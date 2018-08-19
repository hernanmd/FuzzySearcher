testing
test01OneWordOneWordLarger

	self assert: ('PinkFloyd' patternMatch: 'PinkFreuda') = 0.
	self assert: ('PinkFloyd' patternMatch: 'PinkFloydian') = 0.