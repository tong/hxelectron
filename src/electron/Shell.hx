package electron;
@:jsRequire("electron", "shell") @:require("electron") extern class Shell {
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
	static function openExternal(url:String, ?options:{ @:optional
	var activate : Bool; }):Bool;
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
	static function writeShortcutLink(shortcutPath:String, operation:String, options:electron.ShortcutDetails):Bool;
	/**
		Resolves the shortcut link at shortcutPath. An exception will be thrown when any error happens.
	**/
	static function readShortcutLink(shortcutPath:String):electron.ShortcutDetails;
}