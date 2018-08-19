*FuzzySearch
fuzzyMatch: aString mismatches: d
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