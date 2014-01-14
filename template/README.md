# Project
Short project description here.

## Creating a build, uploading to Hockey
First, make sure Shenzhen is installed: `$ gem install shenzhen`

Then, when you want to create a new build, simply call `$ make hockey`. This will increase the build number, add a new git tag,  generate release notes, update the changelog, create the build and send it to Hockey.

## Adding a new device to the provisioning profile
Adding devices and managing the provisioning profile needs to be done on [developer.apple.com](https://developer.apple.com/account/). Sadly the command line tool (Cupertino gem) isn't stable - and even when it's fixed it quickly breaks due to frequent changes by Apple.

Download and install the new provisioning profile, or refresh then within Xcode, and make sure it's selected for the Master config.
