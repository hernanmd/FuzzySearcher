accessing
threshold

	^ threshold
		ifNil: [ threshold := self class defaultThreshold ]