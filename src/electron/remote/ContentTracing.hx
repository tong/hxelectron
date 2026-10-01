package electron.remote;
/**
	> Collect tracing data from Chromium to find performance bottlenecks and slow operations.
	
	Process: Main
	
	This module does not include a web interface. To view recorded traces, use trace viewer, available at `chrome://tracing` in Chrome.
	
	> [!NOTE] You should not use this module until the `ready` event of the app module is emitted.
	@see https://electronjs.org/docs/api/content-tracing
**/
@:jsRequire("electron", "remote.contentTracing") extern class ContentTracing extends js.node.events.EventEmitter<electron.remote.ContentTracing> {
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
		
		If a recording is already running, the promise will be immediately resolved, as only one trace operation can be in progress at a time.
	**/
	static function startRecording(options:haxe.extern.EitherType<electron.TraceConfig, electron.TraceCategoriesAndOptions>):js.lib.Promise<Void>;
	/**
		resolves with a path to a file that contains the traced data once all child processes have acknowledged the `stopRecording` request
		
		Stop recording on all processes.
		
		Child processes typically cache trace data and only rarely flush and send trace data back to the main process. This helps to minimize the runtime overhead of tracing since sending trace data over IPC can be an expensive operation. So, to end tracing, Chromium asynchronously asks all child processes to flush any pending trace data.
		
		Trace data will be written into `resultFilePath`. If `resultFilePath` is empty or not provided, trace data will be written to a temporary file, and the path will be returned in the promise.
	**/
	static function stopRecording(?resultFilePath:String):js.lib.Promise<String>;
	/**
		Resolves with an object containing the `value` and `percentage` of trace buffer maximum usage
		
		* `value` number
		* `percentage` number
		
		Get the maximum usage across processes of trace buffer as a percentage of the full state.
	**/
	static function getTraceBufferUsage():js.lib.Promise<{ var value : Float; var percentage : Float; }>;
	/**
		Resolves once heap profiling has been enabled.
		
		Enable heap profiling for MemoryInfra traces. Equivalent to the `--memlog` switch in Chrome.
		
		Only takes effect if the `disabled-by-default-memory-infra` category is included.
		
		Needs to be called before `contentTracing.startRecording()`.
		
		Usage:
		
		To view the recorded heap dumps:
		
		* Download the breakpad symbols for your Electron version from the Electron GitHub releases
		* Clone the Electron source code
		* In your Chromium checkout for Electron, run this command to symbolicate the heap dump:
		* Open the symbolicated trace in `chrome://tracing` (the Perfetto UI does not support memory dumps yet)
		* Click on one of the `M` symbols
		* Click on a `☰` triple bar icon (e.g., in the `malloc` column)
		
		[Image: Screenshot showing how to view a heapdump in Chromium's tracing view]
	**/
	@:electron_experimental
	static function enableHeapProfiling(?options:electron.EnableHeapProfilingOptions):js.lib.Promise<Void>;
}
enum abstract ContentTracingEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
