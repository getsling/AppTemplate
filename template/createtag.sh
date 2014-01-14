#!/bin/bash

# Are there any commits since the last tag?
lastTag=$(git for-each-ref --sort=-taggerdate --format='%(refname:short)' refs/tags --count 1)
commitsSinceLastTag=$(git rev-list $lastTag..HEAD)

if [ -z "$commitsSinceLastTag" ]
  then
    echo "No new commits, abort"
	exit
fi

plist=$(find . -regex '^.*\/Supporting Files\/.*-Info.plist$')
versionNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$plist")
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$plist")

# Increase the build number by one
buildNumber=$(($buildNumber + 1))

# Set the new build number
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "$plist"

# Commit, set git tag
git ca -m "Build $buildNumber"
tag="$versionNumber-$buildNumber"
git tag -a $tag -m "$tag"
