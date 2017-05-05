package electron.main;

/**
	Control file downloads from remote sources.

	See: <http://electron.atom.io/docs/api/download-item>
**/
@:require(js, electron) @:jsRequire("electron", "DownloadItem") extern class DownloadItem extends js.node.events.EventEmitter<electron.main.DownloadItem> {
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
		Resumes the download that has been paused.
	**/
	function resume():Void;
	/**
		Resumes Boolean - Whether the download can resume.
	**/
	function canResume():Void;
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
	function getURLChain():String;
	function getLastModifiedTime():String;
	function getETag():String;
	function getStartTime():Float;
}

/**
**/
@:require(js, electron) @:enum abstract DownloadItemEvent(String) from String to String {
	/**
		Emitted when the download has been updated and is not done. The state can be one of following:
	**/
	var updated : String = "updated";
	/**
		Emitted when the download is in a terminal state. This includes a completed download, a cancelled download (via downloadItem.cancel()), and interrupted download that can't be resumed. The state can be one of following:
	**/
	var done : String = "done";
}