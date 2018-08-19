examples
example01

	| p |
	p := FSShiftOrMatcher new.
	p searchPattern: 'cancion'.
	p text: 'canciones'.
	^ p fuzzyMatch.