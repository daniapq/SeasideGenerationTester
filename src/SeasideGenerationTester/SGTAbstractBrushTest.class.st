"
Abstract class to test generated brushes
"
Class {
	#name : #SGTAbstractBrushTest,
	#superclass : #SGTAbstractSeasideTestCase,
	#category : #SeasideGenerationTester
}

{ #category : #testing }
SGTAbstractBrushTest class >> isAbstract [
	^ self = SGTAbstractBrushTest
]

{ #category : #tests }
SGTAbstractBrushTest >> testBareBrush [
	self subclassResponsibility
]

{ #category : #tests }
SGTAbstractBrushTest >> testWithContent [
	self subclassResponsibility
]
