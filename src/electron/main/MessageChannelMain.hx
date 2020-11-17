package electron.main;
/**
	@see https://electronjs.org/docs/api/message-channel-main
**/
@:jsRequire("electron", "MessageChannelMain") extern class MessageChannelMain extends js.node.events.EventEmitter<electron.main.MessageChannelMain> {
	/**
		A `MessagePortMain` property.
	**/
	var port1 : electron.main.MessagePortMain;
	/**
		A `MessagePortMain` property.
	**/
	var port2 : electron.main.MessagePortMain;
}
@:enum abstract MessageChannelMainEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
