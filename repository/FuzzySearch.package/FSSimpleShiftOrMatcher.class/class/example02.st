examples
example02

	| p |
	p := self new.
	p readWordsFromFileNamed: 'alice30.txt'.		"read the vocabulary from a file"
	p pattern: 'al'.
	p lookForUntilSatisfied: [ : found | found size >= 10 ].