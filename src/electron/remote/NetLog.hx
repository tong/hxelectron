package electron.remote;
/**
	> Logging network events for a session.
	
	Process: Main
	
	```
	const { netLog } = require('electron')
	
	app.whenReady().then(async () => {
	  await netLog.startLogging('/path/to/net-log')
	  // After some network events
	  const path = await netLog.stopLogging()
	  console.log('Net-logs written to', path)
	})
	```
	
	See `--log-net-log` to log network events throughout the app's lifecycle.
	
	**Note:** All methods unless specified can only be used after the `ready` event of the `app` module gets emitted.
	@see https://electronjs.org/docs/api/net-log
**/
@:jsRequire("electron", "remote.netLog") extern class NetLog extends js.node.events.EventEmitter<electron.remote.NetLog> {
	/**
		A `Boolean` property that indicates whether network logs are currently being recorded.
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
	var captureMode : String; /**
		When the log grows beyond this size, logging will automatically stop. Defaults to unlimited.
	**/
	@:optional
	var maxFileSize : Float; }):js.lib.Promise<Any>;
	/**
		resolves when the net log has been flushed to disk.
		
		Stops recording network events. If not called, net logging will automatically end when app quits.
	**/
	static function stopLogging():js.lib.Promise<Any>;
}
@:enum abstract NetLogEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
