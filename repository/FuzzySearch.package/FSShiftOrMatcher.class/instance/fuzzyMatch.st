public accessing
fuzzyMatch
	" See comment in String>>fuzzyMatch: "
	
	searchPattern size > text size
		ifTrue: [ searchPattern := searchPattern copyFrom: 1 to: text size ].
	^ self match.
