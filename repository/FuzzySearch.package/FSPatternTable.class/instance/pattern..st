all
pattern: aString

	| ascii old |

	table := (1 to: 256) collect: [:i | 0].
	aString withIndexDo: [:char :index |
		ascii := char asciiValue.
		old := table at: ascii + 1.
		table at: ascii + 1 put: (old bitOr: (1 << (index - 1))).
	].
