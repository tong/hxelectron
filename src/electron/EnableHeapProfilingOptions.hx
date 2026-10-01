package electron;
/**
	@see https://electronjs.org/docs/api/structures/enable-heap-profiling-options
**/
typedef EnableHeapProfilingOptions = {
	/**
		Controls which processes are profiled. Equivalent to `--memlog` in Chrome. Default is `all`.
	**/
	@:optional
	var mode : String;
	/**
		Controls the sampling interval in bytes. The lower the interval, the more precise the profile is. However it comes at the cost of performance. Default is `100000` (100KB). That is enough to observe allocation sites that make allocations >500KB total, where total equals to a single allocation size times the number of such allocations at the same call site. Equivalent to `--memlog-sampling-rate` in Chrome. Must be an integer between `1000` and `10000000`.
	**/
	@:optional
	var samplingRate : Float;
	/**
		Controls the type of metadata recorded for each allocation. Equivalent to `--memlog-stack-mode` in Chrome. Default is `native`.
	**/
	@:optional
	var stackMode : String;
}
