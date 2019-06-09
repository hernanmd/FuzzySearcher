querying
countWordsFrom: aCollection
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
