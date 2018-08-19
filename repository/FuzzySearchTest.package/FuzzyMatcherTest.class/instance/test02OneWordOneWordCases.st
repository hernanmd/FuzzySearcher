testing
test02OneWordOneWordCases

	self assert: ( 'popo' fuzzyMatch: 'POPO' ) = 4.
	self assert: ( 'popo' fuzzyMatch: 'Popo' ) = 1.
	self assert: ( 'popo' fuzzyMatch: 'PoPo' ) = 2.
	self assert: ( 'popo' fuzzyMatch: 'POPo' ) = 3.
	self assert: ( 'popo' fuzzyMatch: 'PoPO' ) = 3.
	self assert: ( 'popo' fuzzyMatch: 'PoPO' ) = 3.
	

