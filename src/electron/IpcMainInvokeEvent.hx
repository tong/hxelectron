package electron;
/**
	@see http://electronjs.org/docs/api/structures/ipc-main-invoke-event
**/
typedef IpcMainInvokeEvent = {
	/**
		The ID of the renderer frame that sent this message
	**/
	var frameId : Int;
	/**
		Returns the `webContents` that sent the message
	**/
	var sender : electron.main.WebContents;
}
