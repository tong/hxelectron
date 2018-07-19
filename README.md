
HXElectron
==========

> Haxe→JS type definitions for [electron](https://electronjs.org/).

[![Build Status](https://img.shields.io/travis/tong/hxelectron/master.svg?style=flat-square)](https://travis-ci.org/tong/hxelectron) [![Haxelib Version](https://img.shields.io/github/tag/tong/hxelectron.svg?style=flat-square&colorA=EA8220&colorB=FBC707&label=haxelib)](http://lib.haxe.org/p/electron/)

The Electron framework lets you write cross-platform desktop applications using JavaScript, HTML and CSS based on [Node.js](https://nodejs.org/) and [Chromium](http://www.chromium.org).


## Installation

```sh
# Release version from haxelib:
haxelib install electron
# Development version from git:
haxelib git electron https://github.com/tong/hxelectron.git
```


## Usage

### Demo Application

Spin up the demo application to see electron in action:

```sh
## Make sure you have Electron installed (you only need to do this once)
npm install -g electron

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
 - `@:require(js,electron)`
 - `@:electron` for types in `electron.*` (available in the main and renderer process).
 - `@:electron("main")` for types in `electron.main.*` (only available in the main process).
 - `@:electron("renderer")` for types in `electron.renderer.*` (only available in the renderer process).
 - `@:electron_platform(["Linux"|"macOS"|"Windows"])` the supporting platforms (only if specific).


## Generate Type Definitions

All type definitions are auto generated from [electron-api.json](electron-api.json) into the [src/](src/) directory.  
To (re)generate type definitions using another [electron version](https://github.com/electron/electron/releases) run:
```sh
haxelib run electron [path/to/your/electron-api.json]
```

Do **not** make changes to the externs itself but edit the [generator](tool/ElectronAPI.hx).
```sh
## Edit hxelectron/tool/ElectronAPI.hx
# …
## Rebuild the generator (run.n)
haxe run.hxml
## Generate externs
neko run.n
```
