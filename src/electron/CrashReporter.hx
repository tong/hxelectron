package electron;
/**
	> Submit crash reports to a remote server.
	
	Process: Main, Renderer
	
	> [!IMPORTANT] If you want to call this API from a renderer process with context isolation enabled, place the API call in your preload script and expose it using the `contextBridge` API.
	
	The following is an example of setting up Electron to automatically submit crash reports to a remote server:
	
	```
	const { crashReporter } = require('electron')
	
	crashReporter.start({ submitURL: 'https://your-domain.com/url-to-submit' })
	```
	
	For a guide to collecting, receiving and symbolicating crash reports, including how to run your own crash server or use a hosted service, see the Crash Reporting tutorial.
	
	Electron uses Crashpad to monitor and report crashes. Crashpad uses the same upload protocol as Breakpad, so servers that accept Breakpad minidumps can receive Electron's crash reports.
	
	Crash reports are stored under the directory returned by `app.getPath('crashDumps')`. You can override it by calling `app.setPath('crashDumps', '/path/to/crashes')` before starting the crash reporter. The layout of files inside this directory is an implementation detail and may change between versions of Electron.
	
	The `crashReporter` module is disabled in Mac App Store builds. Its methods can be called, but they do nothing: no crash reports are collected or uploaded, `getUploadedReports()` returns an empty array and `getUploadToServer()` returns `false`.
	@see https://electronjs.org/docs/api/crash-reporter
**/
@:jsRequire("electron", "crashReporter") extern class CrashReporter extends js.node.events.EventEmitter<electron.CrashReporter> {
	/**
		This method must be called before using any other `crashReporter` APIs. Once initialized this way, the crashpad handler collects crashes from all subsequently created processes. The crash reporter cannot be disabled once started.
		
		This method should be called as early as possible in app startup, preferably before `app.on('ready')`. If the crash reporter is not initialized at the time a renderer process is created, then that renderer process will not be monitored by the crash reporter.
		
		> [!NOTE] You can test out the crash reporter by generating a crash using `process.crash()`.
		
		> [!NOTE] If you need to send additional/updated `extra` parameters after your first call `start` you can call `addExtraParameter`.
		
		> [!NOTE] Parameters passed in `extra`, `globalExtra` or set with `addExtraParameter` have limits on the length of the keys and values. Key names must be at most 39 bytes long, and values must be no longer than 20320 bytes. Keys with names longer than the maximum are ignored, and a warning is emitted. Values longer than the maximum length are truncated.
		
		> [!NOTE] This method is only available in the main process.
	**/
	static function start(options:{ /**
		URL that crash reports will be sent to as POST. Required unless `uploadToServer` is `false`.
	**/
	@:optional
	var submitURL : String; /**
		Defaults to `app.name`.
	**/
	@:optional
	var productName : String; /**
		Deprecated alias for `{ globalExtra: { _companyName: ... } }`.
	**/
	@:optional
	var companyName : String; /**
		Whether crash reports should be sent to the server. If false, crash reports will be collected and stored in the crashes directory, but not uploaded. Default is `true`.
	**/
	@:optional
	var uploadToServer : Bool; /**
		If true, crashes generated in the main process will not be forwarded to the system crash handler. This option has no effect on Windows. Default is `false`.
	**/
	@:optional
	var ignoreSystemCrashHandler : Bool; /**
		If true, limit the number of crashes uploaded to 1/hour. Crash reports over the limit are not uploaded, but are still stored on disk. Default is `false`.
	**/
	@:optional
	var rateLimit : Bool; /**
		If true, crash reports will be compressed and uploaded with `Content-Encoding: gzip`. Setting this to `false` while `uploadToServer` is `true` is deprecated and logs a deprecation warning. Default is `true`.
	**/
	@:optional
	var compress : Bool; /**
		Extra string key/value annotations that will be sent along with crash reports that are generated in the main process. Only string values are supported. Crashes generated in child processes will not include these extra parameters. To add extra parameters to crash reports generated from child processes, call `addExtraParameter` from the child process.
	**/
	@:optional
	var extra : Dynamic; /**
		Extra string key/value annotations that will be sent along with any crash reports generated in any process. These annotations cannot be changed once the crash reporter has been started. If a key is present in both the global extra parameters and the process-specific extra parameters, then the global one will take precedence. By default, `productName` and the app version are included, as well as the Electron version. Global extra parameters are not returned by `getParameters()`.
	**/
	@:optional
	var globalExtra : Dynamic; }):Void;
	/**
		The date and ID of the crash report with the most recent upload time, from the list returned by `getUploadedReports()`. If there are no crash reports at all, `null` is returned.
		
		If no report has been uploaded yet but some are stored on disk, a report that has not been uploaded may be returned. Check that its `id` is not empty before treating it as uploaded.
		
		> [!NOTE] This method is only available in the main process.
	**/
	static function getLastCrashReport():haxe.extern.EitherType<electron.CrashReport, Dynamic>;
	/**
		Returns the crash reports stored on disk. Each report contains the date it was uploaded and the ID that the crash server returned for it.
		
		Despite the method's name, reports that have not been uploaded (for example because `uploadToServer` is `false`, the upload failed, or the report was rate limited) are included too. For those reports, `id` is an empty string and `date` is not meaningful. To list only uploaded reports, filter out reports with an empty `id`.
		
		> [!NOTE] This method is only available in the main process.
	**/
	static function getUploadedReports():Array<electron.CrashReport>;
	/**
		Whether reports should be submitted to the server. Set through the `start` method or `setUploadToServer`.
		
		> [!NOTE] This method is only available in the main process.
	**/
	static function getUploadToServer():Bool;
	/**
		This would normally be controlled by user preferences. This has no effect if called before `start` is called.
		
		> [!NOTE] This method is only available in the main process.
	**/
	static function setUploadToServer(uploadToServer:Bool):Void;
	/**
		Set an extra parameter to be sent with the crash report. The values specified here will be sent in addition to any values set via the `extra` option when `start` was called. Calling this again with the same key replaces the value. The value is read when a crash happens, so you can update it as your app's state changes.
		
		Parameters added in this fashion (or via the `extra` parameter to `crashReporter.start`) are specific to the calling process. Adding extra parameters in the main process will not cause those parameters to be sent along with crashes from renderer or other child processes. Similarly, adding extra parameters in a renderer process will not result in those parameters being sent with crashes that occur in other renderer processes or in the main process. Processes created with `utilityProcess` have no API for setting extra parameters, so only `globalExtra` values are sent with their crashes.
		
		> [!NOTE] Parameters have limits on the length of the keys and values. Key names must be no longer than 39 bytes, and values must be no longer than 20320 bytes. Keys with names longer than the maximum are ignored, and a warning is emitted. Values longer than the maximum length are truncated.
	**/
	static function addExtraParameter(key:String, value:String):Void;
	/**
		Remove an extra parameter from the current set of parameters. Future crashes will not include this parameter.
	**/
	static function removeExtraParameter(key:String):Void;
	/**
		The current 'extra' parameters of the crash reporter in the calling process, as set with the `extra` option and `addExtraParameter`. Parameters set with the `globalExtra` option are not included.
	**/
	static function getParameters():Dynamic;
}
enum abstract CrashReporterEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
