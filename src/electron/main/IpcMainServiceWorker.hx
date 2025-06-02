package electron.main;
/**
	@see https://electronjs.org/docs/api/ipc-main-service-worker
**/
@:jsRequire("electron", "IpcMainServiceWorker") extern class IpcMainServiceWorker extends js.node.events.EventEmitter<electron.main.IpcMainServiceWorker> {
	/**
		Listens to `channel`, when a new message arrives `listener` would be called with `listener(event, args...)`.
	**/
	function on(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Adds a one time `listener` function for the event. This `listener` is invoked only the next time a message is sent to `channel`, after which it is removed.
	**/
	function once(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes the specified `listener` from the listener array for the specified `channel`.
	**/
	function removeListener(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes listeners of the specified `channel`.
	**/
	function removeAllListeners(?channel:String):Void;
	function handle(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Handles a single `invoke`able IPC message, then removes the listener. See `ipcMainServiceWorker.handle(channel, listener)`.
	**/
	function handleOnce(channel:String, listener:haxe.Constraints.Function):Void;
	/**
		Removes any handler for `channel`, if present.
	**/
	function removeHandler(channel:String):Void;
}
enum abstract IpcMainServiceWorkerEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
