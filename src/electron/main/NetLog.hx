package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "netLog") @:electron("main") extern class NetLog {
	/**
		A Boolean property that indicates whether network logs are recorded.
	**/
	var currentlyLogging : Bool;
	/**
		A String property that returns the path to the current log file.
	**/
	var currentlyLoggingPath : String;
	/**
		Starts recording network events to path.
	**/
	static function startLogging(path:String):Void;
	/**
		Stops recording network events. If not called, net logging will automatically end when app quits.
	**/
	static function stopLogging(?callback:haxe.Constraints.Function):Void;
}