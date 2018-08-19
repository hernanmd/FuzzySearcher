configuration
readWordsFromFileNamed: aFilename
	" Read vocabulary from file named aFilename "

	| w |
	w := FSWordStats new.
	w initialize.
	w analyzeFromFileNamed: aFilename.
	words := (w sortedByCount copyFrom: 1 to: 1000) collect: #first
