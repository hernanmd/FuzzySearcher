examples
example02

	| p |
	p := FSShiftOrMatcher new.
	p searchPattern: 'how'.
	p text: 'hawaii'.
	^ p match. 