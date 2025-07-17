package electron.renderer;
/**
	> Create a safe, bi-directional, synchronous bridge across isolated contexts
	
	Process: Renderer
	
	An example of exposing an API to a renderer from an isolated preload script is given below:
	
	```
	// Preload (Isolated World)
	const { contextBridge, ipcRenderer } = require('electron')
	
	contextBridge.exposeInMainWorld(
	  'electron',
	  {
	    doThing: () => ipcRenderer.send('do-a-thing')
	  }
	)
	```
	
	### Glossary
	
	
	
	### Main World
	
	The "Main World" is the JavaScript context that your main renderer code runs in. By default, the page you load in your renderer executes code in this world.
	
	### Isolated World
	
	When `contextIsolation` is enabled in your `webPreferences` (this is the default behavior since Electron 12.0.0), your `preload` scripts run in an "Isolated World".  You can read more about context isolation and what it affects in the security docs.
	@see https://electronjs.org/docs/api/context-bridge
**/
@:jsRequire("electron", "contextBridge") extern class ContextBridge extends js.node.events.EventEmitter<electron.renderer.ContextBridge> {
	static function exposeInMainWorld(apiKey:String, api:Any):Void;
	static function exposeInIsolatedWorld(worldId:Int, apiKey:String, api:Any):Void;
	/**
		A copy of the resulting value from executing the function in the main world. Refer to the table on how values are copied between worlds.
	**/
	static function executeInMainWorld(executionScript:{ /**
		A JavaScript function to execute. This function will be serialized which means that any bound parameters and execution context will be lost.
	**/
	var func : Dynamic; /**
		An array of arguments to pass to the provided function. These arguments will be copied between worlds in accordance with the table of supported types.
	**/
	@:optional
	var args : Array<Any>; }):Any;
}
enum abstract ContextBridgeEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
