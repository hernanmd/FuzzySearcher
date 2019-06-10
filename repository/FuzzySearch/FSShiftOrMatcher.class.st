"
Hamming matcher using the Shift-Or algorithm (Hamming Edit Distance). This variant does not use the PatternTable and can use a K factor up to 31. You should choose this only if can assure your searched text do NOT contain non-english characters (diacriticals). 


"
Class {
	#name : #FSShiftOrMatcher,
	#superclass : #FSApproxMatcher,
	#category : 'FuzzySearch-Core'
}

{ #category : #examples }
FSShiftOrMatcher class >> example01 [

	| p |
	p := FSShiftOrMatcher new.
	p searchPattern: 'cancion'.
	p text: 'canciones'.
	^ p fuzzyMatch.
]

{ #category : #examples }
FSShiftOrMatcher class >> example02 [

	| p |
	p := FSShiftOrMatcher new.
	p searchPattern: 'how'.
	p text: 'hawaii'.
	^ p match. 
]

{ #category : #'public accessing' }
FSShiftOrMatcher >> fuzzyMatch [
	" See comment in String>>fuzzyMatch: "
	
	searchPattern size > text size
		ifTrue: [ searchPattern := searchPattern copyFrom: 1 to: text size ].
	^ self match.

]

{ #category : #'public accessing' }
FSShiftOrMatcher >> match [

	| patternSize states patternMask ascii finalBit bitShift |

	bitShift := 0 bitInvert32. " 16r100000000 - 1 "
	patternSize := searchPattern size.
	states := Array new: ( 4 * ( self maxErrors + 1 ) ) withAll: 1 bitInvert32.
	finalBit := (1 << patternSize ) bitAnd: bitShift.
	"  Initialize the pattern bitmasks "
	patternMask	 := Array new: 256 withAll: bitShift.
	
	1 to: patternSize do: [ : index | | oldElem |
		ascii := (searchPattern at: index) asciiValue.
		oldElem := patternMask at: ascii.
		patternMask at: ascii 
					put: ( oldElem bitAnd: ( 1 << ( index - 1 ) ) bitInvert32 ) ].
	1 to: text size do: [ : ind | | oldRd1 |
		"  Update the bit arrays  "
		oldRd1 := states at: 1.
		states at: 1 put: ((states at: 1) bitOr: (patternMask at: (text at: ind) asciiValue)).
		states at: 1 put: ((( states at: 1) << 1) bitAnd: bitShift).
	
		2 to: maxErrors + 1 do: [ : d | | tmp |
			tmp := states at: d.
			ascii := patternMask at: ( text at: ind ) asciiValue.
			
			states at: d put: ( ( ( oldRd1 bitAnd: ( ( states at: d ) bitOr: ascii )) << 1 ) bitAnd: bitShift ).
			oldRd1 := tmp.
		].
	].
	" Scan the states table "
	1 to: maxErrors do: [ : p | 
		((states at: p) bitAnd: finalBit) = 0
			ifTrue: [ ^ p - 1 ] ].
	^ patternSize
]
