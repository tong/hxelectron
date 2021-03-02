package electron.remote;
/**
	@see https://electronjs.org/docs/api/download-item
**/
@:jsRequire("electron", "remote.DownloadItem") extern class DownloadItem extends js.node.events.EventEmitter<electron.remote.DownloadItem> {
	/**
		A `String` property that determines the save file path of the download item.
		
		The property is only available in session's `will-download` callback function. If user doesn't set the save path via the property, Electron will use the original routine to determine the save path; this usually prompts a save dialog.
	**/
	var savePath : String;
	/**
		The API is only available in session's `will-download` callback function. If `path` doesn't exist, Electron will try to make the directory recursively. If user doesn't set the save path via the API, Electron will use the original routine to determine the save path; this usually prompts a save dialog.
	**/
	function setSavePath(path:String):Void;
	/**
		The save path of the download item. This will be either the path set via `downloadItem.setSavePath(path)` or the path selected from the shown save dialog.
	**/
	function getSavePath():String;
	/**
		This API allows the user to set custom options for the save dialog that opens for the download item by default. The API is only available in session's `will-download` callback function.
	**/
	function setSaveDialogOptions(options:SaveDialogOptions):Void;
	/**
		Returns the object previously set by `downloadItem.setSaveDialogOptions(options)`.
	**/
	function getSaveDialogOptions():SaveDialogOptions;
	/**
		Pauses the download.
	**/
	function pause():Void;
	/**
		Whether the download is paused.
	**/
	function isPaused():Bool;
	/**
		Resumes the download that has been paused.
		
		**Note:** To enable resumable downloads the server you are downloading from must support range requests and provide both `Last-Modified` and `ETag` header values. Otherwise `resume()` will dismiss previously received bytes and restart the download from the beginning.
	**/
	function resume():Void;
	/**
		Whether the download can resume.
	**/
	function canResume():Bool;
	/**
		Cancels the download operation.
	**/
	function cancel():Void;
	/**
		The origin URL where the item is downloaded from.
	**/
	function getURL():String;
	/**
		The files mime type.
	**/
	function getMimeType():String;
	/**
		Whether the download has user gesture.
	**/
	function hasUserGesture():Bool;
	/**
		The file name of the download item.
		
		**Note:** The file name is not always the same as the actual one saved in local disk. If user changes the file name in a prompted download saving dialog, the actual name of saved file will be different.
	**/
	function getFilename():String;
	/**
		The total size in bytes of the download item.
		
		If the size is unknown, it returns 0.
	**/
	function getTotalBytes():Int;
	/**
		The received bytes of the download item.
	**/
	function getReceivedBytes():Int;
	/**
		The Content-Disposition field from the response header.
	**/
	function getContentDisposition():String;
	/**
		The current state. Can be `progressing`, `completed`, `cancelled` or `interrupted`.
		
		**Note:** The following methods are useful specifically to resume a `cancelled` item when session is restarted.
	**/
	function getState():String;
	/**
		The complete URL chain of the item including any redirects.
	**/
	function getURLChain():Array<String>;
	/**
		Last-Modified header value.
	**/
	function getLastModifiedTime():String;
	/**
		ETag header value.
	**/
	function getETag():String;
	/**
		Number of seconds since the UNIX epoch when the download was started.
	**/
	function getStartTime():Float;
}
@:enum abstract DownloadItemEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the download has been updated and is not done.
		
		The `state` can be one of following:
		
		* `progressing` - The download is in-progress.
		* `interrupted` - The download has interrupted and can be resumed.
	**/
	var updated : electron.remote.DownloadItemEvent<Void -> Void> = "updated";
	/**
		Emitted when the download is in a terminal state. This includes a completed download, a cancelled download (via `downloadItem.cancel()`), and interrupted download that can't be resumed.
		
		The `state` can be one of following:
		
		* `completed` - The download completed successfully.
		* `cancelled` - The download has been cancelled.
		* `interrupted` - The download has interrupted and can not resume.
	**/
	var done : electron.remote.DownloadItemEvent<Void -> Void> = "done";
}
