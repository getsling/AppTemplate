#!/usr/bin/python
import shutil
import os
from datetime import datetime
import getpass


def findReplace(directory, find, replace):
    for path, dirs, files in os.walk(os.path.abspath(directory)):
        for filename in files:
            filepath = os.path.join(path, filename)
            with open(filepath) as f:
                s = f.read()
            s = s.replace(find, replace)
            with open(filepath, "w") as f:
                f.write(s)


default_folder_name = '~/Workspace'
default_person_name = getpass.getuser()
default_company_name = 'Gangverk'

project_name = raw_input("Enter the project name (for example ios-projectname-universal): ")
folder_name = raw_input("Enter the root folder (leave empty for {0}): ".format(default_folder_name)) or default_folder_name
person_name = raw_input("Enter the name of the project owner (leave empty for {0}): ".format(default_person_name)) or default_person_name
company_name = raw_input("Enter the name of the copyright holder (leave empty for {0}): ".format(default_company_name)) or default_company_name

# Copy template to new folder
destination = os.path.expanduser('{0}/{1}'.format(folder_name, project_name))
shutil.copytree('template', destination)

# Replace text
findReplace(destination, 'AppTemplate', project_name)
findReplace(destination, '{PERSON}', person_name)
findReplace(destination, '{CREATED}', datetime.now().strftime("%d-%m-%Y"))
findReplace(destination, '{COPYRIGHT}', '{0} {1}'.format(datetime.now().year, company_name))

# Rename the info plist and prefix header
os.rename('{0}/AppTemplate/Supporting Files/AppTemplate-Info.plist'.format(destination), '{0}/AppTemplate/Supporting Files/{1}-Info.plist'.format(destination, project_name))
os.rename('{0}/AppTemplate/Supporting Files/AppTemplate-Prefix.pch'.format(destination), '{0}/AppTemplate/Supporting Files/{1}-Prefix.pch'.format(destination, project_name))

# Rename the xcodeproj folder and source folder
os.rename('{0}/AppTemplate.xcodeproj'.format(destination), '{0}/{1}.xcodeproj'.format(destination, project_name))
os.rename('{0}/AppTemplate'.format(destination), '{0}/{1}'.format(destination, project_name))

print "New project created in {0}. Don't forget to run `pod install`.".format(destination)
