#!/bin/sh
haxe run.hxml --no-traces -dce full
neko run.n electron-api.json
haxe doc.hxml
rm -f electron.zip
zip -r electron.zip src/ haxedoc.xml haxelib.json LICENSE README.md run.n -x "*/\.*"
haxelib submit electron.zip
