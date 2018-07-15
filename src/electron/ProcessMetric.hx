package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/process-metric>
**/
@:require(js, electron) @:electron typedef ProcessMetric = {
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
	var memory : MemoryInfo;
	/**
		CPU usage of the process.
	**/
	var cpu : CPUUsage;
}