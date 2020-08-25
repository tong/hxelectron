package electron;
/**
	@see http://electronjs.org/docs/api/structures/ipc-main-event
**/
typedef IpcMainEvent = {
	/**
		The ID of the renderer frame that sent this message
	**/
	var frameId : Int;
	/**
		Set this to the value to be returned in a synchronous message
	**/
	var returnValue : Any;
	/**
		Returns the `webContents` that sent the message
	**/
	var sender : electron.main.WebContents;
	/**
		A list of MessagePorts that were transferred with this message
	**/
	var ports : Array<electron.main.MessagePortMain>;
	/**
		A function that will send an IPC message to the renderer frame that sent the original message that you are currently handling.  You should use this method to "reply" to the sent message in order to guarantee the reply will go to the correct process and frame.
	**/
	var reply : haxe.Constraints.Function;
}
