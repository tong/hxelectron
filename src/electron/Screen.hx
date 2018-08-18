package electron;
/**
	Retrieve information about screen size, displays, cursor position, etc.
	@see http://electron.atom.io/docs/api/screen
**/
@:native('require(\"electron\").screen') extern class Screen extends js.node.events.EventEmitter<electron.Screen> {
	/**
		The current absolute position of the mouse pointer.
	**/
	static function getCursorScreenPoint():electron.Point;
	@:electron_platforms(["macOS"])
	static function getMenuBarHeight():Int;
	static function getPrimaryDisplay():electron.Display;
	static function getAllDisplays():Array<electron.Display>;
	static function getDisplayNearestPoint(point:electron.Point):electron.Display;
	static function getDisplayMatching(rect:electron.Rectangle):electron.Display;
}
@:enum abstract ScreenEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when newDisplay has been added.
	**/
	var display_added : electron.ScreenEvent<js.html.Event -> electron.Display -> Void> = "display-added";
	/**
		Emitted when oldDisplay has been removed.
	**/
	var display_removed : electron.ScreenEvent<js.html.Event -> electron.Display -> Void> = "display-removed";
	/**
		Emitted when one or more metrics change in a display. The changedMetrics is an array of strings that describe the changes. Possible changes are bounds, workArea, scaleFactor and rotation.
	**/
	var display_metrics_changed : electron.ScreenEvent<js.html.Event -> electron.Display -> Array<String> -> Void> = "display-metrics-changed";
}
