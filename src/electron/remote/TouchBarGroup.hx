package electron.remote;
/**
	> Create a group in the touch bar for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-group
**/
@:jsRequire("electron", "remote.TouchBarGroup") extern class TouchBarGroup extends js.node.events.EventEmitter<electron.remote.TouchBarGroup> {
	function new(options:{ /**
		Items to display as a group.
	**/
	var items : electron.remote.TouchBar; }):Void;
}
@:enum abstract TouchBarGroupEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
