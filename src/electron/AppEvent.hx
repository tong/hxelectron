package electron;
@:enum @:require("electron") abstract AppEvent(String) from String to String {
	/**
		Emitted when the application has finished basic startup. On Windows and Linux, the will-finish-launching event is the same as the ready event; on macOS, this event represents the applicationWillFinishLaunching notification of NSApplication. You would usually set up listeners for the open-file and open-url events here, and start the crash reporter and auto updater. In most cases, you should just do everything in the ready event handler.
	**/
	var will_finish_launching : String = "will-finish-launching";
	/**
		Emitted when Electron has finished initializing. On macOS, launchInfo holds the userInfo of the NSUserNotification that was used to open the application, if it was launched from Notification Center. You can call app.isReady() to check if this event has already fired.
	**/
	var ready : String = "ready";
	/**
		Emitted when all windows have been closed. If you do not subscribe to this event and all windows are closed, the default behavior is to quit the app; however, if you subscribe, you control whether the app quits or not. If the user pressed Cmd + Q, or the developer called app.quit(), Electron will first try to close all the windows and then emit the will-quit event, and in this case the window-all-closed event would not be emitted.
	**/
	var window_all_closed : String = "window-all-closed";
	/**
		Emitted before the application starts closing its windows. Calling event.preventDefault() will prevent the default behaviour, which is terminating the application.
	**/
	var before_quit : String = "before-quit";
	/**
		Emitted when all windows have been closed and the application will quit. Calling event.preventDefault() will prevent the default behaviour, which is terminating the application. See the description of the window-all-closed event for the differences between the will-quit and window-all-closed events.
	**/
	var will_quit : String = "will-quit";
	/**
		Emitted when the application is quitting.
	**/
	var quit : String = "quit";
	/**
		Emitted when the user wants to open a file with the application. The open-file event is usually emitted when the application is already open and the OS wants to reuse the application to open the file. open-file is also emitted when a file is dropped onto the dock and the application is not yet running. Make sure to listen for the open-file event very early in your application startup to handle this case (even before the ready event is emitted). You should call event.preventDefault() if you want to handle this event. On Windows, you have to parse process.argv (in the main process) to get the filepath.
	**/
	var open_file : String = "open-file";
	/**
		Emitted when the user wants to open a URL with the application. The URL scheme must be registered to be opened by your application. You should call event.preventDefault() if you want to handle this event.
	**/
	var open_url : String = "open-url";
	/**
		Emitted when the application is activated, which usually happens when the user clicks on the application's dock icon.
	**/
	var activate : String = "activate";
	/**
		Emitted during Handoff when an activity from a different device wants to be resumed. You should call event.preventDefault() if you want to handle this event. A user activity can be continued only in an app that has the same developer Team ID as the activity's source app and that supports the activity's type. Supported activity types are specified in the app's Info.plist under the NSUserActivityTypes key.
	**/
	var continue_activity : String = "continue-activity";
	/**
		Emitted when a browserWindow gets blurred.
	**/
	var browser_window_blur : String = "browser-window-blur";
	/**
		Emitted when a browserWindow gets focused.
	**/
	var browser_window_focus : String = "browser-window-focus";
	/**
		Emitted when a new browserWindow is created.
	**/
	var browser_window_created : String = "browser-window-created";
	/**
		Emitted when a new webContents is created.
	**/
	var web_contents_created : String = "web-contents-created";
	/**
		Emitted when failed to verify the certificate for url, to trust the certificate you should prevent the default behavior with event.preventDefault() and call callback(true).
	**/
	var certificate_error : String = "certificate-error";
	/**
		Emitted when a client certificate is requested. The url corresponds to the navigation entry requesting the client certificate and callback needs to be called with an entry filtered from the list. Using event.preventDefault() prevents the application from using the first certificate from the store.
	**/
	var select_client_certificate : String = "select-client-certificate";
	/**
		Emitted when webContents wants to do basic auth. The default behavior is to cancel all authentications, to override this you should prevent the default behavior with event.preventDefault() and call callback(username, password) with the credentials.
	**/
	var login : String = "login";
	/**
		Emitted when the gpu process crashes or is killed.
	**/
	var gpu_process_crashed : String = "gpu-process-crashed";
	/**
		Emitted when Chrome's accessibility support changes. This event fires when assistive technologies, such as screen readers, are enabled or disabled. See https://www.chromium.org/developers/design-documents/accessibility for more details.
	**/
	var accessibility_support_changed : String = "accessibility-support-changed";
}