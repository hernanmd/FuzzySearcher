*FuzzySearch
isLowercase
	" Answer <true> if receiver has all lowercases "
	
	| stream |
	
	stream := self readStream reset.
	[ stream atEnd not and: [ stream peek isLowercase ] ]
		whileTrue: 	[ stream next ].
	^ stream atEnd