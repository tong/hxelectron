package electron;
@:jsRequire("electron", "Debugger") @:require("electron") extern class Debugger extends js.node.events.EventEmitter<electron.Debugger> {
	/**
		Attaches the debugger to the webContents.
	**/
	function attach(protocolVersion:String):Void;
	function isAttached():Bool;
	/**
		Detaches the debugger from the webContents.
	**/
	function detach():Void;
	/**
		Send given command to the debugging target.
	**/
	function sendCommand(method:String, commandParams:Dynamic, callback:haxe.Constraints.Function):Void;
}