#!/bin/sh

## Rebuild generator
haxe run.hxml --no-traces -dce full

## Build clean externs
rm -rf src/
neko run.n electron-api.json

## Build haxedoc.xml (insure everything is fine)
haxe doc.hxml

## Create zip
rm -f electron.zip
zip -r electron.zip src/ electron-api.json haxedoc.xml haxelib.json LICENSE README.md run.n -x "*/\.*"

## Release haxelib
#haxelib submit electron.zip
