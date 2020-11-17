package electron.main;
/**
	> Create a group in the touch bar for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-group
**/
@:jsRequire("electron", "TouchBarGroup") extern class TouchBarGroup extends js.node.events.EventEmitter<electron.main.TouchBarGroup> {
	function new(options:{ /**
		Items to display as a group.
	**/
	var items : electron.main.TouchBar; }):Void;
}
@:enum abstract TouchBarGroupEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
