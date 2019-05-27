# SeasideGenerationTester

Small project to help test generated Seaside code

# Documentation

## Version management 

This project use semantic versionning to define the releases. This mean that each stable release of the project will get associate a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

When a release contains only bug fixes, the patch number increase. When the release contains new features backward compatibles, the minor version increase. When the release contains breaking changes, the major version increase. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Install

To install the project on your Pharo image you can just execute the following script: 

```Smalltalk
    Metacello new
    	githubUser: 'DuneSt' project: 'SeasideGenerationTester' commitish: 'v1.x.x' path: 'src';
    	baseline: 'SeasideGenerationTester';
    	load
```

To add SeasideGenerationTester to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'SeasideGenerationTester'
    	with: [ spec repository: 'github://DuneSt/SeasideGenerationTester:v1.x.x/src' ]
		
## Getting started

This project should be used by subclassing `SGTAbstractSeasideTestCase` or `SGTAbstractBrushTest`.

Once done, you have access to new assertion methods and they can be used like this:

```Smalltalk
testId
	self assert: [ :html | MDLPanelSwitcherButton new id: 'testId'; renderContentOn: html ] generatedIncludes: 'id="testId"'
```

```Smalltalk
testRenderEmptyGenericDialogOn
	self
		assert: [ :html | MDLRootDialogRenderer new renderEmptyGenericDialogOn: html ]
		generatedIncludesAll: #('mdl-dialog' 'data-openbtnid="root-dialog__open"' 'data-closebtnid="root-dialog__close"')
```

```Smalltalk
testAccentColor
	self
		assert: [ :html | 
			html mdlAnchorButton
				accentColor;
				with: 'Validate' ]
		generates: '<a class="mdl-button mdl-js-button mdl-button--accent">Validate</a>'
```

## Smalltalk versions compatibility

| MDL version 	| Compatible Pharo versions 	| Compatible Gemstone versions 	|
|-------------	|---------------------------	|---------------------------	|
| 1.x.x       	| Pharo 61, 70, 80				| None							|