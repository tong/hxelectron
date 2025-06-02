package electron.main;
/**
	@see https://electronjs.org/docs/api/service-worker-main
**/
@:jsRequire("electron", "ServiceWorkerMain") extern class ServiceWorkerMain extends js.node.events.EventEmitter<electron.main.ServiceWorkerMain> {
	/**
		An `IpcMainServiceWorker` instance scoped to the service worker.
	**/
	var ipc : electron.main.IpcMainServiceWorker;
	/**
		A `string` representing the scope URL of the service worker.
	**/
	var scope : String;
	/**
		A `number` representing the ID of the specific version of the service worker script in its scope.
	**/
	var versionId : Float;
	/**
		Whether the service worker has been destroyed.
	**/
	function isDestroyed():Bool;
	/**
		Send an asynchronous message to the service worker process via `channel`, along with arguments. Arguments will be serialized with the Structured Clone Algorithm, just like `postMessage`, so prototype chains will not be included. Sending Functions, Promises, Symbols, WeakMaps, or WeakSets will throw an exception.
		
		The service worker process can handle the message by listening to `channel` with the `ipcRenderer` module.
	**/
	function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		* `end` Function - Method to call when the task has ended. If never called, the service won't terminate while otherwise idle.
		
		Initiate a task to keep the service worker alive until ended.
	**/
	function startTask():Any;
}
enum abstract ServiceWorkerMainEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
