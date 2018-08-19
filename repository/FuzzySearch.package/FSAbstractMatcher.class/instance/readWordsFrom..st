configuration
readWordsFrom: aCollection
	" Read vocabulary from aCollection "

	| w |
	w := FSWordStats new.
	w initialize.
	w analyzeFromCollection: aCollection.
	words := (w sortedByCount copyFrom: 1 to: w count) collect: #first
