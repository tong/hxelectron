package electron.renderer;
/**
	@see https://electronjs.org/docs/api/browser-window-proxy
**/
@:jsRequire("electron", "BrowserWindowProxy") extern class BrowserWindowProxy extends js.node.events.EventEmitter<electron.renderer.BrowserWindowProxy> {
	/**
		A `Boolean` that is set to true after the child window gets closed.
	**/
	var closed : Bool;
	/**
		Removes focus from the child window.
	**/
	function blur():Void;
	/**
		Forcefully closes the child window without calling its unload event.
	**/
	function close():Void;
	/**
		Evaluates the code in the child window.
	**/
	function eval(code:String):Void;
	/**
		Focuses the child window (brings the window to front).
	**/
	function focus():Void;
	/**
		Invokes the print dialog on the child window.
	**/
	function print():Void;
	/**
		Sends a message to the child window with the specified origin or `*` for no origin preference.
		
		In addition to these methods, the child window implements `window.opener` object with no properties and a single method.
	**/
	function postMessage(message:Any, targetOrigin:String):Void;
}
@:enum abstract BrowserWindowProxyEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
