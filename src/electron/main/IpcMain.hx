package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "ipcMain") extern class IpcMain {
	/**
		Listens to channel, when a new message arrives listener would be called with listener(event, args...).
	**/
	static function on(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Adds a one time listener function for the event. This listener is invoked only the next time a message is sent to channel, after which it is removed.
	**/
	static function once(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes the specified listener from the listener array for the specified channel.
	**/
	static function removeListener(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes all listeners, or those of the specified channel.
	**/
	static function removeAllListeners(?channel:String):Void;
}