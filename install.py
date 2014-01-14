#!/usr/bin/python
import shutil
import os


project_name = raw_input("Enter the project name (for example ios-projectname-universal): ")
folder_name = raw_input("Enter the root folder (leave empty for ~/Workspace): ") or "~/Workspace"
destination = os.path.expanduser('{0}/{1}'.format(folder_name, project_name))

# Copy template to new folder
shutil.copytree('template', destination)

# Replace all occurances of "AppTemplate" with chosen project_name
project_file = '{0}/AppTemplate.xcodeproj/project.pbxproj'.format(destination)
filedata = open(project_file, 'r').read().replace('AppTemplate', project_name)
open(project_file, 'w').write(filedata)

# Rename the info plist and prefix header
os.rename('{0}/AppTemplate/Supporting Files/AppTemplate-Info.plist'.format(destination), '{0}/AppTemplate/Supporting Files/{1}-Info.plist'.format(destination, project_name))
os.rename('{0}/AppTemplate/Supporting Files/AppTemplate-Prefix.pch'.format(destination), '{0}/AppTemplate/Supporting Files/{1}-Prefix.pch'.format(destination, project_name))

# Rename the xcodeproj folder and source folder
os.rename('{0}/AppTemplate.xcodeproj'.format(destination), '{0}/{1}.xcodeproj'.format(destination, project_name))
os.rename('{0}/AppTemplate'.format(destination), '{0}/{1}'.format(destination, project_name))

print "New project created in {0}. Don't forget to run `pod install`.".format(destination)
