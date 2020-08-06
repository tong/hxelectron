package electron;
/**
	@see http://electronjs.org/docs/api/message-port-main
**/
@:jsRequire("electron", "MessagePort") extern class MessagePort extends js.node.events.EventEmitter<electron.MessagePort> {
	/**
		Sends a message from the port, and optionally, transfers ownership of objects to other browsing contexts.
	**/
	function postMessage(message:Any, ?transfer:Array<electron.MessagePort>):Void;
	/**
		Starts the sending of messages queued on the port. Messages will be queued until this method is called.
	**/
	function start():Void;
	/**
		Disconnects the port, so it is no longer active.
	**/
	function close():Void;
}
@:enum abstract MessagePortEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when a MessagePortMain object receives a message.
	**/
	var message : electron.MessagePortEvent<Void -> Void> = "message";
}
