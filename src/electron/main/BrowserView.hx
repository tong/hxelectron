package electron.main;

/**
	Create and control views.

	See: <http://electron.atom.io/docs/api/browser-view>
**/
@:require(js, electron) @:jsRequire("electron", "BrowserView") @:electron("main") extern class BrowserView {
	/**
		A WebContents object owned by this view.
	**/
	var webContents : WebContents;
	/**
		A Integer representing the unique ID of the view.
	**/
	var id : Int;
	function new(?options:{ /**
		See .
	**/
	@:optional
	var webPreferences : { }; }):Void;
	/**
		Force closing the view, the unload and beforeunload events won't be emitted for the web page. After you're done with a view, call this function in order to free memory and other resources as soon as possible.
	**/
	function destroy():Void;
	function isDestroyed():Bool;
	@:electron_platform(["Experimental"])
	function setAutoResize(options:{ /**
		If true, the view's width will grow and shrink together with the window. false by default.
	**/
	@:optional
	var width : Bool; /**
		If true, the view's height will grow and shrink together with the window. false by default.
	**/
	@:optional
	var height : Bool; }):Void;
	/**
		Resizes and moves the view to the supplied bounds relative to the window.
	**/
	@:electron_platform(["Experimental"])
	function setBounds(bounds:Rectangle):Void;
	@:electron_platform(["Experimental"])
	function setBackgroundColor(color:String):Void;
	static function getAllViews():Array<BrowserView>;
	static function fromWebContents(webContents:WebContents):Dynamic;
	static function fromId(id:Int):BrowserView;
}