testing
test01OneWordOneWordEqualSize

	self assert: ('PinkFloyd' patternMatch: 'PinkFloyd') = 1.
	self assert: ('PinkFloyd' patternMatch: 'PinkFroyd') = 2.
	self assert: ('PinkFloyd' patternMatch: 'PinkFroud') = 3.
	self assert: ('PinkFloyd' patternMatch: 'PinkFreud') = 0.

