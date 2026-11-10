package electron.main;
/**
	> Collect tracing data from Chromium to find performance bottlenecks and slow operations.
	
	Process: Main
	
	This module does not include a web interface. Traces are recorded in the Perfetto protobuf format; to view them, open them in the Perfetto UI.
	
	> [!NOTE] You should not use this module until the `ready` event of the app module is emitted.
	@see https://electronjs.org/docs/api/content-tracing
**/
@:jsRequire("electron", "contentTracing") extern class ContentTracing extends js.node.events.EventEmitter<electron.main.ContentTracing> {
	/**
		resolves with an array of category groups once all child processes have acknowledged the `getCategories` request
		
		Get a set of category groups. The category groups can change as new code paths are reached. See also the list of built-in tracing categories.
		
		> **NOTE:** Electron adds a non-default tracing category called `"electron"`. This category can be used to capture Electron-specific tracing events.
	**/
	static function getCategories():js.lib.Promise<Array<String>>;
	/**
		resolved once all child processes have acknowledged the `startRecording` request.
		
		Start recording on all processes.
		
		Recording begins immediately locally and asynchronously on child processes as soon as they receive the EnableRecording request.
		
		If a recording is already running, the promise will be immediately resolved, as only one trace operation can be in progress at a time. If `options.nativeHeapProfiling` is set while a recording is already running, the promise is rejected instead, since the already-running recording's options can't be changed to turn on heap profiling.
	**/
	static function startRecording(options:haxe.extern.EitherType<electron.TraceConfig, electron.TraceCategoriesAndOptions>):js.lib.Promise<Void>;
	/**
		resolves with a path to a file that contains the traced data once all child processes have acknowledged the `stopRecording` request
		
		Stop recording on all processes.
		
		Child processes typically cache trace data and only rarely flush and send trace data back to the main process. This helps to minimize the runtime overhead of tracing since sending trace data over IPC can be an expensive operation. So, to end tracing, Chromium asynchronously asks all child processes to flush any pending trace data.
		
		Trace data will be written into `resultFilePath`. If `resultFilePath` is empty or not provided, trace data will be written to a temporary file, and the path will be returned in the promise.
		
		Trace data is written in the Perfetto protobuf format.
		
		Heap profiling samples record instruction addresses and module build IDs rather than function names. To symbolize them, use the symbols published for the matching Electron release with Chromium's `symbolize_trace` tool.
	**/
	static function stopRecording(?resultFilePath:String):js.lib.Promise<String>;
	/**
		Resolves with an object containing the `value` and `percentage` of trace buffer maximum usage
		
		* `value` number
		* `percentage` number
		
		Get the maximum usage across processes of trace buffer as a percentage of the full state.
	**/
	static function getTraceBufferUsage():js.lib.Promise<{ var value : Float; var percentage : Float; }>;
}
enum abstract ContentTracingEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
