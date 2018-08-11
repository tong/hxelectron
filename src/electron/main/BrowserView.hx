package electron.main;
/**
	Create and control views.
	@see http://electron.atom.io/docs/api/browser-view
**/
@:jsRequire("electron", "BrowserView") extern class BrowserView {
	static function getAllViews():Array<electron.main.BrowserView>;
	static function fromWebContents(webContents:electron.main.WebContents):haxe.extern.EitherType<electron.main.BrowserView, Dynamic>;
	static function fromId(id:Int):electron.main.BrowserView;
	/**
		A WebContents object owned by this view.
	**/
	var webContents : electron.main.WebContents;
	/**
		A Integer representing the unique ID of the view.
	**/
	var id : Int;
	function new(?options:{ /**
		See .
	**/
	@:optional
	var webPreferences : Any; }):Void;
	/**
		Force closing the view, the unload and beforeunload events won't be emitted for the web page. After you're done with a view, call this function in order to free memory and other resources as soon as possible.
	**/
	function destroy():Void;
	function isDestroyed():Bool;
	@:electron_platform(["Experimental"])
	function setAutoResize(options:{ /**
		If true, the view's width will grow and shrink together with the window. false by default.
	**/
	var width : Bool; /**
		If true, the view's height will grow and shrink together with the window. false by default.
	**/
	var height : Bool; }):Void;
	/**
		Resizes and moves the view to the supplied bounds relative to the window.
	**/
	@:electron_platform(["Experimental"])
	function setBounds(bounds:electron.Rectangle):Void;
	@:electron_platform(["Experimental"])
	function setBackgroundColor(color:String):Void;
}
