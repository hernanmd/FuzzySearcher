initialization
initialize

	letters := CharacterSet new.
	letters addAll: ($a to: $z), ($A to: $Z).
	letters add: $'.
	wordCounts := Dictionary new: 10000.
	caseSensitive := true.
	scores := SkipList new.

