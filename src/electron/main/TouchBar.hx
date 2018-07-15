package electron.main;

/**
	Create TouchBar layouts for native macOS applications

	See: <http://electron.atom.io/docs/api/touch-bar>
**/
@:require(js, electron) @:jsRequire("electron", "TouchBar") @:electron("main") extern class TouchBar {
	/**
		A TouchBarItem that will replace the "esc" button on the touch bar when set. Setting to null restores the default "esc" button. Changing this value immediately updates the escape item in the touch bar.
	**/
	var escapeItem : Dynamic;
	function new(options:{ @:optional
	var items : Array<Dynamic>; @:optional
	var escapeItem : Dynamic; }):Void;
}