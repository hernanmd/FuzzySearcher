public accessing
pattern: aString

	aString 
		ifEmpty: [ searchPattern := ' ' ] 
		ifNotEmpty: [ searchPattern := aString copy ].
	self table: (FSPatternTable pattern: searchPattern).
