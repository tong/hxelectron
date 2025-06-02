package electron;
/**
	@see https://electronjs.org/docs/api/structures/ipc-main-service-worker-invoke-event
**/
typedef IpcMainServiceWorkerInvokeEvent = {
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
}
