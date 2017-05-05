package electron.main;

/**
	Create TouchBar layouts for native macOS applications

	See: <http://electron.atom.io/docs/api/touch-bar>
**/
@:require(js, electron) @:jsRequire("electron", "TouchBar") extern class TouchBar {
	/**
		The TouchBarItem that will replace the "esc" button on the touch bar when set. Setting to null restores the default "esc" button. Changing this value immediately updates the escape item in the touch bar.
	**/
	var escapeItem : Dynamic;
	function new(items:Dynamic):Void;
}