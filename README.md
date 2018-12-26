
HXElectron
==========
Haxe type definitions for [electron](https://electronjs.org/), a framework for building cross-platform desktop applications with JavaScript, HTML, and CSS.

[![Build Status](https://img.shields.io/travis/tong/hxelectron/master.svg?style=flat-square)](https://travis-ci.org/tong/hxelectron) [![Haxelib Version](https://img.shields.io/github/tag/tong/hxelectron.svg?style=flat-square&colorA=EA8220&colorB=FBC707&label=haxelib)](http://lib.haxe.org/p/electron/)


## Install

```sh
# Release version
haxelib install electron

# Development version
haxelib git electron https://github.com/tong/hxelectron.git
```


## Generate Type Definitions

All type definitions are generated from [electron-api.json](electron-api.json) by [ElectronAPI.hx](ElectronAPI.hx).  
To (re)generate for another electron version download the description file from https://github.com/electron/electron/releases and run:

```sh
## Generate type definitions
haxe --macro ElectronAPI.generate("optional/path/to/electron-api.json")

## Build haxedoc.xml to insure everything is fine
haxe haxedoc.hxml
```

By default `hxelectron/electron-api.json` is used if you ommit the path argument to your custom description file.

NOTE: The types in this repository (and on haxelib) are generated with and for 4.0.0-preview.5.
You have to (re)generate them for haxe < 4.


## Usage

### Demo Application

Spin up the included demo application to see electron in action:

```sh
## Make sure you have Electron installed (you only need to do this once)
npm install -g electron@latest

## Clone this repository
git clone https://github.com/tong/hxelectron
cd hxelectron/

## Set the haxelib development directory
haxelib dev electron .

## Build and run the demo application
cd demo/
haxe build.hxml
electron bin/
```

### Metadata

The haxe externs are attributed with following metadata:
 - `@:electron_platforms(["Linux"|"macOS"|"Windows"])` the supporting platforms (only if specific).
