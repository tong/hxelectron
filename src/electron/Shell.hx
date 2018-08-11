package electron;
/**
	Manage files and URLs using their default applications.
	@see http://electron.atom.io/docs/api/shell
**/
@:jsRequire("electron", "shell") extern class Shell {
	/**
		Show the given file in a file manager. If possible, select the file.
	**/
	static function showItemInFolder(fullPath:String):Bool;
	/**
		Open the given file in the desktop's default manner.
	**/
	static function openItem(fullPath:String):Bool;
	/**
		Open the given external protocol URL in the desktop's default manner. (For example, mailto: URLs in the user's default mail agent).
	**/
	static function openExternal(url:String, ?options:{ /**
		true to bring the opened application to the foreground. The default is true.
	**/
	var activate : Bool; }, ?callback:haxe.Constraints.Function):Bool;
	/**
		Move the given file to trash and returns a boolean status for the operation.
	**/
	static function moveItemToTrash(fullPath:String):Bool;
	/**
		Play the beep sound.
	**/
	static function beep():Void;
	/**
		Creates or updates a shortcut link at shortcutPath.
	**/
	@:electron_platform(["Windows"])
	static function writeShortcutLink(shortcutPath:String, ?operation:String, options:electron.ShortcutDetails):Bool;
	/**
		Resolves the shortcut link at shortcutPath. An exception will be thrown when any error happens.
	**/
	@:electron_platform(["Windows"])
	static function readShortcutLink(shortcutPath:String):electron.ShortcutDetails;
}
