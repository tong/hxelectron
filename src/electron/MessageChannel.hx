package electron;
/**
	@see http://electronjs.org/docs/api/message-channel-
**/
@:jsRequire("electron", "MessageChannel") extern class MessageChannel extends js.node.events.EventEmitter<electron.MessageChannel> {
	/**
		A `MessagePort` property.
	**/
	var port1 : electron.MessagePort;
	/**
		A `MessagePort` property.
	**/
	var port2 : electron.MessagePort;
}
@:enum abstract MessageChannelEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
