package electron.main;

/**
	Create and control views.

	See: <http://electron.atom.io/docs/api/browser-view>
**/
@:require(js, electron) @:jsRequire("electron", "BrowserView") extern class BrowserView {
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
	function setBounds(bounds:Rectangle):Void;
	function setBackgroundColor(color:String):Void;
}