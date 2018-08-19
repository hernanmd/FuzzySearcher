accessing
match

	| finalBit state |
	state := 1.
	finalBit := 1 << (searchPattern size - 1).
	1 to: text size do: [:pos |
		state := (state bitShift: 1) bitOr: 1.
		state := state bitAnd: (table at: (text at: pos)).
		((state bitAnd: finalBit) ~= 0) 
			ifTrue: [ ^ pos - (searchPattern size - 1) ] ].
	^ 0.
