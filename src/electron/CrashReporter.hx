package electron;
@:jsRequire("electron", "crashReporter") @:require("electron") extern class CrashReporter {
	/**
		You are required to call this method before using other crashReporter APIs. Note: On macOS, Electron uses a new crashpad client, which is different from breakpad on Windows and Linux. To enable the crash collection feature, you are required to call the crashReporter.start API to initialize crashpad in the main process and in each renderer process from which you wish to collect crash reports.
	**/
	static function start(options:{ @:optional
	var companyName : String; /**
		URL that crash reports will be sent to as POST.
	**/
	@:optional
	var submitURL : String; /**
		(optional) - Defaults to .
	**/
	@:optional
	var productName : String; /**
		Send the crash report without user interaction. Default is .
	**/
	@:optional
	var autoSubmit : Bool; /**
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
	static function getLastCrashReport():Dynamic;
	/**
		Returns all uploaded crash reports. Each report contains the date and uploaded ID.
	**/
	static function getUploadedReports():Array<Dynamic>;
}