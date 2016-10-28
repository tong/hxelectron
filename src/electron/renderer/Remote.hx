package electron.renderer;

/**
	Use main process modules from the renderer process.

	[Documentation](http://electron.atom.io/docs/api/remote)
**/
@:require(js, electron) @:jsRequire("electron", "remote") extern class Remote {
	static function require(module:String):{ @:optional
	var module : String; };
	static function getCurrentWindow():electron.main.BrowserWindow;
	static function getCurrentWebContents():electron.main.WebContents;
	static function getGlobal(name:String):{ @:optional
	var name : String; };
}