package electron;
/**
	@see http://electronjs.org/docs/api/structures/process-metric
**/
typedef ProcessMetric = {
	/**
		Process id of the process.
	**/
	var pid : Int;
	/**
		Process type. One of the following values:
	**/
	var type : String;
	/**
		CPU usage of the process.
	**/
	var cpu : electron.CPUUsage;
	/**
		Creation time for this process. The time is represented as number of milliseconds since epoch. Since the `pid` can be reused after a process dies, it is useful to use both the `pid` and the `creationTime` to uniquely identify a process.
	**/
	var creationTime : Float;
	/**
		Memory information for the process.
	**/
	var memory : electron.MemoryInfo;
	/**
		Whether the process is sandboxed on OS level.
	**/
	var sandboxed : Bool;
	/**
		One of the following values:
	**/
	var integrityLevel : String;
}
