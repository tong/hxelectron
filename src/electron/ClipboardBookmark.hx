package electron;
/**
	A `ClipboardBookmark` is the payload used by the `electron application/bookmark` clipboard custom format. It is passed to `clipboard.write()` as a `ClipboardItem` `data` value, and is what `getType('electron application/bookmark')` resolves to when reading via `clipboard.read()`.
	@see https://electronjs.org/docs/api/structures/clipboard-bookmark
**/
typedef ClipboardBookmark = {
	/**
		The title of the bookmark.
	**/
	var title : String;
	/**
		The URL of the bookmark.
	**/
	var url : String;
}
