testing
testFuzzyMatch

	" Note both strings have the same size "
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFloyd') equals: 0.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFroyd') equals: 1.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFroud') equals: 2.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFreud') equals: 3.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkPreud') equals: 4.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkKahlo') equals: 5.	
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinPanter') equals: 6.

	self assert: ( 'popo' fuzzyMatch: 'POPO') equals: 4.
	self assert: ( 'popo' fuzzyMatch: 'Popo') equals: 1.
	self assert: ( 'popo' fuzzyMatch: 'PoPo') equals: 2.
	self assert: ( 'popo' fuzzyMatch: 'POPo') equals: 3.
	self assert: ( 'popo' fuzzyMatch: 'PoPO') equals: 3.
	self assert: ( 'popo' fuzzyMatch: 'PoPO') equals: 3.
	
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFlóyd' ) equals: 1.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFróyd' ) equals: 2.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFróud' ) equals: 3.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFréud' ) equals: 3.
	self assert: ( 'PínkFloyd' fuzzyMatch: 'PínkFréud' ) equals: 3.
	self assert: ( 'PínkFloyd' fuzzyMatch: 'PinkFréud') equals: 4.
	
	self assert: ( 'Revista' fuzzyMatch: 'Revista') equals: 0.		
	self assert: ( 'Revista' fuzzyMatch: 'revista') equals: 1.
	self assert: ( 'revista' fuzzyMatch: 'Revista') equals: 1.	
	self assert: ( 'REVISTAA' fuzzyMatch: 'revista' ) equals: 7.			
	self assert: ( 'REVISTAAB' fuzzyMatch: 'revista' ) equals: 7.			
	self assert: ( 'REVISTAABC' fuzzyMatch: 'revista' ) equals: 7.				
	self assert: ( 'REVISTAABCD' fuzzyMatch: 'revista' ) equals: 7.	

	self assert: ('Rvst' fuzzyMatch: 'revista') equals: 4.
	self assert: ('rvst' fuzzyMatch: 'revista') equals: 3.	

	self assert: ('revst' fuzzyMatch: 'Revista') equals: 3.	
	self assert: ('Revst' fuzzyMatch: 'Revista') equals: 2.
	self assert: ('revist' fuzzyMatch: 'Revista') equals: 1.		
	self assert: ('Revist' fuzzyMatch: 'Revista') equals: 0.
	
	self assert: ('Ab' fuzzyMatch: 'Ac') equals: 1.
	self assert: ('A' fuzzyMatch: 'A') equals: 0.
	
	self assert: ('Révístá' fuzzyMatch: 'Revista') equals: 3.
	self assert: ('Révístá' fuzzyMatch: 'revista') equals: 4.

	self assert: ('Coño' fuzzyMatch: 'Coma') equals: 2.
	self assert: ('Coño' fuzzyMatch: 'Cena') equals: 3.

	self assert: ('popo' fuzzyMatch: 'pópó') equals: 2.
	self assert: ('popo' fuzzyMatch: 'pópo') equals: 1.
	self assert: ('popo' fuzzyMatch: 'popó') equals: 1.
