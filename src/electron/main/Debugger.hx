package electron.main;

/**
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