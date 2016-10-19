package electron;
@:jsRequire("electron", "screen") @:require("electron") extern class Screen {
	/**
		The current absolute position of the mouse pointer.
	**/
	static function getCursorScreenPoint():Dynamic;
	static function getPrimaryDisplay():electron.Display;
	static function getAllDisplays():Array<Display>;
	static function getDisplayNearestPoint(point:{ @:optional
	var x : Int; @:optional
	var y : Int; }):electron.Display;
	static function getDisplayMatching(rect:electron.Rectangle):electron.Display;
}