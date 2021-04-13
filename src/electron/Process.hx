package electron;
/**
	> Extensions to process object.
	
	Process: Main, Renderer
	
	Electron's `process` object is extended from the Node.js `process` object. It adds the following events, properties, and methods:
	
	### Sandbox
	
	In sandboxed renderers the `process` object contains only a subset of the APIs:
	
	* `crash()`
	* `hang()`
	* `getCreationTime()`
	* `getHeapStatistics()`
	* `getBlinkMemoryInfo()`
	* `getProcessMemoryInfo()`
	* `getSystemMemoryInfo()`
	* `getSystemVersion()`
	* `getCPUUsage()`
	* `getIOCounters()`
	* `argv`
	* `execPath`
	* `env`
	* `pid`
	* `arch`
	* `platform`
	* `sandboxed`
	* `type`
	* `version`
	* `versions`
	* `mas`
	* `windowsStore`
	@see https://electronjs.org/docs/api/process
**/
@:jsRequire("electron", "process") extern class Process extends js.node.events.EventEmitter<electron.Process> {
	/**
		A `Boolean`. When app is started by being passed as parameter to the default app, this property is `true` in the main process, otherwise it is `undefined`.
	**/
	static var defaultApp : Bool;
	/**
		A `Boolean`, `true` when the current renderer context is the "main" renderer frame. If you want the ID of the current frame you should use `webFrame.routingId`.
	**/
	static var isMainFrame : Bool;
	/**
		A `Boolean`. For Mac App Store build, this property is `true`, for other builds it is `undefined`.
	**/
	static var mas : Bool;
	/**
		A `Boolean` that controls ASAR support inside your application. Setting this to `true` will disable the support for `asar` archives in Node's built-in modules.
	**/
	static var noAsar : Bool;
	/**
		A `Boolean` that controls whether or not deprecation warnings are printed to `stderr`. Setting this to `true` will silence deprecation warnings. This property is used instead of the `--no-deprecation` command line flag.
	**/
	static var noDeprecation : Bool;
	/**
		A `String` representing the path to the resources directory.
	**/
	static var resourcesPath : String;
	/**
		A `Boolean`. When the renderer process is sandboxed, this property is `true`, otherwise it is `undefined`.
	**/
	static var sandboxed : Bool;
	/**
		A `Boolean` that controls whether or not deprecation warnings will be thrown as exceptions. Setting this to `true` will throw errors for deprecations. This property is used instead of the `--throw-deprecation` command line flag.
	**/
	static var throwDeprecation : Bool;
	/**
		A `Boolean` that controls whether or not deprecations printed to `stderr` include their stack trace. Setting this to `true` will print stack traces for deprecations. This property is instead of the `--trace-deprecation` command line flag.
	**/
	static var traceDeprecation : Bool;
	/**
		A `Boolean` that controls whether or not process warnings printed to `stderr` include their stack trace. Setting this to `true` will print stack traces for process warnings (including deprecations). This property is instead of the `--trace-warnings` command line flag.
	**/
	static var traceProcessWarnings : Bool;
	/**
		A `String` representing the current process's type, can be:
		
		* `browser` - The main process
		* `renderer` - A renderer process
		* `worker` - In a web worker
	**/
	static var type : String;
	/**
		A `String` representing Chrome's version string.
	**/
	static var chrome : String;
	/**
		A `String` representing Electron's version string.
	**/
	static var electron : String;
	/**
		A `Boolean`. If the app is running as a Windows Store app (appx), this property is `true`, for otherwise it is `undefined`.
	**/
	static var windowsStore : Bool;
	/**
		Causes the main thread of the current process crash.
	**/
	static function crash():Void;
	/**
		The number of milliseconds since epoch, or `null` if the information is unavailable
		
		Indicates the creation time of the application. The time is represented as number of milliseconds since epoch. It returns null if it is unable to get the process creation time.
	**/
	static function getCreationTime():haxe.extern.EitherType<Dynamic, Dynamic>;
	static function getCPUUsage():electron.CPUUsage;
	static function getIOCounters():electron.IOCounters;
	/**
		* `totalHeapSize` Integer
		* `totalHeapSizeExecutable` Integer
		* `totalPhysicalSize` Integer
		* `totalAvailableSize` Integer
		* `usedHeapSize` Integer
		* `heapSizeLimit` Integer
		* `mallocedMemory` Integer
		* `peakMallocedMemory` Integer
		* `doesZapGarbage` Boolean
		
		Returns an object with V8 heap statistics. Note that all statistics are reported in Kilobytes.
	**/
	static function getHeapStatistics():Any;
	/**
		* `allocated` Integer - Size of all allocated objects in Kilobytes.
		* `marked` Integer - Size of all marked objects in Kilobytes.
		* `total` Integer - Total allocated space in Kilobytes.
		
		Returns an object with Blink memory information. It can be useful for debugging rendering / DOM related memory issues. Note that all values are reported in Kilobytes.
	**/
	static function getBlinkMemoryInfo():Any;
	/**
		Resolves with a ProcessMemoryInfo
		
		Returns an object giving memory usage statistics about the current process. Note that all statistics are reported in Kilobytes. This api should be called after app ready.
		
		Chromium does not provide `residentSet` value for macOS. This is because macOS performs in-memory compression of pages that haven't been recently used. As a result the resident set size value is not what one would expect. `private` memory is more representative of the actual pre-compression memory usage of the process on macOS.
	**/
	static function getProcessMemoryInfo():js.lib.Promise<Any>;
	/**
		* `total` Integer - The total amount of physical memory in Kilobytes available to the system.
		* `free` Integer - The total amount of memory not being used by applications or disk cache.
		* `swapTotal` Integer _Windows_ _Linux_ - The total amount of swap memory in Kilobytes available to the system.
		* `swapFree` Integer _Windows_ _Linux_ - The free amount of swap memory in Kilobytes available to the system.
		
		Returns an object giving memory usage statistics about the entire system. Note that all statistics are reported in Kilobytes.
	**/
	static function getSystemMemoryInfo():Any;
	/**
		The version of the host operating system.
		
		Example:
		
		**Note:** It returns the actual operating system version instead of kernel version on macOS unlike `os.release()`.
	**/
	static function getSystemVersion():String;
	/**
		Indicates whether the snapshot has been created successfully.
		
		Takes a V8 heap snapshot and saves it to `filePath`.
	**/
	static function takeHeapSnapshot(filePath:String):Bool;
	/**
		Causes the main thread of the current process hang.
	**/
	static function hang():Void;
	/**
		Sets the file descriptor soft limit to `maxDescriptors` or the OS hard limit, whichever is lower for the current process.
	**/
	static function setFdLimit(maxDescriptors:Int):Void;
}
@:enum abstract ProcessEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when Electron has loaded its internal initialization script and is beginning to load the web page or the main script.
	**/
	var loaded : electron.ProcessEvent<Void -> Void> = "loaded";
}
