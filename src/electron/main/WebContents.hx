package electron.main;

/**
	Render and control the contents of a BrowserWindow instance.

	See: <http://electron.atom.io/docs/api/web-contents>
**/
@:require(js, electron) @:jsRequire("electron", "WebContents") extern class WebContents extends js.node.events.EventEmitter<electron.main.WebContents> {
	/**
		A Integer representing the unique ID of this WebContents.
	**/
	var id : Int;
	/**
		A Session used by this webContents.
	**/
	var session : Session;
	/**
		A WebContents instance that might own this WebContents.
	**/
	var hostWebContents : WebContents;
	/**
		A WebContents of DevTools for this WebContents. Note: Users should never store this object because it may become null when the DevTools has been closed.
	**/
	var devToolsWebContents : WebContents;
	/**
		A Debugger instance for this webContents.
	**/
	var debugger : Debugger;
	/**
		Loads the url in the window. The url must contain the protocol prefix, e.g. the http:// or file://. If the load should bypass http cache then use the pragma header to achieve it.
	**/
	function loadURL(url:String, ?options:{ /**
		A HTTP Referrer url.
	**/
	@:optional
	var httpReferrer : String; /**
		A user agent originating the request.
	**/
	@:optional
	var userAgent : String; /**
		Extra headers separated by "\n"
	**/
	@:optional
	var extraHeaders : String; @:optional
	var postData : Dynamic; /**
		Base url (with trailing path separator) for files to be loaded by the data url. This is needed only if the specified url is a data url and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):Void;
	/**
		Initiates a download of the resource at url without navigating. The will-download event of session will be triggered.
	**/
	function downloadURL(url:String):Void;
	function getURL():String;
	function getTitle():String;
	function isDestroyed():Bool;
	/**
		Focuses the web page.
	**/
	function focus():Void;
	function isFocused():Bool;
	function isLoading():Bool;
	function isLoadingMainFrame():Bool;
	function isWaitingForResponse():Bool;
	/**
		Stops any pending navigation.
	**/
	function stop():Void;
	/**
		Reloads the current web page.
	**/
	function reload():Void;
	/**
		Reloads current page and ignores cache.
	**/
	function reloadIgnoringCache():Void;
	function canGoBack():Bool;
	function canGoForward():Bool;
	function canGoToOffset(offset:Int):Bool;
	/**
		Clears the navigation history.
	**/
	function clearHistory():Void;
	/**
		Makes the browser go back a web page.
	**/
	function goBack():Void;
	/**
		Makes the browser go forward a web page.
	**/
	function goForward():Void;
	/**
		Navigates browser to the specified absolute web page index.
	**/
	function goToIndex(index:Int):Void;
	/**
		Navigates to the specified offset from the "current entry".
	**/
	function goToOffset(offset:Int):Void;
	function isCrashed():Bool;
	/**
		Overrides the user agent for this web page.
	**/
	function setUserAgent(userAgent:String):Void;
	function getUserAgent():String;
	/**
		Injects CSS into the current web page.
	**/
	function insertCSS(css:String):Void;
	/**
		Evaluates code in page. In the browser window some HTML APIs like requestFullScreen can only be invoked by a gesture from the user. Setting userGesture to true will remove this limitation. If the result of the executed code is a promise the callback result will be the resolved value of the promise.  We recommend that you use the returned Promise to handle code that results in a Promise.
	**/
	function executeJavaScript(code:String, ?userGesture:Bool, ?callback:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Ignore application menu shortcuts while this web contents is focused.
	**/
	@:electron_platform(["Experimental"])
	function setIgnoreMenuShortcuts(ignore:Bool):Void;
	/**
		Mute the audio on the current web page.
	**/
	function setAudioMuted(muted:Bool):Void;
	function isAudioMuted():Bool;
	/**
		Changes the zoom factor to the specified factor. Zoom factor is zoom percent divided by 100, so 300% = 3.0.
	**/
	function setZoomFactor(factor:Float):Void;
	/**
		Sends a request to get current zoom factor, the callback will be called with callback(zoomFactor).
	**/
	function getZoomFactor(callback:haxe.Constraints.Function):Void;
	/**
		Changes the zoom level to the specified level. The original size is 0 and each increment above or below represents zooming 20% larger or smaller to default limits of 300% and 50% of original size, respectively.
	**/
	function setZoomLevel(level:Float):Void;
	/**
		Sends a request to get current zoom level, the callback will be called with callback(zoomLevel).
	**/
	function getZoomLevel(callback:haxe.Constraints.Function):Void;
	/**
		Deprecated: Call setVisualZoomLevelLimits instead to set the visual zoom level limits. This method will be removed in Electron 2.0.
	**/
	function setZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
	/**
		Sets the maximum and minimum pinch-to-zoom level.
	**/
	function setVisualZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
	/**
		Sets the maximum and minimum layout-based (i.e. non-visual) zoom level.
	**/
	function setLayoutZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
	/**
		Executes the editing command undo in web page.
	**/
	function undo():Void;
	/**
		Executes the editing command redo in web page.
	**/
	function redo():Void;
	/**
		Executes the editing command cut in web page.
	**/
	function cut():Void;
	/**
		Executes the editing command copy in web page.
	**/
	function copy():Void;
	/**
		Copy the image at the given position to the clipboard.
	**/
	function copyImageAt(x:Int, y:Int):Void;
	/**
		Executes the editing command paste in web page.
	**/
	function paste():Void;
	/**
		Executes the editing command pasteAndMatchStyle in web page.
	**/
	function pasteAndMatchStyle():Void;
	/**
		Executes the editing command delete in web page.
	**/
	function delete():Void;
	/**
		Executes the editing command selectAll in web page.
	**/
	function selectAll():Void;
	/**
		Executes the editing command unselect in web page.
	**/
	function unselect():Void;
	/**
		Executes the editing command replace in web page.
	**/
	function replace(text:String):Void;
	/**
		Executes the editing command replaceMisspelling in web page.
	**/
	function replaceMisspelling(text:String):Void;
	/**
		Inserts text to the focused element.
	**/
	function insertText(text:String):Void;
	/**
		Starts a request to find all matches for the text in the web page and returns an Integer representing the request id used for the request. The result of the request can be obtained by subscribing to found-in-page event.
	**/
	function findInPage(text:String, ?options:{ /**
		Whether to search forward or backward, defaults to true.
	**/
	@:optional
	var forward : Bool; /**
		Whether the operation is first request or a follow up, defaults to false.
	**/
	@:optional
	var findNext : Bool; /**
		Whether search should be case-sensitive, defaults to false.
	**/
	@:optional
	var matchCase : Bool; /**
		Whether to look only at the start of words. defaults to false.
	**/
	@:optional
	var wordStart : Bool; /**
		When combined with wordStart, accepts a match in the middle of a word if the match begins with an uppercase letter followed by a lowercase or non-letter. Accepts several other intra-word matches, defaults to false.
	**/
	@:optional
	var medialCapitalAsWordStart : Bool; }):Void;
	/**
		Stops any findInPage request for the webContents with the provided action.
	**/
	function stopFindInPage(action:String):Void;
	/**
		Captures a snapshot of the page within rect. Upon completion callback will be called with callback(image). The image is an instance of NativeImage that stores data of the snapshot. Omitting rect will capture the whole visible page.
	**/
	function capturePage(?rect:Rectangle, callback:haxe.Constraints.Function):Void;
	/**
		Checks if any ServiceWorker is registered and returns a boolean as response to callback.
	**/
	function hasServiceWorker(callback:haxe.Constraints.Function):Void;
	/**
		Unregisters any ServiceWorker if present and returns a boolean as response to callback when the JS promise is fulfilled or false when the JS promise is rejected.
	**/
	function unregisterServiceWorker(callback:haxe.Constraints.Function):Void;
	/**
		Get the system printer list.
	**/
	function getPrinters():Array<PrinterInfo>;
	/**
		Prints window's web page. When silent is set to true, Electron will pick the system's default printer if deviceName is empty and the default settings for printing. Calling window.print() in web page is equivalent to calling webContents.print({silent: false, printBackground: false, deviceName: ''}). Use page-break-before: always; CSS style to force to print to a new page.
	**/
	function print(?options:{ /**
		Don't ask user for print settings. Default is false.
	**/
	@:optional
	var silent : Bool; /**
		Also prints the background color and image of the web page. Default is false.
	**/
	@:optional
	var printBackground : Bool; /**
		Set the printer device name to use. Default is ''.
	**/
	@:optional
	var deviceName : String; }):Void;
	/**
		Prints window's web page as PDF with Chromium's preview printing custom settings. The callback will be called with callback(error, data) on completion. The data is a Buffer that contains the generated PDF data. The landscape will be ignored if @page CSS at-rule is used in the web page. By default, an empty options will be regarded as: Use page-break-before: always; CSS style to force to print to a new page. An example of webContents.printToPDF:
	**/
	function printToPDF(options:{ /**
		Specifies the type of margins to use. Uses 0 for default margin, 1 for no margin, and 2 for minimum margin.
	**/
	@:optional
	var marginsType : Int; /**
		Specify page size of the generated PDF. Can be A3, A4, A5, Legal, Letter, Tabloid or an Object containing height and width in microns.
	**/
	@:optional
	var pageSize : String; /**
		Whether to print CSS backgrounds.
	**/
	@:optional
	var printBackground : Bool; /**
		Whether to print selection only.
	**/
	@:optional
	var printSelectionOnly : Bool; /**
		true for landscape, false for portrait.
	**/
	@:optional
	var landscape : Bool; }, callback:haxe.Constraints.Function):Void;
	/**
		Adds the specified path to DevTools workspace. Must be used after DevTools creation:
	**/
	function addWorkSpace(path:String):Void;
	/**
		Removes the specified path from DevTools workspace.
	**/
	function removeWorkSpace(path:String):Void;
	/**
		Opens the devtools.
	**/
	function openDevTools(?options:{ /**
		Opens the devtools with specified dock state, can be right, bottom, undocked, detach. Defaults to last used dock state. In undocked mode it's possible to dock back. In detach mode it's not.
	**/
	@:optional
	var mode : String; }):Void;
	/**
		Closes the devtools.
	**/
	function closeDevTools():Void;
	function isDevToolsOpened():Bool;
	function isDevToolsFocused():Bool;
	/**
		Toggles the developer tools.
	**/
	function toggleDevTools():Void;
	/**
		Starts inspecting element at position (x, y).
	**/
	function inspectElement(x:Int, y:Int):Void;
	/**
		Opens the developer tools for the service worker context.
	**/
	function inspectServiceWorker():Void;
	/**
		Send an asynchronous message to renderer process via channel, you can also send arbitrary arguments. Arguments will be serialized in JSON internally and hence no functions or prototype chain will be included. The renderer process can handle the message by listening to channel with the ipcRenderer module. An example of sending messages from the main process to the renderer process:
	**/
	function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Enable device emulation with the given parameters.
	**/
	function enableDeviceEmulation(parameters:{ /**
		Specify the screen type to emulate (default: desktop)
	**/
	@:optional
	var screenPosition : String; /**
		Set the emulated screen size (screenPosition == mobile)
	**/
	@:optional
	var screenSize : Size; /**
		Position the view on the screen (screenPosition == mobile) (default: {x: 0, y: 0})
	**/
	@:optional
	var viewPosition : Point; /**
		Set the device scale factor (if zero defaults to original device scale factor) (default: 0)
	**/
	@:optional
	var deviceScaleFactor : Int; /**
		Set the emulated view size (empty means no override)
	**/
	@:optional
	var viewSize : Size; /**
		Whether emulated view should be scaled down if necessary to fit into available space (default: false)
	**/
	@:optional
	var fitToView : Bool; /**
		Offset of the emulated view inside available space (not in fit to view mode) (default: {x: 0, y: 0})
	**/
	@:optional
	var offset : Point; /**
		Scale of emulated view inside available space (not in fit to view mode) (default: 1)
	**/
	@:optional
	var scale : Float; }):Void;
	/**
		Disable device emulation enabled by webContents.enableDeviceEmulation.
	**/
	function disableDeviceEmulation():Void;
	/**
		Sends an input event to the page. Note: The BrowserWindow containing the contents needs to be focused for sendInputEvent() to work. For keyboard events, the event object also have following properties: For mouse events, the event object also have following properties: For the mouseWheel event, the event object also have following properties:
	**/
	function sendInputEvent(event:{ /**
		() The type of the event, can be mouseDown, mouseUp, mouseEnter, mouseLeave, contextMenu, mouseWheel, mouseMove, keyDown, keyUp, char.
	**/
	@:optional
	var type : String; /**
		An array of modifiers of the event, can include shift, control, alt, meta, isKeypad, isAutoRepeat, leftButtonDown, middleButtonDown, rightButtonDown, capsLock, numLock, left, right.
	**/
	@:optional
	var modifiers : Array<String>; }):Void;
	/**
		Begin subscribing for presentation events and captured frames, the callback will be called with callback(frameBuffer, dirtyRect) when there is a presentation event. The frameBuffer is a Buffer that contains raw pixel data. On most machines, the pixel data is effectively stored in 32bit BGRA format, but the actual representation depends on the endianness of the processor (most modern processors are little-endian, on machines with big-endian processors the data is in 32bit ARGB format). The dirtyRect is an object with x, y, width, height properties that describes which part of the page was repainted. If onlyDirty is set to true, frameBuffer will only contain the repainted area. onlyDirty defaults to false.
	**/
	function beginFrameSubscription(?onlyDirty:Bool, callback:haxe.Constraints.Function):Void;
	/**
		End subscribing for frame presentation events.
	**/
	function endFrameSubscription():Void;
	/**
		Sets the item as dragging item for current drag-drop operation, file is the absolute path of the file to be dragged, and icon is the image showing under the cursor when dragging.
	**/
	function startDrag(item:{ /**
		or files Array The path(s) to the file(s) being dragged.
	**/
	@:optional
	var file : String; /**
		The image must be non-empty on macOS.
	**/
	@:optional
	var icon : NativeImage; }):Void;
	function savePage(fullPath:String, saveType:String, callback:haxe.Constraints.Function):Bool;
	/**
		Shows pop-up dictionary that searches the selected word on the page.
	**/
	@:electron_platform(["macOS"])
	function showDefinitionForSelection():Void;
	/**
		Set the size of the page. This is only supported for <webview> guest contents.
	**/
	function setSize(options:{ /**
		Normal size of the page. This can be used in combination with the attribute to manually resize the webview guest contents.
	**/
	@:optional
	var normal : { @:optional
	var width : Int; @:optional
	var height : Int; }; }):Void;
	function isOffscreen():Bool;
	/**
		If offscreen rendering is enabled and not painting, start painting.
	**/
	function startPainting():Void;
	/**
		If offscreen rendering is enabled and painting, stop painting.
	**/
	function stopPainting():Void;
	function isPainting():Bool;
	/**
		If offscreen rendering is enabled sets the frame rate to the specified number. Only values between 1 and 60 are accepted.
	**/
	function setFrameRate(fps:Int):Void;
	function getFrameRate():Int;
	/**
		Schedules a full repaint of the window this web contents is in. If offscreen rendering is enabled invalidates the frame and generates a new one through the 'paint' event.
	**/
	function invalidate():Void;
	function getWebRTCIPHandlingPolicy():String;
	/**
		Setting the WebRTC IP handling policy allows you to control which IPs are exposed via WebRTC.  See BrowserLeaks for more details.
	**/
	function setWebRTCIPHandlingPolicy(policy:String):Void;
	function getOSProcessId():Int;
	static function getAllWebContents():Array<WebContents>;
	static function getFocusedWebContents():WebContents;
	static function fromId(id:Int):WebContents;
}

/**
**/
@:require(js, electron) @:enum abstract WebContentsEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the navigation is done, i.e. the spinner of the tab has stopped spinning, and the onload event was dispatched.
	**/
	var did_finish_load : electron.main.WebContents.WebContentsEvent<Void -> Void> = "did-finish-load";
	/**
		This event is like did-finish-load but emitted when the load failed or was cancelled, e.g. window.stop() is invoked. The full list of error codes and their meaning is available here.
	**/
	var did_fail_load : electron.main.WebContents.WebContentsEvent<js.html.Event -> Int -> String -> String -> Bool -> Void> = "did-fail-load";
	/**
		Emitted when a frame has done navigation.
	**/
	var did_frame_finish_load : electron.main.WebContents.WebContentsEvent<js.html.Event -> Bool -> Void> = "did-frame-finish-load";
	/**
		Corresponds to the points in time when the spinner of the tab started spinning.
	**/
	var did_start_loading : electron.main.WebContents.WebContentsEvent<Void -> Void> = "did-start-loading";
	/**
		Corresponds to the points in time when the spinner of the tab stopped spinning.
	**/
	var did_stop_loading : electron.main.WebContents.WebContentsEvent<Void -> Void> = "did-stop-loading";
	/**
		Emitted when details regarding a requested resource are available. status indicates the socket connection to download the resource.
	**/
	var did_get_response_details : electron.main.WebContents.WebContentsEvent<js.html.Event -> Bool -> String -> String -> Int -> String -> String -> Dynamic -> String -> Void> = "did-get-response-details";
	/**
		Emitted when a redirect is received while requesting a resource.
	**/
	var did_get_redirect_request : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> String -> Bool -> Int -> String -> String -> Dynamic -> Void> = "did-get-redirect-request";
	/**
		Emitted when the document in the given frame is loaded.
	**/
	var dom_ready : electron.main.WebContents.WebContentsEvent<js.html.Event -> Void> = "dom-ready";
	/**
		Emitted when page receives favicon urls.
	**/
	var page_favicon_updated : electron.main.WebContents.WebContentsEvent<js.html.Event -> Array<String> -> Void> = "page-favicon-updated";
	/**
		Emitted when the page requests to open a new window for a url. It could be requested by window.open or an external link like <a target='_blank'>. By default a new BrowserWindow will be created for the url. Calling event.preventDefault() will prevent Electron from automatically creating a new BrowserWindow. If you call event.preventDefault() and manually create a new BrowserWindow then you must set event.newGuest to reference the new BrowserWindow instance, failing to do so may result in unexpected behavior. For example:
	**/
	var new_window : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> String -> String -> Dynamic -> Array<String> -> Void> = "new-window";
	/**
		Emitted when a user or the page wants to start navigation. It can happen when the window.location object is changed or a user clicks a link in the page. This event will not emit when the navigation is started programmatically with APIs like webContents.loadURL and webContents.back. It is also not emitted for in-page navigations, such as clicking anchor links or updating the window.location.hash. Use did-navigate-in-page event for this purpose. Calling event.preventDefault() will prevent the navigation.
	**/
	var will_navigate : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> Void> = "will-navigate";
	/**
		Emitted when a navigation is done. This event is not emitted for in-page navigations, such as clicking anchor links or updating the window.location.hash. Use did-navigate-in-page event for this purpose.
	**/
	var did_navigate : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> Void> = "did-navigate";
	/**
		Emitted when an in-page navigation happened. When in-page navigation happens, the page URL changes but does not cause navigation outside of the page. Examples of this occurring are when anchor links are clicked or when the DOM hashchange event is triggered.
	**/
	var did_navigate_in_page : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> Bool -> Void> = "did-navigate-in-page";
	/**
		Emitted when a beforeunload event handler is attempting to cancel a page unload. Calling event.preventDefault() will ignore the beforeunload event handler and allow the page to be unloaded.
	**/
	var will_prevent_unload : electron.main.WebContents.WebContentsEvent<js.html.Event -> Void> = "will-prevent-unload";
	/**
		Emitted when the renderer process crashes or is killed.
	**/
	var crashed : electron.main.WebContents.WebContentsEvent<js.html.Event -> Bool -> Void> = "crashed";
	/**
		Emitted when a plugin process has crashed.
	**/
	var plugin_crashed : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> String -> Void> = "plugin-crashed";
	/**
		Emitted when webContents is destroyed.
	**/
	var destroyed : electron.main.WebContents.WebContentsEvent<Void -> Void> = "destroyed";
	/**
		Emitted before dispatching the keydown and keyup events in the page. Calling event.preventDefault will prevent the page keydown/keyup events and the menu shortcuts. To only prevent the menu shortcuts, use setIgnoreMenuShortcuts:
	**/
	var before_input_event : electron.main.WebContents.WebContentsEvent<js.html.Event -> Dynamic -> Void> = "before-input-event";
	/**
		Emitted when DevTools is opened.
	**/
	var devtools_opened : electron.main.WebContents.WebContentsEvent<Void -> Void> = "devtools-opened";
	/**
		Emitted when DevTools is closed.
	**/
	var devtools_closed : electron.main.WebContents.WebContentsEvent<Void -> Void> = "devtools-closed";
	/**
		Emitted when DevTools is focused / opened.
	**/
	var devtools_focused : electron.main.WebContents.WebContentsEvent<Void -> Void> = "devtools-focused";
	/**
		Emitted when failed to verify the certificate for url. The usage is the same with the certificate-error event of app.
	**/
	var certificate_error : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> String -> Certificate -> haxe.Constraints.Function -> Void> = "certificate-error";
	/**
		Emitted when a client certificate is requested. The usage is the same with the select-client-certificate event of app.
	**/
	var select_client_certificate : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> Array<Certificate> -> haxe.Constraints.Function -> Void> = "select-client-certificate";
	/**
		Emitted when webContents wants to do basic auth. The usage is the same with the login event of app.
	**/
	var login : electron.main.WebContents.WebContentsEvent<js.html.Event -> Dynamic -> Dynamic -> haxe.Constraints.Function -> Void> = "login";
	/**
		Emitted when a result is available for [webContents.findInPage] request.
	**/
	var found_in_page : electron.main.WebContents.WebContentsEvent<js.html.Event -> Dynamic -> Void> = "found-in-page";
	/**
		Emitted when media starts playing.
	**/
	var media_started_playing : electron.main.WebContents.WebContentsEvent<Void -> Void> = "media-started-playing";
	/**
		Emitted when media is paused or done playing.
	**/
	var media_paused : electron.main.WebContents.WebContentsEvent<Void -> Void> = "media-paused";
	/**
		Emitted when a page's theme color changes. This is usually due to encountering a meta tag:
	**/
	var did_change_theme_color : electron.main.WebContents.WebContentsEvent<Void -> Void> = "did-change-theme-color";
	/**
		Emitted when mouse moves over a link or the keyboard moves the focus to a link.
	**/
	var update_target_url : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> Void> = "update-target-url";
	/**
		Emitted when the cursor's type changes. The type parameter can be default, crosshair, pointer, text, wait, help, e-resize, n-resize, ne-resize, nw-resize, s-resize, se-resize, sw-resize, w-resize, ns-resize, ew-resize, nesw-resize, nwse-resize, col-resize, row-resize, m-panning, e-panning, n-panning, ne-panning, nw-panning, s-panning, se-panning, sw-panning, w-panning, move, vertical-text, cell, context-menu, alias, progress, nodrop, copy, none, not-allowed, zoom-in, zoom-out, grab, grabbing, custom. If the type parameter is custom, the image parameter will hold the custom cursor image in a NativeImage, and scale, size and hotspot will hold additional information about the custom cursor.
	**/
	var cursor_changed : electron.main.WebContents.WebContentsEvent<js.html.Event -> String -> ?NativeImage -> ?Float -> ?Size -> ?Point -> Void> = "cursor-changed";
	/**
		Emitted when there is a new context menu that needs to be handled.
	**/
	var context_menu : electron.main.WebContents.WebContentsEvent<js.html.Event -> Dynamic -> Void> = "context-menu";
	/**
		Emitted when bluetooth device needs to be selected on call to navigator.bluetooth.requestDevice. To use navigator.bluetooth api webBluetooth should be enabled.  If event.preventDefault is not called, first available device will be selected. callback should be called with deviceId to be selected, passing empty string to callback will cancel the request.
	**/
	var select_bluetooth_device : electron.main.WebContents.WebContentsEvent<js.html.Event -> Array<BluetoothDevice> -> haxe.Constraints.Function -> Void> = "select-bluetooth-device";
	/**
		Emitted when a new frame is generated. Only the dirty area is passed in the buffer.
	**/
	var paint : electron.main.WebContents.WebContentsEvent<js.html.Event -> Rectangle -> NativeImage -> Void> = "paint";
	/**
		Emitted when the devtools window instructs the webContents to reload
	**/
	var devtools_reload_page : electron.main.WebContents.WebContentsEvent<Void -> Void> = "devtools-reload-page";
	/**
		Emitted when a <webview>'s web contents is being attached to this web contents. Calling event.preventDefault() will destroy the guest page. This event can be used to configure webPreferences for the webContents of a <webview> before it's loaded, and provides the ability to set settings that can't be set via <webview> attributes. Note: The specified preload script option will be appear as preloadURL (not preload) in the webPreferences object emitted with this event.
	**/
	var will_attach_webview : electron.main.WebContents.WebContentsEvent<js.html.Event -> Dynamic -> Dynamic -> Void> = "will-attach-webview";
}