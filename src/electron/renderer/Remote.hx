package electron.renderer;

/**
**/
@:require(js, electron) @:jsRequire("electron", "remote") extern class Remote {
	/**
		e.g.
	**/
	static function require(module:String):Any;
	static function getCurrentWindow():electron.main.BrowserWindow;
	static function getCurrentWebContents():electron.main.WebContents;
	static function getGlobal(name:String):Any;
}