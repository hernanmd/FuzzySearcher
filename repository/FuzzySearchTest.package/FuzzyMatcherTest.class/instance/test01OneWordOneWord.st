testing
test01OneWordOneWord

	" Note both strings have the same size "
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFloyd' ) = 0.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFroyd' ) = 1.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFroud' ) = 2.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkFreud' ) = 3.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkPreud' ) = 4.
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinkKahlo' ) = 5.	
	self assert: ( 'PinkFloyd' fuzzyMatch: 'PinPanter' ) = 6.

	

