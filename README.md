
# Electron

[Haxe](https://haxe.org/) externs for [Electron](http://electron.atom.io/).


The Electron framework lets you write cross-platform desktop applications
using JavaScript, HTML and CSS. It is based on [Node.js](https://nodejs.org/) and
[Chromium](http://www.chromium.org).

[![Build Status](https://travis-ci.org/fponticelli/hxelectron.svg?branch=master)](https://travis-ci.org/fponticelli/hxelectron)


All type definitions are auto generated from [electron-api.json](electron-api.json) into the [src/](src/) directory. To (re)generate using another electron version run:

```sh
haxelib run electron <path/to/electron-api.json>
```

## Demo Application

Spin up the Haxe Quick Start app to see Electron in action:

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
