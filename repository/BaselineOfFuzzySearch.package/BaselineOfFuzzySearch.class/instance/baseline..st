baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'github://hernanmd/FuzzySearcher/repository/'.
		spec
			baseline: 'Diacriticals' 
			with: [ spec repository: 'github://hernanmd/Diacriticals/repository' ];
			baseline: 'SkipList' 
			with: [ spec repository: 'github://hernanmd/SkipList/repository' ].

		spec 
			package: 'FuzzySearch' 		with: [ spec requires: #('SkipLists' 'Diacriticals'). ];
			package: 'FuzzySearchTest' 	with: [ spec requires: #('FuzzySearch'). ];
			package: 'SkipLists';
			package: 'SkipLists-Tests'.
		spec 
			group: 'Core' with: #('SkipLists' 'FuzzySearch');
			group: 'Tests' with: #('FuzzySearchTest' 'SkipLists-Tests' ). ].
