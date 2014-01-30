# Project
Short project description here.

## Install
1. Install [mogenerator](http://rentzsch.github.com/mogenerator/)  
`brew install mogenerator`

2. Install [CocoaPods](http://cocoapods.org)  
`gem install cocoapods`  
`pod setup`

3. Install dependencies  
`pod install`

4. Open the project **workspace** in **Xcode 5**  
`open AppTemplate.xcworkspace`

## Objective-C code style
Please use our code style as documented [in this document](https://github.com/gangverk/AppTemplate/blob/master/objective-c-style-guide.md).

## Creating a build, uploading to Hockey
First, make sure Shenzhen is installed: `$ gem install shenzhen`

Then, when you want to create a new build, simply call `$ make hockey`. This will increase the build number, add a new git tag,  generate release notes, update the changelog, create the build and send it to Hockey.
