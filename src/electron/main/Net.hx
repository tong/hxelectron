package electron.main;
/**
	@see http://electronjs.org/docs/api/net
**/
@:jsRequire("electron", "net") extern class Net extends js.node.events.EventEmitter<electron.main.Net> {
	/**
		Creates a `ClientRequest` instance using the provided `options` which are directly forwarded to the `ClientRequest` constructor. The `net.request` method would be used to issue both secure and insecure HTTP requests according to the specified protocol scheme in the `options` object.
	**/
	static function request(options:haxe.extern.EitherType<Dynamic, Dynamic>):electron.main.ClientRequest;
}
@:enum abstract NetEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
