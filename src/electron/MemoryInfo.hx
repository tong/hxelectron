package electron;
/**
	Note that all statistics are reported in Kilobytes.
	@see https://electronjs.org/docs/api/structures/memory-info
**/
typedef MemoryInfo = {
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
}
