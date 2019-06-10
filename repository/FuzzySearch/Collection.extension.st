Extension { #name : #Collection }

{ #category : #'*FuzzySearch' }
Collection >> asParagraphString [
	" Return collection printed as 'a b c' "

	^ String streamContents: [ : s | self asStringOn: s delimiter: ' ' ]
	
	" another way 
	#('usr' 'local' 'bin') inject: '' into: [:path :suffix | path , ' ' , suffix].

	"
	
]
