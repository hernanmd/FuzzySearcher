testing
test04OneWordOneWordAdditionalCharacters

	self assert: ( 'Revista' fuzzyMatch: 'Revista') = 0.		
	self assert: ( 'Revista' fuzzyMatch: 'revista') = 1.
	self assert: ( 'revista' fuzzyMatch: 'Revista') = 1.	
	self assert: ( 'REVISTAA' fuzzyMatch: 'revista' ) = 7.			
	self assert: ( 'REVISTAAB' fuzzyMatch: 'revista' ) = 7.			
	self assert: ( 'REVISTAABC' fuzzyMatch: 'revista' ) = 7.				
	self assert: ( 'REVISTAABCD' fuzzyMatch: 'revista' ) = 7.	
	

