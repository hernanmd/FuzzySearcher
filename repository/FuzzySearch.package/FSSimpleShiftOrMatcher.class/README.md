A simplified implementation of ambiguous matching algorithm based on

----------
Baeza-Yates, R. A., and Gonnet, G.H., A new approach to text searcing, 
Communications of the ACM, 35, 10 (October 1992), pp 74-82.

Wu, S., and Manber, U., Fast text searching allowing errors,
Communications of the ACM, 35, 10 (October 1992), pp 82-91.
----------

This algorithm tests if the pattern is similar to the beginning of text and returns the similarity score.  The score 0 means the distance is far enough, 1 means pattern exactly matches the beginning of the text.  The score more than 1 means the *distance* of the pattern and text.

(N.B.  This algorithm uses heavy integer arithmetic in tight loop.  Making it a primitive would speed it up siginificantly.)

Typical way to use this is as follows.  First, as an initialization, do the following line.

	| p |
	p := BPSimplifiedShiftOrMatcher new.	"make an instance."
	"Second, pre-process the pattern"
	p pattern: 'how'.
	"Then, set the text and calculate the score."
	p text: 'hawaii'.
	p fuzzyMatch.   "returns 2, because 'haw' and 'how' differs only one place."

Another way to use this is to extract similar words to the given pattern from list of words. First, set up the 'words' instance variable (Array of Strings) by:

	| p |
	p := BPSimplifiedShiftOrMatcher new.
	p readWordsFromFileNamed: 'alice30.txt'.		"read the vocabulary from a file"
	p pattern: 'al'.
	p lookForUntilSatisfied: [ : found | found size >= 10].

This enumerate the words instance variable until the given block returns true.  The return value is an array of pairs whose first element is the word and the second element is the score.
