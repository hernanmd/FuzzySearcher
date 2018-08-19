public accessing
fuzzyMatch
	" See superimplementor's comment "

	| finalBit tmp states |
	states := (Array new: 3) atAllPut: 1.
	finalBit := 1 << (searchPattern size - 1).
	1 to: (text size min: searchPattern size) do: [ : pos |
		states size to: 1 by: -1 do: [ : index |
			tmp := states at: index.
			tmp := (tmp bitShift: 1) bitOr: 1.
			tmp := tmp bitAnd: (table at: (text at: pos)).
			index > 1 ifTrue: [
				tmp := tmp bitOr: ((states at: index - 1) bitShift: 1) 	].
			states at: index put: tmp ] ].
	1 to: states size do: [ : index |
		(((states at: index) bitAnd: finalBit) ~= 0) 
			ifTrue: [ ^ index ] ].
	^ 0