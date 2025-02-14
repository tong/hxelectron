package electron;
/**
	@see https://electronjs.org/docs/api/structures/ipc-main-invoke-event
**/
typedef IpcMainInvokeEvent = {
	/**
		The internal ID of the renderer process that sent this message
	**/
	var processId : Int;
	/**
		The ID of the renderer frame that sent this message
	**/
	var frameId : Int;
	/**
		Returns the `webContents` that sent the message
	**/
	var sender : electron.main.WebContents;
	/**
		The frame that sent this message. May be `null` if accessed after the frame has either navigated or been destroyed.
	**/
	var senderFrame : haxe.extern.EitherType<electron.main.WebFrameMain, Dynamic>;
}
