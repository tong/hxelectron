package electron;
/**
	@see https://electronjs.org/docs/api/structures/enable-heap-profiling-options
**/
typedef EnableHeapProfilingOptions = {
	/**
		Controls which processes are profiled. Equivalent to `--memlog` in Chrome. Default is `all`.
	**/
	@:optional
	var mode : EnableHeapProfilingOptionsMode;
	/**
		Controls the sampling interval in bytes. The lower the interval, the more precise the profile is. However it comes at the cost of performance. Default is `100000` (100KB). That is enough to observe allocation sites that make allocations >500KB total, where total equals to a single allocation size times the number of such allocations at the same call site. Equivalent to `--memlog-sampling-rate` in Chrome. Must be an integer between `1000` and `10000000`.
	**/
	@:optional
	var samplingRate : Float;
	/**
		Controls the type of metadata recorded for each allocation. Equivalent to `--memlog-stack-mode` in Chrome. Default is `native`.
	**/
	@:optional
	var stackMode : EnableHeapProfilingOptionsStackMode;
}
enum abstract EnableHeapProfilingOptionsMode(String) from String to String {
	/**
		Profile all processes.
	**/
	var all = "all";
	/**
		Profile only the browser process.
	**/
	var browser = "browser";
	/**
		Profile only the GPU process.
	**/
	var gpu = "gpu";
	/**
		Profile only the browser and GPU processes.
	**/
	var minimal = "minimal";
	/**
		Profile at most 1 renderer process. Each renderer process has a fixed probability of being profiled when the renderer process is started or, for existing processes, when heap profiling is enabled.
	**/
	var renderer_sampling = "renderer-sampling";
	/**
		Profile all renderer processes.
	**/
	var all_renderers = "all-renderers";
	/**
		Each utility process has a fixed probability of being profiled.
	**/
	var utility_sampling = "utility-sampling";
	/**
		Profile all utility processes.
	**/
	var all_utilities = "all-utilities";
	/**
		Profile all utility processes and the browser process.
	**/
	var utility_and_browser = "utility-and-browser";
}
enum abstract EnableHeapProfilingOptionsStackMode(String) from String to String {
	/**
		Instruction addresses from unwinding the stack.
	**/
	var native = "native";
	/**
		Instruction addresses from unwinding the stack. Includes the thread name as the first frame.
	**/
	var native_with_thread_names = "native-with-thread-names";
}
