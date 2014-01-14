# Install shenzhen, which provides the ipa command:
# $ gem install shenzhen
#
# When you're ready to create a new build for Hockey:
# $ make hockey
#
# This will increase the build number, add a new git tag,
# create release notes, update the changelog, create the build, 
# sign it with the embedded provisioning profile and send it to Hockey.


SCHEME="AppTemplate"
HOCKEY_API_TOKEN="xxx"


createtag:
	./createtag.sh

makenotes:
	git log --pretty=format:'* %s [%an]' --abbrev-commit --dense --no-merges --reverse ...`git for-each-ref --sort=-taggerdate --format='%(refname:short)' refs/tags --count 2 | cut -f2 | sed -n 2p` > notes.md
	pico notes.md # gives you the option to edit the release notes, filter out any nonsense

	# Save notes into changelog
	echo "`git for-each-ref --sort=-taggerdate --format='%(refname:short)' refs/tags --count 1` (`date +"%Y-%m-%d %H:%M"`)" >> temp_changelog.md
	cat notes.md >> temp_changelog.md
	echo "\n" >> temp_changelog.md
	cat changelog.md >> temp_changelog.md
	mv temp_changelog.md changelog.md

createbuild:
	ipa build -t -c Master -s $(SCHEME) --clean

cleanup:
	rm -f notes.md
	rm -f $(SCHEME).app.dSYM.zip
	rm -f $(SCHEME).ipa

hockey: createtag makenotes createbuild
	ipa distribute:hockeyapp --token $(HOCKEY_API_TOKEN) --markdown --notes "`cat notes.md`"
	make cleanup

hockeydownloadoff: createtag makenotes createbuild
	ipa distribute:hockeyapp --token $(HOCKEY_API_TOKEN) --markdown --downloadOff --notes "`cat notes.md`"
	make cleanup
