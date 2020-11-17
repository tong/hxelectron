package electron.main;
/**
	> Create and control views.
	
	Process: Main
	
	A `BrowserView` can be used to embed additional web content into a `BrowserWindow`. It is like a child window, except that it is positioned relative to its owning window. It is meant to be an alternative to the `webview` tag.
	
	### Example
	
	```
	// In the main process.
	const { BrowserView, BrowserWindow } = require('electron')
	
	const win = new BrowserWindow({ width: 800, height: 600 })
	
	const view = new BrowserView()
	win.setBrowserView(view)
	view.setBounds({ x: 0, y: 0, width: 300, height: 300 })
	view.webContents.loadURL('https://electronjs.org')
	```
	@see https://electronjs.org/docs/api/browser-view
**/
@:jsRequire("electron", "BrowserView") extern class BrowserView extends js.node.events.EventEmitter<electron.main.BrowserView> {
	/**
		A `WebContents` object owned by this view.
	**/
	var webContents : electron.main.WebContents;
	function new(?options:{ /**
		See BrowserWindow.
	**/
	@:optional
	var webPreferences : Any; }):Void;
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
	function setBackgroundColor(color:String):Void;
}
@:enum abstract BrowserViewEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
