package electron.remote;
/**
	@see https://electronjs.org/docs/api/debugger
**/
@:jsRequire("electron", "remote.Debugger") extern class Debugger extends js.node.events.EventEmitter<electron.remote.Debugger> {
	/**
		Attaches the debugger to the `webContents`.
	**/
	function attach(?protocolVersion:String):Void;
	/**
		Whether a debugger is attached to the `webContents`.
	**/
	function isAttached():Bool;
	/**
		Detaches the debugger from the `webContents`.
	**/
	function detach():Void;
	/**
		A promise that resolves with the response defined by the 'returns' attribute of the command description in the remote debugging protocol or is rejected indicating the failure of the command.
		
		Send given command to the debugging target.
	**/
	function sendCommand(method:String, ?commandParams:Any, ?sessionId:String):js.lib.Promise<Any>;
}
@:enum abstract DebuggerEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the debugging session is terminated. This happens either when `webContents` is closed or devtools is invoked for the attached `webContents`.
	**/
	var detach : electron.remote.DebuggerEvent<Void -> Void> = "detach";
	/**
		Emitted whenever the debugging target issues an instrumentation event.
	**/
	var message : electron.remote.DebuggerEvent<Void -> Void> = "message";
}
