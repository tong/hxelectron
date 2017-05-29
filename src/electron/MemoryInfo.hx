package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/memory-info>
**/
@:require(js, electron) typedef MemoryInfo = {
	/**
		Process id of the process.
	**/
	var pid : Int;
	/**
		The amount of memory currently pinned to actual physical RAM.
	**/
	var workingSetSize : Int;
	/**
		The maximum amount of memory that has ever been pinned to actual physical RAM.
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