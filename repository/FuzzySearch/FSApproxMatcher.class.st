"
Abstract class for grouping on-line approximate matcher behavior.

An on-line matcher is used when text pre-processing is not feasible, for example, is not known beforehand (building of an index is not possible)


    Instance Variables
	maxErrors:		<Number>


    Implementation Points
"
Class {
	#name : #FSApproxMatcher,
	#superclass : #FSAbstractMatcher,
	#instVars : [
		'maxErrors'
	],
	#category : 'FuzzySearch-Core'
}

{ #category : #'public accessing' }
FSApproxMatcher >> maxErrors [

	^ maxErrors 
		ifNil: [ maxErrors := 9 ]
]

{ #category : #'public accessing' }
FSApproxMatcher >> maxErrors: anObject [
	^ maxErrors := anObject
]
