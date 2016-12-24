
# HXElectron

[![Build Status](https://travis-ci.org/fponticelli/hxelectron.svg?branch=master)](https://travis-ci.org/fponticelli/hxelectron)

[Haxe](https://haxe.org/) externs for [Electron](http://electron.atom.io/).

The Electron framework lets you write cross-platform desktop applications
using JavaScript, HTML and CSS. It is based on [Node.js](https://nodejs.org/) and
[Chromium](http://www.chromium.org)

## Install

```shell
$ haxelib install electron
```

## Generate Externs

Download latest api description file from the [electron releases site](https://github.com/electron/electron/releases).

```shell
$ haxelib run electron <path/to/electron-api.json>
```

## Demo Application

Spin up the Haxe Quick Start app to see Electron in action:

```shell
$ git clone https://github.com/fponticelli/hxelectron
$ cd hxelectron/demo/

## Install dependencies, build and run
$ npm install
$ npm run build
$ npm start
```
