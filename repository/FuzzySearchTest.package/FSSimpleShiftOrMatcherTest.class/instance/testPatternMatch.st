testing
testPatternMatch

	| resultSet |
	
	matcher := FSSimpleShiftOrMatcher pattern: 'Revisa'.
	resultSet := Set 
					with: 'Revista de Cultura'
					with: 'Revisar of Applied Cryptography'
					with: 'Revista de Filosofia'.
					
	self assert: (matcher filterPhrasesFrom: #('Revista de Cultura' 'Revista de Filosofia' 'Journal of Computer Science' 'Revisar of Applied Cryptography')) equals: resultSet.

	self assert: ('PinkFloyd' patternMatch: 'PinkFloyd') equals: 1.
	self assert: ('PinkFloyd' patternMatch: 'PinkFroyd') equals: 2.
	self assert: ('PinkFloyd' patternMatch: 'PinkFroud') equals: 3.
	self assert: ('PinkFloyd' patternMatch: 'PinkFreud') equals: 0.

	self assert: ('PinkFloyd' patternMatch: 'PinkFreuda') equals: 0.
	self assert: ('PinkFloyd' patternMatch: 'PinkFloydian') equals: 0.
