# Project
Short project description here.

## Creating a build, uploading to Hockey
First, make sure Shenzhen is installed: `$ gem install shenzhen`

Then, when you want to create a new build, simply call `$ make hockey`. This will increase the build number, add a new git tag,  generate release notes, update the changelog, create the build and send it to Hockey.
