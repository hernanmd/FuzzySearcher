*FuzzySearch
fuzzyMatch: aString
	" Answer an <Integer> representing the similarity score between self and aString.
	
	The score 0 means self and aString are equal
	1 means receiver and aString differs in 1 character
	2 means receiver and aString differs in 3 characters...
	"

	^ FSShiftOrMatcher new
		text: self; 	
		searchPattern: aString;
		fuzzyMatch