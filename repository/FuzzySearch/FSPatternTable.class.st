"
Internal helper used by BPSimplifiedShiftOrMatcher. 

 #cellPhoneKeyPattern: is merely a hack to treat the chars entered by the same button. 

See BPSimplifiedShiftOrMatcher comment for a little more info.

"
Class {
	#name : #FSPatternTable,
	#superclass : #Object,
	#instVars : [
		'table'
	],
	#classVars : [
		'CellPhoneKeys',
		'CharsForKey'
	],
	#category : #'FuzzySearch-Core'
}

{ #category : #all }
FSPatternTable class >> cellPhoneKeyPattern: aString [

	^ (self new) cellPhoneKeyPattern: aString; yourself
]

{ #category : #all }
FSPatternTable class >> initialize [
"
	self initialize
"
	CellPhoneKeys := #($a $d $g $j $m $p $t $w).

	CharsForKey := Dictionary new.
	CharsForKey at: $a put: 'abc'.
	CharsForKey at: $d put: 'def'.
	CharsForKey at: $g put: 'ghi'.
	CharsForKey at: $j put: 'jkl'.
	CharsForKey at: $m put: 'mno'.
	CharsForKey at: $p put: 'pqrs'.
	CharsForKey at: $t put: 'tuv'.
	CharsForKey at: $w put: 'wxyz'.
	
]

{ #category : #all }
FSPatternTable class >> pattern: aString [

	^ (self new) pattern: aString; yourself
]

{ #category : #accessing }
FSPatternTable >> at: char [

	^ table at: (char asciiValue + 1)
]

{ #category : #all }
FSPatternTable >> cellPhoneKeyPattern: aString [

	| ascii old |
	table := (1 to: 256) collect: [ :i | 0 ].

	aString keysAndValuesDo: [ :index :char | 
		index = 1 ifTrue: [ 
			(CellPhoneKeys includes: char) ifTrue: [ 
				(CharsForKey at: char) do: [ :k | 
					ascii := k asciiValue.
					old := table at: ascii + 1.
					table at: ascii + 1 put: (old bitOr: 1 << (index - 1)) ] ] ].
		ascii := char asciiValue.
		old := table at: ascii + 1.
		table at: ascii + 1 put: (old bitOr: 1 << (index - 1)) ]
]

{ #category : #all }
FSPatternTable >> pattern: aString [

	| ascii old |
	table := (1 to: 256) collect: [ :i | 0 ].
	aString keysAndValuesDo: [ :index :char | 
		ascii := char asciiValue.
		old := table at: ascii + 1.
		table at: ascii + 1 put: (old bitOr: 1 << (index - 1)) ]
]
