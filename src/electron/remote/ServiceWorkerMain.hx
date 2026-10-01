package electron.remote;
/**
	@see https://electronjs.org/docs/api/service-worker-main
**/
@:jsRequire("electron", "remote.ServiceWorkerMain") extern class ServiceWorkerMain extends js.node.events.EventEmitter<electron.remote.ServiceWorkerMain> {
	/**
		An `IpcMainServiceWorker` instance scoped to the service worker.
	**/
	@:electron_experimental
	var ipc : electron.remote.IpcMainServiceWorker;
	/**
		A `string` representing the scope URL of the service worker.
	**/
	@:electron_experimental
	var scope : String;
	/**
		A `string` representing the script URL of the service worker.
	**/
	@:electron_experimental
	var scriptURL : String;
	/**
		A `number` representing the ID of the specific version of the service worker script in its scope.
	**/
	@:electron_experimental
	var versionId : Float;
	/**
		Whether the service worker has been destroyed.
	**/
	@:electron_experimental
	function isDestroyed():Bool;
	/**
		Send an asynchronous message to the service worker process via `channel`, along with arguments. Arguments will be serialized with the Structured Clone Algorithm, just like `postMessage`, so prototype chains will not be included. Sending Functions, Promises, Symbols, WeakMaps, or WeakSets will throw an exception.
		
		The service worker process can handle the message by listening to `channel` with the `ipcRenderer` module.
	**/
	@:electron_experimental
	function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		* `end` Function - Method to call when the task has ended. If never called, the service won't terminate while otherwise idle.
		
		Initiate a task to keep the service worker alive until ended.
	**/
	@:electron_experimental
	function startTask():{ /**
		Method to call when the task has ended. If never called, the service won't terminate while otherwise idle.
	**/
	var end : haxe.Constraints.Function; };
}
enum abstract ServiceWorkerMainEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
