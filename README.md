
# HXElectron

[Haxe](https://haxe.org/) type definitions for [Electron](http://electron.atom.io/).

[![Build Status](https://travis-ci.org/fponticelli/hxelectron.svg?branch=master)](https://travis-ci.org/fponticelli/hxelectron)

The Electron framework lets you write cross-platform desktop applications
using JavaScript, HTML and CSS based on [Node.js](https://nodejs.org/) and
[Chromium](http://www.chromium.org).


## Generate Type Definitions

All type definitions are auto generated from [electron-api.json](electron-api.json) into the [src/](src/) directory.  
To (re)generate type definitions using another electron version run:
```sh
haxelib run electron <path/to/your/electron-api.json>
```


## Demo Application

Spin up the demo application to see electron in action:

```sh
## Clone repository
git clone https://github.com/fponticelli/hxelectron
cd hxelectron/

## Set the haxelib development directory
haxelib dev electron .

## Build and run the demo application
cd demo/
haxe build.hxml
electron bin/
```
