"
See subclasses comment
"
Class {
	#name : #FSAbstractMatcher,
	#superclass : #Object,
	#instVars : [
		'searchPattern',
		'text',
		'words'
	],
	#category : 'FuzzySearch-Core'
}

{ #category : #'instance creation' }
FSAbstractMatcher class >> new [

	^ super new initialize
]

{ #category : #'instance creation' }
FSAbstractMatcher class >> pattern: aString [
	"Responde una nueva instancia del receptor
	con aString configurado como texto de busqueda"
	
	^ self new pattern: aString
]

{ #category : #'public accessing' }
FSAbstractMatcher >> filter [
	" Answer a <Collection> with filtered results without score" 

	| found result |
	found := OrderedCollection new.
	words do: [ : w |
		self text: w.
		(result := self fuzzyMatch) > 0 
			ifTrue: [ w size >= searchPattern size 
						ifTrue: [ found add: { w . result } ] ] ].
	found isEmpty
		ifFalse: [ ^ found collect: #first ].
	^ found.
]

{ #category : #configuration }
FSAbstractMatcher >> filterPhrasesFrom: aCollection [
	" Read phrase vocabulary from aCollection "

	| found |
	found := Set new.
	aCollection do: [: phrase | 	
		self readWordsFrom: phrase.
		self filter
			ifNotEmpty: [ found add: phrase ] ].
	^ found
]

{ #category : #'public accessing' }
FSAbstractMatcher >> fuzzyMatch [
	" See comment in String>>fuzzyMatch: "

	self subclassResponsibility
]

{ #category : #'public accessing' }
FSAbstractMatcher >> match [

	self subclassResponsibility
]

{ #category : #configuration }
FSAbstractMatcher >> readWordsFrom: aCollection [
	" Read vocabulary from aCollection "

	| w |
	w := FSWordStats new.
	w initialize.
	w analyzeFromCollection: aCollection.
	words := (w sortedByCount copyFrom: 1 to: w count) collect: #first

]

{ #category : #configuration }
FSAbstractMatcher >> readWordsFromFileNamed: aFilename [
	" Read vocabulary from file named aFilename "

	| w |
	w := FSWordStats new.
	w initialize.
	w analyzeFromFileNamed: aFilename.
	words := (w sortedByCount copyFrom: 1 to: 1000) collect: #first

]

{ #category : #accessing }
FSAbstractMatcher >> searchPattern [
	^ searchPattern
]

{ #category : #accessing }
FSAbstractMatcher >> searchPattern: anObject [
	searchPattern := anObject
]

{ #category : #'public accessing' }
FSAbstractMatcher >> text: aString [

	text := aString.
	"text _ aString copy"
]

{ #category : #accessing }
FSAbstractMatcher >> words [
	^ words
]

{ #category : #accessing }
FSAbstractMatcher >> words: anObject [
	words := anObject
]
