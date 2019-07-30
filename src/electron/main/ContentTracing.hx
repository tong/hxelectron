package electron.main;
/**
	Collect tracing data from Chromium's content module for finding performance
	bottlenecks and slow operations.
	@see http://electronjs.org/docs/api/content-tracing
**/
@:jsRequire("electron", "contentTracing") extern class ContentTracing {
	/**
		Get a set of category groups. The category groups can change as new code paths are reached.
	**/
	@:overload(function(callback:haxe.Constraints.Function):Void { })
	static function getCategories():js.lib.Promise<Any>;
	/**
		Start recording on all processes. Recording begins immediately locally and asynchronously on child processes as soon as they receive the EnableRecording request.
	**/
	@:overload(function(options:haxe.extern.EitherType<electron.TraceCategoriesAndOptions, electron.TraceConfig>, callback:haxe.Constraints.Function):Void { })
	static function startRecording(options:haxe.extern.EitherType<electron.TraceCategoriesAndOptions, electron.TraceConfig>):js.lib.Promise<Any>;
	/**
		Stop recording on all processes. Child processes typically cache trace data and only rarely flush and send trace data back to the main process. This helps to minimize the runtime overhead of tracing since sending trace data over IPC can be an expensive operation. So, to end tracing, we must asynchronously ask all child processes to flush any pending trace data. Trace data will be written into resultFilePath if it is not empty or into a temporary file.
	**/
	@:overload(function(resultFilePath:String, callback:haxe.Constraints.Function):Void { })
	static function stopRecording(resultFilePath:String):js.lib.Promise<Any>;
	/**
		Get the maximum usage across processes of trace buffer as a percentage of the full state.
	**/
	@:overload(function(callback:haxe.Constraints.Function):Void { })
	static function getTraceBufferUsage():js.lib.Promise<Any>;
}
