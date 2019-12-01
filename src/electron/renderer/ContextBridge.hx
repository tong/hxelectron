package electron.renderer;
/**
	@see http://electronjs.org/docs/api/context-bridge
**/
@:jsRequire("electron", "contextBridge") extern class ContextBridge extends js.node.events.EventEmitter<electron.renderer.ContextBridge> {
	static function exposeInMainWorld(apiKey:String, api:Record):Void;
}
@:enum abstract ContextBridgeEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
