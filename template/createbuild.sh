#!/bin/bash

# Are there any commits since the last tag?
git fetch --tags
lastTag=$(git for-each-ref --sort=-taggerdate --format='%(refname:short)' refs/tags --count 1)
commitsSinceLastTag=$(git rev-list $lastTag..HEAD)

if [ -z "$commitsSinceLastTag" ]
  then
    echo "No new commits, abort"
	exit
fi

# Make sure cocoapods is in sync
pod install

plist=$(find . -regex '^.*\/Supporting Files\/.*-Info.plist$')
versionNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$plist")
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$plist")

# Increase the build number by one
buildNumber=$(($buildNumber + 1))

# Set the new build number
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "$plist"

# Create the build
xcodebuild -workspace sling.xcworkspace -scheme sling -sdk iphoneos archive

# Save the git log into notes.md
git log --pretty=format:'* %s [%an]' --abbrev-commit --dense --no-merges --reverse ...$lastTag > notes.md

# Edit the notes, make it nice and readable, edit out any nonsense
pico notes.md

# Save notes into changelog
echo "$versionNumber-$buildNumber (`date +"%Y-%m-%d %H:%M"`)" >> temp_changelog.md
cat notes.md >> temp_changelog.md
echo "" >> temp_changelog.md
cat changelog.md >> temp_changelog.md
mv temp_changelog.md changelog.md
rm -f notes.md

# Commit, set git tag
git add .
git commit -m "Build $buildNumber"
tag="$versionNumber-$buildNumber"
git tag -a $tag -m "$tag"
git push origin $tag
git push origin