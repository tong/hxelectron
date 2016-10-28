package electron.main;

/**
**/
@:require(js, electron) @:enum abstract SessionEvent(String) from String to String {
	/**
		Emitted when Electron is about to download item in webContents. Calling event.preventDefault() will cancel the download and item will not be available from next tick of the process.
	**/
	var will_download : String = "will-download";
}