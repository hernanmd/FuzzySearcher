public accessing
cellPhoneKeyPattern: aString

	aString isEmpty
		ifTrue: [ searchPattern := ' ' ] 
		ifFalse: [ searchPattern := aString copy].

	self table: (FSPatternTable cellPhoneKeyPattern: searchPattern).
