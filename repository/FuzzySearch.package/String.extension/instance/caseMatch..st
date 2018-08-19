*FuzzySearch
caseMatch: aString
	" Answer the case differences between the receiver and aString "

	| cases |
	cases := 0.
	((aString isLowercase and: [ self isLowercase ]) or: [ aString isUppercase and: [ self isUppercase ] ])
		ifFalse: [ 
			(self ~= aString and: [ self asLowercase = aString asLowercase ])
				ifTrue: [
					cases := ((self select: #isLowercase) size - (aString select: #isLowercase) size) abs ]
					ifFalse: [
							1 to: (self size min: aString size) do: [: i | 
								(self at: i) asLowercase = (aString at: i) asLowercase
									ifTrue: [ (((self at: i) isLowercase and: [ (aString at: i) isUppercase ])
												or: [ (self at: i) isUppercase and: [ (aString at: i) isLowercase ] ])
													ifTrue: [ cases := cases + 1 ] ] ] ] ].
	^ cases