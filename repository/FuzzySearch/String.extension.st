Extension { #name : #String }

{ #category : #'*FuzzySearch' }
String >> caseMatch: aString [
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
]

{ #category : #'*FuzzySearch' }
String >> fuzzyMatch: aString [
	" Answer an <Integer> representing the similarity score between self and aString.
	
	The score 0 means self and aString are equal
	1 means receiver and aString differs in 1 character
	2 means receiver and aString differs in 3 characters...
	"

	^ FSShiftOrMatcher new
		text: self; 	
		searchPattern: aString;
		fuzzyMatch
]

{ #category : #'*FuzzySearch' }
String >> fuzzyMatch: aString mismatches: d [
	"Answer an <Integer> representing the similarity score between self and aString, allowing at most d mismatches.
	
	The score 0 means self and aString are equal
	1 means receiver and aString differs in 1 character
	2 means receiver and aString differs in 3 characters...
	"

	^ FSShiftOrMatcher new
		text: self; 	
		searchPattern: aString;
		maxErrors: d;
		fuzzyMatch
]

{ #category : #'*FuzzySearch' }
String >> isLowercase [
	" Answer <true> if receiver has all lowercases "
	
	| stream |
	
	stream := self readStream reset.
	[ stream atEnd not and: [ stream peek isLowercase ] ]
		whileTrue: 	[ stream next ].
	^ stream atEnd
]

{ #category : #'*FuzzySearch' }
String >> isUppercase [
	" Answer <true> if receiver has all uppercases "
	
	^ self isLowercase not
]

{ #category : #'*FuzzySearch' }
String >> patternMatch: aString [
	"Returns an Integer representing the similarity score between self and aString.  
	- The score 0 means the distance is far enough, 
	- The score 1 means pattern exactly matches the beginning of the text.  
	- The score more than 1 means the *distance* of the pattern and text.
	This matcher counts up to 3 differences.
	See comments in PatternMatcher for details "

	^ FSSimpleShiftOrMatcher new
		text: self; 	
		pattern: aString;
		fuzzyMatch
]
