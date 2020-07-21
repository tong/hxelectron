package electron;
/**
	@see http://electronjs.org/docs/api/message-channel-main
**/
@:jsRequire("electron", "MessageChannelMain") extern class MessageChannelMain extends js.node.events.EventEmitter<electron.MessageChannelMain> {
	/**
		A `MessagePortMain` property.
	**/
	var port1 : electron.MessagePortMain;
	/**
		A `MessagePortMain` property.
	**/
	var port2 : electron.MessagePortMain;
}
@:enum abstract MessageChannelMainEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
