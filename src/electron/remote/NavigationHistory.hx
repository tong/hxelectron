package electron.remote;
/**
	@see https://electronjs.org/docs/api/navigation-history
**/
@:jsRequire("electron", "remote.NavigationHistory") extern class NavigationHistory extends js.node.events.EventEmitter<electron.remote.NavigationHistory> {
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
		History length.
	**/
	function length():Int;
}
enum abstract NavigationHistoryEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
