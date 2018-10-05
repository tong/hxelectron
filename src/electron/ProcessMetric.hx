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
		Process type (Browser or Tab or GPU etc).
	**/
	var type : String;
	/**
		Memory information for the process.
	**/
	var memory : electron.MemoryInfo;
	/**
		CPU usage of the process.
	**/
	var cpu : electron.CPUUsage;
}
