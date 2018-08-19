testing
test04OneWordPhrasePattern

	| resultSet |
	
	matcher := BPSimplifiedShiftOrMatcher pattern: 'Revisa'.
	
	resultSet := Set with: 'Revista de Cultura'
					with: 'Revisar of Applied Cryptography'
					with: 'Revista de Filosofia'.
					
	self assert: ( (matcher filterPhrasesFrom: #('Revista de Cultura' 'Revista de Filosofia' 'Journal of Computer Science' 'Revisar of Applied Cryptography') ) = resultSet).
	
	"resultSet := Set with: 'Nueva revista' 
					with: 'Muy nueva revista de moda'.
	
	self assert: (( matcher filterPhrasesFrom: #('Nueva revista' 'Muy nueva revista de moda') ) = resultSet )"
