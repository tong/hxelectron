package electron.remote;
/**
	> A single clipboard entry that pairs one or more MIME-typed payloads.
	
	Process: Main
	
	`ClipboardItem` is modeled after the W3C `ClipboardItem` class. Each `ClipboardItem` carries one or more MIME-typed payloads that represent the same conceptual clipboard entry — for example, a single copy operation that exposes both a plain-text and an HTML representation of a selection.
	
	### Class: ClipboardItem
	
	> Construct a clipboard entry for `clipboard.write()` or inspect an entry returned from `clipboard.read()`.
	
	Process: Main
	
	> [!WARNING] Electron's built-in classes cannot be subclassed in user code. For more information, see the FAQ.
	@see https://electronjs.org/docs/api/clipboard-item
**/
@:jsRequire("electron", "remote.ClipboardItem") extern class ClipboardItem extends js.node.events.EventEmitter<electron.remote.ClipboardItem> {
	/**
		A `string[]` property — the MIME types of the data carried by this entry. For a constructed `ClipboardItem` these are the keys passed to the constructor; for an item returned by `clipboard.read()` these are the MIME types the platform clipboard currently makes available.
	**/
	var types : Array<String>;
	function new(items:haxe.DynamicAccess<haxe.extern.EitherType<String, haxe.extern.EitherType<electron.ClipboardBookmark, haxe.extern.EitherType<js.html.Blob, js.lib.Promise<haxe.extern.EitherType<js.html.Blob, String>>>>>>):Void;
	/**
		Resolves with a ClipboardBookmark when a bookmark is available in the clipboard. Rejects when a bookmark is not available in the clipboard.
	**/
	@:overload(function(type:String):js.lib.Promise<Dynamic> { })
	function getType(bookmark:String):js.lib.Promise<electron.ClipboardBookmark>;
}
enum abstract ClipboardItemEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
