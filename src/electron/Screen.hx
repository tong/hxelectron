package electron;

/**
**/
@:require(js, electron) @:electron @:native("require(\"electron\").screen") extern class Screen {
	/**
		The current absolute position of the mouse pointer.
	**/
	static function getCursorScreenPoint():Point;
	static function getPrimaryDisplay():Display;
	static function getAllDisplays():Array<Display>;
	static function getDisplayNearestPoint(point:Point):Display;
	static function getDisplayMatching(rect:Rectangle):Display;
	/**
		Converts a screen physical point to a screen DIP point. The DPI scale is performed relative to the display containing the physical point.
	**/
	@:electron_platform(["Windows"])
	static function screenToDipPoint(point:Point):Point;
	/**
		Converts a screen DIP point to a screen physical point. The DPI scale is performed relative to the display containing the DIP point.
	**/
	@:electron_platform(["Windows"])
	static function dipToScreenPoint(point:Point):Point;
	/**
		Converts a screen physical rect to a screen DIP rect. The DPI scale is performed relative to the display nearest to window. If window is null, scaling will be performed to the display nearest to rect.
	**/
	//@:electron_platform(["Windows"])
	//static function screenToDipRect(window:BrowserWindow, rect:Rectangle):Rectangle;
	/**
		Converts a screen DIP rect to a screen physical rect. The DPI scale is performed relative to the display nearest to window. If window is null, scaling will be performed to the display nearest to rect.
	**/
	//@:electron_platform(["Windows"])
	//static function dipToScreenRect(window:BrowserWindow, rect:Rectangle):Rectangle;
}
