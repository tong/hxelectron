package electron.main;

/**
	An alternate transport for Chrome's remote debugging protocol.

	See: <http://electron.atom.io/docs/api/debugger>
**/
@:require(js, electron) @:jsRequire("electron", "Debugger") extern class Debugger extends js.node.events.EventEmitter<electron.main.Debugger> {
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
	function sendCommand(method:String, ?commandParams:Dynamic, ?callback:haxe.Constraints.Function):Void;
}

/**
**/
@:require(js, electron) @:enum abstract DebuggerEvent(String) from String to String {
	/**
		Emitted when debugging session is terminated. This happens either when webContents is closed or devtools is invoked for the attached webContents.
	**/
	var detach : String = "detach";
	/**
		Emitted whenever debugging target issues instrumentation event.
	**/
	var message : String = "message";
}