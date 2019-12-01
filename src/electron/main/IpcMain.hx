package electron.main;
/**
	@see http://electronjs.org/docs/api/ipc-main
**/
@:jsRequire("electron", "ipcMain") extern class IpcMain extends js.node.events.EventEmitter<electron.main.IpcMain> {
	/**
		Listens to `channel`, when a new message arrives `listener` would be called with `listener(event, args...)`.
	**/
	static function on(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Adds a one time `listener` function for the event. This `listener` is invoked only the next time a message is sent to `channel`, after which it is removed.
	**/
	static function once(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes the specified `listener` from the listener array for the specified `channel`.
	**/
	static function removeListener(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes listeners of the specified `channel`.
	**/
	static function removeAllListeners(?channel:String):Void;
	/**
		Adds a handler for an `invoke`able IPC. This handler will be called whenever a renderer calls `ipcRenderer.invoke(channel, ...args)`.
		
		If `listener` returns a Promise, the eventual result of the promise will be returned as a reply to the remote caller. Otherwise, the return value of the listener will be used as the value of the reply.
		
		The `event` that is passed as the first argument to the handler is the same as that passed to a regular event listener. It includes information about which WebContents is the source of the invoke request.
	**/
	static function handle(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Handles a single `invoke`able IPC message, then removes the listener. See `ipcMain.handle(channel, listener)`.
	**/
	static function handleOnce(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes any handler for `channel`, if present.
	**/
	static function removeHandler(channel:String):Void;
}
@:enum abstract IpcMainEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
