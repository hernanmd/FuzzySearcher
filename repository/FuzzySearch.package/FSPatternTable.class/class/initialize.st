all
initialize
"
	self initialize
"
	CellPhoneKeys := #($a $d $g $j $m $p $t $w).

	CharsForKey := Dictionary new.
	CharsForKey at: $a put: 'abc'.
	CharsForKey at: $d put: 'def'.
	CharsForKey at: $g put: 'ghi'.
	CharsForKey at: $j put: 'jkl'.
	CharsForKey at: $m put: 'mno'.
	CharsForKey at: $p put: 'pqrs'.
	CharsForKey at: $t put: 'tuv'.
	CharsForKey at: $w put: 'wxyz'.
	