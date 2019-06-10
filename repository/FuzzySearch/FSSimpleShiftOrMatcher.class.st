"
A simplified implementation of ambiguous matching algorithm based on

----------
Baeza-Yates, R. A., and Gonnet, G.H., A new approach to text searcing, 
Communications of the ACM, 35, 10 (October 1992), pp 74-82.

Wu, S., and Manber, U., Fast text searching allowing errors,
Communications of the ACM, 35, 10 (October 1992), pp 82-91.
----------

This algorithm tests if the pattern is similar to the beginning of text and returns the similarity score.  The score 0 means the distance is far enough, 1 means pattern exactly matches the beginning of the text.  The score more than 1 means the *distance* of the pattern and text.

(N.B.  This algorithm uses heavy integer arithmetic in tight loop.  Making it a primitive would speed it up siginificantly.)

Typical way to use this is as follows.  First, as an initialization, do the following line.

	| p |
	p := FSSimpleShiftOrMatcher new.	""make an instance.""
	""Second, pre-process the pattern""
	p pattern: 'how'.
	""Then, set the text and calculate the score.""
	p text: 'hawaii'.
	p fuzzyMatch.   ""returns 2, because 'haw' and 'how' differs only one place.""

Another way to use this is to extract similar words to the given pattern from list of words. First, set up the 'words' instance variable (Array of Strings) by:

	| p |
	p := FSSimpleShiftOrMatcher new.
	p readWordsFromFileNamed: 'alice30.txt'.		""read the vocabulary from a file""
	p pattern: 'al'.
	p lookForUntilSatisfied: [ : found | found size >= 10].

This enumerate the words instance variable until the given block returns true.  The return value is an array of pairs whose first element is the word and the second element is the score.

"
Class {
	#name : #FSSimpleShiftOrMatcher,
	#superclass : #FSApproxMatcher,
	#instVars : [
		'table'
	],
	#category : 'FuzzySearch-Core'
}

{ #category : #examples }
FSSimpleShiftOrMatcher class >> example01 [

	| p |
	p := self new.
	"Second, pre-process the pattern"
	p pattern: 'how'.
	"Then, set the text and calculate the score."
	p text: 'hawaii'.
	p fuzzyMatch.   "returns 2, because 'haw' and 'how' differs only one place."
]

{ #category : #examples }
FSSimpleShiftOrMatcher class >> example02 [

	| p |
	p := self new.
	p readWordsFromFileNamed: 'alice30.txt'.		"read the vocabulary from a file"
	p pattern: 'al'.
	p lookForUntilSatisfied: [ : found | found size >= 10 ].
]

{ #category : #'public accessing' }
FSSimpleShiftOrMatcher >> cellPhoneKeyPattern: aString [

	aString isEmpty
		ifTrue: [ searchPattern := ' ' ] 
		ifFalse: [ searchPattern := aString copy].

	self table: (FSPatternTable cellPhoneKeyPattern: searchPattern).

]

{ #category : #'public accessing' }
FSSimpleShiftOrMatcher >> fuzzyMatch [
	" See superimplementor's comment "

	| finalBit tmp states |
	states := (Array new: 3) atAllPut: 1.
	finalBit := 1 << (searchPattern size - 1).
	1 to: (text size min: searchPattern size) do: [ : pos |
		states size to: 1 by: -1 do: [ : index |
			tmp := states at: index.
			tmp := (tmp bitShift: 1) bitOr: 1.
			tmp := tmp bitAnd: (table at: (text at: pos)).
			index > 1 ifTrue: [
				tmp := tmp bitOr: ((states at: index - 1) bitShift: 1) 	].
			states at: index put: tmp ] ].
	1 to: states size do: [ : index |
		(((states at: index) bitAnd: finalBit) ~= 0) 
			ifTrue: [ ^ index ] ].
	^ 0
]

{ #category : #'public accessing' }
FSSimpleShiftOrMatcher >> lookForUntilSatisfied: aBlock [

	| found result |
	found := OrderedCollection new.
	words do: [ : w |
		self text: w.
		(result := self fuzzyMatch) > 0 
			ifTrue: [
				w size >= searchPattern size 
					ifTrue: [
						found add: { w . result }.
						(aBlock value: found) ifTrue: [ ^ found ] ] ] ].
	^ found
]

{ #category : #'public accessing' }
FSSimpleShiftOrMatcher >> match [

	| finalBit state |
	state := 1.
	finalBit := 1 << (searchPattern size - 1).
	1 to: text size do: [:pos |
		state := (state bitShift: 1) bitOr: 1.
		state := state bitAnd: (table at: (text at: pos)).
		((state bitAnd: finalBit) ~= 0) 
			ifTrue: [ ^ pos - (searchPattern size - 1) ] ].
	^ 0.

]

{ #category : #'public accessing' }
FSSimpleShiftOrMatcher >> pattern: aString [

	aString 
		ifEmpty: [ searchPattern := ' ' ] 
		ifNotEmpty: [ searchPattern := aString copy ].
	self table: (FSPatternTable pattern: searchPattern).

]

{ #category : #accessing }
FSSimpleShiftOrMatcher >> table: aPatternTable [
	" Set the receiver's pattern table "

	table := aPatternTable
]
