package electron.main;
/**
	A `BrowserView` can be used to embed additional web content into a `BrowserWindow`. It is like a child window, except that it is positioned relative to its owning window. It is meant to be an alternative to the `webview` tag.
	
	### Class: BrowserView
	
	> Create and control views.
	
	Process: Main
	
	This module cannot be used until the `ready` event of the `app` module is emitted.
	
	### Example
	
	```
	// In the main process.
	const { app, BrowserView, BrowserWindow } = require('electron')
	
	app.whenReady().then(() => {
	  const win = new BrowserWindow({ width: 800, height: 600 })
	
	  const view = new BrowserView()
	  win.setBrowserView(view)
	  view.setBounds({ x: 0, y: 0, width: 300, height: 300 })
	  view.webContents.loadURL('https://electronjs.org')
	})
	```
	@see https://electronjs.org/docs/api/browser-view
**/
@:jsRequire("electron", "BrowserView") extern class BrowserView extends js.node.events.EventEmitter<electron.main.BrowserView> {
	/**
		A `WebContents` object owned by this view.
	**/
	var webContents : electron.main.WebContents;
	function new(?options:{ /**
		Settings of web page's features.
	**/
	@:optional
	var webPreferences : electron.WebPreferences; }):Void;
	function setAutoResize(options:{ /**
		If `true`, the view's width will grow and shrink together with the window. `false` by default.
	**/
	@:optional
	var width : Bool; /**
		If `true`, the view's height will grow and shrink together with the window. `false` by default.
	**/
	@:optional
	var height : Bool; /**
		If `true`, the view's x position and width will grow and shrink proportionally with the window. `false` by default.
	**/
	@:optional
	var horizontal : Bool; /**
		If `true`, the view's y position and height will grow and shrink proportionally with the window. `false` by default.
	**/
	@:optional
	var vertical : Bool; }):Void;
	/**
		Resizes and moves the view to the supplied bounds relative to the window.
	**/
	function setBounds(bounds:electron.Rectangle):Void;
	/**
		The `bounds` of this BrowserView instance as `Object`.
	**/
	function getBounds():electron.Rectangle;
	/**
		Examples of valid `color` values:
		
		* Hex
		  * #fff (RGB)
		  * #ffff (ARGB)
		  * #ffffff (RRGGBB)
		  * #ffffffff (AARRGGBB)
		* RGB
		  * rgb(([\d]+),\s*([\d]+),\s*([\d]+))
		    * e.g. rgb(255, 255, 255)
		* RGBA
		  * rgba(([\d]+),\s*([\d]+),\s*([\d]+),\s*([\d.]+))
		    * e.g. rgba(255, 255, 255, 1.0)
		* HSL
		  * hsl((-?[\d.]+),\s*([\d.]+)%,\s*([\d.]+)%)
		    * e.g. hsl(200, 20%, 50%)
		* HSLA
		  * hsla((-?[\d.]+),\s*([\d.]+)%,\s*([\d.]+)%,\s*([\d.]+))
		    * e.g. hsla(200, 20%, 50%, 0.5)
		* Color name
		  * Options are listed in SkParseColor.cpp
		  * Similar to CSS Color Module Level 3 keywords, but case-sensitive.
		    * e.g. `blueviolet` or `red`
		
		**Note:** Hex format with alpha takes `AARRGGBB` or `ARGB`, _not_ `RRGGBBA` or `RGA`.
	**/
	function setBackgroundColor(color:String):Void;
}
enum abstract BrowserViewEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
