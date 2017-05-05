package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "dialog") extern class Dialog {
	/**
		The browserWindow argument allows the dialog to attach itself to a parent window, making it modal. The filters specifies an array of file types that can be displayed or selected when you want to limit the user to a specific type. For example: The extensions array should contain extensions without wildcards or dots (e.g. 'png' is good but '.png' and '*.png' are bad). To show all files, use the '*' wildcard (no other wildcard is supported). If a callback is passed, the API call will be asynchronous and the result will be passed via callback(filenames) Note: On Windows and Linux an open dialog can not be both a file selector and a directory selector, so if you set properties to ['openFile', 'openDirectory'] on these platforms, a directory selector will be shown.
	**/
	static function showOpenDialog(?browserWindow:BrowserWindow, options:{ @:optional
	var title : String; @:optional
	var defaultPath : String; /**
		Custom label for the confirmation button, when left empty the default label will be used.
	**/
	@:optional
	var buttonLabel : String; @:optional
	var filters : FileFilter; /**
		Contains which features the dialog should use. The following values are supported:
	**/
	@:optional
	var properties : String; /**
		Message to display above input boxes.
	**/
	@:optional
	var message : String; }, ?callback:haxe.Constraints.Function):String;
	/**
		The browserWindow argument allows the dialog to attach itself to a parent window, making it modal. The filters specifies an array of file types that can be displayed, see dialog.showOpenDialog for an example. If a callback is passed, the API call will be asynchronous and the result will be passed via callback(filename)
	**/
	static function showSaveDialog(?browserWindow:BrowserWindow, options:{ @:optional
	var title : String; @:optional
	var defaultPath : String; /**
		Custom label for the confirmation button, when left empty the default label will be used.
	**/
	@:optional
	var buttonLabel : String; @:optional
	var filters : FileFilter; /**
		Message to display above text fields.
	**/
	@:optional
	var message : String; /**
		Custom label for the text displayed in front of the filename text field.
	**/
	@:optional
	var nameFieldLabel : String; /**
		Show the tags input box, defaults to .
	**/
	@:optional
	var showsTagField : Bool; }, ?callback:haxe.Constraints.Function):String;
	/**
		Shows a message box, it will block the process until the message box is closed. It returns the index of the clicked button. The browserWindow argument allows the dialog to attach itself to a parent window, making it modal. If a callback is passed, the API call will be asynchronous and the result will be passed via callback(response).
	**/
	static function showMessageBox(?browserWindow:BrowserWindow, options:{ /**
		Can be , , , or . On Windows, "question" displays the same icon as "info", unless you set an icon using the "icon" option.
	**/
	@:optional
	var type : String; /**
		Array of texts for buttons. On Windows, an empty array will result in one button labeled "OK".
	**/
	@:optional
	var buttons : String; /**
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
	var detail : String; /**
		If provided, the message box will include a checkbox with the given label. The checkbox state can be inspected only when using .
	**/
	@:optional
	var checkboxLabel : String; /**
		Initial checked state of the checkbox. by default.
	**/
	@:optional
	var checkboxChecked : Bool; @:optional
	var icon : NativeImage; /**
		The index of the button to be used to cancel the dialog, via the key. By default this is assigned to the first button with "cancel" or "no" as the label. If no such labeled buttons exist and this option is not set, will be used as the return value or callback response. This option is ignored on Windows.
	**/
	@:optional
	var cancelId : Int; /**
		On Windows Electron will try to figure out which one of the are common buttons (like "Cancel" or "Yes"), and show the others as command links in the dialog. This can make the dialog appear in the style of modern Windows apps. If you don't like this behavior, you can set to .
	**/
	@:optional
	var noLink : Bool; /**
		Normalize the keyboard access keys across platforms. Default is . Enabling this assumes is used in the button labels for the placement of the keyboard shortcut access key and labels will be converted so they work correctly on each platform, characters are removed on macOS, converted to on Linux, and left untouched on Windows. For example, a button label of will be converted to on Linux and on macOS and can be selected via on Windows and Linux.
	**/
	@:optional
	var normalizeAccessKeys : Bool; }, ?callback:haxe.Constraints.Function):Int;
	/**
		Displays a modal dialog that shows an error message. This API can be called safely before the ready event the app module emits, it is usually used to report errors in early stage of startup.  If called before the app readyevent on Linux, the message will be emitted to stderr, and no GUI dialog will appear.
	**/
	static function showErrorBox(title:String, content:String):Void;
	/**
		Displays a modal dialog that shows a message and certificate information, and gives the user the option of trusting/importing the certificate. The browserWindow argument allows the dialog to attach itself to a parent window, making it modal.
	**/
	static function showCertificateTrustDialog(?browserWindow:BrowserWindow, options:{ /**
		The certificate to trust/import.
	**/
	@:optional
	var certificate : Certificate; /**
		The message to display to the user.
	**/
	@:optional
	var message : String; }, callback:haxe.Constraints.Function):Void;
}