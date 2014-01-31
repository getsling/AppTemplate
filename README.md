# AppTemplate
Gangverk universal iOS app template, command line build script, recommendations and Objective-C style guide.


## What is this?
This is Gangverk's app template to create a new (universal) iOS app. It uses our preferred folder structure, default pods and handy macros. It includes a command line build script for creating a new build and uploading it to Hockey.

For a list of recommended frameworks and libraries have a look at [recommendations.md](https://github.com/gangverk/AppTemplate/blob/master/recommendations.md), and our code style is documented in [objective-c-style-guide.md](https://github.com/gangverk/AppTemplate/blob/master/objective-c-style-guide.md).


## Create a new project from the template
```
git clone git@github.com:gangverk/AppTemplate.git
cd AppTemplate
./clone.py
```

Run `pod install` in your newly created project folder and from then on only open the workspace.

You should also edit the Makefile in your new project and enter the correct Hockey API key.


## Who are we?
Gangverk is a software consultancy founded by seasoned software professionals. We have been creating applications, both desktop and web-based for over a decade. Of late we have been focusing on mobile applications, specifically media applications for mobile users. We pride ourselves in our ability to offer our clients assistance throughout the creative process from conception to design to implementation, operation and maintenance.

Gangverk is an Icelandic word that literally means "that what makes stuff tick", originally coined for the machinery of clocks but in later times has taken over the connotation of whatever it is that keeps things operating smoothly underneath a polished exterior.

Visit us at [gangverk.is](http://www.gangverk.is).


## License
AppTemplate is available under the MIT license. See the LICENSE file for more info.