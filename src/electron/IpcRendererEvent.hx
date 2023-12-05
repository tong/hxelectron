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
		A list of MessagePorts that were transferred with this message
	**/
	var ports : Array<MessagePort>;
}
