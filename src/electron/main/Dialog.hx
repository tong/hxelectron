package electron.main;
/**
	Display native system dialogs for opening and saving files, alerting, etc.
	@see http://electronjs.org/docs/api/dialog
**/
@:jsRequire("electron", "dialog") extern class Dialog {
	/**
		The browserWindow argument allows the dialog to attach itself to a parent window, making it modal. The filters specifies an array of file types that can be displayed or selected when you want to limit the user to a specific type. For example: The extensions array should contain extensions without wildcards or dots (e.g. 'png' is good but '.png' and '*.png' are bad). To show all files, use the '*' wildcard (no other wildcard is supported). If a callback is passed, the API call will be asynchronous and the result will be passed via callback(filenames). Note: On Windows and Linux an open dialog can not be both a file selector and a directory selector, so if you set properties to ['openFile', 'openDirectory'] on these platforms, a directory selector will be shown.
	**/
	static function showOpenDialog(?browserWindow:electron.main.BrowserWindow, options:{ @:optional
	var title : String; @:optional
	var defaultPath : String; /**
		Custom label for the confirmation button, when left empty the default label will be used.
	**/
	@:optional
	var buttonLabel : String; @:optional
	var filters : Array<electron.FileFilter>; /**
		Contains which features the dialog should use. The following values are supported:
	**/
	@:optional
	var properties : Array<String>; /**
		Message to display above input boxes.
	**/
	@:optional
	var message : String; /**
		Create when packaged for the Mac App Store.
	**/
	@:optional
	var securityScopedBookmarks : Bool; }, ?callback:haxe.Constraints.Function):haxe.extern.EitherType<Array<String>, Dynamic>;
	/**
		The browserWindow argument allows the dialog to attach itself to a parent window, making it modal. The filters specifies an array of file types that can be displayed, see dialog.showOpenDialog for an example. If a callback is passed, the API call will be asynchronous and the result will be passed via callback(filename).
	**/
	static function showSaveDialog(?browserWindow:electron.main.BrowserWindow, options:{ @:optional
	var title : String; /**
		Absolute directory path, absolute file path, or file name to use by default.
	**/
	@:optional
	var defaultPath : String; /**
		Custom label for the confirmation button, when left empty the default label will be used.
	**/
	@:optional
	var buttonLabel : String; @:optional
	var filters : Array<electron.FileFilter>; /**
		Message to display above text fields.
	**/
	@:optional
	var message : String; /**
		Custom label for the text displayed in front of the filename text field.
	**/
	@:optional
	var nameFieldLabel : String; /**
		Show the tags input box, defaults to true.
	**/
	@:optional
	var showsTagField : Bool; /**
		Create a when packaged for the Mac App Store. If this option is enabled and the file doesn't already exist a blank file will be created at the chosen path.
	**/
	@:optional
	var securityScopedBookmarks : Bool; }, ?callback:haxe.Constraints.Function):haxe.extern.EitherType<String, Dynamic>;
	/**
		Shows a message box, it will block the process until the message box is closed. It returns the index of the clicked button. The browserWindow argument allows the dialog to attach itself to a parent window, making it modal. If a callback is passed, the dialog will not block the process. The API call will be asynchronous and the result will be passed via callback(response).
	**/
	static function showMessageBox(?browserWindow:electron.main.BrowserWindow, options:{ /**
		Can be "none", "info", "error", "question" or "warning". On Windows, "question" displays the same icon as "info", unless you set an icon using the "icon" option. On macOS, both "warning" and "error" display the same warning icon.
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
	var message : String; /**
		Extra information of the message.
	**/
	@:optional
	var detail : String; /**
		If provided, the message box will include a checkbox with the given label. The checkbox state can be inspected only when using callback.
	**/
	@:optional
	var checkboxLabel : String; /**
		Initial checked state of the checkbox. false by default.
	**/
	@:optional
	var checkboxChecked : Bool; @:optional
	var icon : electron.NativeImage; /**
		The index of the button to be used to cancel the dialog, via the Esc key. By default this is assigned to the first button with "cancel" or "no" as the label. If no such labeled buttons exist and this option is not set, 0 will be used as the return value or callback response.
	**/
	@:optional
	var cancelId : Int; /**
		On Windows Electron will try to figure out which one of the buttons are common buttons (like "Cancel" or "Yes"), and show the others as command links in the dialog. This can make the dialog appear in the style of modern Windows apps. If you don't like this behavior, you can set noLink to true.
	**/
	@:optional
	var noLink : Bool; /**
		Normalize the keyboard access keys across platforms. Default is false. Enabling this assumes & is used in the button labels for the placement of the keyboard shortcut access key and labels will be converted so they work correctly on each platform, & characters are removed on macOS, converted to _ on Linux, and left untouched on Windows. For example, a button label of Vie&w will be converted to Vie_w on Linux and View on macOS and can be selected via Alt-W on Windows and Linux.
	**/
	@:optional
	var normalizeAccessKeys : Bool; }, ?callback:haxe.Constraints.Function):Int;
	/**
		Displays a modal dialog that shows an error message. This API can be called safely before the ready event the app module emits, it is usually used to report errors in early stage of startup. If called before the app readyevent on Linux, the message will be emitted to stderr, and no GUI dialog will appear.
	**/
	static function showErrorBox(title:String, content:String):Void;
	/**
		On macOS, this displays a modal dialog that shows a message and certificate information, and gives the user the option of trusting/importing the certificate. If you provide a browserWindow argument the dialog will be attached to the parent window, making it modal. On Windows the options are more limited, due to the Win32 APIs used:
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function showCertificateTrustDialog(?browserWindow:electron.main.BrowserWindow, options:{ /**
		The certificate to trust/import.
	**/
	var certificate : electron.Certificate; /**
		The message to display to the user.
	**/
	var message : String; }, callback:haxe.Constraints.Function):Void;
}
