testing
test06OneWordOneWordMisc

	self assert: ('Ab' fuzzyMatch: 'Ac') equals: 1.
	self assert: ('A' fuzzyMatch: 'A') equals: 0.
	
	self assert: ('Révístá' fuzzyMatch: 'Revista') equals: 3.
	self assert: ('Révístá' fuzzyMatch: 'revista') equals: 4.

	self assert: ('Coño' fuzzyMatch: 'Coma') equals: 2.
	self assert: ('Coño' fuzzyMatch: 'Cena') equals: 3.

	self assert: ('popo' fuzzyMatch: 'pópó') equals: 2.
	self assert: ('popo' fuzzyMatch: 'pópo') equals: 1.
	self assert: ('popo' fuzzyMatch: 'popó') equals: 1.

	
