package electron.renderer;

/**
**/
@:require(js, electron) @:jsRequire("electron", "ipcRenderer") extern class IpcRenderer {
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
	/**
		Send a message to the main process asynchronously via channel, you can also send arbitrary arguments. Arguments will be serialized in JSON internally and hence no functions or prototype chain will be included. The main process handles it by listening for channel with ipcMain module.
	**/
	static function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Send a message to the main process synchronously via channel, you can also send arbitrary arguments. Arguments will be serialized in JSON internally and hence no functions or prototype chain will be included. The main process handles it by listening for channel with ipcMain module, and replies by setting event.returnValue. Note: Sending a synchronous message will block the whole renderer process, unless you know what you are doing you should never use it.
	**/
	static function sendSync(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Like ipcRenderer.send but the event will be sent to the <webview> element in the host page instead of the main process.
	**/
	static function sendToHost(channel:String, args:haxe.extern.Rest<Any>):Void;
}