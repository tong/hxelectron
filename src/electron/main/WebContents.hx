package electron.main;
/**
	@see https://electronjs.org/docs/api/web-contents
**/
@:jsRequire("electron", "WebContents") extern class WebContents extends js.node.events.EventEmitter<electron.main.WebContents> {
	/**
		An array of all `WebContents` instances. This will contain web contents for all windows, webviews, opened devtools, and devtools extension background pages.
	**/
	static function getAllWebContents():Array<electron.main.WebContents>;
	/**
		The web contents that is focused in this application, otherwise returns `null`.
	**/
	static function getFocusedWebContents():electron.main.WebContents;
	/**
		| undefined - A WebContents instance with the given ID, or `undefined` if there is no WebContents associated with the given ID.
	**/
	static function fromId(id:Int):electron.main.WebContents;
	/**
		A `Boolean` property that determines whether this page is muted.
	**/
	var audioMuted : Bool;
	/**
		A `String` property that determines the user agent for this web page.
	**/
	var userAgent : String;
	/**
		A `Number` property that determines the zoom level for this web contents.
		
		The original size is 0 and each increment above or below represents zooming 20% larger or smaller to default limits of 300% and 50% of original size, respectively. The formula for this is `scale := 1.2 ^ level`.
	**/
	var zoomLevel : Float;
	/**
		A `Number` property that determines the zoom factor for this web contents.
		
		The zoom factor is the zoom percent divided by 100, so 300% = 3.0.
	**/
	var zoomFactor : Float;
	/**
		An `Integer` property that sets the frame rate of the web contents to the specified number. Only values between 1 and 240 are accepted.
		
		Only applicable if *offscreen rendering* is enabled.
	**/
	var frameRate : Int;
	/**
		A `Integer` representing the unique ID of this WebContents. Each ID is unique among all `WebContents` instances of the entire Electron application.
	**/
	var id : Int;
	/**
		A `Session` used by this webContents.
	**/
	var session : electron.main.Session;
	/**
		A `WebContents` instance that might own this `WebContents`.
	**/
	var hostWebContents : electron.main.WebContents;
	/**
		A `WebContents | null` property that represents the of DevTools `WebContents` associated with a given `WebContents`.
		
		**Note:** Users should never store this object because it may become `null` when the DevTools has been closed.
	**/
	var devToolsWebContents : haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		A `Debugger` instance for this webContents.
	**/
	var debugger : electron.main.Debugger;
	/**
		A `Boolean` property that determines whether or not this WebContents will throttle animations and timers when the page becomes backgrounded. This also affects the Page Visibility API.
	**/
	var backgroundThrottling : Bool;
	/**
		A `WebFrameMain` property that represents the top frame of the page's frame hierarchy.
	**/
	var mainFrame : electron.main.WebFrameMain;
	/**
		the promise will resolve when the page has finished loading (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`). A noop rejection handler is already attached, which avoids unhandled rejection errors.
		
		Loads the `url` in the window. The `url` must contain the protocol prefix, e.g. the `http://` or `file://`. If the load should bypass http cache then use the `pragma` header to achieve it.
	**/
	function loadURL(url:String, ?options:{ /**
		An HTTP Referrer url.
	**/
	@:optional
	var httpReferrer : haxe.extern.EitherType<Dynamic, Dynamic>; /**
		A user agent originating the request.
	**/
	@:optional
	var userAgent : String; /**
		Extra headers separated by "\n".
	**/
	@:optional
	var extraHeaders : String; @:optional
	var postData : haxe.extern.EitherType<Array<Dynamic>, Array<Dynamic>>; /**
		Base url (with trailing path separator) for files to be loaded by the data url. This is needed only if the specified `url` is a data url and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):js.lib.Promise<Any>;
	/**
		the promise will resolve when the page has finished loading (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`).
		
		Loads the given file in the window, `filePath` should be a path to an HTML file relative to the root of your application.  For instance an app structure like this:
		
		Would require code like this
	**/
	function loadFile(filePath:String, ?options:{ /**
		Passed to `url.format()`.
	**/
	@:optional
	var query : Record; /**
		Passed to `url.format()`.
	**/
	@:optional
	var search : String; /**
		Passed to `url.format()`.
	**/
	@:optional
	var hash : String; }):js.lib.Promise<Any>;
	/**
		Initiates a download of the resource at `url` without navigating. The `will-download` event of `session` will be triggered.
	**/
	function downloadURL(url:String):Void;
	/**
		The URL of the current web page.
	**/
	function getURL():String;
	/**
		The title of the current web page.
	**/
	function getTitle():String;
	/**
		Whether the web page is destroyed.
	**/
	function isDestroyed():Bool;
	/**
		Focuses the web page.
	**/
	function focus():Void;
	/**
		Whether the web page is focused.
	**/
	function isFocused():Bool;
	/**
		Whether web page is still loading resources.
	**/
	function isLoading():Bool;
	/**
		Whether the main frame (and not just iframes or frames within it) is still loading.
	**/
	function isLoadingMainFrame():Bool;
	/**
		Whether the web page is waiting for a first-response from the main resource of the page.
	**/
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
	/**
		Whether the browser can go back to previous web page.
	**/
	function canGoBack():Bool;
	/**
		Whether the browser can go forward to next web page.
	**/
	function canGoForward():Bool;
	/**
		Whether the web page can go to `offset`.
	**/
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
	/**
		Whether the renderer process has crashed.
	**/
	function isCrashed():Bool;
	/**
		Forcefully terminates the renderer process that is currently hosting this `webContents`. This will cause the `render-process-gone` event to be emitted with the `reason=killed || reason=crashed`. Please note that some webContents share renderer processes and therefore calling this method may also crash the host process for other webContents as well.
		
		Calling `reload()` immediately after calling this method will force the reload to occur in a new process. This should be used when this process is unstable or unusable, for instance in order to recover from the `unresponsive` event.
	**/
	function forcefullyCrashRenderer():Void;
	/**
		Overrides the user agent for this web page.
	**/
	function setUserAgent(userAgent:String):Void;
	/**
		The user agent for this web page.
	**/
	function getUserAgent():String;
	/**
		A promise that resolves with a key for the inserted CSS that can later be used to remove the CSS via `contents.removeInsertedCSS(key)`.
		
		Injects CSS into the current web page and returns a unique key for the inserted stylesheet.
	**/
	function insertCSS(css:String, ?options:{ /**
		Can be either 'user' or 'author'; Specifying 'user' enables you to prevent websites from overriding the CSS you insert. Default is 'author'.
	**/
	@:optional
	var cssOrigin : String; }):js.lib.Promise<Any>;
	/**
		Resolves if the removal was successful.
		
		Removes the inserted CSS from the current web page. The stylesheet is identified by its key, which is returned from `contents.insertCSS(css)`.
	**/
	function removeInsertedCSS(key:String):js.lib.Promise<Any>;
	/**
		A promise that resolves with the result of the executed code or is rejected if the result of the code is a rejected promise.
		
		Evaluates `code` in page.
		
		In the browser window some HTML APIs like `requestFullScreen` can only be invoked by a gesture from the user. Setting `userGesture` to `true` will remove this limitation.
		
		Code execution will be suspended until web page stop loading.
	**/
	function executeJavaScript(code:String, ?userGesture:Bool):js.lib.Promise<Any>;
	/**
		A promise that resolves with the result of the executed code or is rejected if the result of the code is a rejected promise.
		
		Works like `executeJavaScript` but evaluates `scripts` in an isolated context.
	**/
	function executeJavaScriptInIsolatedWorld(worldId:Int, scripts:Array<electron.WebSource>, ?userGesture:Bool):js.lib.Promise<Any>;
	/**
		Ignore application menu shortcuts while this web contents is focused.
	**/
	function setIgnoreMenuShortcuts(ignore:Bool):Void;
	/**
		Called before creating a window when `window.open()` is called from the renderer. See `window.open()` for more details and how to use this in conjunction with `did-create-window`.
	**/
	function setWindowOpenHandler(handler:haxe.Constraints.Function):Void;
	/**
		Mute the audio on the current web page.
	**/
	function setAudioMuted(muted:Bool):Void;
	/**
		Whether this page has been muted.
	**/
	function isAudioMuted():Bool;
	/**
		Whether audio is currently playing.
	**/
	function isCurrentlyAudible():Bool;
	/**
		Changes the zoom factor to the specified factor. Zoom factor is zoom percent divided by 100, so 300% = 3.0.
		
		The factor must be greater than 0.0.
	**/
	function setZoomFactor(factor:Float):Void;
	/**
		the current zoom factor.
	**/
	function getZoomFactor():Float;
	/**
		Changes the zoom level to the specified level. The original size is 0 and each increment above or below represents zooming 20% larger or smaller to default limits of 300% and 50% of original size, respectively. The formula for this is `scale := 1.2 ^ level`.
		
		> **NOTE**: The zoom policy at the Chromium level is same-origin, meaning that the zoom level for a specific domain propagates across all instances of windows with the same domain. Differentiating the window URLs will make zoom work per-window.
	**/
	function setZoomLevel(level:Float):Void;
	/**
		the current zoom level.
	**/
	function getZoomLevel():Float;
	/**
		Sets the maximum and minimum pinch-to-zoom level.
		
		> **NOTE**: Visual zoom is disabled by default in Electron. To re-enable it, call:
	**/
	function setVisualZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):js.lib.Promise<Any>;
	/**
		Executes the editing command `undo` in web page.
	**/
	function undo():Void;
	/**
		Executes the editing command `redo` in web page.
	**/
	function redo():Void;
	/**
		Executes the editing command `cut` in web page.
	**/
	function cut():Void;
	/**
		Executes the editing command `copy` in web page.
	**/
	function copy():Void;
	/**
		Copy the image at the given position to the clipboard.
	**/
	function copyImageAt(x:Int, y:Int):Void;
	/**
		Executes the editing command `paste` in web page.
	**/
	function paste():Void;
	/**
		Executes the editing command `pasteAndMatchStyle` in web page.
	**/
	function pasteAndMatchStyle():Void;
	/**
		Executes the editing command `delete` in web page.
	**/
	function delete():Void;
	/**
		Executes the editing command `selectAll` in web page.
	**/
	function selectAll():Void;
	/**
		Executes the editing command `unselect` in web page.
	**/
	function unselect():Void;
	/**
		Executes the editing command `replace` in web page.
	**/
	function replace(text:String):Void;
	/**
		Executes the editing command `replaceMisspelling` in web page.
	**/
	function replaceMisspelling(text:String):Void;
	/**
		Inserts `text` to the focused element.
	**/
	function insertText(text:String):js.lib.Promise<Any>;
	/**
		The request id used for the request.
		
		Starts a request to find all matches for the `text` in the web page. The result of the request can be obtained by subscribing to `found-in-page` event.
	**/
	function findInPage(text:String, ?options:{ /**
		Whether to search forward or backward, defaults to `true`.
	**/
	@:optional
	var forward : Bool; /**
		Whether the operation is first request or a follow up, defaults to `false`.
	**/
	@:optional
	var findNext : Bool; /**
		Whether search should be case-sensitive, defaults to `false`.
	**/
	@:optional
	var matchCase : Bool; }):Int;
	/**
		Stops any `findInPage` request for the `webContents` with the provided `action`.
	**/
	function stopFindInPage(action:String):Void;
	/**
		Resolves with a NativeImage
		
		Captures a snapshot of the page within `rect`. Omitting `rect` will capture the whole visible page.
	**/
	function capturePage(?rect:electron.Rectangle):js.lib.Promise<Any>;
	/**
		Whether this page is being captured. It returns true when the capturer count is large then 0.
	**/
	function isBeingCaptured():Bool;
	/**
		Increase the capturer count by one. The page is considered visible when its browser window is hidden and the capturer count is non-zero. If you would like the page to stay hidden, you should ensure that `stayHidden` is set to true.
		
		This also affects the Page Visibility API.
	**/
	function incrementCapturerCount(?size:electron.Size, ?stayHidden:Bool):Void;
	/**
		Decrease the capturer count by one. The page will be set to hidden or occluded state when its browser window is hidden or occluded and the capturer count reaches zero. If you want to decrease the hidden capturer count instead you should set `stayHidden` to true.
	**/
	function decrementCapturerCount(?stayHidden:Bool):Void;
	/**
		Get the system printer list.
	**/
	function getPrinters():Array<electron.PrinterInfo>;
	/**
		When a custom `pageSize` is passed, Chromium attempts to validate platform specific minimum values for `width_microns` and `height_microns`. Width and height must both be minimum 353 microns but may be higher on some operating systems.
		
		Prints window's web page. When `silent` is set to `true`, Electron will pick the system's default printer if `deviceName` is empty and the default settings for printing.
		
		Use `page-break-before: always;` CSS style to force to print to a new page.
		
		Example usage:
	**/
	function print(?options:{ /**
		Don't ask user for print settings. Default is `false`.
	**/
	@:optional
	var silent : Bool; /**
		Prints the background color and image of the web page. Default is `false`.
	**/
	@:optional
	var printBackground : Bool; /**
		Set the printer device name to use. Must be the system-defined name and not the 'friendly' name, e.g 'Brother_QL_820NWB' and not 'Brother QL-820NWB'.
	**/
	@:optional
	var deviceName : String; /**
		Set whether the printed web page will be in color or grayscale. Default is `true`.
	**/
	@:optional
	var color : Bool; @:optional
	var margins : { /**
		Can be `default`, `none`, `printableArea`, or `custom`. If `custom` is chosen, you will also need to specify `top`, `bottom`, `left`, and `right`.
	**/
	@:optional
	var marginType : String; /**
		The top margin of the printed web page, in pixels.
	**/
	@:optional
	var top : Float; /**
		The bottom margin of the printed web page, in pixels.
	**/
	@:optional
	var bottom : Float; /**
		The left margin of the printed web page, in pixels.
	**/
	@:optional
	var left : Float; /**
		The right margin of the printed web page, in pixels.
	**/
	@:optional
	var right : Float; }; /**
		Whether the web page should be printed in landscape mode. Default is `false`.
	**/
	@:optional
	var landscape : Bool; /**
		The scale factor of the web page.
	**/
	@:optional
	var scaleFactor : Float; /**
		The number of pages to print per page sheet.
	**/
	@:optional
	var pagesPerSheet : Float; /**
		Whether the web page should be collated.
	**/
	@:optional
	var collate : Bool; /**
		The number of copies of the web page to print.
	**/
	@:optional
	var copies : Float; /**
		The page range to print. On macOS, only one range is honored.
	**/
	@:optional
	var pageRanges : Array<{ /**
	Index of the first page to print (0-based).
**/
var from : Float; /**
	Index of the last page to print (inclusive) (0-based).
**/
var to : Float; }>; /**
		Set the duplex mode of the printed web page. Can be `simplex`, `shortEdge`, or `longEdge`.
	**/
	@:optional
	var duplexMode : String; @:optional
	var dpi : Record; /**
		String to be printed as page header.
	**/
	@:optional
	var header : String; /**
		String to be printed as page footer.
	**/
	@:optional
	var footer : String; /**
		Specify page size of the printed document. Can be `A3`, `A4`, `A5`, `Legal`, `Letter`, `Tabloid` or an Object containing `height`.
	**/
	@:optional
	var pageSize : haxe.extern.EitherType<Dynamic, Dynamic>; }, ?callback:haxe.Constraints.Function):Void;
	/**
		Resolves with the generated PDF data.
		
		Prints window's web page as PDF with Chromium's preview printing custom settings.
		
		The `landscape` will be ignored if `@page` CSS at-rule is used in the web page.
		
		By default, an empty `options` will be regarded as:
		
		Use `page-break-before: always; ` CSS style to force to print to a new page.
		
		An example of `webContents.printToPDF`:
	**/
	function printToPDF(options:{ /**
		the header and footer for the PDF.
	**/
	@:optional
	var headerFooter : Record; /**
		`true` for landscape, `false` for portrait.
	**/
	@:optional
	var landscape : Bool; /**
		Specifies the type of margins to use. Uses 0 for default margin, 1 for no margin, and 2 for minimum margin.
	**/
	@:optional
	var marginsType : Int; /**
		The scale factor of the web page. Can range from 0 to 100.
	**/
	@:optional
	var scaleFactor : Float; /**
		The page range to print.
	**/
	@:optional
	var pageRanges : Record; /**
		Specify page size of the generated PDF. Can be `A3`, `A4`, `A5`, `Legal`, `Letter`, `Tabloid` or an Object containing `height` and `width` in microns.
	**/
	@:optional
	var pageSize : haxe.extern.EitherType<Dynamic, Dynamic>; /**
		Whether to print CSS backgrounds.
	**/
	@:optional
	var printBackground : Bool; /**
		Whether to print selection only.
	**/
	@:optional
	var printSelectionOnly : Bool; }):js.lib.Promise<Any>;
	/**
		Adds the specified path to DevTools workspace. Must be used after DevTools creation:
	**/
	function addWorkSpace(path:String):Void;
	/**
		Removes the specified path from DevTools workspace.
	**/
	function removeWorkSpace(path:String):Void;
	/**
		Uses the `devToolsWebContents` as the target `WebContents` to show devtools.
		
		The `devToolsWebContents` must not have done any navigation, and it should not be used for other purposes after the call.
		
		By default Electron manages the devtools by creating an internal `WebContents` with native view, which developers have very limited control of. With the `setDevToolsWebContents` method, developers can use any `WebContents` to show the devtools in it, including `BrowserWindow`, `BrowserView` and `<webview>` tag.
		
		Note that closing the devtools does not destroy the `devToolsWebContents`, it is caller's responsibility to destroy `devToolsWebContents`.
		
		An example of showing devtools in a `<webview>` tag:
		
		An example of showing devtools in a `BrowserWindow`:
	**/
	function setDevToolsWebContents(devToolsWebContents:electron.main.WebContents):Void;
	/**
		Opens the devtools.
		
		When `contents` is a `<webview>` tag, the `mode` would be `detach` by default, explicitly passing an empty `mode` can force using last used dock state.
	**/
	function openDevTools(?options:{ /**
		Opens the devtools with specified dock state, can be `right`, `bottom`, `undocked`, `detach`. Defaults to last used dock state. In `undocked` mode it's possible to dock back. In `detach` mode it's not.
	**/
	var mode : String; /**
		Whether to bring the opened devtools window to the foreground. The default is `true`.
	**/
	@:optional
	var activate : Bool; }):Void;
	/**
		Closes the devtools.
	**/
	function closeDevTools():Void;
	/**
		Whether the devtools is opened.
	**/
	function isDevToolsOpened():Bool;
	/**
		Whether the devtools view is focused .
	**/
	function isDevToolsFocused():Bool;
	/**
		Toggles the developer tools.
	**/
	function toggleDevTools():Void;
	/**
		Starts inspecting element at position (`x`, `y`).
	**/
	function inspectElement(x:Int, y:Int):Void;
	/**
		Opens the developer tools for the shared worker context.
	**/
	function inspectSharedWorker():Void;
	/**
		Inspects the shared worker based on its ID.
	**/
	function inspectSharedWorkerById(workerId:String):Void;
	/**
		Information about all Shared Workers.
	**/
	function getAllSharedWorkers():Array<electron.SharedWorkerInfo>;
	/**
		Opens the developer tools for the service worker context.
	**/
	function inspectServiceWorker():Void;
	/**
		Send an asynchronous message to the renderer process via `channel`, along with arguments. Arguments will be serialized with the Structured Clone Algorithm, just like `postMessage`, so prototype chains will not be included. Sending Functions, Promises, Symbols, WeakMaps, or WeakSets will throw an exception.
		
		> **NOTE**: Sending non-standard JavaScript types such as DOM objects or special Electron objects will throw an exception.
		
		The renderer process can handle the message by listening to `channel` with the `ipcRenderer` module.
		
		An example of sending messages from the main process to the renderer process:
	**/
	function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Send an asynchronous message to a specific frame in a renderer process via `channel`, along with arguments. Arguments will be serialized with the Structured Clone Algorithm, just like `postMessage`, so prototype chains will not be included. Sending Functions, Promises, Symbols, WeakMaps, or WeakSets will throw an exception.
		
		> **NOTE:** Sending non-standard JavaScript types such as DOM objects or special Electron objects will throw an exception.
		
		The renderer process can handle the message by listening to `channel` with the `ipcRenderer` module.
		
		If you want to get the `frameId` of a given renderer context you should use the `webFrame.routingId` value.  E.g.
		
		You can also read `frameId` from all incoming IPC messages in the main process.
	**/
	function sendToFrame(frameId:haxe.extern.EitherType<Dynamic, Dynamic>, channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Send a message to the renderer process, optionally transferring ownership of zero or more [`MessagePortMain`][] objects.
		
		The transferred `MessagePortMain` objects will be available in the renderer process by accessing the `ports` property of the emitted event. When they arrive in the renderer, they will be native DOM `MessagePort` objects.
		
		For example:
	**/
	function postMessage(channel:String, message:Any, ?transfer:Array<electron.main.MessagePortMain>):Void;
	/**
		Enable device emulation with the given parameters.
	**/
	function enableDeviceEmulation(parameters:{ /**
		Specify the screen type to emulate (default: `desktop`):
	**/
	var screenPosition : String; /**
		Set the emulated screen size (screenPosition == mobile).
	**/
	var screenSize : electron.Size; /**
		Position the view on the screen (screenPosition == mobile) (default: `{ x: 0, y: 0 }`).
	**/
	var viewPosition : electron.Point; /**
		Set the device scale factor (if zero defaults to original device scale factor) (default: `0`).
	**/
	var deviceScaleFactor : Int; /**
		Set the emulated view size (empty means no override)
	**/
	var viewSize : electron.Size; /**
		Scale of emulated view inside available space (not in fit to view mode) (default: `1`).
	**/
	var scale : Float; }):Void;
	/**
		Disable device emulation enabled by `webContents.enableDeviceEmulation`.
	**/
	function disableDeviceEmulation():Void;
	/**
		Sends an input `event` to the page. **Note:** The `BrowserWindow` containing the contents needs to be focused for `sendInputEvent()` to work.
	**/
	function sendInputEvent(inputEvent:haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, Dynamic>>):Void;
	/**
		Begin subscribing for presentation events and captured frames, the `callback` will be called with `callback(image, dirtyRect)` when there is a presentation event.
		
		The `image` is an instance of NativeImage that stores the captured frame.
		
		The `dirtyRect` is an object with `x, y, width, height` properties that describes which part of the page was repainted. If `onlyDirty` is set to `true`, `image` will only contain the repainted area. `onlyDirty` defaults to `false`.
	**/
	function beginFrameSubscription(?onlyDirty:Bool, callback:haxe.Constraints.Function):Void;
	/**
		End subscribing for frame presentation events.
	**/
	function endFrameSubscription():Void;
	/**
		Sets the `item` as dragging item for current drag-drop operation, `file` is the absolute path of the file to be dragged, and `icon` is the image showing under the cursor when dragging.
	**/
	function startDrag(item:{ /**
		The path(s) to the file(s) being dragged.
	**/
	var file : haxe.extern.EitherType<Array<Dynamic>, Dynamic>; /**
		The image must be non-empty on macOS.
	**/
	var icon : haxe.extern.EitherType<Dynamic, Dynamic>; }):Void;
	/**
		resolves if the page is saved.
	**/
	function savePage(fullPath:String, saveType:String):js.lib.Promise<Any>;
	/**
		Shows pop-up dictionary that searches the selected word on the page.
	**/
	function showDefinitionForSelection():Void;
	/**
		Indicates whether *offscreen rendering* is enabled.
	**/
	function isOffscreen():Bool;
	/**
		If *offscreen rendering* is enabled and not painting, start painting.
	**/
	function startPainting():Void;
	/**
		If *offscreen rendering* is enabled and painting, stop painting.
	**/
	function stopPainting():Void;
	/**
		If *offscreen rendering* is enabled returns whether it is currently painting.
	**/
	function isPainting():Bool;
	/**
		If *offscreen rendering* is enabled sets the frame rate to the specified number. Only values between 1 and 240 are accepted.
	**/
	function setFrameRate(fps:Int):Void;
	/**
		If *offscreen rendering* is enabled returns the current frame rate.
	**/
	function getFrameRate():Int;
	/**
		Schedules a full repaint of the window this web contents is in.
		
		If *offscreen rendering* is enabled invalidates the frame and generates a new one through the `'paint'` event.
	**/
	function invalidate():Void;
	/**
		Returns the WebRTC IP Handling Policy.
	**/
	function getWebRTCIPHandlingPolicy():String;
	/**
		Setting the WebRTC IP handling policy allows you to control which IPs are exposed via WebRTC. See BrowserLeaks for more details.
	**/
	function setWebRTCIPHandlingPolicy(policy:String):Void;
	/**
		The operating system `pid` of the associated renderer process.
	**/
	function getOSProcessId():Int;
	/**
		The Chromium internal `pid` of the associated renderer. Can be compared to the `frameProcessId` passed by frame specific navigation events (e.g. `did-frame-navigate`)
	**/
	function getProcessId():Int;
	/**
		Indicates whether the snapshot has been created successfully.
		
		Takes a V8 heap snapshot and saves it to `filePath`.
	**/
	function takeHeapSnapshot(filePath:String):js.lib.Promise<Any>;
	/**
		whether or not this WebContents will throttle animations and timers when the page becomes backgrounded. This also affects the Page Visibility API.
	**/
	function getBackgroundThrottling():Bool;
	/**
		Controls whether or not this WebContents will throttle animations and timers when the page becomes backgrounded. This also affects the Page Visibility API.
	**/
	function setBackgroundThrottling(allowed:Bool):Void;
	/**
		the type of the webContent. Can be `backgroundPage`, `window`, `browserView`, `remote`, `webview` or `offscreen`.
	**/
	function getType():String;
}
@:enum abstract WebContentsEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the navigation is done, i.e. the spinner of the tab has stopped spinning, and the `onload` event was dispatched.
	**/
	var did_finish_load : electron.main.WebContentsEvent<Void -> Void> = "did-finish-load";
	/**
		This event is like `did-finish-load` but emitted when the load failed. The full list of error codes and their meaning is available here.
	**/
	var did_fail_load : electron.main.WebContentsEvent<Void -> Void> = "did-fail-load";
	/**
		This event is like `did-fail-load` but emitted when the load was cancelled (e.g. `window.stop()` was invoked).
	**/
	var did_fail_provisional_load : electron.main.WebContentsEvent<Void -> Void> = "did-fail-provisional-load";
	/**
		Emitted when a frame has done navigation.
	**/
	var did_frame_finish_load : electron.main.WebContentsEvent<Void -> Void> = "did-frame-finish-load";
	/**
		Corresponds to the points in time when the spinner of the tab started spinning.
	**/
	var did_start_loading : electron.main.WebContentsEvent<Void -> Void> = "did-start-loading";
	/**
		Corresponds to the points in time when the spinner of the tab stopped spinning.
	**/
	var did_stop_loading : electron.main.WebContentsEvent<Void -> Void> = "did-stop-loading";
	/**
		Emitted when the document in the given frame is loaded.
	**/
	var dom_ready : electron.main.WebContentsEvent<Void -> Void> = "dom-ready";
	/**
		Fired when page title is set during navigation. `explicitSet` is false when title is synthesized from file url.
	**/
	var page_title_updated : electron.main.WebContentsEvent<Void -> Void> = "page-title-updated";
	/**
		Emitted when page receives favicon urls.
	**/
	var page_favicon_updated : electron.main.WebContentsEvent<Void -> Void> = "page-favicon-updated";
	/**
		Deprecated in favor of `webContents.setWindowOpenHandler`.
		
		Emitted when the page requests to open a new window for a `url`. It could be requested by `window.open` or an external link like `<a target='_blank'>`.
		
		By default a new `BrowserWindow` will be created for the `url`.
		
		Calling `event.preventDefault()` will prevent Electron from automatically creating a new `BrowserWindow`. If you call `event.preventDefault()` and manually create a new `BrowserWindow` then you must set `event.newGuest` to reference the new `BrowserWindow` instance, failing to do so may result in unexpected behavior. For example:
	**/
	var new_window : electron.main.WebContentsEvent<Void -> Void> = "new-window";
	/**
		Emitted _after_ successful creation of a window via `window.open` in the renderer. Not emitted if the creation of the window is canceled from `webContents.setWindowOpenHandler`.
		
		See `window.open()` for more details and how to use this in conjunction with `webContents.setWindowOpenHandler`.
	**/
	var did_create_window : electron.main.WebContentsEvent<Void -> Void> = "did-create-window";
	/**
		Emitted when a user or the page wants to start navigation. It can happen when the `window.location` object is changed or a user clicks a link in the page.
		
		This event will not emit when the navigation is started programmatically with APIs like `webContents.loadURL` and `webContents.back`.
		
		It is also not emitted for in-page navigations, such as clicking anchor links or updating the `window.location.hash`. Use `did-navigate-in-page` event for this purpose.
		
		Calling `event.preventDefault()` will prevent the navigation.
	**/
	var will_navigate : electron.main.WebContentsEvent<Void -> Void> = "will-navigate";
	/**
		Emitted when any frame (including main) starts navigating. `isInPlace` will be `true` for in-page navigations.
	**/
	var did_start_navigation : electron.main.WebContentsEvent<Void -> Void> = "did-start-navigation";
	/**
		Emitted as a server side redirect occurs during navigation.  For example a 302 redirect.
		
		This event will be emitted after `did-start-navigation` and always before the `did-redirect-navigation` event for the same navigation.
		
		Calling `event.preventDefault()` will prevent the navigation (not just the redirect).
	**/
	var will_redirect : electron.main.WebContentsEvent<Void -> Void> = "will-redirect";
	/**
		Emitted after a server side redirect occurs during navigation.  For example a 302 redirect.
		
		This event cannot be prevented, if you want to prevent redirects you should checkout out the `will-redirect` event above.
	**/
	var did_redirect_navigation : electron.main.WebContentsEvent<Void -> Void> = "did-redirect-navigation";
	/**
		Emitted when a main frame navigation is done.
		
		This event is not emitted for in-page navigations, such as clicking anchor links or updating the `window.location.hash`. Use `did-navigate-in-page` event for this purpose.
	**/
	var did_navigate : electron.main.WebContentsEvent<Void -> Void> = "did-navigate";
	/**
		Emitted when any frame navigation is done.
		
		This event is not emitted for in-page navigations, such as clicking anchor links or updating the `window.location.hash`. Use `did-navigate-in-page` event for this purpose.
	**/
	var did_frame_navigate : electron.main.WebContentsEvent<Void -> Void> = "did-frame-navigate";
	/**
		Emitted when an in-page navigation happened in any frame.
		
		When in-page navigation happens, the page URL changes but does not cause navigation outside of the page. Examples of this occurring are when anchor links are clicked or when the DOM `hashchange` event is triggered.
	**/
	var did_navigate_in_page : electron.main.WebContentsEvent<Void -> Void> = "did-navigate-in-page";
	/**
		Emitted when a `beforeunload` event handler is attempting to cancel a page unload.
		
		Calling `event.preventDefault()` will ignore the `beforeunload` event handler and allow the page to be unloaded.
	**/
	var will_prevent_unload : electron.main.WebContentsEvent<Void -> Void> = "will-prevent-unload";
	/**
		Emitted when the renderer process crashes or is killed.
		
		**Deprecated:** This event is superceded by the `render-process-gone` event which contains more information about why the render process disappeared. It isn't always because it crashed.  The `killed` boolean can be replaced by checking `reason === 'killed'` when you switch to that event.
	**/
	var crashed : electron.main.WebContentsEvent<Void -> Void> = "crashed";
	/**
		Emitted when the renderer process unexpectedly disappears.  This is normally because it was crashed or killed.
	**/
	var render_process_gone : electron.main.WebContentsEvent<Void -> Void> = "render-process-gone";
	/**
		Emitted when the web page becomes unresponsive.
	**/
	var unresponsive : electron.main.WebContentsEvent<Void -> Void> = "unresponsive";
	/**
		Emitted when the unresponsive web page becomes responsive again.
	**/
	var responsive : electron.main.WebContentsEvent<Void -> Void> = "responsive";
	/**
		Emitted when a plugin process has crashed.
	**/
	var plugin_crashed : electron.main.WebContentsEvent<Void -> Void> = "plugin-crashed";
	/**
		Emitted when `webContents` is destroyed.
	**/
	var destroyed : electron.main.WebContentsEvent<Void -> Void> = "destroyed";
	/**
		Emitted before dispatching the `keydown` and `keyup` events in the page. Calling `event.preventDefault` will prevent the page `keydown`/`keyup` events and the menu shortcuts.
		
		To only prevent the menu shortcuts, use `setIgnoreMenuShortcuts`:
	**/
	var before_input_event : electron.main.WebContentsEvent<Void -> Void> = "before-input-event";
	/**
		Emitted when the window enters a full-screen state triggered by HTML API.
	**/
	var enter_html_full_screen : electron.main.WebContentsEvent<Void -> Void> = "enter-html-full-screen";
	/**
		Emitted when the window leaves a full-screen state triggered by HTML API.
	**/
	var leave_html_full_screen : electron.main.WebContentsEvent<Void -> Void> = "leave-html-full-screen";
	/**
		Emitted when the user is requesting to change the zoom level using the mouse wheel.
	**/
	var zoom_changed : electron.main.WebContentsEvent<Void -> Void> = "zoom-changed";
	/**
		Emitted when DevTools is opened.
	**/
	var devtools_opened : electron.main.WebContentsEvent<Void -> Void> = "devtools-opened";
	/**
		Emitted when DevTools is closed.
	**/
	var devtools_closed : electron.main.WebContentsEvent<Void -> Void> = "devtools-closed";
	/**
		Emitted when DevTools is focused / opened.
	**/
	var devtools_focused : electron.main.WebContentsEvent<Void -> Void> = "devtools-focused";
	/**
		Emitted when failed to verify the `certificate` for `url`.
		
		The usage is the same with the `certificate-error` event of `app`.
	**/
	var certificate_error : electron.main.WebContentsEvent<Void -> Void> = "certificate-error";
	/**
		Emitted when a client certificate is requested.
		
		The usage is the same with the `select-client-certificate` event of `app`.
	**/
	var select_client_certificate : electron.main.WebContentsEvent<Void -> Void> = "select-client-certificate";
	/**
		Emitted when `webContents` wants to do basic auth.
		
		The usage is the same with the `login` event of `app`.
	**/
	var login : electron.main.WebContentsEvent<Void -> Void> = "login";
	/**
		Emitted when a result is available for [`webContents.findInPage`] request.
	**/
	var found_in_page : electron.main.WebContentsEvent<Void -> Void> = "found-in-page";
	/**
		Emitted when media starts playing.
	**/
	var media_started_playing : electron.main.WebContentsEvent<Void -> Void> = "media-started-playing";
	/**
		Emitted when media is paused or done playing.
	**/
	var media_paused : electron.main.WebContentsEvent<Void -> Void> = "media-paused";
	/**
		Emitted when a page's theme color changes. This is usually due to encountering a meta tag:
	**/
	var did_change_theme_color : electron.main.WebContentsEvent<Void -> Void> = "did-change-theme-color";
	/**
		Emitted when mouse moves over a link or the keyboard moves the focus to a link.
	**/
	var update_target_url : electron.main.WebContentsEvent<Void -> Void> = "update-target-url";
	/**
		Emitted when the cursor's type changes. The `type` parameter can be `default`, `crosshair`, `pointer`, `text`, `wait`, `help`, `e-resize`, `n-resize`, `ne-resize`, `nw-resize`, `s-resize`, `se-resize`, `sw-resize`, `w-resize`, `ns-resize`, `ew-resize`, `nesw-resize`, `nwse-resize`, `col-resize`, `row-resize`, `m-panning`, `e-panning`, `n-panning`, `ne-panning`, `nw-panning`, `s-panning`, `se-panning`, `sw-panning`, `w-panning`, `move`, `vertical-text`, `cell`, `context-menu`, `alias`, `progress`, `nodrop`, `copy`, `none`, `not-allowed`, `zoom-in`, `zoom-out`, `grab`, `grabbing` or `custom`.
		
		If the `type` parameter is `custom`, the `image` parameter will hold the custom cursor image in a `NativeImage`, and `scale`, `size` and `hotspot` will hold additional information about the custom cursor.
	**/
	var cursor_changed : electron.main.WebContentsEvent<Void -> Void> = "cursor-changed";
	/**
		Emitted when there is a new context menu that needs to be handled.
	**/
	var context_menu : electron.main.WebContentsEvent<Void -> Void> = "context-menu";
	/**
		Emitted when bluetooth device needs to be selected on call to `navigator.bluetooth.requestDevice`. To use `navigator.bluetooth` api `webBluetooth` should be enabled. If `event.preventDefault` is not called, first available device will be selected. `callback` should be called with `deviceId` to be selected, passing empty string to `callback` will cancel the request.
	**/
	var select_bluetooth_device : electron.main.WebContentsEvent<Void -> Void> = "select-bluetooth-device";
	/**
		Emitted when a new frame is generated. Only the dirty area is passed in the buffer.
	**/
	var paint : electron.main.WebContentsEvent<Void -> Void> = "paint";
	/**
		Emitted when the devtools window instructs the webContents to reload
	**/
	var devtools_reload_page : electron.main.WebContentsEvent<Void -> Void> = "devtools-reload-page";
	/**
		Emitted when a `<webview>`'s web contents is being attached to this web contents. Calling `event.preventDefault()` will destroy the guest page.
		
		This event can be used to configure `webPreferences` for the `webContents` of a `<webview>` before it's loaded, and provides the ability to set settings that can't be set via `<webview>` attributes.
		
		**Note:** The specified `preload` script option will appear as `preloadURL` (not `preload`) in the `webPreferences` object emitted with this event.
	**/
	var will_attach_webview : electron.main.WebContentsEvent<Void -> Void> = "will-attach-webview";
	/**
		Emitted when a `<webview>` has been attached to this web contents.
	**/
	var did_attach_webview : electron.main.WebContentsEvent<Void -> Void> = "did-attach-webview";
	/**
		Emitted when the associated window logs a console message.
	**/
	var console_message : electron.main.WebContentsEvent<Void -> Void> = "console-message";
	/**
		Emitted when the preload script `preloadPath` throws an unhandled exception `error`.
	**/
	var preload_error : electron.main.WebContentsEvent<Void -> Void> = "preload-error";
	/**
		Emitted when the renderer process sends an asynchronous message via `ipcRenderer.send()`.
	**/
	var ipc_message : electron.main.WebContentsEvent<Void -> Void> = "ipc-message";
	/**
		Emitted when the renderer process sends a synchronous message via `ipcRenderer.sendSync()`.
	**/
	var ipc_message_sync : electron.main.WebContentsEvent<Void -> Void> = "ipc-message-sync";
	/**
		Emitted when `desktopCapturer.getSources()` is called in the renderer process. Calling `event.preventDefault()` will make it return empty sources.
	**/
	var desktop_capturer_get_sources : electron.main.WebContentsEvent<Void -> Void> = "desktop-capturer-get-sources";
	/**
		Emitted when `remote.require()` is called in the renderer process. Calling `event.preventDefault()` will prevent the module from being returned. Custom value can be returned by setting `event.returnValue`.
	**/
	var remote_require : electron.main.WebContentsEvent<Void -> Void> = "remote-require";
	/**
		Emitted when `remote.getGlobal()` is called in the renderer process. Calling `event.preventDefault()` will prevent the global from being returned. Custom value can be returned by setting `event.returnValue`.
	**/
	var remote_get_global : electron.main.WebContentsEvent<Void -> Void> = "remote-get-global";
	/**
		Emitted when `remote.getBuiltin()` is called in the renderer process. Calling `event.preventDefault()` will prevent the module from being returned. Custom value can be returned by setting `event.returnValue`.
	**/
	var remote_get_builtin : electron.main.WebContentsEvent<Void -> Void> = "remote-get-builtin";
	/**
		Emitted when `remote.getCurrentWindow()` is called in the renderer process. Calling `event.preventDefault()` will prevent the object from being returned. Custom value can be returned by setting `event.returnValue`.
	**/
	var remote_get_current_window : electron.main.WebContentsEvent<Void -> Void> = "remote-get-current-window";
	/**
		Emitted when `remote.getCurrentWebContents()` is called in the renderer process. Calling `event.preventDefault()` will prevent the object from being returned. Custom value can be returned by setting `event.returnValue`.
	**/
	var remote_get_current_web_contents : electron.main.WebContentsEvent<Void -> Void> = "remote-get-current-web-contents";
	/**
		Emitted when the `WebContents` preferred size has changed.
		
		This event will only be emitted when `enablePreferredSizeMode` is set to `true` in `webPreferences`.
	**/
	var preferred_size_changed : electron.main.WebContentsEvent<Void -> Void> = "preferred-size-changed";
}
