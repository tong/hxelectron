#!/usr/bin/env bash

if [ -z "$1" ]; then
    next=$(gh release list --repo electron/electron --limit 1 --exclude-drafts | awk '{print $2}')
else
    next=$1
fi

#current=$(git describe --tags --abbrev=0)
current=$(jq  -r '.version' haxelib.json)
prerelease_version=$(echo $next | awk -F'-' '{print $2}')

if [[ -n "$prerelease_version" ]]; then
    echo "Aborting update since latest version is a pre-release ($next)"
    exit 1
fi

if [ "$current" = "$next" ]; then
    echo "No new version available"
    exit 1
fi

echo "Updating from $current -> $next"

echo "Download electron-api.json"
gh release download "$next" --clobber -R electron/electron -p electron-api.json
echo "Building api"
haxe api.hxml
echo "Building haxedoc.xml"
haxe haxedoc.hxml
echo "Updating haxelib.json"
cat <<< "$(jq --arg var "$next" '.version = $var' haxelib.json)" > tmpfile && mv tmpfile haxelib.json
echo "Updating demo/package.json"
cd demo || exit 1
cat <<< "$(jq --arg var "$next" '.devDependencies.electron = $var' package.json)" > tmpfile && mv tmpfile package.json
npm install
cd - || exit 1
exit 0
