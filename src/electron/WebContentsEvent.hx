package electron;
@:enum @:require("electron") abstract WebContentsEvent(String) from String to String {
	/**
		Emitted when the navigation is done, i.e. the spinner of the tab has stopped spinning, and the onload event was dispatched.
	**/
	var did_finish_load : String = "did-finish-load";
	/**
		This event is like did-finish-load but emitted when the load failed or was cancelled, e.g. window.stop() is invoked. The full list of error codes and their meaning is available here. Note that redirect responses will emit errorCode -3; you may want to ignore that error explicitly.
	**/
	var did_fail_load : String = "did-fail-load";
	/**
		Emitted when a frame has done navigation.
	**/
	var did_frame_finish_load : String = "did-frame-finish-load";
	/**
		Corresponds to the points in time when the spinner of the tab started spinning.
	**/
	var did_start_loading : String = "did-start-loading";
	/**
		Corresponds to the points in time when the spinner of the tab stopped spinning.
	**/
	var did_stop_loading : String = "did-stop-loading";
	/**
		Emitted when details regarding a requested resource are available. status indicates the socket connection to download the resource.
	**/
	var did_get_response_details : String = "did-get-response-details";
	/**
		Emitted when a redirect is received while requesting a resource.
	**/
	var did_get_redirect_request : String = "did-get-redirect-request";
	/**
		Emitted when the document in the given frame is loaded.
	**/
	var dom_ready : String = "dom-ready";
	/**
		Emitted when page receives favicon urls.
	**/
	var page_favicon_updated : String = "page-favicon-updated";
	/**
		Emitted when the page requests to open a new window for a url. It could be requested by window.open or an external link like <a target='_blank'>. By default a new BrowserWindow will be created for the url. Calling event.preventDefault() will prevent creating new windows. In such case, the event.newGuest may be set with a reference to a BrowserWindow instance to make it used by the Electron's runtime.
	**/
	var new_window : String = "new-window";
	/**
		Emitted when a user or the page wants to start navigation. It can happen when the window.location object is changed or a user clicks a link in the page. This event will not emit when the navigation is started programmatically with APIs like webContents.loadURL and webContents.back. It is also not emitted for in-page navigations, such as clicking anchor links or updating the window.location.hash. Use did-navigate-in-page event for this purpose. Calling event.preventDefault() will prevent the navigation.
	**/
	var will_navigate : String = "will-navigate";
	/**
		Emitted when a navigation is done. This event is not emitted for in-page navigations, such as clicking anchor links or updating the window.location.hash. Use did-navigate-in-page event for this purpose.
	**/
	var did_navigate : String = "did-navigate";
	/**
		Emitted when an in-page navigation happened. When in-page navigation happens, the page URL changes but does not cause navigation outside of the page. Examples of this occurring are when anchor links are clicked or when the DOM hashchange event is triggered.
	**/
	var did_navigate_in_page : String = "did-navigate-in-page";
	/**
		Emitted when the renderer process crashes or is killed.
	**/
	var crashed : String = "crashed";
	/**
		Emitted when a plugin process has crashed.
	**/
	var plugin_crashed : String = "plugin-crashed";
	/**
		Emitted when webContents is destroyed.
	**/
	var destroyed : String = "destroyed";
	/**
		Emitted when DevTools is opened.
	**/
	var devtools_opened : String = "devtools-opened";
	/**
		Emitted when DevTools is closed.
	**/
	var devtools_closed : String = "devtools-closed";
	/**
		Emitted when DevTools is focused / opened.
	**/
	var devtools_focused : String = "devtools-focused";
	/**
		Emitted when failed to verify the certificate for url. The usage is the same with the certificate-error event of app.
	**/
	var certificate_error : String = "certificate-error";
	/**
		Emitted when a client certificate is requested. The usage is the same with the select-client-certificate event of app.
	**/
	var select_client_certificate : String = "select-client-certificate";
	/**
		Emitted when webContents wants to do basic auth. The usage is the same with the login event of app.
	**/
	var login : String = "login";
	/**
		Emitted when a result is available for webContents.findInPage request.
	**/
	var found_in_page : String = "found-in-page";
	/**
		Emitted when media starts playing.
	**/
	var media_started_playing : String = "media-started-playing";
	/**
		Emitted when media is paused or done playing.
	**/
	var media_paused : String = "media-paused";
	/**
		Emitted when a page's theme color changes. This is usually due to encountering a meta tag:
	**/
	var did_change_theme_color : String = "did-change-theme-color";
	/**
		Emitted when mouse moves over a link or the keyboard moves the focus to a link.
	**/
	var update_target_url : String = "update-target-url";
	/**
		Emitted when the cursor's type changes. The type parameter can be default, crosshair, pointer, text, wait, help, e-resize, n-resize, ne-resize, nw-resize, s-resize, se-resize, sw-resize, w-resize, ns-resize, ew-resize, nesw-resize, nwse-resize, col-resize, row-resize, m-panning, e-panning, n-panning, ne-panning, nw-panning, s-panning, se-panning, sw-panning, w-panning, move, vertical-text, cell, context-menu, alias, progress, nodrop, copy, none, not-allowed, zoom-in, zoom-out, grab, grabbing, custom. If the type parameter is custom, the image parameter will hold the custom cursor image in a NativeImage, and scale, size and hotspot will hold additional information about the custom cursor.
	**/
	var cursor_changed : String = "cursor-changed";
	/**
		The mediaFlags is an object with the following properties: The editFlags is an object with the following properties: Emitted when there is a new context menu that needs to be handled.
	**/
	var context_menu : String = "context-menu";
	/**
		Emitted when bluetooth device needs to be selected on call to navigator.bluetooth.requestDevice. To use navigator.bluetooth api webBluetooth should be enabled.  If event.preventDefault is not called, first available device will be selected. callback should be called with deviceId to be selected, passing empty string to callback will cancel the request.
	**/
	var select_bluetooth_device : String = "select-bluetooth-device";
	/**
		Emitted when a new frame is generated. Only the dirty area is passed in the buffer.
	**/
	var paint : String = "paint";
}