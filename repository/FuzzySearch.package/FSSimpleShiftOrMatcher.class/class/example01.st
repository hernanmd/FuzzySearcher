examples
example01

	| p |
	p := self new.
	"Second, pre-process the pattern"
	p pattern: 'how'.
	"Then, set the text and calculate the score."
	p text: 'hawaii'.
	p fuzzyMatch.   "returns 2, because 'haw' and 'how' differs only one place."