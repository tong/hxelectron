package electron.remote;
/**
	> Communicate asynchronously from the main process to renderer processes.
	
	Process: Main
	
	The `ipcMain` module is an Event Emitter. When used in the main process, it handles asynchronous and synchronous messages sent from a renderer process (web page). Messages sent from a renderer will be emitted to this module.
	
	### Sending Messages
	
	It is also possible to send messages from the main process to the renderer process, see webContents.send for more information.
	
	* When sending a message, the event name is the `channel`.
	* To reply to a synchronous message, you need to set `event.returnValue`.
	* To send an asynchronous message back to the sender, you can use `event.reply(...)`.  This helper method will automatically handle messages coming from frames that aren't the main frame (e.g. iframes) whereas `event.sender.send(...)` will always send to the main frame.
	
	An example of sending and handling messages between the render and main processes:
	
	```
	// In main process.
	const { ipcMain } = require('electron')
	ipcMain.on('asynchronous-message', (event, arg) => {
	  console.log(arg) // prints "ping"
	  event.reply('asynchronous-reply', 'pong')
	})
	
	ipcMain.on('synchronous-message', (event, arg) => {
	  console.log(arg) // prints "ping"
	  event.returnValue = 'pong'
	})
	```
	
	```
	// In renderer process (web page).
	const { ipcRenderer } = require('electron')
	console.log(ipcRenderer.sendSync('synchronous-message', 'ping')) // prints "pong"
	
	ipcRenderer.on('asynchronous-reply', (event, arg) => {
	  console.log(arg) // prints "pong"
	})
	ipcRenderer.send('asynchronous-message', 'ping')
	```
	@see https://electronjs.org/docs/api/ipc-main
**/
@:jsRequire("electron", "remote.ipcMain") extern class IpcMain extends js.node.events.EventEmitter<electron.remote.IpcMain> {
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
