package electron.main;
/**
	Collect tracing data from Chromium's content module for finding performance
	bottlenecks and slow operations.
	@see http://electronjs.org/docs/api/content-tracing
**/
@:jsRequire("electron", "contentTracing") extern class ContentTracing {
	/**
		Get a set of category groups. The category groups can change as new code paths are reached. Once all child processes have acknowledged the getCategories request the callback is invoked with an array of category groups.
	**/
	static function getCategories(callback:haxe.Constraints.Function):Void;
	/**
		Start recording on all processes. Recording begins immediately locally and asynchronously on child processes as soon as they receive the EnableRecording request. The callback will be called once all child processes have acknowledged the startRecording request.
	**/
	static function startRecording(options:haxe.extern.EitherType<electron.TraceCategoriesAndOptions, electron.TraceConfig>, callback:haxe.Constraints.Function):Void;
	/**
		Stop recording on all processes. Child processes typically cache trace data and only rarely flush and send trace data back to the main process. This helps to minimize the runtime overhead of tracing since sending trace data over IPC can be an expensive operation. So, to end tracing, we must asynchronously ask all child processes to flush any pending trace data. Once all child processes have acknowledged the stopRecording request, callback will be called with a file that contains the traced data. Trace data will be written into resultFilePath if it is not empty or into a temporary file. The actual file path will be passed to callback if it's not null.
	**/
	static function stopRecording(resultFilePath:String, callback:haxe.Constraints.Function):Void;
	/**
		Start monitoring on all processes. Monitoring begins immediately locally and asynchronously on child processes as soon as they receive the startMonitoring request. Once all child processes have acknowledged the startMonitoring request the callback will be called.
	**/
	static function startMonitoring(options:{ var categoryFilter : String; var traceOptions : String; }, callback:haxe.Constraints.Function):Void;
	/**
		Stop monitoring on all processes. Once all child processes have acknowledged the stopMonitoring request the callback is called.
	**/
	static function stopMonitoring(callback:haxe.Constraints.Function):Void;
	/**
		Get the current monitoring traced data. Child processes typically cache trace data and only rarely flush and send trace data back to the main process. This is because it may be an expensive operation to send the trace data over IPC and we would like to avoid unneeded runtime overhead from tracing. So, to end tracing, we must asynchronously ask all child processes to flush any pending trace data. Once all child processes have acknowledged the captureMonitoringSnapshot request the callback will be called with a file that contains the traced data.
	**/
	static function captureMonitoringSnapshot(resultFilePath:String, callback:haxe.Constraints.Function):Void;
	/**
		Get the maximum usage across processes of trace buffer as a percentage of the full state. When the TraceBufferUsage value is determined the callback is called.
	**/
	static function getTraceBufferUsage(callback:haxe.Constraints.Function):Void;
}
