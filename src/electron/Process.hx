package electron;
@:jsRequire("electron", "process") @:require("electron") extern class Process {
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
	static function getProcessMemoryInfo():Dynamic;
	/**
		Returns an object giving memory usage statistics about the entire system. Note that all statistics are reported in Kilobytes.
	**/
	static function getSystemMemoryInfo():Dynamic;
}