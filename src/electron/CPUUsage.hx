package electron;
/**
	Both `percentCPUUsage` and `idleWakeupsPerSecond` are averages rather than instant samples, and each call starts a fresh measurement interval.
	
	Multiple APIs return `CPUUsage` objects, and each tracks its own intervals:
	
	* `process.getCPUUsage()` measures the process it is called in. Only calls to `process.getCPUUsage()` in that same process reset its interval.
	* `app.getAppMetrics()` measures every process in the app, as the `cpu` property of each `ProcessMetric`. It keeps a separate interval for each process ID, and a single call resets all of them at once, since one call reports on every process.
	
	> [!NOTE] Each API's measurement interval is independent. Calling `process.getCPUUsage()` does not change what `app.getAppMetrics()` reports and vice-versa. The main process can therefore report different `percentCPUUsage` values through each API at the same moment.
	
	> [!NOTE] If one of your app's dependencies calls one of these functions, it will start a new interval before you read it. To measure an interval you control, use `cumulativeCPUUsage` instead. Subtract an earlier reading from a later one to get usage over that span. Reading it still means calling `app.getAppMetrics()` or `process.getCPUUsage()`, which starts a new interval for everyone else.
	@see https://electronjs.org/docs/api/structures/cpu-usage
**/
typedef CPUUsage = {
	/**
		Percentage of CPU used since the last call to the API that returned this object. First call returns 0.
	**/
	var percentCPUUsage : Float;
	/**
		Total seconds of CPU time used since process startup.
	**/
	@:optional
	var cumulativeCPUUsage : Float;
	/**
		The number of average idle CPU wakeups per second since the last call to the API that returned this object. First call returns 0. Will always return 0 on Windows.
	**/
	var idleWakeupsPerSecond : Float;
}
