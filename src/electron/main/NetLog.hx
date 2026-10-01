package electron.main;
/**
	> Logging network events for a session.
	
	Process: Main
	
	```
	const { app, netLog } = require('electron')
	
	app.whenReady().then(async () => {
	  await netLog.startLogging('/path/to/net-log')
	  // After some network events
	  const path = await netLog.stopLogging()
	  console.log('Net-logs written to', path)
	})
	```
	
	See `--log-net-log` to log network events throughout the app's lifecycle.
	
	> [!NOTE] All methods unless specified can only be used after the `ready` event of the `app` module gets emitted.
	@see https://electronjs.org/docs/api/net-log
**/
@:jsRequire("electron", "netLog") extern class NetLog extends js.node.events.EventEmitter<electron.main.NetLog> {
	/**
		A `boolean` property that indicates whether network logs are currently being recorded.
	**/
	static var currentlyLogging : Bool;
	/**
		resolves when the net log has begun recording.
		
		Starts recording network events to `path`.
	**/
	static function startLogging(path:String, ?options:{ /**
		What kinds of data should be captured. By default, only metadata about requests will be captured. Setting this to `includeSensitive` will include cookies and authentication data. Setting it to `everything` will include all bytes transferred on sockets. Can be `default`, `includeSensitive` or `everything`.
	**/
	@:optional
	var captureMode : NetLogStartLoggingOptionsCaptureMode; /**
		When the log grows beyond this size, logging will automatically stop. Defaults to unlimited.
	**/
	@:optional
	var maxFileSize : Float; }):js.lib.Promise<Void>;
	/**
		resolves when the net log has been flushed to disk.
		
		Stops recording network events. If not called, net logging will automatically end when app quits.
	**/
	static function stopLogging():js.lib.Promise<Void>;
}
enum abstract NetLogEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
enum abstract NetLogStartLoggingOptionsCaptureMode(String) from String to String {
	var default_ = "default";
	var includeSensitive = "includeSensitive";
	var everything = "everything";
}
