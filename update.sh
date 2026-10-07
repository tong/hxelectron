#!/usr/bin/env bash
#
# Update to a new electron release.
#
# Usage: ./update.sh [version]
#   version  electron release, with or without leading `v` (default: latest release)

set -euo pipefail

cd "$(dirname "$0")"

for cmd in gh jq haxe npm; do
  command -v "$cmd" >/dev/null || {
    echo "Missing required command: $cmd"
    exit 1
  }
done

if [ -n "${1:-}" ]; then
  tag="v${1#v}"
else
  tag=$(gh release view --repo electron/electron --json tagName --jq .tagName)
fi
version=${tag#v}

if [[ ! "$tag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+(-.+)?$ ]]; then
  echo "Invalid version ($tag)"
  exit 1
fi

if [[ "$version" == *-* ]]; then
  echo "Aborting update since $tag is a pre-release"
  exit 1
fi

current=$(jq -r '.version' haxelib.json)
if [ "$current" = "$version" ]; then
  echo "No new version available (current: $current)"
  exit 1
fi

echo "Updating from $current -> $version"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# Update a json file in place; keeps the original if jq fails
jq_update() {
  local file=$1
  shift
  jq "$@" "$file" >"$tmp/json" && mv "$tmp/json" "$file"
}

echo "Download electron-api.json"
gh release download "$tag" -R electron/electron -p electron-api.json -D "$tmp"
mv "$tmp/electron-api.json" electron-api.json

echo "Building api"
haxe api.hxml

echo "Building haxedoc.xml"
haxe haxedoc.hxml

echo "Updating haxelib.json"
# shellcheck disable=SC2016 # $var is a jq variable
jq_update haxelib.json --arg var "$version" '.version = $var'

echo "Updating demo/package.json"
# shellcheck disable=SC2016 # $var is a jq variable
jq_update demo/package.json --arg var "$tag" '.devDependencies.electron = $var'
(cd demo && npm install --no-audit --no-fund)

echo
echo "Updated to electron $tag. Review the changes and commit:"
echo "  git add -A electron-api.json haxelib.json haxedoc.xml demo/package.json demo/package-lock.json src"
echo "  git commit -m \"upgrade to electron $tag\""
