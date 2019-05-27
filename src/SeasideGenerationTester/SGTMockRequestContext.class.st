"
Mock used to emulate a request context
"
Class {
	#name : #SGTMockRequestContext,
	#superclass : #WARequestContext,
	#category : #SeasideGenerationTester
}

{ #category : #'instance creation' }
SGTMockRequestContext class >> new [
	^ super request: WARequest new response: WABufferedResponse new
]

{ #category : #'accessing-dynamic' }
SGTMockRequestContext >> handler [
	^ WARequestHandler new
]
