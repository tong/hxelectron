
HXElectron
==========
Haxe type definitions for [electron](https://electronjs.org/), a framework for building cross-platform desktop applications with JavaScript, HTML, and CSS.

[![Actions Status](https://github.com/tong/hxelectron/workflows/CI/badge.svg)](https://github.com/tong/hxelectron) [![Haxelib Version](https://img.shields.io/github/tag/tong/hxelectron.svg?style=flat-square&colorA=EA8220&colorB=FBC707&label=haxelib)](http://lib.haxe.org/p/electron/)


## Install

```sh
# Release version
haxelib install electron

# Development version
haxelib git electron https://github.com/tong/hxelectron.git
```

---

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

---

### Metadata

The haxe externs are attributed with following metadata:
 - `@:electron_platforms(["Linux"|"macOS"|"Windows"])` the supporting platforms (only if specific).

---

## Usage

### Demo Application

- #### Clone this repository and setup
 
```sh
git clone https://github.com/tong/hxelectron && cd hxelectron/
haxelib dev electron .
```

#### Build/Run

```sh
cd demo/
npm install # Install electron
npm run build # Build main.js, app.js
npm start # Run application
```
