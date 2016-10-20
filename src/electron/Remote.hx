package electron;
@:jsRequire("electron", "remote") @:require(electron_renderer) @:require(electron) extern class Remote {
	static function require(module:String):{ @:optional
	var module : String; };
	static function getCurrentWindow():electron.BrowserWindow;
	static function getCurrentWebContents():electron.WebContents;
	static function getGlobal(name:String):electron.Any;
}