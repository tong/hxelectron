package electron.main;

/**
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
	function getState():String;
}