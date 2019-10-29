package electron.renderer;
/**
	Create a safe, bi-directional, synchronous bridge across isolated contexts
	@see http://electronjs.org/docs/api/context-bridge
**/
@:jsRequire("electron", "contextBridge") extern class ContextBridge {
	@:electron_platforms(["Experimental"])
	static function exposeInMainWorld(apiKey:String, api:Record):Void;
}
