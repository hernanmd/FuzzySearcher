querying
analyzeFromFileNamed: aString
	" Analyze word frequency of the file with the given name. "

	^ self analyzeFromStream: (FileStream oldFileNamed: aString).
