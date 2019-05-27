"
Abstract class to test generated seaside code.
"
Class {
	#name : #SGTAbstractSeasideTestCase,
	#superclass : #TestCase,
	#category : #SeasideGenerationTester
}

{ #category : #testing }
SGTAbstractSeasideTestCase class >> isAbstract [
	^ self = SGTAbstractSeasideTestCase
]

{ #category : #asserting }
SGTAbstractSeasideTestCase >> assert: aBlock generatedIncludes: aString [
	self
		executeWithMockContext: [ | actual |
			actual := WAHtmlCanvas builder render: aBlock.
			self assert: (actual includesSubstring: aString) description: actual , ' should includes ' , aString ]
]

{ #category : #asserting }
SGTAbstractSeasideTestCase >> assert: aBlock generatedIncludesAll: aCollection [
	self
		executeWithMockContext: [ | generated |
			generated := WAHtmlCanvas builder render: aBlock.
			aCollection do: [ :aString | self assert: (generated includesSubstring: aString) ] ]
]

{ #category : #asserting }
SGTAbstractSeasideTestCase >> assert: aBlock generates: aString [
	self executeWithMockContext: [ self assert: (WAHtmlCanvas builder render: aBlock) equals: aString ]
]

{ #category : #asserting }
SGTAbstractSeasideTestCase >> deny: aBlock generatedIncludes: aString [
	self
		executeWithMockContext: [ | actual |
			actual := WAHtmlCanvas builder render: aBlock.
			self deny: (actual includesSubstring: aString) description: actual , ' should includes ' , aString ]
]

{ #category : #asserting }
SGTAbstractSeasideTestCase >> executeWithMockContext: aBlock [
	WACurrentRequestContext use: SGTMockRequestContext new during: [ aBlock value ]
]
