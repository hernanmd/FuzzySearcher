configuration
filterPhrasesFrom: aCollection
	" Read phrase vocabulary from aCollection "

	| found |
	found := Set new.
	aCollection do: [: phrase | 	
		self readWordsFrom: phrase.
		self filter
			ifNotEmpty: [ found add: phrase ] ].
	^ found