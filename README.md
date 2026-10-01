# HXElectron

Haxe type definitions (externs) for [Electron](https://electronjs.org/), a framework for building cross-platform desktop applications with JavaScript, HTML and CSS.

[![test](https://github.com/tong/hxelectron/actions/workflows/test.yml/badge.svg)](https://github.com/tong/hxelectron/actions/workflows/test.yml) [![Haxelib Version](https://img.shields.io/github/tag/tong/hxelectron.svg?style=flat-square&colorA=EA8220&colorB=FBC707&label=haxelib)](http://lib.haxe.org/p/electron/)

The library version follows the Electron version it was generated from (e.g. `44.5.1`).

## Install

Release version:

```sh
haxelib install electron
```

Development version:

```sh
haxelib git electron https://github.com/tong/hxelectron.git
```

Requires Haxe 4.3.7 or newer and [hxnodejs](https://github.com/HaxeFoundation/hxnodejs), which is installed automatically as a dependency.

## Usage

Add the library to your build file and compile to JavaScript. Main and renderer process code are separate targets:

```hxml
-lib electron
-main Main
-js main.js
```

Types are split by process: `electron.main.*` for the main process, `electron.renderer.*` for renderer processes. Types available in both live directly in `electron.*`.

```haxe
import electron.main.App;
import electron.main.BrowserWindow;

class Main {
 static function main() {
  App.on('ready', () -> {
   var win = new BrowserWindow({width: 800, height: 600});
   win.loadFile('app.html');
  });
 }
}
```

See the [demo](demo/) for a complete application.

### Demo application

```sh
git clone https://github.com/tong/hxelectron
cd hxelectron/
haxelib dev electron .
cd demo/
npm install       # Install electron
npm run build     # Build main.js and app.js
npm start         # Run the application
```

### Metadata

The externs are annotated with the following metadata:

- `@:electron_platforms(["macOS"|"Windows"|"Linux"|"MAS"])` the supported platforms (only if platform specific).
- `@:deprecated` for APIs Electron has deprecated.
- `@:electron_experimental` for experimental APIs.

## Updating to a new Electron version

All type definitions are generated from [electron-api.json](electron-api.json) by [ElectronAPI.hx](ElectronAPI.hx).

To update to the latest release (requires the [GitHub CLI](https://cli.github.com/) and `jq`):

```sh
./update.sh          # latest release
./update.sh v44.5.1  # specific release
```

This downloads `electron-api.json`, regenerates `src/`, rebuilds `haxedoc.xml` and bumps the version in `haxelib.json` and `demo/package.json`.

To regenerate manually from a description file downloaded from the [Electron releases](https://github.com/electron/electron/releases):

```sh
haxe api.hxml        # regenerate src/ from electron-api.json
haxe haxedoc.hxml    # build haxedoc.xml to verify everything compiles
```

## License

[MIT](LICENSE)
