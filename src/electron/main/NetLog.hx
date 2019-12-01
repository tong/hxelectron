package electron.main;
/**
	@see http://electronjs.org/docs/api/net-log
**/
@:jsRequire("electron", "netLog") extern class NetLog extends js.node.events.EventEmitter<electron.main.NetLog> {
	/**
		A `Boolean` property that indicates whether network logs are recorded.
	**/
	static var currentlyLogging : Bool;
	/**
		A `String` property that returns the path to the current log file.
	**/
	static var currentlyLoggingPath : String;
	/**
		resolves when the net log has begun recording.
		
		Starts recording network events to `path`.
	**/
	static function startLogging(path:String, ?options:{ /**
		What kinds of data should be captured. By default, only metadata about requests will be captured. Setting this to `includeSensitive` will include cookies and authentication data. Setting it to `everything` will include all bytes transferred on sockets. Can be `default`, `includeSensitive` or `everything`.
	**/
	@:optional
	var captureMode : String; /**
		When the log grows beyond this size, logging will automatically stop. Defaults to unlimited.
	**/
	@:optional
	var maxFileSize : Float; }):js.lib.Promise<Any>;
	/**
		resolves with a file path to which network logs were recorded.
		
		Stops recording network events. If not called, net logging will automatically end when app quits.
	**/
	static function stopLogging():js.lib.Promise<Any>;
}
@:enum abstract NetLogEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
