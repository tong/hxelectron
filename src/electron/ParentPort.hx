package electron;
/**
	> Interface for communication with parent process.
	
	Process: Utility
	
	`parentPort` is an EventEmitter. _This object is not exported from the `'electron'` module. It is only available as a property of the process object in the Electron API._
	@see https://electronjs.org/docs/api/parent-port
**/
@:jsRequire("electron", "parentPort") extern class ParentPort extends js.node.events.EventEmitter<electron.ParentPort> {
	/**
		Sends a message from the process to its parent.
	**/
	static function postMessage(message:Any):Void;
}
enum abstract ParentPortEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the process receives a message. Messages received on this port will be queued up until a handler is registered for this event.
	**/
	var message : electron.ParentPortEvent<Void -> Void> = "message";
}
