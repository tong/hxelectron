package electron;
/**
	@see https://electronjs.org/docs/api/structures/cpu-usage
**/
typedef CPUUsage = {
	/**
		Percentage of CPU used since the last call to getCPUUsage. First call returns 0.
	**/
	var percentCPUUsage : Float;
	/**
		Total seconds of CPU time used since process startup.
	**/
	@:optional
	var cumulativeCPUUsage : Float;
	/**
		The number of average idle CPU wakeups per second since the last call to getCPUUsage. First call returns 0. Will always return 0 on Windows.
	**/
	var idleWakeupsPerSecond : Float;
}
