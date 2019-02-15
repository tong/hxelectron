package electron.main;
/**
	Control your application's event lifecycle.
	@see http://electronjs.org/docs/api/app
**/
@:jsRequire("electron", "app") extern class App extends js.node.events.EventEmitter<electron.main.App> {
	/**
		A Boolean property that returns  true if the app is packaged, false otherwise. For many apps, this property can be used to distinguish development and production environments.
	**/
	static var isPackaged : Bool;
	static var commandLine : { /**
		Append a switch (with optional value) to Chromium's command line. Note: This will not affect process.argv, and is mainly used by developers to control some low-level Chromium behaviors.
	**/
	var appendSwitch : haxe.Constraints.Function; /**
		Append an argument to Chromium's command line. The argument will be quoted correctly. Note: This will not affect process.argv.
	**/
	var appendArgument : haxe.Constraints.Function; };
	static var dock : { /**
		When critical is passed, the dock icon will bounce until either the application becomes active or the request is canceled. When informational is passed, the dock icon will bounce for one second. However, the request remains active until either the application becomes active or the request is canceled.
	**/
	@:electron_platforms(["macOS"])
	var bounce : haxe.Constraints.Function; /**
		Cancel the bounce of id.
	**/
	@:electron_platforms(["macOS"])
	var cancelBounce : haxe.Constraints.Function; /**
		Bounces the Downloads stack if the filePath is inside the Downloads folder.
	**/
	@:electron_platforms(["macOS"])
	var downloadFinished : haxe.Constraints.Function; /**
		Sets the string to be displayed in the dock’s badging area.
	**/
	@:electron_platforms(["macOS"])
	var setBadge : haxe.Constraints.Function; @:electron_platforms(["macOS"])
	var getBadge : haxe.Constraints.Function; /**
		Hides the dock icon.
	**/
	@:electron_platforms(["macOS"])
	var hide : haxe.Constraints.Function; /**
		Shows the dock icon.
	**/
	@:electron_platforms(["macOS"])
	var show : haxe.Constraints.Function; @:electron_platforms(["macOS"])
	var isVisible : haxe.Constraints.Function; /**
		Sets the application's dock menu.
	**/
	@:electron_platforms(["macOS"])
	var setMenu : haxe.Constraints.Function; /**
		Sets the image associated with this dock icon.
	**/
	@:electron_platforms(["macOS"])
	var setIcon : haxe.Constraints.Function; };
	/**
		Try to close all windows. The before-quit event will be emitted first. If all windows are successfully closed, the will-quit event will be emitted and by default the application will terminate. This method guarantees that all beforeunload and unload event handlers are correctly executed. It is possible that a window cancels the quitting by returning false in the beforeunload event handler.
	**/
	static function quit():Void;
	/**
		Exits immediately with exitCode. exitCode defaults to 0. All windows will be closed immediately without asking user and the before-quit and will-quit events will not be emitted.
	**/
	static function exit(?exitCode:Int):Void;
	/**
		Relaunches the app when current instance exits. By default the new instance will use the same working directory and command line arguments with current instance. When args is specified, the args will be passed as command line arguments instead. When execPath is specified, the execPath will be executed for relaunch instead of current app. Note that this method does not quit the app when executed, you have to call app.quit or app.exit after calling app.relaunch to make the app restart. When app.relaunch is called for multiple times, multiple instances will be started after current instance exited. An example of restarting current instance immediately and adding a new command line argument to the new instance:
	**/
	static function relaunch(?options:{ @:optional
	var args : Array<String>; @:optional
	var execPath : String; }):Void;
	static function isReady():Bool;
	static function whenReady():js.Promise<Any>;
	/**
		On Linux, focuses on the first visible window. On macOS, makes the application the active app. On Windows, focuses on the application's first window.
	**/
	static function focus():Void;
	/**
		Hides all application windows without minimizing them.
	**/
	@:electron_platforms(["macOS"])
	static function hide():Void;
	/**
		Shows application windows after they were hidden. Does not automatically focus them.
	**/
	@:electron_platforms(["macOS"])
	static function show():Void;
	static function getAppPath():String;
	/**
		You can request the following paths by the name:
	**/
	static function getPath(name:String):String;
	/**
		Fetches a path's associated icon. On Windows, there a 2 kinds of icons: On Linux and macOS, icons depend on the application associated with file mime type.
	**/
	static function getFileIcon(path:String, ?options:{ var size : String; }, callback:haxe.Constraints.Function):Void;
	/**
		Overrides the path to a special directory or file associated with name. If the path specifies a directory that does not exist, the directory will be created by this method. On failure an Error is thrown. You can only override paths of a name defined in app.getPath. By default, web pages' cookies and caches will be stored under the userData directory. If you want to change this location, you have to override the userData path before the ready event of the app module is emitted.
	**/
	static function setPath(name:String, path:String):Void;
	static function getVersion():String;
	/**
		Usually the name field of package.json is a short lowercased name, according to the npm modules spec. You should usually also specify a productName field, which is your application's full capitalized name, and which will be preferred over name by Electron.
	**/
	static function getName():String;
	/**
		Overrides the current application's name.
	**/
	static function setName(name:String):Void;
	/**
		To set the locale, you'll want to use a command line switch at app startup, which may be found here. Note: When distributing your packaged app, you have to also ship the locales folder. Note: On Windows you have to call it after the ready events gets emitted.
	**/
	static function getLocale():String;
	/**
		Adds path to the recent documents list. This list is managed by the OS. On Windows you can visit the list from the task bar, and on macOS you can visit it from dock menu.
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function addRecentDocument(path:String):Void;
	/**
		Clears the recent documents list.
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function clearRecentDocuments():Void;
	/**
		This method sets the current executable as the default handler for a protocol (aka URI scheme). It allows you to integrate your app deeper into the operating system. Once registered, all links with your-protocol:// will be opened with the current executable. The whole link, including protocol, will be passed to your application as a parameter. On Windows you can provide optional parameters path, the path to your executable, and args, an array of arguments to be passed to your executable when it launches. Note: On macOS, you can only register protocols that have been added to your app's info.plist, which can not be modified at runtime. You can however change the file with a simple text editor or script during build time. Please refer to Apple's documentation for details. The API uses the Windows Registry and LSSetDefaultHandlerForURLScheme internally.
	**/
	static function setAsDefaultProtocolClient(protocol:String, ?path:String, ?args:Array<String>):Bool;
	/**
		This method checks if the current executable as the default handler for a protocol (aka URI scheme). If so, it will remove the app as the default handler.
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function removeAsDefaultProtocolClient(protocol:String, ?path:String, ?args:Array<String>):Bool;
	/**
		This method checks if the current executable is the default handler for a protocol (aka URI scheme). If so, it will return true. Otherwise, it will return false. Note: On macOS, you can use this method to check if the app has been registered as the default protocol handler for a protocol. You can also verify this by checking ~/Library/Preferences/com.apple.LaunchServices.plist on the macOS machine. Please refer to Apple's documentation for details. The API uses the Windows Registry and LSCopyDefaultHandlerForURLScheme internally.
	**/
	static function isDefaultProtocolClient(protocol:String, ?path:String, ?args:Array<String>):Bool;
	/**
		Adds tasks to the Tasks category of the JumpList on Windows. tasks is an array of Task objects. Note: If you'd like to customize the Jump List even more use app.setJumpList(categories) instead.
	**/
	@:electron_platforms(["Windows"])
	static function setUserTasks(tasks:Array<electron.Task>):Bool;
	@:electron_platforms(["Windows"])
	static function getJumpListSettings():Any;
	/**
		Sets or removes a custom Jump List for the application, and returns one of the following strings: If categories is null the previously set custom Jump List (if any) will be replaced by the standard Jump List for the app (managed by Windows). Note: If a JumpListCategory object has neither the type nor the name property set then its type is assumed to be tasks. If the name property is set but the type property is omitted then the type is assumed to be custom. Note: Users can remove items from custom categories, and Windows will not allow a removed item to be added back into a custom category until after the next successful call to app.setJumpList(categories). Any attempt to re-add a removed item to a custom category earlier than that will result in the entire custom category being omitted from the Jump List. The list of removed items can be obtained using app.getJumpListSettings(). Here's a very simple example of creating a custom Jump List:
	**/
	@:electron_platforms(["Windows"])
	static function setJumpList(categories:Array<electron.JumpListCategory>):Void;
	/**
		This method makes your application a Single Instance Application - instead of allowing multiple instances of your app to run, this will ensure that only a single instance of your app is running, and other instances signal this instance and exit. The return value of this method indicates whether or not this instance of your application successfully obtained the lock.  If it failed to obtain the lock you can assume that another instance of your application is already running with the lock and exit immediately. I.e. This method returns true if your process is the primary instance of your application and your app should continue loading.  It returns false if your process should immediately quit as it has sent its parameters to another instance that has already acquired the lock. On macOS the system enforces single instance automatically when users try to open a second instance of your app in Finder, and the open-file and open-url events will be emitted for that. However when users start your app in command line the system's single instance mechanism will be bypassed and you have to use this method to ensure single instance. An example of activating the window of primary instance when a second instance starts:
	**/
	static function requestSingleInstanceLock():Bool;
	/**
		This method returns whether or not this instance of your app is currently holding the single instance lock.  You can request the lock with app.requestSingleInstanceLock() and release with app.releaseSingleInstanceLock()
	**/
	static function hasSingleInstanceLock():Bool;
	/**
		Releases all locks that were created by requestSingleInstanceLock. This will allow multiple instances of the application to once again run side by side.
	**/
	static function releaseSingleInstanceLock():Void;
	/**
		Creates an NSUserActivity and sets it as the current activity. The activity is eligible for Handoff to another device afterward.
	**/
	@:electron_platforms(["macOS"])
	static function setUserActivity(type:String, userInfo:Any, ?webpageURL:String):Void;
	@:electron_platforms(["macOS"])
	static function getCurrentActivityType():String;
	/**
		Invalidates the current Handoff user activity.
	**/
	@:electron_platforms(["macOS"])
	static function invalidateCurrentActivity(type:String):Void;
	/**
		Updates the current activity if its type matches type, merging the entries from userInfo into its current userInfo dictionary.
	**/
	@:electron_platforms(["macOS"])
	static function updateCurrentActivity(type:String, userInfo:Any):Void;
	/**
		Changes the Application User Model ID to id.
	**/
	@:electron_platforms(["Windows"])
	static function setAppUserModelId(id:String):Void;
	/**
		Imports the certificate in pkcs12 format into the platform certificate store. callback is called with the result of import operation, a value of 0 indicates success while any other value indicates failure according to Chromium net_error_list.
	**/
	@:electron_platforms(["LINUX"])
	static function importCertificate(options:{ /**
		Path for the pkcs12 file.
	**/
	var certificate : String; /**
		Passphrase for the certificate.
	**/
	var password : String; }, callback:haxe.Constraints.Function):Void;
	/**
		Disables hardware acceleration for current app. This method can only be called before app is ready.
	**/
	static function disableHardwareAcceleration():Void;
	/**
		By default, Chromium disables 3D APIs (e.g. WebGL) until restart on a per domain basis if the GPU processes crashes too frequently. This function disables that behaviour. This method can only be called before app is ready.
	**/
	static function disableDomainBlockingFor3DAPIs():Void;
	static function getAppMetrics():Array<electron.ProcessMetric>;
	static function getGPUFeatureStatus():electron.GPUFeatureStatus;
	/**
		For infoType equal to complete: Promise is fulfilled with Object containing all the GPU Information as in chromium's GPUInfo object. This includes the version and driver information that's shown on chrome://gpu page. For infoType equal to basic: Promise is fulfilled with Object containing fewer attributes than when requested with complete. Here's an example of basic response: Using basic should be preferred if only basic information like vendorId or driverId is needed.
	**/
	static function getGPUInfo(infoType:String):js.Promise<Any>;
	/**
		Sets the counter badge for current app. Setting the count to 0 will hide the badge. On macOS it shows on the dock icon. On Linux it only works for Unity launcher, Note: Unity launcher requires the existence of a .desktop file to work, for more information please read Desktop Environment Integration.
	**/
	@:electron_platforms(["Linux", "macOS"])
	static function setBadgeCount(count:Int):Bool;
	@:electron_platforms(["Linux", "macOS"])
	static function getBadgeCount():Int;
	@:electron_platforms(["Linux"])
	static function isUnityRunning():Bool;
	/**
		If you provided path and args options to app.setLoginItemSettings then you need to pass the same arguments here for openAtLogin to be set correctly.
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function getLoginItemSettings(?options:{ /**
		The executable path to compare against. Defaults to process.execPath.
	**/
	@:optional
	var path : String; /**
		The command-line arguments to compare against. Defaults to an empty array.
	**/
	@:optional
	var args : Array<String>; }):Any;
	/**
		Set the app's login item settings. To work with Electron's autoUpdater on Windows, which uses Squirrel, you'll want to set the launch path to Update.exe, and pass arguments that specify your application name. For example:
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function setLoginItemSettings(settings:{ /**
		true to open the app at login, false to remove the app as a login item. Defaults to false.
	**/
	@:optional
	var openAtLogin : Bool; /**
		true to open the app as hidden. Defaults to false. The user can edit this setting from the System Preferences so app.getLoginItemSettings().wasOpenedAsHidden should be checked when the app is opened to know the current value. This setting is not available on .
	**/
	@:optional
	var openAsHidden : Bool; /**
		The executable to launch at login. Defaults to process.execPath.
	**/
	@:optional
	var path : String; /**
		The command-line arguments to pass to the executable. Defaults to an empty array. Take care to wrap paths in quotes.
	**/
	@:optional
	var args : Array<String>; }):Void;
	@:electron_platforms(["macOS", "Windows"])
	static function isAccessibilitySupportEnabled():Bool;
	/**
		Manually enables Chrome's accessibility support, allowing to expose accessibility switch to users in application settings. See Chromium's accessibility docs for more details. Disabled by default. This API must be called after the ready event is emitted. Note: Rendering accessibility tree can significantly affect the performance of your app. It should not be enabled by default.
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function setAccessibilitySupportEnabled(enabled:Bool):Void;
	/**
		Show the about panel with the values defined in the app's .plist file or with the options set via app.setAboutPanelOptions(options).
	**/
	@:electron_platforms(["macOS"])
	static function showAboutPanel():Void;
	/**
		Set the about panel options. This will override the values defined in the app's .plist file. See the Apple docs for more details.
	**/
	@:electron_platforms(["macOS"])
	static function setAboutPanelOptions(options:{ /**
		The app's name.
	**/
	@:optional
	var applicationName : String; /**
		The app's version.
	**/
	@:optional
	var applicationVersion : String; /**
		Copyright information.
	**/
	@:optional
	var copyright : String; /**
		Credit information.
	**/
	@:optional
	var credits : String; /**
		The app's build version number.
	**/
	@:optional
	var version : String; }):Void;
	/**
		Start accessing a security scoped resource. With this method Electron applications that are packaged for the Mac App Store may reach outside their sandbox to access files chosen by the user. See Apple's documentation for a description of how this system works.
	**/
	@:electron_platforms(["macOS", "mas"])
	static function startAccessingSecurityScopedResource(bookmarkData:String):haxe.Constraints.Function;
	/**
		Enables full sandbox mode on the app. This method can only be called before app is ready.
	**/
	@:electron_platforms(["Experimental", "macOS", "Windows"])
	static function enableSandbox():Void;
	/**
		Enables mixed sandbox mode on the app. This method can only be called before app is ready.
	**/
	@:electron_platforms(["Experimental", "macOS", "Windows"])
	static function enableMixedSandbox():Void;
	@:electron_platforms(["macOS"])
	static function isInApplicationsFolder():Bool;
	/**
		No confirmation dialog will be presented by default, if you wish to allow the user to confirm the operation you may do so using the dialog API. NOTE: This method throws errors if anything other than the user causes the move to fail. For instance if the user cancels the authorization dialog this method returns false. If we fail to perform the copy then this method will throw an error. The message in the error should be informative and tell you exactly what went wrong
	**/
	@:electron_platforms(["macOS"])
	static function moveToApplicationsFolder():Bool;
	static function on(eventType:Dynamic, callback:Dynamic -> Void):Void;
}
@:enum abstract AppEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the application has finished basic startup. On Windows and Linux, the will-finish-launching event is the same as the ready event; on macOS, this event represents the applicationWillFinishLaunching notification of NSApplication. You would usually set up listeners for the open-file and open-url events here, and start the crash reporter and auto updater. In most cases, you should do everything in the ready event handler.
	**/
	var will_finish_launching : electron.main.AppEvent<Void -> Void> = "will-finish-launching";
	/**
		Emitted when Electron has finished initializing. On macOS, launchInfo holds the userInfo of the NSUserNotification that was used to open the application, if it was launched from Notification Center. You can call app.isReady() to check if this event has already fired.
	**/
	var ready : electron.main.AppEvent<Any -> Void> = "ready";
	/**
		Emitted when all windows have been closed. If you do not subscribe to this event and all windows are closed, the default behavior is to quit the app; however, if you subscribe, you control whether the app quits or not. If the user pressed Cmd + Q, or the developer called app.quit(), Electron will first try to close all the windows and then emit the will-quit event, and in this case the window-all-closed event would not be emitted.
	**/
	var window_all_closed : electron.main.AppEvent<Void -> Void> = "window-all-closed";
	/**
		Emitted before the application starts closing its windows. Calling event.preventDefault() will prevent the default behaviour, which is terminating the application. Note: If application quit was initiated by autoUpdater.quitAndInstall() then before-quit is emitted after emitting close event on all windows and closing them. Note: On Windows, this event will not be emitted if the app is closed due to a shutdown/restart of the system or a user logout.
	**/
	var before_quit : electron.main.AppEvent<js.html.Event -> Void> = "before-quit";
	/**
		Emitted when all windows have been closed and the application will quit. Calling event.preventDefault() will prevent the default behaviour, which is terminating the application. See the description of the window-all-closed event for the differences between the will-quit and window-all-closed events. Note: On Windows, this event will not be emitted if the app is closed due to a shutdown/restart of the system or a user logout.
	**/
	var will_quit : electron.main.AppEvent<js.html.Event -> Void> = "will-quit";
	/**
		Emitted when the application is quitting. Note: On Windows, this event will not be emitted if the app is closed due to a shutdown/restart of the system or a user logout.
	**/
	var quit : electron.main.AppEvent<(js.html.Event, Int) -> Void> = "quit";
	/**
		Emitted when the user wants to open a file with the application. The open-file event is usually emitted when the application is already open and the OS wants to reuse the application to open the file. open-file is also emitted when a file is dropped onto the dock and the application is not yet running. Make sure to listen for the open-file event very early in your application startup to handle this case (even before the ready event is emitted). You should call event.preventDefault() if you want to handle this event. On Windows, you have to parse process.argv (in the main process) to get the filepath.
	**/
	@:electron_platforms(["macOS"])
	var open_file : electron.main.AppEvent<(js.html.Event, String) -> Void> = "open-file";
	/**
		Emitted when the user wants to open a URL with the application. Your application's Info.plist file must define the url scheme within the CFBundleURLTypes key, and set NSPrincipalClass to AtomApplication. You should call event.preventDefault() if you want to handle this event.
	**/
	@:electron_platforms(["macOS"])
	var open_url : electron.main.AppEvent<(js.html.Event, String) -> Void> = "open-url";
	/**
		Emitted when the application is activated. Various actions can trigger this event, such as launching the application for the first time, attempting to re-launch the application when it's already running, or clicking on the application's dock or taskbar icon.
	**/
	@:electron_platforms(["macOS"])
	var activate : electron.main.AppEvent<(js.html.Event, Bool) -> Void> = "activate";
	/**
		Emitted during Handoff when an activity from a different device wants to be resumed. You should call event.preventDefault() if you want to handle this event. A user activity can be continued only in an app that has the same developer Team ID as the activity's source app and that supports the activity's type. Supported activity types are specified in the app's Info.plist under the NSUserActivityTypes key.
	**/
	@:electron_platforms(["macOS"])
	var continue_activity : electron.main.AppEvent<(js.html.Event, String, Any) -> Void> = "continue-activity";
	/**
		Emitted during Handoff before an activity from a different device wants to be resumed. You should call event.preventDefault() if you want to handle this event.
	**/
	@:electron_platforms(["macOS"])
	var will_continue_activity : electron.main.AppEvent<(js.html.Event, String) -> Void> = "will-continue-activity";
	/**
		Emitted during Handoff when an activity from a different device fails to be resumed.
	**/
	@:electron_platforms(["macOS"])
	var continue_activity_error : electron.main.AppEvent<(js.html.Event, String, String) -> Void> = "continue-activity-error";
	/**
		Emitted during Handoff after an activity from this device was successfully resumed on another one.
	**/
	@:electron_platforms(["macOS"])
	var activity_was_continued : electron.main.AppEvent<(js.html.Event, String, Any) -> Void> = "activity-was-continued";
	/**
		Emitted when Handoff is about to be resumed on another device. If you need to update the state to be transferred, you should call event.preventDefault() immediately, construct a new userInfo dictionary and call app.updateCurrentActiviy() in a timely manner. Otherwise the operation will fail and continue-activity-error will be called.
	**/
	@:electron_platforms(["macOS"])
	var update_activity_state : electron.main.AppEvent<(js.html.Event, String, Any) -> Void> = "update-activity-state";
	/**
		Emitted when the user clicks the native macOS new tab button. The new tab button is only visible if the current BrowserWindow has a tabbingIdentifier
	**/
	@:electron_platforms(["macOS"])
	var new_window_for_tab : electron.main.AppEvent<js.html.Event -> Void> = "new-window-for-tab";
	/**
		Emitted when a browserWindow gets blurred.
	**/
	var browser_window_blur : electron.main.AppEvent<(js.html.Event, electron.main.BrowserWindow) -> Void> = "browser-window-blur";
	/**
		Emitted when a browserWindow gets focused.
	**/
	var browser_window_focus : electron.main.AppEvent<(js.html.Event, electron.main.BrowserWindow) -> Void> = "browser-window-focus";
	/**
		Emitted when a new browserWindow is created.
	**/
	var browser_window_created : electron.main.AppEvent<(js.html.Event, electron.main.BrowserWindow) -> Void> = "browser-window-created";
	/**
		Emitted when a new webContents is created.
	**/
	var web_contents_created : electron.main.AppEvent<(js.html.Event, electron.main.WebContents) -> Void> = "web-contents-created";
	/**
		Emitted when failed to verify the certificate for url, to trust the certificate you should prevent the default behavior with event.preventDefault() and call callback(true).
	**/
	var certificate_error : electron.main.AppEvent<(js.html.Event, electron.main.WebContents, String, String, electron.Certificate, haxe.Constraints.Function) -> Void> = "certificate-error";
	/**
		Emitted when a client certificate is requested. The url corresponds to the navigation entry requesting the client certificate and callback can be called with an entry filtered from the list. Using event.preventDefault() prevents the application from using the first certificate from the store.
	**/
	var select_client_certificate : electron.main.AppEvent<(js.html.Event, electron.main.WebContents, String, Array<electron.Certificate>, haxe.Constraints.Function) -> Void> = "select-client-certificate";
	/**
		Emitted when webContents wants to do basic auth. The default behavior is to cancel all authentications, to override this you should prevent the default behavior with event.preventDefault() and call callback(username, password) with the credentials.
	**/
	var login : electron.main.AppEvent<(js.html.Event, electron.main.WebContents, Any, Any, haxe.Constraints.Function) -> Void> = "login";
	/**
		Emitted when the gpu process crashes or is killed.
	**/
	var gpu_process_crashed : electron.main.AppEvent<(js.html.Event, Bool) -> Void> = "gpu-process-crashed";
	/**
		Emitted when Chrome's accessibility support changes. This event fires when assistive technologies, such as screen readers, are enabled or disabled. See https://www.chromium.org/developers/design-documents/accessibility for more details.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var accessibility_support_changed : electron.main.AppEvent<(js.html.Event, Bool) -> Void> = "accessibility-support-changed";
	/**
		Emitted when Electron has created a new session.
	**/
	var session_created : electron.main.AppEvent<electron.main.Session -> Void> = "session-created";
	/**
		This event will be emitted inside the primary instance of your application when a second instance has been executed. argv is an Array of the second instance's command line arguments, and workingDirectory is its current working directory. Usually applications respond to this by making their primary window focused and non-minimized. This event is guaranteed to be emitted after the ready event of app gets emitted.
	**/
	var second_instance : electron.main.AppEvent<(js.html.Event, Array<String>, String) -> Void> = "second-instance";
	/**
		Emitted when remote.require() is called in the renderer process of webContents. Calling event.preventDefault() will prevent the module from being returned. Custom value can be returned by setting event.returnValue.
	**/
	var remote_require : electron.main.AppEvent<(js.html.Event, electron.main.WebContents, String) -> Void> = "remote-require";
	/**
		Emitted when remote.getGlobal() is called in the renderer process of webContents. Calling event.preventDefault() will prevent the global from being returned. Custom value can be returned by setting event.returnValue.
	**/
	var remote_get_global : electron.main.AppEvent<(js.html.Event, electron.main.WebContents, String) -> Void> = "remote-get-global";
	/**
		Emitted when remote.getBuiltin() is called in the renderer process of webContents. Calling event.preventDefault() will prevent the module from being returned. Custom value can be returned by setting event.returnValue.
	**/
	var remote_get_builtin : electron.main.AppEvent<(js.html.Event, electron.main.WebContents, String) -> Void> = "remote-get-builtin";
	/**
		Emitted when remote.getCurrentWindow() is called in the renderer process of webContents. Calling event.preventDefault() will prevent the object from being returned. Custom value can be returned by setting event.returnValue.
	**/
	var remote_get_current_window : electron.main.AppEvent<(js.html.Event, electron.main.WebContents) -> Void> = "remote-get-current-window";
	/**
		Emitted when remote.getCurrentWebContents() is called in the renderer process of webContents. Calling event.preventDefault() will prevent the object from being returned. Custom value can be returned by setting event.returnValue.
	**/
	var remote_get_current_web_contents : electron.main.AppEvent<(js.html.Event, electron.main.WebContents) -> Void> = "remote-get-current-web-contents";
	/**
		Emitted when <webview>.getWebContents() is called in the renderer process of webContents. Calling event.preventDefault() will prevent the object from being returned. Custom value can be returned by setting event.returnValue.
	**/
	var remote_get_guest_web_contents : electron.main.AppEvent<(js.html.Event, electron.main.WebContents, electron.main.WebContents) -> Void> = "remote-get-guest-web-contents";
}
