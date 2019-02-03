package electron;
/**
	Extensions to process object.
	@see http://electronjs.org/docs/api/process
**/
@:jsRequire("electron", "process") extern class Process extends js.node.events.EventEmitter<electron.Process> {
	/**
		A Boolean. When app is started by being passed as parameter to the default app, this property is true in the main process, otherwise it is undefined.
	**/
	static var defaultApp : Bool;
	/**
		A Boolean. For Mac App Store build, this property is true, for other builds it is undefined.
	**/
	static var mas : Bool;
	/**
		A Boolean that controls ASAR support inside your application. Setting this to true will disable the support for asar archives in Node's built-in modules.
	**/
	static var noAsar : Bool;
	/**
		A Boolean that controls whether or not deprecation warnings are printed to stderr. Setting this to true will silence deprecation warnings. This property is used instead of the --no-deprecation command line flag.
	**/
	static var noDeprecation : Bool;
	/**
		A String representing the path to the resources directory.
	**/
	static var resourcesPath : String;
	/**
		A Boolean. When the renderer process is sandboxed, this property is true, otherwise it is undefined.
	**/
	static var sandboxed : Bool;
	/**
		A Boolean that controls whether or not deprecation warnings will be thrown as exceptions. Setting this to true will throw errors for deprecations. This property is used instead of the --throw-deprecation command line flag.
	**/
	static var throwDeprecation : Bool;
	/**
		A Boolean that controls whether or not deprecations printed to stderr include their stack trace. Setting this to true will print stack traces for deprecations. This property is instead of the --trace-deprecation command line flag.
	**/
	static var traceDeprecation : Bool;
	/**
		A Boolean that controls whether or not process warnings printed to stderr include their stack trace. Setting this to true will print stack traces for process warnings (including deprecations). This property is instead of the --trace-warnings command line flag.
	**/
	static var traceProcessWarnings : Bool;
	/**
		A String representing the current process's type, can be "browser" (i.e. main process) or "renderer".
	**/
	static var type : String;
	/**
		A Boolean. If the app is running as a Windows Store app (appx), this property is true, for otherwise it is undefined.
	**/
	static var windowsStore : Bool;
	static var versions : { /**
		A String representing Chrome's version string.
	**/
	var chrome : String; /**
		A String representing Electron's version string.
	**/
	var electron : String; };
	/**
		Causes the main thread of the current process crash.
	**/
	static function crash():Void;
	/**
		Indicates the creation time of the application. The time is represented as number of milliseconds since epoch. It returns null if it is unable to get the process creation time.
	**/
	static function getCreationTime():haxe.extern.EitherType<Float, Dynamic>;
	static function getCPUUsage():electron.CPUUsage;
	@:electron_platforms(["Windows", "Linux"])
	static function getIOCounters():electron.IOCounters;
	/**
		Returns an object with V8 heap statistics. Note that all statistics are reported in Kilobytes.
	**/
	static function getHeapStatistics():Any;
	/**
		Returns an object giving memory usage statistics about the current process. Note that all statistics are reported in Kilobytes. This api should be called after app ready. Chromium does not provide residentSet value for macOS. This is because macOS performs in-memory compression of pages that haven't been recently used. As a result the resident set size value is not what one would expect. private memory is more representative of the actual pre-compression memory usage of the process on macOS.
	**/
	static function getProcessMemoryInfo():Any;
	/**
		Returns an object giving memory usage statistics about the entire system. Note that all statistics are reported in Kilobytes.
	**/
	static function getSystemMemoryInfo():Any;
	/**
		Takes a V8 heap snapshot and saves it to filePath.
	**/
	static function takeHeapSnapshot(filePath:String):Bool;
	/**
		Causes the main thread of the current process hang.
	**/
	static function hang():Void;
	/**
		Sets the file descriptor soft limit to maxDescriptors or the OS hard limit, whichever is lower for the current process.
	**/
	@:electron_platforms(["macOS", "Linux"])
	static function setFdLimit(maxDescriptors:Int):Void;
}
@:enum abstract ProcessEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when Electron has loaded its internal initialization script and is beginning to load the web page or the main script. It can be used by the preload script to add removed Node global symbols back to the global scope when node integration is turned off:
	**/
	var loaded : electron.ProcessEvent<Void -> Void> = "loaded";
}
