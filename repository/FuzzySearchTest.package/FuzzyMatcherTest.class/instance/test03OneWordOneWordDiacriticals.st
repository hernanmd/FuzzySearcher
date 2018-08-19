testing
test03OneWordOneWordDiacriticals

	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFlóyd' ) = 1.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFróyd' ) = 2.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFróud' ) = 3.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFréud' ) = 3.
	self assert: ( 'PínkFloyd' fuzzyMatch: 'PínkFréud' ) = 3.
	self assert: ( 'PínkFloyd' fuzzyMatch: 'PinkFréud') = 4.	

	

