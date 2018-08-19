testing
test04OneWordPhrasePattern

	| resultSet |
	
	matcher := FSSimpleShiftOrMatcher pattern: 'Revisa'.
	resultSet := Set 
					with: 'Revista de Cultura'
					with: 'Revisar of Applied Cryptography'
					with: 'Revista de Filosofia'.
					
	self assert: (matcher filterPhrasesFrom: #('Revista de Cultura' 'Revista de Filosofia' 'Journal of Computer Science' 'Revisar of Applied Cryptography')) equals: resultSet.

