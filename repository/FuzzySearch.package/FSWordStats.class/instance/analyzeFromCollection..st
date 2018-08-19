querying
analyzeFromCollection: aCollection
	" Analyze word frequency of the file with the given name. "

	^ self analyzeFromStream: aCollection readStream.

