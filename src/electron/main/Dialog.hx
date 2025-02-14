package electron.main;
/**
	> Display native system dialogs for opening and saving files, alerting, etc.
	
	Process: Main
	
	An example of showing a dialog to select multiple files:
	@see https://electronjs.org/docs/api/dialog
**/
@:jsRequire("electron", "dialog") extern class Dialog extends js.node.events.EventEmitter<electron.main.Dialog> {
	/**
		the file paths chosen by the user; if the dialog is cancelled it returns `undefined`.
		
		The `window` argument allows the dialog to attach itself to a parent window, making it modal.
		
		The `filters` specifies an array of file types that can be displayed or selected when you want to limit the user to a specific type. For example:
		
		The `extensions` array should contain extensions without wildcards or dots (e.g. `'png'` is good but `'.png'` and `'*.png'` are bad). To show all files, use the `'*'` wildcard (no other wildcard is supported).
		
		**Note:** On Windows and Linux an open dialog can not be both a file selector and a directory selector, so if you set `properties` to `['openFile', 'openDirectory']` on these platforms, a directory selector will be shown.
		
		**Note:** On Linux `defaultPath` is not supported when using portal file chooser dialogs unless the portal backend is version 4 or higher. You can use `--xdg-portal-required-version` command-line switch to force gtk or kde dialogs.
	**/
	static function showOpenDialogSync(?window:electron.main.BaseWindow, options:{ @:optional
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
		Create security scoped bookmarks when packaged for the Mac App Store.
	**/
	@:optional
	var securityScopedBookmarks : Bool; }):haxe.extern.EitherType<Array<String>, Dynamic>;
	/**
		Resolve with an object containing the following:
		
		* `canceled` boolean - whether or not the dialog was canceled.
		* `filePaths` string[] - An array of file paths chosen by the user. If the dialog is cancelled this will be an empty array.
		* `bookmarks` string[] (optional) _macOS_ _mas_ - An array matching the `filePaths` array of base64 encoded strings which contains security scoped bookmark data. `securityScopedBookmarks` must be enabled for this to be populated. (For return values, see table here.)
		
		The `window` argument allows the dialog to attach itself to a parent window, making it modal.
		
		The `filters` specifies an array of file types that can be displayed or selected when you want to limit the user to a specific type. For example:
		
		The `extensions` array should contain extensions without wildcards or dots (e.g. `'png'` is good but `'.png'` and `'*.png'` are bad). To show all files, use the `'*'` wildcard (no other wildcard is supported).
		
		**Note:** On Windows and Linux an open dialog can not be both a file selector and a directory selector, so if you set `properties` to `['openFile', 'openDirectory']` on these platforms, a directory selector will be shown.
		
		**Note:** On Linux `defaultPath` is not supported when using portal file chooser dialogs unless the portal backend is version 4 or higher. You can use `--xdg-portal-required-version` command-line switch to force gtk or kde dialogs.
	**/
	static function showOpenDialog(?window:electron.main.BaseWindow, options:{ @:optional
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
		Create security scoped bookmarks when packaged for the Mac App Store.
	**/
	@:optional
	var securityScopedBookmarks : Bool; }):js.lib.Promise<Any>;
	/**
		the path of the file chosen by the user; if the dialog is cancelled it returns an empty string.
		
		The `window` argument allows the dialog to attach itself to a parent window, making it modal.
		
		The `filters` specifies an array of file types that can be displayed, see `dialog.showOpenDialog` for an example.
	**/
	static function showSaveDialogSync(?window:electron.main.BaseWindow, options:{ /**
		The dialog title. Cannot be displayed on some _Linux_ desktop environments.
	**/
	@:optional
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
		Show the tags input box, defaults to `true`.
	**/
	@:optional
	var showsTagField : Bool; @:optional
	var properties : Array<String>; /**
		Create a security scoped bookmark when packaged for the Mac App Store. If this option is enabled and the file doesn't already exist a blank file will be created at the chosen path.
	**/
	@:optional
	var securityScopedBookmarks : Bool; }):String;
	/**
		Resolve with an object containing the following:
		
		* `canceled` boolean - whether or not the dialog was canceled.
		* `filePath` string - If the dialog is canceled, this will be an empty string.
		* `bookmark` string (optional) _macOS_ _mas_ - Base64 encoded string which contains the security scoped bookmark data for the saved file. `securityScopedBookmarks` must be enabled for this to be present. (For return values, see table here.)
		
		The `window` argument allows the dialog to attach itself to a parent window, making it modal.
		
		The `filters` specifies an array of file types that can be displayed, see `dialog.showOpenDialog` for an example.
		
		**Note:** On macOS, using the asynchronous version is recommended to avoid issues when expanding and collapsing the dialog.
	**/
	static function showSaveDialog(?window:electron.main.BaseWindow, options:{ /**
		The dialog title. Cannot be displayed on some _Linux_ desktop environments.
	**/
	@:optional
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
		Show the tags input box, defaults to `true`.
	**/
	@:optional
	var showsTagField : Bool; @:optional
	var properties : Array<String>; /**
		Create a security scoped bookmark when packaged for the Mac App Store. If this option is enabled and the file doesn't already exist a blank file will be created at the chosen path.
	**/
	@:optional
	var securityScopedBookmarks : Bool; }):js.lib.Promise<Any>;
	/**
		the index of the clicked button.
		
		Shows a message box, it will block the process until the message box is closed. It returns the index of the clicked button.
		
		The `window` argument allows the dialog to attach itself to a parent window, making it modal. If `window` is not shown dialog will not be attached to it. In such case it will be displayed as an independent window.
	**/
	static function showMessageBoxSync(?window:electron.main.BaseWindow, options:{ /**
		Content of the message box.
	**/
	var message : String; /**
		Can be `none`, `info`, `error`, `question` or `warning`. On Windows, `question` displays the same icon as `info`, unless you set an icon using the `icon` option. On macOS, both `warning` and `error` display the same warning icon.
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
		Extra information of the message.
	**/
	@:optional
	var detail : String; @:optional
	var icon : haxe.extern.EitherType<electron.NativeImage, String>; /**
		Custom width of the text in the message box.
	**/
	@:optional
	var textWidth : Int; /**
		The index of the button to be used to cancel the dialog, via the `Esc` key. By default this is assigned to the first button with "cancel" or "no" as the label. If no such labeled buttons exist and this option is not set, `0` will be used as the return value.
	**/
	@:optional
	var cancelId : Int; /**
		On Windows Electron will try to figure out which one of the `buttons` are common buttons (like "Cancel" or "Yes"), and show the others as command links in the dialog. This can make the dialog appear in the style of modern Windows apps. If you don't like this behavior, you can set `noLink` to `true`.
	**/
	@:optional
	var noLink : Bool; /**
		Normalize the keyboard access keys across platforms. Default is `false`. Enabling this assumes `&` is used in the button labels for the placement of the keyboard shortcut access key and labels will be converted so they work correctly on each platform, `&` characters are removed on macOS, converted to `_` on Linux, and left untouched on Windows. For example, a button label of `Vie&w` will be converted to `Vie_w` on Linux and `View` on macOS and can be selected via `Alt-W` on Windows and Linux.
	**/
	@:optional
	var normalizeAccessKeys : Bool; }):Int;
	/**
		resolves with a promise containing the following properties:
		
		* `response` number - The index of the clicked button.
		* `checkboxChecked` boolean - The checked state of the checkbox if `checkboxLabel` was set. Otherwise `false`.
		
		Shows a message box.
		
		The `window` argument allows the dialog to attach itself to a parent window, making it modal.
	**/
	static function showMessageBox(?window:electron.main.BaseWindow, options:{ /**
		Content of the message box.
	**/
	var message : String; /**
		Can be `none`, `info`, `error`, `question` or `warning`. On Windows, `question` displays the same icon as `info`, unless you set an icon using the `icon` option. On macOS, both `warning` and `error` display the same warning icon.
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
		Pass an instance of AbortSignal to optionally close the message box, the message box will behave as if it was cancelled by the user. On macOS, `signal` does not work with message boxes that do not have a parent window, since those message boxes run synchronously due to platform limitations.
	**/
	@:optional
	var signal : AbortSignal; /**
		Title of the message box, some platforms will not show it.
	**/
	@:optional
	var title : String; /**
		Extra information of the message.
	**/
	@:optional
	var detail : String; /**
		If provided, the message box will include a checkbox with the given label.
	**/
	@:optional
	var checkboxLabel : String; /**
		Initial checked state of the checkbox. `false` by default.
	**/
	@:optional
	var checkboxChecked : Bool; @:optional
	var icon : haxe.extern.EitherType<electron.NativeImage, String>; /**
		Custom width of the text in the message box.
	**/
	@:optional
	var textWidth : Int; /**
		The index of the button to be used to cancel the dialog, via the `Esc` key. By default this is assigned to the first button with "cancel" or "no" as the label. If no such labeled buttons exist and this option is not set, `0` will be used as the return value.
	**/
	@:optional
	var cancelId : Int; /**
		On Windows Electron will try to figure out which one of the `buttons` are common buttons (like "Cancel" or "Yes"), and show the others as command links in the dialog. This can make the dialog appear in the style of modern Windows apps. If you don't like this behavior, you can set `noLink` to `true`.
	**/
	@:optional
	var noLink : Bool; /**
		Normalize the keyboard access keys across platforms. Default is `false`. Enabling this assumes `&` is used in the button labels for the placement of the keyboard shortcut access key and labels will be converted so they work correctly on each platform, `&` characters are removed on macOS, converted to `_` on Linux, and left untouched on Windows. For example, a button label of `Vie&w` will be converted to `Vie_w` on Linux and `View` on macOS and can be selected via `Alt-W` on Windows and Linux.
	**/
	@:optional
	var normalizeAccessKeys : Bool; }):js.lib.Promise<Any>;
	/**
		Displays a modal dialog that shows an error message.
		
		This API can be called safely before the `ready` event the `app` module emits, it is usually used to report errors in early stage of startup. If called before the app `ready`event on Linux, the message will be emitted to stderr, and no GUI dialog will appear.
	**/
	static function showErrorBox(title:String, content:String):Void;
	/**
		resolves when the certificate trust dialog is shown.
		
		On macOS, this displays a modal dialog that shows a message and certificate information, and gives the user the option of trusting/importing the certificate. If you provide a `window` argument the dialog will be attached to the parent window, making it modal.
		
		On Windows the options are more limited, due to the Win32 APIs used:
		
		* The `message` argument is not used, as the OS provides its own confirmation dialog.
		* The `window` argument is ignored since it is not possible to make this confirmation dialog modal.
	**/
	static function showCertificateTrustDialog(?window:electron.main.BaseWindow, options:{ /**
		The certificate to trust/import.
	**/
	var certificate : electron.Certificate; /**
		The message to display to the user.
	**/
	var message : String; }):js.lib.Promise<Any>;
}
enum abstract DialogEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
