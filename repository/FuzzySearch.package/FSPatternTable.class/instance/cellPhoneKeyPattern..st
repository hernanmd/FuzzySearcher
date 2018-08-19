all
cellPhoneKeyPattern: aString

	| ascii old |

	table := (1 to: 256) collect: [:i | 0].

	aString withIndexDo: [:char :index |
		index = 1 ifTrue: [
			(CellPhoneKeys includes: char) ifTrue: [
				(CharsForKey at: char) do: [:k |
					ascii := k asciiValue.
					old := table at: ascii + 1.
					table at: ascii + 1 put: (old bitOr: (1 << (index - 1))).
				].		
			].
		].
		ascii := char asciiValue.
		old := table at: ascii + 1.
		table at: ascii + 1 put: (old bitOr: (1 << (index - 1))).
	].
