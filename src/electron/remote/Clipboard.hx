package electron.remote;
/**
	> Perform copy and paste operations on the system clipboard.
	
	Process: Main
	
	The `clipboard` module is modeled after the W3C Clipboard API: `clipboard.read()` returns a `Promise` that resolves with a list of `ClipboardItem` objects, and `clipboard.write()` accepts an array of `ClipboardItem` instances that map MIME types to Blob payloads.
	
	In addition to the standard MIME types (`text/plain`, `text/html`, `text/rtf`, `image/png`, `image/jpeg`, …), Electron exposes a small set of custom formats so the clipboard can carry desktop-specific payloads. These follow the W3C custom format proposal, using an `electron` prefix instead of `web` to avoid collisions. The custom formats Electron exposes are:
	
	* `electron application/bookmark` — a URL bookmark. Unlike every other MIME type/custom format, its payload is a ClipboardBookmark object on both the write and read sides rather than a `Blob`, so `getType('electron application/bookmark')` resolves to `{ title: string, url: string }`.
	* `electron application/findtext` (_macOS_) — the contents of the active app's find pasteboard.
	* `electron application/osclipboard;format="<name>"` — a raw payload for a platform-specific clipboard format. The `<name>` is the platform format (e.g. `HTML Format` on Windows or `public.utf8-plain-text` on macOS). `clipboard.read()` also surfaces any platform clipboard format that has no standard MIME mapping under this custom format, so a raw OS format round-trips through the same string on write and read.
	
	Beyond the well-known MIME types, both `clipboard.read()` and `clipboard.write()` accept arbitrary MIME types including custom formats starting with the `web` prefix (followed by a space, e.g. `web application/x.my-format`) that follow the W3C web custom format proposal.
	
	```
	const { clipboard, ClipboardItem } = require('electron')
	
	async function writeClipboard() {
	  await clipboard.write([
	    new ClipboardItem({
	      'web application/x.my-app-clip': new Blob(['arbitrary payload'])
	    })
	  ])
	}
	
	writeClipboard()
	```
	
	On Linux there is also a `selection` clipboard. It is exposed via the `clipboard.selection` sub-namespace, which mirrors the top-level `clipboard` interface. The `selection` clipboard operates against the selection clipboard instead of the system clipboard.
	
	It exposes the same surface as the top-level `clipboard` module, but each method targets the selection clipboard rather than the system clipboard. The two clipboards are independent: writing via `clipboard.selection` does not affect the data returned by `clipboard.read()` (and vice versa).
	
	> [!NOTE] The `selection` clipboard does not support the W3C web custom format.
	@see https://electronjs.org/docs/api/clipboard
**/
@:jsRequire("electron", "remote.clipboard") extern class Clipboard extends js.node.events.EventEmitter<electron.remote.Clipboard> {
	/**
		A `Clipboard` property — a `Clipboard` object on Linux that operates against the selection clipboard instead of the system clipboard, and `undefined` on all other platforms. It exposes the same `read`, `write`, `readText`, `writeText`, `has`, and `clear` methods as the top-level `clipboard` module.
	**/
	@:electron_platforms(["Linux"])
	static var selection : electron.remote.Clipboard;
	/**
		A promise that resolves with the content of the clipboard as plain text. Modeled after the W3C `navigator.clipboard.readText` API.
	**/
	static function readText():js.lib.Promise<String>;
	/**
		A promise that resolves once the text has been written to the clipboard. Modeled after the W3C `navigator.clipboard.writeText` API.
	**/
	static function writeText(text:String):js.lib.Promise<Void>;
	/**
		A promise that resolves with an array of ClipboardItem objects containing the clipboard's contents.
	**/
	static function read():js.lib.Promise<Array<electron.remote.ClipboardItem>>;
	/**
		Resolves once the data has been written to the clipboard. All entries supplied in a single `write()` call are committed to the system clipboard atomically.
	**/
	static function write(data:Array<electron.remote.ClipboardItem>):js.lib.Promise<Void>;
	/**
		A promise that resolves with `true` if the clipboard contains data of the specified `mimetype`, otherwise `false`. To check for a raw format, eg `public/utf8-plain-text`, use the `electron application/osclipboard` custom format (`electron application/osclipboard;format="public/utf8-plain-text"`).
	**/
	static function has(mimetype:String):js.lib.Promise<Bool>;
	/**
		Clears the clipboard content.
	**/
	static function clear():Void;
}
enum abstract ClipboardEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
