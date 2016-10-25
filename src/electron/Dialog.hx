package electron;

///// GENERATED - DO NOT EDIT /////

/**
	Display native system dialogs for opening and saving files, alerting, etc.

	[Documentation](http://electron.atom.io/docs/api/dialog)
**/
@:jsRequire("electron", "dialog") @:require(electron_main) @:require(electron) extern class Dialog {
	/**
		On success this method returns an array of file paths chosen by the user, otherwise it returns undefined. The filters specifies an array of file types that can be displayed or selected when you want to limit the user to a specific type. For example: The extensions array should contain extensions without wildcards or dots (e.g. 'png' is good but '.png' and '*.png' are bad). To show all files, use the '*' wildcard (no other wildcard is supported). If a callback is passed, the API call will be asynchronous and the result will be passed via callback(filenames) Note: On Windows and Linux an open dialog can not be both a file selector and a directory selector, so if you set properties to ['openFile', 'openDirectory'] on these platforms, a directory selector will be shown.
	**/
	static function showOpenDialog(?browserWindow:electron.BrowserWindow, options:{ @:optional
	var title : String; @:optional
	var defaultPath : String; /**
		Custom label for the confirmation button, when left empty the default label will be used.
	**/
	@:optional
	var buttonLabel : String; @:optional
	var filters : Array<String>; /**
		Contains which features the dialog should use, can contain , , , and .
	**/
	@:optional
	var properties : Array<String>; }, ?callback:haxe.Constraints.Function):Void;
	/**
		On success this method returns the path of the file chosen by the user, otherwise it returns undefined. The filters specifies an array of file types that can be displayed, see dialog.showOpenDialog for an example. If a callback is passed, the API call will be asynchronous and the result will be passed via callback(filename)
	**/
	static function showSaveDialog(?browserWindow:electron.BrowserWindow, options:{ @:optional
	var title : String; @:optional
	var defaultPath : String; /**
		Custom label for the confirmation button, when left empty the default label will be used.
	**/
	@:optional
	var buttonLabel : String; @:optional
	var filters : Array<String>; }, ?callback:haxe.Constraints.Function):Void;
	/**
		Shows a message box, it will block the process until the message box is closed. It returns the index of the clicked button. If a callback is passed, the API call will be asynchronous and the result will be passed via callback(response).
	**/
	static function showMessageBox(?browserWindow:electron.BrowserWindow, options:{ /**
		Can be , , , or . On Windows, "question" displays the same icon as "info", unless you set an icon using the "icon" option.
	**/
	@:optional
	var type : String; /**
		Array of texts for buttons. On Windows, an empty array will result in one button labeled "OK".
	**/
	@:optional
	var buttons : Array<String>; /**
		Index of the button in the buttons array which will be selected by default when the message box opens.
	**/
	@:optional
	var defaultId : Int; /**
		Title of the message box, some platforms will not show it.
	**/
	@:optional
	var title : String; /**
		Content of the message box.
	**/
	@:optional
	var message : String; /**
		Extra information of the message.
	**/
	@:optional
	var detail : String; @:optional
	var icon : electron.NativeImage; /**
		The value will be returned when user cancels the dialog instead of clicking the buttons of the dialog. By default it is the index of the buttons that have "cancel" or "no" as label, or 0 if there is no such buttons. On macOS and Windows the index of "Cancel" button will always be used as , not matter whether it is already specified.
	**/
	@:optional
	var cancelId : Int; /**
		On Windows Electron will try to figure out which one of the are common buttons (like "Cancel" or "Yes"), and show the others as command links in the dialog. This can make the dialog appear in the style of modern Windows apps. If you don't like this behavior, you can set to .
	**/
	@:optional
	var noLink : Bool; }, callback:haxe.Constraints.Function):Void;
	/**
		Displays a modal dialog that shows an error message. This API can be called safely before the ready event the app module emits, it is usually used to report errors in early stage of startup.  If called before the app readyevent on Linux, the message will be emitted to stderr, and no GUI dialog will appear.
	**/
	static function showErrorBox(title:String, content:String):Void;
}