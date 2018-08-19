testing
test05OneWordOneWordMissingCharacters

	self assert: ('Rvst' fuzzyMatch: 'revista') equals: 4.
	self assert: ('rvst' fuzzyMatch: 'revista') equals: 3.	

	self assert: ('revst' fuzzyMatch: 'Revista') equals: 3.	
	self assert: ('Revst' fuzzyMatch: 'Revista') equals: 2.
	self assert: ('revist' fuzzyMatch: 'Revista') equals: 1.		
	self assert: ('Revist' fuzzyMatch: 'Revista') equals: 0.