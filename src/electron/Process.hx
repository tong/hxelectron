package electron;

/**
**/
@:require(js, electron) @:jsRequire("electron", "process") extern class Process {
	/**
		Causes the main thread of the current process crash.
	**/
	static function crash():Void;
	/**
		Causes the main thread of the current process hang.
	**/
	static function hang():Void;
	/**
		Sets the file descriptor soft limit to maxDescriptors or the OS hard limit, whichever is lower for the current process.
	**/
	static function setFdLimit(maxDescriptors:Int):Void;
	/**
		Returns an object giving memory usage statistics about the current process. Note that all statistics are reported in Kilobytes.
	**/
	static function getProcessMemoryInfo():{ /**
		The amount of memory currently pinned to actual physical RAM.
	**/
	@:optional
	var workingSetSize : Int; /**
		The maximum amount of memory that has ever been pinned to actual physical RAM.
	**/
	@:optional
	var peakWorkingSetSize : Int; /**
		The amount of memory not shared by other processes, such as JS heap or HTML content.
	**/
	@:optional
	var privateBytes : Int; /**
		The amount of memory shared between processes, typically memory consumed by the Electron code itself
	**/
	@:optional
	var sharedBytes : Int; };
	/**
		Returns an object giving memory usage statistics about the entire system. Note that all statistics are reported in Kilobytes.
	**/
	static function getSystemMemoryInfo():{ /**
		The total amount of physical memory in Kilobytes available to the system.
	**/
	@:optional
	var total : Int; /**
		The total amount of memory not being used by applications or disk cache.
	**/
	@:optional
	var free : Int; /**
		The total amount of swap memory in Kilobytes available to the system.
	**/
	@:optional
	var swapTotal : Int; /**
		The free amount of swap memory in Kilobytes available to the system.
	**/
	@:optional
	var swapFree : Int; };
}