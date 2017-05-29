package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/process-memory-info>
**/
@:require(js, electron) typedef ProcessMemoryInfo = {
	/**
		Process id of the process.
	**/
	var pid : Int;
	/**
		Memory information of the process.
	**/
	var memory : MemoryInfo;
}