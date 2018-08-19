querying
doSearch
	" Score the words in aCollection "
	"Example:
 			WordStats new
						threshold: 0.5;
						searchType: #fullFuzzyMatch: ;
						searchPattern: '' ;
						searchText: '';
						doSearch.
		"

	| stream word currentScore |
	
	stream := self searchText readStream.
	[ (word := self nextWordFrom: stream) notNil ] 
		whileTrue: [
			((word first = $') or: [ word last = $' ]) 
				ifFalse: [
					((currentScore := word 
							perform: self searchType 
							with: self searchPattern) > self threshold)
						ifTrue: [ scores at: currentScore put: word ]
				  ]
			].
	^ scores
