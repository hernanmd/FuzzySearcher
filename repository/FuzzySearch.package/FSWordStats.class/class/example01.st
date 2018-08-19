examples
example01

	^ FSWordStats new 
		analyzeFromStream: 'this is a text and this is a test' readStream; 
		sortedByCount 