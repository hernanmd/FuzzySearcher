Class {
	#name : 'BaselineOfFuzzySearch',
	#superclass : 'BaselineOf',
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'BaselineOfFuzzySearch',
	#package : 'BaselineOfFuzzySearch'
}

{ #category : 'baselines' }
BaselineOfFuzzySearch >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec
			baseline: 'Diacriticals'		with: [ spec repository: 'github://hernanmd/Diacriticals/repository' ];
			baseline: 'SkipList' 			with: [ spec repository: 'github://hernanmd/SkipList/repository' ].

		spec 
			package: 'FuzzySearch' 		with: [ spec requires: #('SkipList' 'Diacriticals'). ];
			package: 'FuzzySearchTest' 	with: [ spec requires: #('FuzzySearch'). ].
		spec 
			group: 'Core' with: #('FuzzySearch');
			group: 'Tests' with: #('FuzzySearchTest'). ].

]
