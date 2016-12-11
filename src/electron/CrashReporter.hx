package electron;

/**
**/
@:require(js, electron) @:jsRequire("electron", "crashReporter") extern class CrashReporter {
	/**
		You are required to call this method before using any other crashReporter APIs and in each process (main/renderer) from which you want to collect crash reports. You can pass different options to crashReporter.start when calling from different processes. Note: On Windows and Linux, Electron uses breakpad for crash collection and reporting. Crashes can be collected from the main and renderer process, but not from the child processes created via the child_process module. Note: On macOS, Electron uses a new crashpad client for crash collection and reporting. Crashes can be collected from the main, renderer and any of the child processes created via the child_process module. If you want to enable crash reporting, initializing crashpad from the main process using crashReporter.start is required regardless of which process you want to collect crashes from. Once initialized this way, the crashpad handler collects crashes from all processes. You still have to call crashReporter.start from the renderer process, otherwise crashes from renderer processes will get reported without companyName, productName or any of the extra information.
	**/
	static function start(options:{ @:optional
	var companyName : String; /**
		URL that crash reports will be sent to as POST.
	**/
	@:optional
	var submitURL : String; /**
		Defaults to .
	**/
	@:optional
	var productName : String; /**
		Whether crash reports should be sent to the server Default is .
	**/
	@:optional
	var uploadToServer : Bool; /**
		Default is .
	**/
	@:optional
	var ignoreSystemCrashHandler : Bool; /**
		An object you can define that will be sent along with the report. Only string properties are sent correctly, Nested objects are not supported.
	**/
	@:optional
	var extra : { }; }):Void;
	/**
		Returns the date and ID of the last crash report. If no crash reports have been sent or the crash reporter has not been started, null is returned.
	**/
	static function getLastCrashReport():CrashReport;
	/**
		Returns all uploaded crash reports. Each report contains the date and uploaded ID.
	**/
	static function getUploadedReports():Array<CrashReport>;
	/**
		Note: This API can only be called from the main process.
	**/
	static function getUploadToServer():Bool;
	/**
		This would normally be controlled by user preferences. This has no effect if called before start is called. Note: This API can only be called from the main process.
	**/
	static function setUploadToServer(uploadToServer:Bool):Void;
}