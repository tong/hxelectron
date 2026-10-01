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
	* `uptime()`
	* `argv`
	* `execPath`
	* `env`
	* `pid`
	* `arch`
	* `platform`
	* `sandboxed`
	* `contextIsolated`
	* `type`
	* `version`
	* `versions`
	* `mas`
	* `windowsStore`
	* `contextId`
	@see https://electronjs.org/docs/api/process
**/
@:native('process') extern class Process extends js.node.events.EventEmitter<electron.Process> {
	/**
		A `boolean`. When the app is started by being passed as parameter to the default Electron executable, this property is `true` in the main process, otherwise it is `undefined`. For example when running the app with `electron .`, it is `true`, even if the app is packaged (`isPackaged`) is `true`. This can be useful to determine how many arguments will need to be sliced off from `process.argv`.
	**/
	static var defaultApp : Bool;
	/**
		A `boolean`, `true` when the current renderer context is the "main" renderer frame. If you want the ID of the current frame you should use `webFrame.routingId`.
	**/
	static var isMainFrame : Bool;
	/**
		A `boolean`. For Mac App Store build, this property is `true`, for other builds it is `undefined`.
	**/
	static var mas : Bool;
	/**
		A `boolean` that controls ASAR support inside your application. Setting this to `true` will disable the support for `asar` archives in Node's built-in modules.
	**/
	static var noAsar : Bool;
	/**
		A `boolean` (optional) that controls whether or not deprecation warnings are printed to `stderr`. Setting this to `true` will silence deprecation warnings. This property is used instead of the `--no-deprecation` command line flag.
	**/
	@:optional
	static var noDeprecation : Bool;
	/**
		A `string` representing the path to the resources directory.
	**/
	static var resourcesPath : String;
	/**
		A `boolean`. When the renderer process is sandboxed, this property is `true`, otherwise it is `undefined`.
	**/
	static var sandboxed : Bool;
	/**
		A `boolean` that indicates whether the current renderer context has `contextIsolation` enabled. It is `undefined` in the main process.
	**/
	static var contextIsolated : Bool;
	/**
		A `boolean` that controls whether or not deprecation warnings will be thrown as exceptions. Setting this to `true` will throw errors for deprecations. This property is used instead of the `--throw-deprecation` command line flag.
	**/
	static var throwDeprecation : Bool;
	/**
		A `boolean` that controls whether or not deprecations printed to `stderr` include their stack trace. Setting this to `true` will print stack traces for deprecations. This property is used instead of the `--trace-deprecation` command line flag.
	**/
	static var traceDeprecation : Bool;
	/**
		A `boolean` that controls whether or not process warnings printed to `stderr` include their stack trace. Setting this to `true` will print stack traces for process warnings (including deprecations). This property is used instead of the `--trace-warnings` command line flag.
	**/
	static var traceProcessWarnings : Bool;
	/**
		A `string` representing the current process's type, can be:
		
		* `browser` - The main process
		* `renderer` - A renderer process
		* `service-worker` - In a service worker
		* `worker` - In a web worker
		* `utility` - In a node process launched as a service
	**/
	static var type : ProcessType;
	/**
		A `string` representing Chrome's version string.
	**/
	static var chrome : String;
	/**
		A `string` representing Electron's version string.
	**/
	static var electron : String;
	/**
		A `boolean`. If the app is running as an MSIX package (including AppX for Windows Store), this property is `true`, otherwise it is `undefined`.
	**/
	static var windowsStore : Bool;
	/**
		A `string` (optional) representing a globally unique ID of the current JavaScript context. Each frame has its own JavaScript context. When contextIsolation is enabled, the isolated world also has a separate JavaScript context. This property is only available in the renderer process.
	**/
	@:optional
	static var contextId : String;
	/**
		A `Electron.ParentPort` property if this is a `UtilityProcess` (or `null` otherwise) allowing communication with the parent process.
	**/
	static var parentPort : electron.ParentPort;
	/**
		Causes the main thread of the current process crash.
	**/
	static function crash():Void;
	/**
		The number of milliseconds since epoch, or `null` if the information is unavailable
		
		Indicates the creation time of the application. The time is represented as number of milliseconds since epoch. It returns null if it is unable to get the process creation time.
	**/
	static function getCreationTime():haxe.extern.EitherType<Float, Dynamic>;
	/**
		CPU usage of the process this is called in.
		
		> [!NOTE] `percentCPUUsage` and `idleWakeupsPerSecond` are averages over the time since the previous call to `process.getCPUUsage()` in this process, and each call starts a new measurement interval. Every caller in the process shares that interval. See `CPUUsage` for details.
	**/
	static function getCPUUsage():electron.CPUUsage;
	/**
		* `totalHeapSize` Integer
		* `totalHeapSizeExecutable` Integer
		* `totalPhysicalSize` Integer
		* `totalAvailableSize` Integer
		* `usedHeapSize` Integer
		* `heapSizeLimit` Integer
		* `mallocedMemory` Integer
		* `peakMallocedMemory` Integer
		* `doesZapGarbage` boolean
		
		Returns an object with V8 heap statistics. Note that all statistics are reported in Kilobytes.
	**/
	static function getHeapStatistics():{ var totalHeapSize : Int; var totalHeapSizeExecutable : Int; var totalPhysicalSize : Int; var totalAvailableSize : Int; var usedHeapSize : Int; var heapSizeLimit : Int; var mallocedMemory : Int; var peakMallocedMemory : Int; var doesZapGarbage : Bool; };
	/**
		* `allocated` Integer - Size of all allocated objects in Kilobytes.
		* `total` Integer - Total allocated space in Kilobytes.
		
		Returns an object with Blink memory information. It can be useful for debugging rendering / DOM related memory issues. Note that all values are reported in Kilobytes.
	**/
	static function getBlinkMemoryInfo():{ /**
		Size of all allocated objects in Kilobytes.
	**/
	var allocated : Int; /**
		Total allocated space in Kilobytes.
	**/
	var total : Int; };
	/**
		Resolves with a ProcessMemoryInfo
		
		Returns an object giving memory usage statistics about the current process. Note that all statistics are reported in Kilobytes. This api should be called after app ready.
		
		Chromium does not provide `residentSet` value for macOS. This is because macOS performs in-memory compression of pages that haven't been recently used. As a result the resident set size value is not what one would expect. `private` memory is more representative of the actual pre-compression memory usage of the process on macOS.
	**/
	static function getProcessMemoryInfo():js.lib.Promise<electron.ProcessMemoryInfo>;
	/**
		* `total` Integer - The total amount of physical memory in Kilobytes available to the system.
		* `free` Integer - The total amount of memory not being used by applications or disk cache.
		* `available` Integer _Linux_ - The kernel's estimate of the amount of memory available for allocation without swapping, from `/proc/meminfo` `MemAvailable`. Use this as the memory pressure signal on Linux; `free` there is `MemFree`, which excludes page cache and other reclaimable memory.
		* `fileBacked` Integer _macOS_ - The amount of memory that currently has been paged out to storage. Includes memory for file caches, network buffers, and other system services.
		* `purgeable` Integer _macOS_ - The amount of memory that is marked as "purgeable". The system can reclaim it if memory pressure increases.
		* `swapTotal` Integer _Windows_ _Linux_ - The total amount of swap memory in Kilobytes available to the system.
		* `swapFree` Integer _Windows_ _Linux_ - The free amount of swap memory in Kilobytes available to the system.
		
		Returns an object giving memory usage statistics about the entire system. Note that all statistics are reported in Kilobytes.
	**/
	static function getSystemMemoryInfo():{ /**
		The total amount of physical memory in Kilobytes available to the system.
	**/
	var total : Int; /**
		The total amount of memory not being used by applications or disk cache.
	**/
	var free : Int; /**
		The kernel's estimate of the amount of memory available for allocation without swapping, from `/proc/meminfo` `MemAvailable`. Use this as the memory pressure signal on Linux; `free` there is `MemFree`, which excludes page cache and other reclaimable memory.
	**/
	@:electron_platforms(["Linux"])
	var available : Int; /**
		The amount of memory that currently has been paged out to storage. Includes memory for file caches, network buffers, and other system services.
	**/
	@:electron_platforms(["macOS"])
	var fileBacked : Int; /**
		The amount of memory that is marked as "purgeable". The system can reclaim it if memory pressure increases.
	**/
	@:electron_platforms(["macOS"])
	var purgeable : Int; /**
		The total amount of swap memory in Kilobytes available to the system.
	**/
	@:electron_platforms(["Windows", "Linux"])
	var swapTotal : Int; /**
		The free amount of swap memory in Kilobytes available to the system.
	**/
	@:electron_platforms(["Windows", "Linux"])
	var swapFree : Int; };
	/**
		The version of the host operating system.
		
		Example:
		
		> [!NOTE] It returns the actual operating system version instead of kernel version on macOS unlike `os.release()`.
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
	@:electron_platforms(["macOS", "Linux"])
	static function setFdLimit(maxDescriptors:Int):Void;
	static function on<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function once<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function addListener<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function removeListener<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function off<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function removeAllListeners<T:(haxe.Constraints.Function)>(?event:js.node.events.EventEmitter.Event<T>):Void;
}
enum abstract ProcessEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when Electron has loaded its internal initialization script and is beginning to load the web page or the main script.
	**/
	var loaded : electron.ProcessEvent<() -> Void> = "loaded";
}
enum abstract ProcessType(String) from String to String {
	/**
		The main process
	**/
	var browser = "browser";
	/**
		A renderer process
	**/
	var renderer = "renderer";
	/**
		In a service worker
	**/
	var service_worker = "service-worker";
	/**
		In a web worker
	**/
	var worker = "worker";
	/**
		In a node process launched as a service
	**/
	var utility = "utility";
}
