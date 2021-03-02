package electron;
/**
	> Manage files and URLs using their default applications.
	
	Process: Main, Renderer (non-sandboxed only)
	
	The `shell` module provides functions related to desktop integration.
	
	An example of opening a URL in the user's default browser:
	
	```
	const { shell } = require('electron')
	
	shell.openExternal('https://github.com')
	```
	
	**Note:** While the `shell` module can be used in the renderer process, it will not function in a sandboxed renderer.
	@see https://electronjs.org/docs/api/shell
**/
@:jsRequire("electron", "shell") extern class Shell extends js.node.events.EventEmitter<electron.Shell> {
	/**
		Show the given file in a file manager. If possible, select the file.
	**/
	static function showItemInFolder(fullPath:String):Void;
	/**
		Resolves with a string containing the error message corresponding to the failure if a failure occurred, otherwise "".
		
		Open the given file in the desktop's default manner.
	**/
	static function openPath(path:String):js.lib.Promise<Any>;
	/**
		Open the given external protocol URL in the desktop's default manner. (For example, mailto: URLs in the user's default mail agent).
	**/
	static function openExternal(url:String, ?options:{ /**
		`true` to bring the opened application to the foreground. The default is `true`.
	**/
	@:optional
	var activate : Bool; /**
		The working directory.
	**/
	@:optional
	var workingDirectory : String; }):js.lib.Promise<Any>;
	/**
		Whether the item was successfully moved to the trash or otherwise deleted.
		
		> NOTE: This method is deprecated. Use `shell.trashItem` instead.
		
		Move the given file to trash and returns a boolean status for the operation.
	**/
	static function moveItemToTrash(fullPath:String, ?deleteOnFail:Bool):Bool;
	/**
		Resolves when the operation has been completed. Rejects if there was an error while deleting the requested item.
		
		This moves a path to the OS-specific trash location (Trash on macOS, Recycle Bin on Windows, and a desktop-environment-specific location on Linux).
	**/
	static function trashItem(path:String):js.lib.Promise<Any>;
	/**
		Play the beep sound.
	**/
	static function beep():Void;
	/**
		Whether the shortcut was created successfully.
		
		Creates or updates a shortcut link at `shortcutPath`.
	**/
	static function writeShortcutLink(shortcutPath:String, ?operation:String, options:electron.ShortcutDetails):Bool;
	/**
		Resolves the shortcut link at `shortcutPath`.
		
		An exception will be thrown when any error happens.
	**/
	static function readShortcutLink(shortcutPath:String):electron.ShortcutDetails;
}
@:enum abstract ShellEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
