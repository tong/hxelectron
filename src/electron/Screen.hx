package electron;
/**
	Retrieve information about screen size, displays, cursor position, etc.
	@see http://electronjs.org/docs/api/screen
**/
@:native('require(\"electron\").screen') extern class Screen extends js.node.events.EventEmitter<electron.Screen> {
	/**
		The current absolute position of the mouse pointer.
	**/
	static function getCursorScreenPoint():electron.Point;
	static function getPrimaryDisplay():electron.Display;
	static function getAllDisplays():Array<electron.Display>;
	static function getDisplayNearestPoint(point:electron.Point):electron.Display;
	static function getDisplayMatching(rect:electron.Rectangle):electron.Display;
	/**
		Converts a screen physical point to a screen DIP point. The DPI scale is performed relative to the display containing the physical point.
	**/
	@:electron_platforms(["Windows"])
	static function screenToDipPoint(point:electron.Point):electron.Point;
	/**
		Converts a screen DIP point to a screen physical point. The DPI scale is performed relative to the display containing the DIP point.
	**/
	@:electron_platforms(["Windows"])
	static function dipToScreenPoint(point:electron.Point):electron.Point;
	/**
		Converts a screen physical rect to a screen DIP rect. The DPI scale is performed relative to the display nearest to window. If window is null, scaling will be performed to the display nearest to rect.
	**/
	@:electron_platforms(["Windows"])
	static function screenToDipRect(window:haxe.extern.EitherType<electron.main.BrowserWindow, Dynamic>, rect:electron.Rectangle):electron.Rectangle;
	/**
		Converts a screen DIP rect to a screen physical rect. The DPI scale is performed relative to the display nearest to window. If window is null, scaling will be performed to the display nearest to rect.
	**/
	@:electron_platforms(["Windows"])
	static function dipToScreenRect(window:haxe.extern.EitherType<electron.main.BrowserWindow, Dynamic>, rect:electron.Rectangle):electron.Rectangle;
}
@:enum abstract ScreenEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when newDisplay has been added.
	**/
	var display_added : electron.ScreenEvent<(js.html.Event, electron.Display) -> Void> = "display-added";
	/**
		Emitted when oldDisplay has been removed.
	**/
	var display_removed : electron.ScreenEvent<(js.html.Event, electron.Display) -> Void> = "display-removed";
	/**
		Emitted when one or more metrics change in a display. The changedMetrics is an array of strings that describe the changes. Possible changes are bounds, workArea, scaleFactor and rotation.
	**/
	var display_metrics_changed : electron.ScreenEvent<(js.html.Event, electron.Display, Array<String>) -> Void> = "display-metrics-changed";
}
