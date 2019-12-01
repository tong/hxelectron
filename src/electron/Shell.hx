package electron;
/**
	@see http://electronjs.org/docs/api/shell
**/
@:jsRequire("electron", "shell") extern class Shell extends js.node.events.EventEmitter<electron.Shell> {
	/**
		Show the given file in a file manager. If possible, select the file.
	**/
	static function showItemInFolder(fullPath:String):Void;
	/**
		Whether the item was successfully opened.
		
		Open the given file in the desktop's default manner.
	**/
	static function openItem(fullPath:String):Bool;
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
		Whether the item was successfully moved to the trash.
		
		Move the given file to trash and returns a boolean status for the operation.
	**/
	static function moveItemToTrash(fullPath:String):Bool;
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
