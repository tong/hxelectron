package as.node;

@:jsRequire("browser-window")
extern class BrowserWindow {
	function new(options : BrowserWindowOptions) : Void;
	function on(eventType : String, callback : Void -> Void) : Void;
	function loadUrl(path : String) : Void;
}
