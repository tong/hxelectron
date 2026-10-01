package electron.remote;
/**
	@see https://electronjs.org/docs/api/service-workers
**/
@:jsRequire("electron", "remote.ServiceWorkers") extern class ServiceWorkers extends js.node.events.EventEmitter<electron.remote.ServiceWorkers> {
	/**
		A ServiceWorkerInfo object where the keys are the service worker version ID and the values are the information about that service worker.
	**/
	function getAllRunning():Dynamic;
	/**
		Information about this service worker
		
		If the service worker does not exist or is not running this method will throw an exception.
	**/
	function getInfoFromVersionID(versionId:Float):electron.ServiceWorkerInfo;
	/**
		Information about this service worker
		
		If the service worker does not exist or is not running this method will throw an exception.
		
		**Deprecated:** Use the new `serviceWorkers.getInfoFromVersionID` API.
	**/
	function getFromVersionID(versionId:Float):electron.ServiceWorkerInfo;
	/**
		Instance of the service worker associated with the given version ID. If there's no associated version, or its running status has changed to 'stopped', this will return `undefined`.
	**/
	function getWorkerFromVersionID(versionId:Float):haxe.extern.EitherType<electron.remote.ServiceWorkerMain, Dynamic>;
	/**
		Resolves with the service worker when it's started.
		
		Starts the service worker or does nothing if already running.
	**/
	function startWorkerForScope(scope:String):js.lib.Promise<Any>;
}
enum abstract ServiceWorkersEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when a service worker logs something to the console.
	**/
	var console_message : electron.remote.ServiceWorkersEvent<(js.html.Event, { /**
		The actual console message
	**/
	var message : String; /**
		The version ID of the service worker that sent the log message
	**/
	var versionId : Float; /**
		The type of source for this message.  Can be `javascript`, `xml`, `network`, `console-api`, `storage`, `rendering`, `security`, `deprecation`, `worker`, `violation`, `intervention`, `recommendation` or `other`.
	**/
	var source : String; /**
		The log level, from 0 to 3. In order it matches `verbose`, `info`, `warning` and `error`.
	**/
	var level : Float; /**
		The URL the message came from
	**/
	var sourceUrl : String; /**
		The line number of the source that triggered this console message
	**/
	var lineNumber : Float; }) -> Void> = "console-message";
	/**
		Emitted when a service worker has been registered. Can occur after a call to `navigator.serviceWorker.register('/sw.js')` successfully resolves or when a Chrome extension is loaded.
	**/
	var registration_completed : electron.remote.ServiceWorkersEvent<(js.html.Event, { /**
		The base URL that a service worker is registered for
	**/
	var scope : String; }) -> Void> = "registration-completed";
	/**
		Emitted when a service worker's running status has changed.
	**/
	var running_status_changed : electron.remote.ServiceWorkersEvent<js.html.Event -> Void> = "running-status-changed";
}
