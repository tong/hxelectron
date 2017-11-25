package electron;

/**
**/
@:require(js, electron) @:jsRequire("electron", "process") extern class Process {
	/**
		A Boolean. When app is started by being passed as parameter to the default app, this property is true in the main process, otherwise it is undefined.
	**/
	var defaultApp : Bool;
	/**
		A Boolean. For Mac App Store build, this property is true, for other builds it is undefined.
	**/
	var mas : Bool;
	/**
		A Boolean that controls ASAR support inside your application. Setting this to true will disable the support for asar archives in Node's built-in modules.
	**/
	var noAsar : Bool;
	/**
		A Boolean that controls whether or not deprecation warnings are printed to stderr. Setting this to true will silence deprecation warnings.  This property is used instead of the --no-deprecation command line flag.
	**/
	var noDeprecation : Bool;
	/**
		A String representing the path to the resources directory.
	**/
	var resourcesPath : String;
	/**
		A Boolean that controls whether or not deprecation warnings will be thrown as exceptions.  Setting this to true will throw errors for deprecations.  This property is used instead of the --throw-deprecation command line flag.
	**/
	var throwDeprecation : Bool;
	/**
		A Boolean that controls whether or not deprecations printed to stderr include their stack trace.  Setting this to true will print  stack traces for deprecations. This property is instead of the --trace-deprecation command line flag.
	**/
	var traceDeprecation : Bool;
	/**
		A Boolean that controls whether or not process warnings printed to stderr include their stack trace.  Setting this to true will print stack traces for process warnings (including deprecations).  This property is instead of the --trace-warnings command line flag.
	**/
	var traceProcessWarnings : Bool;
	/**
		A String representing the current process's type, can be "browser" (i.e. main process) or "renderer".
	**/
	var type : String;
	/**
		A Boolean. If the app is running as a Windows Store app (appx), this property is true, for otherwise it is undefined.
	**/
	var windowsStore : Bool;
	var versions : { /**
		A String representing Chrome's version string.
	**/
	@:optional
	var chrome : String; /**
		A String representing Electron's version string.
	**/
	@:optional
	var electron : String; };
	/**
		Causes the main thread of the current process crash.
	**/
	static function crash():Void;
	static function getCPUUsage():CPUUsage;
	@:electron_platform(["Windows", "Linux"])
	static function getIOCounters():IOCounters;
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
	/**
		Causes the main thread of the current process hang.
	**/
	static function hang():Void;
	/**
		Sets the file descriptor soft limit to maxDescriptors or the OS hard limit, whichever is lower for the current process.
	**/
	@:electron_platform(["macOS", "Linux"])
	static function setFdLimit(maxDescriptors:Int):Void;
}