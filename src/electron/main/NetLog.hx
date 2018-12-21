package electron.main;
/**
	Logging network events for a session.
	@see http://electronjs.org/docs/api/net-log
**/
@:jsRequire("electron", "netLog") extern class NetLog {
	/**
		A Boolean property that indicates whether network logs are recorded.
	**/
	static var currentlyLogging : Bool;
	/**
		A String property that returns the path to the current log file.
	**/
	static var currentlyLoggingPath : String;
	/**
		Starts recording network events to path.
	**/
	static function startLogging(path:String):Void;
	/**
		Stops recording network events. If not called, net logging will automatically end when app quits.
	**/
	static function stopLogging(?callback:haxe.Constraints.Function):Void;
}
