public accessing
filter
	" Answer a <Collection> with filtered results without score" 

	| found result |
	found := OrderedCollection new.
	words do: [ : w |
		self text: w.
		(result := self fuzzyMatch) > 0 
			ifTrue: [ w size >= searchPattern size 
						ifTrue: [ found add: { w . result } ] ] ].
	found isEmpty
		ifFalse: [ ^ found collect: #first ].
	^ found.