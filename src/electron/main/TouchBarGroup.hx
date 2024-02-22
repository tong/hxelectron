package electron.main;
/**
	> Create a group in the touch bar for native macOS applications
	
	Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._
	@see https://electronjs.org/docs/api/touch-bar-group
**/
@:jsRequire("electron", "TouchBarGroup") extern class TouchBarGroup extends js.node.events.EventEmitter<electron.main.TouchBarGroup> {
	function new(options:{ /**
		Items to display as a group.
	**/
	var items : electron.main.TouchBar; }):Void;
}
enum abstract TouchBarGroupEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
