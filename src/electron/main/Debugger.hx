package electron.main;
/**
	An alternate transport for Chrome's remote debugging protocol.
	@see http://electronjs.org/docs/api/debugger
**/
@:jsRequire("electron", "Debugger") extern class Debugger extends js.node.events.EventEmitter<electron.main.Debugger> {
	/**
		Attaches the debugger to the webContents.
	**/
	function attach(?protocolVersion:String):Void;
	function isAttached():Bool;
	/**
		Detaches the debugger from the webContents.
	**/
	function detach():Void;
	/**
		Send given command to the debugging target.
	**/
	function sendCommand(method:String, ?commandParams:Any, ?callback:haxe.Constraints.Function):Void;
}
@:enum abstract DebuggerEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when debugging session is terminated. This happens either when webContents is closed or devtools is invoked for the attached webContents.
	**/
	var detach : electron.main.DebuggerEvent<(js.html.Event, String) -> Void> = "detach";
	/**
		Emitted whenever debugging target issues instrumentation event.
	**/
	var message : electron.main.DebuggerEvent<(js.html.Event, String, Any) -> Void> = "message";
}
