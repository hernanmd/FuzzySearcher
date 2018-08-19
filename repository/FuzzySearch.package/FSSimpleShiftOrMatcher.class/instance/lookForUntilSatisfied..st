public accessing
lookForUntilSatisfied: aBlock

	| found result |
	found := OrderedCollection new.
	words do: [ : w |
		self text: w.
		(result := self fuzzyMatch) > 0 
			ifTrue: [
				w size >= searchPattern size 
					ifTrue: [
						found add: { w . result }.
						(aBlock value: found) ifTrue: [ ^ found ] ] ] ].
	^ found