private
nextWordFrom: aStream
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
