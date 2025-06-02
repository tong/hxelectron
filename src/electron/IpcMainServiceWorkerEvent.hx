package electron;
/**
	@see https://electronjs.org/docs/api/structures/ipc-main-service-worker-event
**/
typedef IpcMainServiceWorkerEvent = {
	/**
		Possible values include `service-worker`.
	**/
	var type : String;
	/**
		The service worker that sent this message
	**/
	var serviceWorker : electron.main.ServiceWorkerMain;
	/**
		The service worker version ID.
	**/
	var versionId : Float;
	/**
		The `Session` instance with which the event is associated.
	**/
	var session : electron.main.Session;
	/**
		Set this to the value to be returned in a synchronous message
	**/
	var returnValue : Any;
	/**
		A list of MessagePorts that were transferred with this message
	**/
	var ports : Array<electron.main.MessagePortMain>;
	/**
		A function that will send an IPC message to the renderer frame that sent the original message that you are currently handling.  You should use this method to "reply" to the sent message in order to guarantee the reply will go to the correct process and frame.
	**/
	var reply : haxe.Constraints.Function;
}
