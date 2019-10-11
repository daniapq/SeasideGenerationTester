"
I am a baseline of SeasideGenerationTester. 
Read more at: https://github.com/DuneSt/SeasideGenerationTester
"
Class {
	#name : #BaselineOfSeasideGenerationTester,
	#superclass : #BaselineOf,
	#category : #BaselineOfSeasideGenerationTester
}

{ #category : #baseline }
BaselineOfSeasideGenerationTester >> baseline: spec [
	<baseline>
	spec for: #common do: [
		self seaside3: spec.

		spec package: 'SeasideGenerationTester' with: [ spec requires: 'Seaside3' ]
		]
]

{ #category : #accessing }
BaselineOfSeasideGenerationTester >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfSeasideGenerationTester >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('Core');
				repository: 'github://SeasideSt/Seaside:v3.4.x/repository' ]
]
