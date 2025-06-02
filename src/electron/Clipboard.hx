package electron;
/**
	> Perform copy and paste operations on the system clipboard.
	
	Process: Main, Renderer (non-sandboxed only)
	
	On Linux, there is also a `selection` clipboard. To manipulate it you need to pass `selection` to each method:
	@see https://electronjs.org/docs/api/clipboard
**/
@:jsRequire("electron", "clipboard") extern class Clipboard extends js.node.events.EventEmitter<electron.Clipboard> {
	/**
		The content in the clipboard as plain text.
	**/
	static function readText(?type:String):String;
	/**
		Writes the `text` into the clipboard as plain text.
	**/
	static function writeText(text:String, ?type:String):Void;
	/**
		The content in the clipboard as markup.
	**/
	static function readHTML(?type:String):String;
	/**
		Writes `markup` to the clipboard.
	**/
	static function writeHTML(markup:String, ?type:String):Void;
	/**
		The image content in the clipboard.
	**/
	static function readImage(?type:String):electron.NativeImage;
	/**
		Writes `image` to the clipboard.
	**/
	static function writeImage(image:electron.NativeImage, ?type:String):Void;
	/**
		The content in the clipboard as RTF.
	**/
	static function readRTF(?type:String):String;
	/**
		Writes the `text` into the clipboard in RTF.
	**/
	static function writeRTF(text:String, ?type:String):Void;
	/**
		* `title` string
		* `url` string
		
		Returns an Object containing `title` and `url` keys representing the bookmark in the clipboard. The `title` and `url` values will be empty strings when the bookmark is unavailable.  The `title` value will always be empty on Windows.
	**/
	static function readBookmark():Any;
	/**
		Writes the `title` (macOS only) and `url` into the clipboard as a bookmark.
		
		> [!NOTE] Most apps on Windows don't support pasting bookmarks into them so you can use `clipboard.write` to write both a bookmark and fallback text to the clipboard.
	**/
	static function writeBookmark(title:String, url:String, ?type:String):Void;
	/**
		The text on the find pasteboard, which is the pasteboard that holds information about the current state of the active application’s find panel.
		
		This method uses synchronous IPC when called from the renderer process. The cached value is reread from the find pasteboard whenever the application is activated.
	**/
	static function readFindText():String;
	/**
		Writes the `text` into the find pasteboard (the pasteboard that holds information about the current state of the active application’s find panel) as plain text. This method uses synchronous IPC when called from the renderer process.
	**/
	static function writeFindText(text:String):Void;
	/**
		Clears the clipboard content.
	**/
	static function clear(?type:String):Void;
	/**
		An array of supported formats for the clipboard `type`.
	**/
	static function availableFormats(?type:String):Array<String>;
	/**
		Whether the clipboard supports the specified `format`.
	**/
	static function has(format:String, ?type:String):Bool;
	/**
		Reads `format` type from the clipboard.
		
		`format` should contain valid ASCII characters and have `/` separator. `a/c`, `a/bc` are valid formats while `/abc`, `abc/`, `a/`, `/a`, `a` are not valid.
	**/
	static function read(format:String):String;
	/**
		Reads `format` type from the clipboard.
	**/
	static function readBuffer(format:String):js.node.Buffer;
	/**
		Writes the `buffer` into the clipboard as `format`.
	**/
	static function writeBuffer(format:String, buffer:js.node.Buffer, ?type:String):Void;
	/**
		Writes `data` to the clipboard.
	**/
	static function write(data:{ @:optional
	var text : String; @:optional
	var html : String; @:optional
	var image : electron.NativeImage; @:optional
	var rtf : String; /**
		The title of the URL at `text`.
	**/
	@:optional
	var bookmark : String; }, ?type:String):Void;
}
enum abstract ClipboardEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
