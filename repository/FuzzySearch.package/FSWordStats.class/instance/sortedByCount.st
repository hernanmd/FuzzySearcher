querying
sortedByCount
	" Answer word list sorted in order of decreasing word frequecy. "

	| result |
	result := OrderedCollection new: wordCounts size.
	wordCounts associationsDo: [ : assoc |
		result add: (Array with: assoc key with: assoc value)].
	result := result asArray.
	result sort: [ : w1 : w2 | w1 last > w2 last ].
	^ result
