package electron;
/**
	@see https://electronjs.org/docs/api/structures/ipc-renderer-event
**/
typedef IpcRendererEvent = {
	/**
		The `IpcRenderer` instance that emitted the event originally
	**/
	var sender : electron.renderer.IpcRenderer;
	/**
		The `webContents.id` that sent the message, you can call `event.sender.sendTo(event.senderId, ...)` to reply to the message, see ipcRenderer.sendTo for more information. This only applies to messages sent from a different renderer. Messages sent directly from the main process set `event.senderId` to `0`.
	**/
	var senderId : Int;
	/**
		A list of MessagePorts that were transferred with this message
	**/
	var ports : Array<MessagePort>;
}
