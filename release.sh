#!/bin/sh

## Generate clean type definitions
haxe --macro 'ElectronAPI.generate("electron-api.json","src",true)'

## Build haxedoc.xml
haxe haxedoc.hxml

## Build demo application (test wise)
haxe --cwd demo build.hxml

## Create zip
rm -f electron.zip
zip -r electron.zip src/ api.hxml ElectronAPI.hx electron-api.json haxedoc.xml haxelib.json LICENSE README.md -x "*/\.*"

## Release haxelib
haxelib submit electron.zip
