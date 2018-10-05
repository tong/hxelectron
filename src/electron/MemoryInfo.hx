package electron;
/**
	@see http://electronjs.org/docs/api/structures/memory-info
**/
typedef MemoryInfo = {
	/**
		Process id of the process.
	**/
	var pid : Int;
	/**
		The amount of memory currently pinned to actual physical RAM.
	**/
	var workingSetSize : Int;
	/**
		The maximum amount of memory that has ever been pinned to actual physical RAM. On macOS its value will always be 0.
	**/
	var peakWorkingSetSize : Int;
	/**
		The amount of memory not shared by other processes, such as JS heap or HTML content.
	**/
	var privateBytes : Int;
	/**
		The amount of memory shared between processes, typically memory consumed by the Electron code itself
	**/
	var sharedBytes : Int;
}
