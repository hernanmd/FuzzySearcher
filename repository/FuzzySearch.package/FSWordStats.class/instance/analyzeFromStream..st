querying
analyzeFromStream: aStream
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
