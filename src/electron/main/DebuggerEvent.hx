package electron.main;

/**
**/
@:require(js, electron) @:enum abstract DebuggerEvent(String) from String to String {
	/**
		Emitted when debugging session is terminated. This happens either when webContents is closed or devtools is invoked for the attached webContents.
	**/
	var detach : String = "detach";
	/**
		Emitted whenever debugging target issues instrumentation event.
	**/
	var message : String = "message";
}