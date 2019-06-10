"
Utilities to analyze word frequencies from a given input text.

See class side for examples.

    Instance Variables
	caseSensitive:		<Object>
	letters:		<Object>
	scores:		<Object>
	searchPattern:		<Object>
	searchText:		<Object>
	searchType:		<Object>
	threshold:		<Object>
	wordCounts:		<Object>


    Implementation Points
"
Class {
	#name : #FSWordStats,
	#superclass : #Object,
	#instVars : [
		'caseSensitive',
		'letters',
		'scores',
		'threshold',
		'wordCounts',
		'searchPattern',
		'searchText',
		'searchType'
	],
	#category : 'FuzzySearch-Utilities'
}

{ #category : #defaults }
FSWordStats class >> defaultThreshold [

	^ 0.4
]

{ #category : #examples }
FSWordStats class >> example01 [

	^ FSWordStats new 
		analyzeFromStream: 'this is a text and this is a test' readStream; 
		sortedByCount 
]

{ #category : #examples }
FSWordStats class >> example02 [

	^ FSWordStats new 
		analyzeFileNamed: 'wiz.txt'; 
		sortedByCount
]

{ #category : #querying }
FSWordStats >> analyzeFromCollection: aCollection [
	" Analyze word frequency of the file with the given name. "

	^ self analyzeFromStream: aCollection readStream.


]

{ #category : #querying }
FSWordStats >> analyzeFromFileNamed: aString [
	" Analyze word frequency of the file with the given name. "

	^ self analyzeFromStream: aString asFileReference readStream.

]

{ #category : #querying }
FSWordStats >> analyzeFromStream: aStream [
	" Analyze word frequency of the file with the given name. "
	" Example:
		FSWordStats new 
			analyzeFromStream: 'this is a text and this is a test' readStream; 
			sortedByCount 
	"

	| w n |

	wordCounts := Dictionary new: 10000.
	[ (w := self nextWordFrom: aStream) notNil] 
		whileTrue: [
			((w first = $') or: [ w last = $' ]) 
				ifFalse: [
					n := wordCounts at: w ifAbsent: [ 0 ].
					wordCounts at: w put: n + 1 ] ].
	^ wordCounts size printString , ' words read'

]

{ #category : #private }
FSWordStats >> count [
	" Answer how many words we have read "
	
	^ wordCounts size
]

{ #category : #querying }
FSWordStats >> countWordsFrom: aCollection [
	"Count words from aCollection. Answer an Integer "
	"Example:
		FSWordStats new countWordsFrom: 'this is a text and this is a test' 
		"

	| stream w |
	stream := aCollection readStream.
	wordCounts := 0.
	[(w := self nextWordFrom: stream) notNil] 
		whileTrue: [
			((w first = $') or: [w last = $']) 
				ifFalse: [ wordCounts := wordCounts + 1 ]	].
	^ wordCounts

]

{ #category : #querying }
FSWordStats >> doSearch [
	" Score the words in aCollection "
	"Example:
 			FSWordStats new
						threshold: 0.5;
						searchType: #fullFuzzyMatch: ;
						searchPattern: '' ;
						searchText: '';
						doSearch.
		"

	| stream word currentScore |
	
	stream := self searchText readStream.
	[ (word := self nextWordFrom: stream) notNil ] 
		whileTrue: [
			((word first = $') or: [ word last = $' ]) 
				ifFalse: [
					((currentScore := word 
							perform: self searchType 
							with: self searchPattern) > self threshold)
						ifTrue: [ scores at: currentScore put: word ]
				  ]
			].
	^ scores

]

{ #category : #initialization }
FSWordStats >> initialize [

	letters := CharacterSet new.
	letters addAll: ($a to: $z), ($A to: $Z).
	letters add: $'.
	wordCounts := Dictionary new: 10000.
	caseSensitive := true.
	scores := SkipList new.


]

{ #category : #private }
FSWordStats >> nextWordFrom: aStream [
	" Answer a <SString> which is the next word from the given stream, or nil if at the end of the stream. "

	| wordBuffer ch |
	wordBuffer := WriteStream on: (String new: 10).
	"skip to start of next word or end of file"
	ch := aStream next.
	[ ch isNil or: [ letters includes: ch ] ]
		whileFalse: [ ch := aStream next ].
	aStream atEnd ifTrue: [ ^ nil ].
	"build word"
	[ ch notNil and: [ letters includes: ch ] ] 
		whileTrue: [
			caseSensitive
				ifFalse:[ ch := ch asLowercase ].
			wordBuffer nextPut: ch.
			ch := aStream next ].
	^ wordBuffer contents

]

{ #category : #accessing }
FSWordStats >> searchPattern [
	^ searchPattern
]

{ #category : #accessing }
FSWordStats >> searchPattern: anObject [
	searchPattern := anObject
]

{ #category : #accessing }
FSWordStats >> searchText [
	^ searchText
]

{ #category : #accessing }
FSWordStats >> searchText: anObject [
	searchText := anObject
]

{ #category : #accessing }
FSWordStats >> searchType [
	^ searchType
]

{ #category : #accessing }
FSWordStats >> searchType: anObject [
	searchType := anObject
]

{ #category : #querying }
FSWordStats >> sortedByCount [
	" Answer word list sorted in order of decreasing word frequecy. "

	| result |
	result := OrderedCollection new: wordCounts size.
	wordCounts associationsDo: [ : assoc |
		result add: (Array with: assoc key with: assoc value)].
	result := result asArray.
	result sort: [ : w1 : w2 | w1 last > w2 last ].
	^ result

]

{ #category : #accessing }
FSWordStats >> threshold [

	^ threshold
		ifNil: [ threshold := self class defaultThreshold ]
]

{ #category : #accessing }
FSWordStats >> threshold: anObject [
	threshold := anObject
]
