package electron;
@:jsRequire("electron", "dialog") @:require("electron") extern class Dialog {
	/**
		On success this method returns an array of file paths chosen by the user, otherwise it returns undefined. The filters specifies an array of file types that can be displayed or selected when you want to limit the user to a specific type. For example: The extensions array should contain extensions without wildcards or dots (e.g. 'png' is good but '.png' and '*.png' are bad). To show all files, use the '*' wildcard (no other wildcard is supported). If a callback is passed, the API call will be asynchronous and the result will be passed via callback(filenames) Note: On Windows and Linux an open dialog can not be both a file selector and a directory selector, so if you set properties to ['openFile', 'openDirectory'] on these platforms, a directory selector will be shown.
	**/
	static function showOpenDialog(?browserWindow:electron.BrowserWindow, options:{ @:optional
	var title : String; @:optional
	var defaultPath : String; @:optional
	var buttonLabel : String; @:optional
	var filters : Array<String>; @:optional
	var properties : Array<String>; }, ?callback:haxe.Constraints.Function):Void;
	/**
		On success this method returns the path of the file chosen by the user, otherwise it returns undefined. The filters specifies an array of file types that can be displayed, see dialog.showOpenDialog for an example. If a callback is passed, the API call will be asynchronous and the result will be passed via callback(filename)
	**/
	static function showSaveDialog(?browserWindow:electron.BrowserWindow, options:{ @:optional
	var title : String; @:optional
	var defaultPath : String; @:optional
	var buttonLabel : String; @:optional
	var filters : Array<String>; }, ?callback:haxe.Constraints.Function):Void;
	/**
		Shows a message box, it will block the process until the message box is closed. It returns the index of the clicked button. If a callback is passed, the API call will be asynchronous and the result will be passed via callback(response).
	**/
	static function showMessageBox(?browserWindow:electron.BrowserWindow, options:{ @:optional
	var type : String; @:optional
	var buttons : Array<String>; @:optional
	var defaultId : Int; @:optional
	var title : String; @:optional
	var message : String; @:optional
	var detail : String; @:optional
	var icon : electron.NativeImage; @:optional
	var cancelId : Int; @:optional
	var noLink : Bool; }, callback:haxe.Constraints.Function):Void;
	/**
		Displays a modal dialog that shows an error message. This API can be called safely before the ready event the app module emits, it is usually used to report errors in early stage of startup.  If called before the app readyevent on Linux, the message will be emitted to stderr, and no GUI dialog will appear.
	**/
	static function showErrorBox(title:String, content:String):Void;
}