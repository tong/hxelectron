package electron.remote;
/**
	@see https://electronjs.org/docs/api/message-channel-main
**/
@:jsRequire("electron", "remote.MessageChannelMain") extern class MessageChannelMain extends js.node.events.EventEmitter<electron.remote.MessageChannelMain> {
	/**
		A `MessagePortMain` property.
	**/
	var port1 : electron.remote.MessagePortMain;
	/**
		A `MessagePortMain` property.
	**/
	var port2 : electron.remote.MessagePortMain;
}
@:enum abstract MessageChannelMainEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
