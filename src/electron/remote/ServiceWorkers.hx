package electron.remote;
/**
	@see https://electronjs.org/docs/api/service-workers
**/
@:jsRequire("electron", "remote.ServiceWorkers") extern class ServiceWorkers extends js.node.events.EventEmitter<electron.remote.ServiceWorkers> {
	/**
		A ServiceWorkerInfo object where the keys are the service worker version ID and the values are the information about that service worker.
	**/
	function getAllRunning():Record;
	/**
		Information about this service worker
		
		If the service worker does not exist or is not running this method will throw an exception.
	**/
	function getFromVersionID(versionId:Float):electron.ServiceWorkerInfo;
}
enum abstract ServiceWorkersEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when a service worker logs something to the console.
	**/
	var console_message : electron.remote.ServiceWorkersEvent<Void -> Void> = "console-message";
	/**
		Emitted when a service worker has been registered. Can occur after a call to `navigator.serviceWorker.register('/sw.js')` successfully resolves or when a Chrome extension is loaded.
	**/
	var registration_completed : electron.remote.ServiceWorkersEvent<Void -> Void> = "registration-completed";
}
