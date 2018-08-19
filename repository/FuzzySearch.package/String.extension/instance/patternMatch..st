*FuzzySearch
patternMatch: aString
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