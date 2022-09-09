#!/usr/bin/env bash

#current=$(git describe --tags --abbrev=0)
current=$(jq  -r '.version' haxelib.json)
latest=$(gh release list --repo electron/electron --limit 1 --exclude-drafts | awk '{print $2}')

echo "Current: $current"
echo "Latest: $latest"

if [ ! "$current" = "$latest" ]; then
    echo "Download electron-api.json"
    gh release download "$latest" -R electron/electron -p electron-api.json
    echo "Building api"
    haxe api.hxml
    echo "Building haxedoc.xml"
    haxe haxedoc.hxml
    echo "Updating haxelib.json"
    cat <<< "$(jq --arg var "$latest" '.version = $var' haxelib.json)" > haxelib.json
    echo "Updating demo/package.json"
    cd demo || exit 1
    cat <<< "$(jq --arg var "$latest" '.devDependencies.electron = $var' package.json)" > package.json
    npm install
    cd - || exit 1
    exit 0
else
    echo "No new version available"
    exit 1
fi
