package electron;

/**
**/
@:require(js, electron) @:jsRequire("electron", "screen") extern class Screen {
	/**
		The current absolute position of the mouse pointer.
	**/
	static function getCursorScreenPoint():Point;
	static function getMenuBarHeight():Int;
	static function getPrimaryDisplay():Display;
	static function getAllDisplays():Array<Display>;
	static function getDisplayNearestPoint(point:Point):Display;
	static function getDisplayMatching(rect:Rectangle):Display;
}