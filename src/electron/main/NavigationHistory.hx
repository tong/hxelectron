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
		Whether the web page can go to the specified relative `offset` from the current entry.
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
		Navigation entry at the given index.
		
		If index is out of bounds (greater than history length or less than 0), null will be returned.
	**/
	function getEntryAtIndex(index:Int):electron.NavigationEntry;
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
		Navigates to the specified relative offset from the current entry.
	**/
	function goToOffset(offset:Int):Void;
	/**
		History length.
	**/
	function length():Int;
	/**
		Removes the navigation entry at the given index. Can't remove entry at the "current active index".
		
		Whether the navigation entry was removed from the webContents history.
	**/
	function removeEntryAtIndex(index:Int):Bool;
	/**
		WebContents complete history.
	**/
	function getAllEntries():Array<electron.NavigationEntry>;
	/**
		the promise will resolve when the page has finished loading the selected navigation entry (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`). A noop rejection handler is already attached, which avoids unhandled rejection errors.
	**/
	function restore(options:{ /**
		Result of a prior `getAllEntries()` call
	**/
	var entries : Array<electron.NavigationEntry>; /**
		Index of the stack that should be loaded. If you set it to `0`, the webContents will load the first (oldest) entry. If you leave it undefined, Electron will automatically load the last (newest) entry.
	**/
	@:optional
	var index : Int; }):js.lib.Promise<Any>;
}
enum abstract NavigationHistoryEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
