
# Electron

[Haxe](https://haxe.org/) externs for [Electron](http://electron.atom.io/).

The Electron framework lets you write cross-platform desktop applications
using JavaScript, HTML and CSS. It is based on [Node.js](https://nodejs.org/) and
[Chromium](http://www.chromium.org).

[![Build Status](https://travis-ci.org/fponticelli/hxelectron.svg?branch=master)](https://travis-ci.org/fponticelli/hxelectron)

## Install

```sh
$ haxelib install electron
```

## Generate Externs

Download latest api description file from the [electron releases site](https://github.com/electron/electron/releases).

```sh
$ haxelib run electron <path/to/electron-api.json>
```

## Demo Application

Spin up the Haxe Quick Start app to see Electron in action:

```sh

## Clone repository and use as haxelib
$ git clone https://github.com/fponticelli/hxelectron
$ cd hxelectron/
$ haxelib dev electron .

# Build and run the demo application
$ cd demo/
$ haxe build.hxml
$ electron bin/
```
