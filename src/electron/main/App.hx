package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "app") extern class App {
	/**
		Try to close all windows. The before-quit event will be emitted first. If all windows are successfully closed, the will-quit event will be emitted and by default the application will terminate. This method guarantees that all beforeunload and unload event handlers are correctly executed. It is possible that a window cancels the quitting by returning false in the beforeunload event handler.
	**/
	static function quit():Void;
	/**
		Exits immediately with exitCode.  exitCode defaults to 0. All windows will be closed immediately without asking user and the before-quit and will-quit events will not be emitted.
	**/
	static function exit(?exitCode:Int):Void;
	/**
		Relaunches the app when current instance exits. By default the new instance will use the same working directory and command line arguments with current instance. When args is specified, the args will be passed as command line arguments instead. When execPath is specified, the execPath will be executed for relaunch instead of current app. Note that this method does not quit the app when executed, you have to call app.quit or app.exit after calling app.relaunch to make the app restart. When app.relaunch is called for multiple times, multiple instances will be started after current instance exited. An example of restarting current instance immediately and adding a new command line argument to the new instance:
	**/
	static function relaunch(?options:{ /**
		(optional)
	**/
	@:optional
	var args : String; @:optional
	var execPath : String; }):Void;
	static function isReady():Bool;
	/**
		On Linux, focuses on the first visible window. On macOS, makes the application the active app. On Windows, focuses on the application's first window.
	**/
	static function focus():Void;
	/**
		Hides all application windows without minimizing them.
	**/
	static function hide():Void;
	/**
		Shows application windows after they were hidden. Does not automatically focus them.
	**/
	static function show():Void;
	static function getAppPath():String;
	/**
		You can request the following paths by the name:
	**/
	static function getPath(name:String):String;
	/**
		Fetches a path's associated icon. On Windows, there a 2 kinds of icons: On Linux and macOS, icons depend on the application associated with file mime type.
	**/
	static function getFileIcon(path:String, ?options:{ @:optional
	var size : String; }, callback:haxe.Constraints.Function):Void;
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
		Note: When distributing your packaged app, you have to also ship the locales folder. Note: On Windows you have to call it after the ready events gets emitted.
	**/
	static function getLocale():String;
	/**
		Adds path to the recent documents list. This list is managed by the OS. On Windows you can visit the list from the task bar, and on macOS you can visit it from dock menu.
	**/
	static function addRecentDocument(path:String):Void;
	/**
		Clears the recent documents list.
	**/
	static function clearRecentDocuments():Void;
	/**
		This method sets the current executable as the default handler for a protocol (aka URI scheme). It allows you to integrate your app deeper into the operating system. Once registered, all links with your-protocol:// will be opened with the current executable. The whole link, including protocol, will be passed to your application as a parameter. On Windows you can provide optional parameters path, the path to your executable, and args, an array of arguments to be passed to your executable when it launches. Note: On macOS, you can only register protocols that have been added to your app's info.plist, which can not be modified at runtime. You can however change the file with a simple text editor or script during build time. Please refer to Apple's documentation for details. The API uses the Windows Registry and LSSetDefaultHandlerForURLScheme internally.
	**/
	static function setAsDefaultProtocolClient(protocol:String, ?path:String, ?args:String):Bool;
	/**
		This method checks if the current executable as the default handler for a protocol (aka URI scheme). If so, it will remove the app as the default handler.
	**/
	static function removeAsDefaultProtocolClient(protocol:String, ?path:String, ?args:String):Bool;
	/**
		This method checks if the current executable is the default handler for a protocol (aka URI scheme). If so, it will return true. Otherwise, it will return false. Note: On macOS, you can use this method to check if the app has been registered as the default protocol handler for a protocol. You can also verify this by checking ~/Library/Preferences/com.apple.LaunchServices.plist on the macOS machine. Please refer to Apple's documentation for details. The API uses the Windows Registry and LSCopyDefaultHandlerForURLScheme internally.
	**/
	static function isDefaultProtocolClient(protocol:String, ?path:String, ?args:String):Bool;
	/**
		Adds tasks to the Tasks category of the JumpList on Windows. tasks is an array of Task objects. Note: If you'd like to customize the Jump List even more use app.setJumpList(categories) instead.
	**/
	static function setUserTasks(tasks:Task):Bool;
	static function getJumpListSettings():{ /**
		The minimum number of items that will be shown in the Jump List (for a more detailed description of this value see the ).
	**/
	@:optional
	var minItems : Int; /**
		Array of objects that correspond to items that the user has explicitly removed from custom categories in the Jump List. These items must not be re-added to the Jump List in the call to , Windows will not display any custom category that contains any of the removed items.
	**/
	@:optional
	var removedItems : JumpListItem; };
	/**
		Sets or removes a custom Jump List for the application, and returns one of the following strings: If categories is null the previously set custom Jump List (if any) will be replaced by the standard Jump List for the app (managed by Windows). Note: If a JumpListCategory object has neither the type nor the name property set then its type is assumed to be tasks. If the name property is set but the type property is omitted then the type is assumed to be custom. Note: Users can remove items from custom categories, and Windows will not allow a removed item to be added back into a custom category until after the next successful call to app.setJumpList(categories). Any attempt to re-add a removed item to a custom category earlier than that will result in the entire custom category being omitted from the Jump List. The list of removed items can be obtained using app.getJumpListSettings(). Here's a very simple example of creating a custom Jump List:
	**/
	static function setJumpList(categories:JumpListCategory):Void;
	/**
		This method makes your application a Single Instance Application - instead of allowing multiple instances of your app to run, this will ensure that only a single instance of your app is running, and other instances signal this instance and exit. callback will be called with callback(argv, workingDirectory) when a second instance has been executed. argv is an Array of the second instance's command line arguments, and workingDirectory is its current working directory. Usually applications respond to this by making their primary window focused and non-minimized. The callback is guaranteed to be executed after the ready event of app gets emitted. This method returns false if your process is the primary instance of the application and your app should continue loading. And returns true if your process has sent its parameters to another instance, and you should immediately quit. On macOS the system enforces single instance automatically when users try to open a second instance of your app in Finder, and the open-file and open-url events will be emitted for that. However when users start your app in command line the system's single instance mechanism will be bypassed and you have to use this method to ensure single instance. An example of activating the window of primary instance when a second instance starts:
	**/
	static function makeSingleInstance(callback:haxe.Constraints.Function):Void;
	/**
		Releases all locks that were created by makeSingleInstance. This will allow multiple instances of the application to once again run side by side.
	**/
	static function releaseSingleInstance():Void;
	/**
		Creates an NSUserActivity and sets it as the current activity. The activity is eligible for Handoff to another device afterward.
	**/
	static function setUserActivity(type:String, userInfo:Dynamic, ?webpageURL:String):Void;
	static function getCurrentActivityType():String;
	/**
		Changes the Application User Model ID to id.
	**/
	static function setAppUserModelId(id:String):Void;
	/**
		Imports the certificate in pkcs12 format into the platform certificate store. callback is called with the result of import operation, a value of 0 indicates success while any other value indicates failure according to chromium net_error_list.
	**/
	static function importCertificate(options:{ /**
		Path for the pkcs12 file.
	**/
	@:optional
	var certificate : String; /**
		Passphrase for the certificate.
	**/
	@:optional
	var password : String; }, callback:haxe.Constraints.Function):Void;
	/**
		Disables hardware acceleration for current app. This method can only be called before app is ready.
	**/
	static function disableHardwareAcceleration():Void;
	/**
		Sets the counter badge for current app. Setting the count to 0 will hide the badge. On macOS it shows on the dock icon. On Linux it only works for Unity launcher, Note: Unity launcher requires the existence of a .desktop file to work, for more information please read Desktop Environment Integration.
	**/
	static function setBadgeCount(count:Int):Bool;
	static function getBadgeCount():Int;
	static function isUnityRunning():Bool;
	/**
		If you provided path and args options to app.setLoginItemSettings then you need to pass the same arguments here for openAtLogin to be set correctly. Note: This API has no effect on MAS builds.
	**/
	static function getLoginItemSettings(?options:{ /**
		The executable path to compare against. Defaults to .
	**/
	@:optional
	var path : String; /**
		The command-line arguments to compare against. Defaults to an empty array.
	**/
	@:optional
	var args : String; }):{ @:optional
	var options : { /**
		The executable path to compare against. Defaults to .
	**/
	@:optional
	var path : String; /**
		The command-line arguments to compare against. Defaults to an empty array.
	**/
	@:optional
	var args : String; }; /**
		if the app is set to open at login.
	**/
	@:optional
	var openAtLogin : Bool; /**
		if the app is set to open as hidden at login. This setting is only supported on macOS.
	**/
	@:optional
	var openAsHidden : Bool; /**
		if the app was opened at login automatically. This setting is only supported on macOS.
	**/
	@:optional
	var wasOpenedAtLogin : Bool; /**
		if the app was opened as a hidden login item. This indicates that the app should not open any windows at startup. This setting is only supported on macOS.
	**/
	@:optional
	var wasOpenedAsHidden : Bool; /**
		if the app was opened as a login item that should restore the state from the previous session. This indicates that the app should restore the windows that were open the last time the app was closed. This setting is only supported on macOS.
	**/
	@:optional
	var restoreState : Bool; };
	/**
		Set the app's login item settings. To work with Electron's autoUpdater on Windows, which uses Squirrel, you'll want to set the launch path to Update.exe, and pass arguments that specify your application name. For example: Note: This API has no effect on MAS builds.
	**/
	static function setLoginItemSettings(settings:{ /**
		to open the app at login, to remove the app as a login item. Defaults to .
	**/
	@:optional
	var openAtLogin : Bool; /**
		to open the app as hidden. Defaults to . The user can edit this setting from the System Preferences so should be checked when the app is opened to know the current value. This setting is only supported on macOS.
	**/
	@:optional
	var openAsHidden : Bool; }, ?path:String, ?args:String):Void;
	static function isAccessibilitySupportEnabled():Bool;
	/**
		Set the about panel options. This will override the values defined in the app's .plist file. See the Apple docs for more details.
	**/
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
	static function on(eventType:Dynamic, callback:Dynamic -> Void):Void;
}