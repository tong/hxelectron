package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/cpu-usage>
**/
@:require(js, electron) typedef CPUUsage = {
	/**
		Percentage of CPU used since the last call to getCPUUsage. First call returns 0.
	**/
	var percentCPUUsage : Float;
	/**
		The number of average idle cpu wakeups per second since the last call to getCPUUsage. First call returns 0. Will always return 0 on Windows.
	**/
	var idleWakeupsPerSecond : Float;
}