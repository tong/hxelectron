package electron.main;
/**
	@see https://electronjs.org/docs/api/navigation-history
**/
@:jsRequire("electron", "NavigationHistory") extern class NavigationHistory extends js.node.events.EventEmitter<electron.main.NavigationHistory> {
	/**
		Whether the browser can go back to previous web page.
	**/
	function canGoBack():Bool;
	/**
		Whether the browser can go forward to next web page.
	**/
	function canGoForward():Bool;
	/**
		Whether the web page can go to the specified `offset` from the current entry.
	**/
	function canGoToOffset(offset:Int):Bool;
	/**
		Clears the navigation history.
	**/
	function clear():Void;
	/**
		The index of the current page, from which we would go back/forward or reload.
	**/
	function getActiveIndex():Int;
	/**
		* `url` string - The URL of the navigation entry at the given index.
		* `title` string - The page title of the navigation entry at the given index.
		
		If index is out of bounds (greater than history length or less than 0), null will be returned.
	**/
	function getEntryAtIndex(index:Int):Any;
	/**
		Makes the browser go back a web page.
	**/
	function goBack():Void;
	/**
		Makes the browser go forward a web page.
	**/
	function goForward():Void;
	/**
		Navigates browser to the specified absolute web page index.
	**/
	function goToIndex(index:Int):Void;
	/**
		Navigates to the specified offset from the current entry.
	**/
	function goToOffset(offset:Int):Void;
	/**
		History length.
	**/
	function length():Int;
}
enum abstract NavigationHistoryEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
