package electron;

/**
**/
@:require(js, electron) @:electron @:native("require(\"electron\").screen") extern class Screen {
	/**
		The current absolute position of the mouse pointer.
	**/
	static function getCursorScreenPoint():Point;
	@:electron_platform(["macOS"])
	static function getMenuBarHeight():Int;
	static function getPrimaryDisplay():Display;
	static function getAllDisplays():Array<Display>;
	static function getDisplayNearestPoint(point:Point):Display;
	static function getDisplayMatching(rect:Rectangle):Display;
}