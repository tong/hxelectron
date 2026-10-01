package electron.renderer;
/**
	> A utility layer to interact with Web API objects (Files, Blobs, etc.)
	
	Process: Renderer
	
	> [!IMPORTANT] If you want to call this API from a renderer process with context isolation enabled, place the API call in your preload script and expose it using the `contextBridge` API.
	@see https://electronjs.org/docs/api/web-utils
**/
@:jsRequire("electron", "webUtils") extern class WebUtils extends js.node.events.EventEmitter<electron.renderer.WebUtils> {
	/**
		The file system path that this `File` object points to. In the case where the object passed in is not a `File` object an exception is thrown. In the case where the File object passed in was constructed in JS and is not backed by a file on disk an empty string is returned.
		
		This method superseded the previous augmentation to the `File` object with the `path` property.  An example is included below.
	**/
	static function getPathForFile(file:electron.File):String;
}
enum abstract WebUtilsEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
