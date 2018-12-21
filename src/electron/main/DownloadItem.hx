package electron.main;
/**
	Control file downloads from remote sources.
	@see http://electronjs.org/docs/api/download-item
**/
@:jsRequire("electron", "DownloadItem") extern class DownloadItem extends js.node.events.EventEmitter<electron.main.DownloadItem> {
	/**
		The API is only available in session's will-download callback function. If user doesn't set the save path via the API, Electron will use the original routine to determine the save path(Usually prompts a save dialog).
	**/
	function setSavePath(path:String):Void;
	function getSavePath():String;
	/**
		Pauses the download.
	**/
	function pause():Void;
	function isPaused():Bool;
	/**
		Resumes the download that has been paused. Note: To enable resumable downloads the server you are downloading from must support range requests and provide both Last-Modified and ETag header values. Otherwise resume() will dismiss previously received bytes and restart the download from the beginning.
	**/
	function resume():Void;
	function canResume():Bool;
	/**
		Cancels the download operation.
	**/
	function cancel():Void;
	function getURL():String;
	function getMimeType():String;
	function hasUserGesture():Bool;
	/**
		Note: The file name is not always the same as the actual one saved in local disk. If user changes the file name in a prompted download saving dialog, the actual name of saved file will be different.
	**/
	function getFilename():String;
	/**
		If the size is unknown, it returns 0.
	**/
	function getTotalBytes():Int;
	function getReceivedBytes():Int;
	function getContentDisposition():String;
	/**
		Note: The following methods are useful specifically to resume a cancelled item when session is restarted.
	**/
	function getState():String;
	function getURLChain():Array<String>;
	function getLastModifiedTime():String;
	function getETag():String;
	function getStartTime():Float;
}
@:enum abstract DownloadItemEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the download has been updated and is not done. The state can be one of following:
	**/
	var updated : electron.main.DownloadItemEvent<(js.html.Event, String) -> Void> = "updated";
	/**
		Emitted when the download is in a terminal state. This includes a completed download, a cancelled download (via downloadItem.cancel()), and interrupted download that can't be resumed. The state can be one of following:
	**/
	var done : electron.main.DownloadItemEvent<(js.html.Event, String) -> Void> = "done";
}
