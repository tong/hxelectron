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
}
@:enum abstract ContextBridgeEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
