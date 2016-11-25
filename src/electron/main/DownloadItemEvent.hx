package electron.main;

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