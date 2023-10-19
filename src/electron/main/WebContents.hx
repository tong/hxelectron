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
	static function getFocusedWebContents():haxe.extern.EitherType<electron.main.WebContents, Dynamic>;
	/**
		A WebContents instance with the given ID, or `undefined` if there is no WebContents associated with the given ID.
	**/
	static function fromId(id:Int):haxe.extern.EitherType<electron.main.WebContents, Dynamic>;
	/**
		A WebContents instance with the given WebFrameMain, or `undefined` if there is no WebContents associated with the given WebFrameMain.
	**/
	static function fromFrame(frame:electron.main.WebFrameMain):haxe.extern.EitherType<electron.main.WebContents, Dynamic>;
	/**
		A WebContents instance with the given TargetID, or `undefined` if there is no WebContents associated with the given TargetID.
		
		When communicating with the Chrome DevTools Protocol, it can be useful to lookup a WebContents instance based on its assigned TargetID.
	**/
	static function fromDevToolsTargetId(targetId:String):haxe.extern.EitherType<electron.main.WebContents, Dynamic>;
	/**
		An `IpcMain` scoped to just IPC messages sent from this WebContents.
		
		IPC messages sent with `ipcRenderer.send`, `ipcRenderer.sendSync` or `ipcRenderer.postMessage` will be delivered in the following order:
		
		* `contents.on('ipc-message')`
		* `contents.mainFrame.on(channel)`
		* `contents.ipc.on(channel)`
		* `ipcMain.on(channel)`
		
		Handlers registered with `invoke` will be checked in the following order. The first one that is defined will be called, the rest will be ignored.
		
		* `contents.mainFrame.handle(channel)`
		* `contents.handle(channel)`
		* `ipcMain.handle(channel)`
		
		A handler or event listener registered on the WebContents will receive IPC messages sent from any frame, including child frames. In most cases, only the main frame can send IPC messages. However, if the `nodeIntegrationInSubFrames` option is enabled, it is possible for child frames to send IPC messages also. In that case, handlers should check the `senderFrame` property of the IPC event to ensure that the message is coming from the expected frame. Alternatively, register handlers on the appropriate frame directly using the `WebFrameMain.ipc` interface.
	**/
	var ipc : electron.main.IpcMain;
	/**
		A `boolean` property that determines whether this page is muted.
	**/
	var audioMuted : Bool;
	/**
		A `string` property that determines the user agent for this web page.
	**/
	var userAgent : String;
	/**
		A `number` property that determines the zoom level for this web contents.
		
		The original size is 0 and each increment above or below represents zooming 20% larger or smaller to default limits of 300% and 50% of original size, respectively. The formula for this is `scale := 1.2 ^ level`.
	**/
	var zoomLevel : Float;
	/**
		A `number` property that determines the zoom factor for this web contents.
		
		The zoom factor is the zoom percent divided by 100, so 300% = 3.0.
	**/
	var zoomFactor : Float;
	/**
		An `Integer` property that sets the frame rate of the web contents to the specified number. Only values between 1 and 240 are accepted.
		
		Only applicable if _offscreen rendering_ is enabled.
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
	var devToolsWebContents : haxe.extern.EitherType<electron.main.WebContents, Dynamic>;
	/**
		A `Debugger` instance for this webContents.
	**/
	var debugger : electron.main.Debugger;
	/**
		A `boolean` property that determines whether or not this WebContents will throttle animations and timers when the page becomes backgrounded. This also affects the Page Visibility API.
	**/
	var backgroundThrottling : Bool;
	/**
		A `WebFrameMain` property that represents the top frame of the page's frame hierarchy.
	**/
	var mainFrame : electron.main.WebFrameMain;
	/**
		A `WebFrameMain` property that represents the frame that opened this WebContents, either with open(), or by navigating a link with a target attribute.
	**/
	var opener : electron.main.WebFrameMain;
	/**
		the promise will resolve when the page has finished loading (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`). A noop rejection handler is already attached, which avoids unhandled rejection errors.
		
		Loads the `url` in the window. The `url` must contain the protocol prefix, e.g. the `http://` or `file://`. If the load should bypass http cache then use the `pragma` header to achieve it.
	**/
	function loadURL(url:String, ?options:{ /**
		An HTTP Referrer url.
	**/
	@:optional
	var httpReferrer : haxe.extern.EitherType<String, electron.Referrer>; /**
		A user agent originating the request.
	**/
	@:optional
	var userAgent : String; /**
		Extra headers separated by "\n".
	**/
	@:optional
	var extraHeaders : String; @:optional
	var postData : Array<haxe.extern.EitherType<electron.UploadRawData, electron.UploadFile>>; /**
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
	function downloadURL(url:String, ?options:{ /**
		HTTP request headers.
	**/
	@:optional
	var headers : Record; }):Void;
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
		Closes the page, as if the web content had called `window.close()`.
		
		If the page is successfully closed (i.e. the unload is not prevented by the page, or `waitForBeforeUnload` is false or unspecified), the WebContents will be destroyed and no longer usable. The `destroyed` event will be emitted.
	**/
	function close(?opts:{ /**
		if true, fire the `beforeunload` event before closing the page. If the page prevents the unload, the WebContents will not be closed. The `will-prevent-unload` will be fired if the page requests prevention of unload.
	**/
	var waitForBeforeUnload : Bool; }):Void;
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
		Can be 'user' or 'author'. Sets the cascade origin of the inserted stylesheet. Default is 'author'.
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
		Called before creating a window a new window is requested by the renderer, e.g. by `window.open()`, a link with `target="_blank"`, shift+clicking on a link, or submitting a form with `<form target="_blank">`. See `window.open()` for more details and how to use this in conjunction with `did-create-window`.
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
		Centers the current text selection in web page.
	**/
	function centerSelection():Void;
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
		Scrolls to the top of the current `webContents`.
	**/
	function scrollToTop():Void;
	/**
		Scrolls to the bottom of the current `webContents`.
	**/
	function scrollToBottom():Void;
	/**
		Adjusts the current text selection starting and ending points in the focused frame by the given amounts. A negative amount moves the selection towards the beginning of the document, and a positive amount moves the selection towards the end of the document.
		
		Example:
		
		For a call of `win.webContents.adjustSelection({ start: 1, end: 5 })`
		
		Before:
		
		<img width="487" alt="Image Before Text Selection Adjustment" src="../images/web-contents-text-selection-before.png"/>
		
		After:
		
		<img width="487" alt="Image After Text Selection Adjustment" src="../images/web-contents-text-selection-after.png"/>
	**/
	function adjustSelection(options:{ /**
		Amount to shift the start index of the current selection.
	**/
	@:optional
	var start : Float; /**
		Amount to shift the end index of the current selection.
	**/
	@:optional
	var end : Float; }):Void;
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
		Whether to begin a new text finding session with this request. Should be `true` for initial requests, and `false` for follow-up requests. Defaults to `false`.
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
		
		Captures a snapshot of the page within `rect`. Omitting `rect` will capture the whole visible page. The page is considered visible when its browser window is hidden and the capturer count is non-zero. If you would like the page to stay hidden, you should ensure that `stayHidden` is set to true.
	**/
	function capturePage(?rect:electron.Rectangle, ?opts:{ /**
		Keep the page hidden instead of visible. Default is `false`.
	**/
	@:optional
	var stayHidden : Bool; /**
		Keep the system awake instead of allowing it to sleep. Default is `false`.
	**/
	@:optional
	var stayAwake : Bool; }):js.lib.Promise<Any>;
	/**
		Whether this page is being captured. It returns true when the capturer count is large then 0.
	**/
	function isBeingCaptured():Bool;
	/**
		Get the system printer list.
		
		Resolves with a `PrinterInfo[]`
	**/
	function getPrintersAsync():js.lib.Promise<Any>;
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
		string to be printed as page header.
	**/
	@:optional
	var header : String; /**
		string to be printed as page footer.
	**/
	@:optional
	var footer : String; /**
		Specify page size of the printed document. Can be `A0`, `A1`, `A2`, `A3`, `A4`, `A5`, `A6`, `Legal`, `Letter`, `Tabloid` or an Object containing `height` and `width`.
	**/
	@:optional
	var pageSize : haxe.extern.EitherType<String, electron.Size>; }, ?callback:haxe.Constraints.Function):Void;
	/**
		Resolves with the generated PDF data.
		
		Prints the window's web page as PDF.
		
		The `landscape` will be ignored if `@page` CSS at-rule is used in the web page.
		
		An example of `webContents.printToPDF`:
		
		See Page.printToPdf for more information.
	**/
	function printToPDF(options:{ /**
		Paper orientation.`true` for landscape, `false` for portrait. Defaults to false.
	**/
	@:optional
	var landscape : Bool; /**
		Whether to display header and footer. Defaults to false.
	**/
	@:optional
	var displayHeaderFooter : Bool; /**
		Whether to print background graphics. Defaults to false.
	**/
	@:optional
	var printBackground : Bool; /**
		Scale of the webpage rendering. Defaults to 1.
	**/
	@:optional
	var scale : Float; /**
		Specify page size of the generated PDF. Can be `A0`, `A1`, `A2`, `A3`, `A4`, `A5`, `A6`, `Legal`, `Letter`, `Tabloid`, `Ledger`, or an Object containing `height` and `width` in inches. Defaults to `Letter`.
	**/
	@:optional
	var pageSize : haxe.extern.EitherType<String, electron.Size>; @:optional
	var margins : { /**
		Top margin in inches. Defaults to 1cm (~0.4 inches).
	**/
	@:optional
	var top : Float; /**
		Bottom margin in inches. Defaults to 1cm (~0.4 inches).
	**/
	@:optional
	var bottom : Float; /**
		Left margin in inches. Defaults to 1cm (~0.4 inches).
	**/
	@:optional
	var left : Float; /**
		Right margin in inches. Defaults to 1cm (~0.4 inches).
	**/
	@:optional
	var right : Float; }; /**
		Page ranges to print, e.g., '1-5, 8, 11-13'. Defaults to the empty string, which means print all pages.
	**/
	@:optional
	var pageRanges : String; /**
		HTML template for the print header. Should be valid HTML markup with following classes used to inject printing values into them: `date` (formatted print date), `title` (document title), `url` (document location), `pageNumber` (current page number) and `totalPages` (total pages in the document). For example, `<span class=title></span>` would generate span containing the title.
	**/
	@:optional
	var headerTemplate : String; /**
		HTML template for the print footer. Should use the same format as the `headerTemplate`.
	**/
	@:optional
	var footerTemplate : String; /**
		Whether or not to prefer page size as defined by css. Defaults to false, in which case the content will be scaled to fit the paper size.
	**/
	@:optional
	var preferCSSPageSize : Bool; }):js.lib.Promise<Any>;
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
		
		On Windows, if Windows Control Overlay is enabled, Devtools will be opened with `mode: 'detach'`.
	**/
	function openDevTools(?options:{ /**
		Opens the devtools with specified dock state, can be `left`, `right`, `bottom`, `undocked`, `detach`. Defaults to last used dock state. In `undocked` mode it's possible to dock back. In `detach` mode it's not.
	**/
	var mode : String; /**
		Whether to bring the opened devtools window to the foreground. The default is `true`.
	**/
	@:optional
	var activate : Bool; /**
		A title for the DevTools window (only in `undocked` or `detach` mode).
	**/
	@:optional
	var title : String; }):Void;
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
		the current title of the DevTools window. This will only be visible if DevTools is opened in `undocked` or `detach` mode.
	**/
	function getDevToolsTitle():String;
	/**
		Changes the title of the DevTools window to `title`. This will only be visible if DevTools is opened in `undocked` or `detach` mode.
	**/
	function setDevToolsTitle(title:String):Void;
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
		
		:::warning
		
		Sending non-standard JavaScript types such as DOM objects or special Electron objects will throw an exception.
		
		:::
		
		For additional reading, refer to Electron's IPC guide.
	**/
	function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Send an asynchronous message to a specific frame in a renderer process via `channel`, along with arguments. Arguments will be serialized with the Structured Clone Algorithm, just like `postMessage`, so prototype chains will not be included. Sending Functions, Promises, Symbols, WeakMaps, or WeakSets will throw an exception.
		
		> **NOTE:** Sending non-standard JavaScript types such as DOM objects or special Electron objects will throw an exception.
		
		The renderer process can handle the message by listening to `channel` with the `ipcRenderer` module.
		
		If you want to get the `frameId` of a given renderer context you should use the `webFrame.routingId` value.  E.g.
		
		You can also read `frameId` from all incoming IPC messages in the main process.
	**/
	function sendToFrame(frameId:haxe.extern.EitherType<Int, Array<Float>>, channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Send a message to the renderer process, optionally transferring ownership of zero or more `MessagePortMain` objects.
		
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
	function sendInputEvent(inputEvent:haxe.extern.EitherType<electron.MouseInputEvent, haxe.extern.EitherType<electron.MouseWheelInputEvent, electron.KeyboardInputEvent>>):Void;
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
		The path to the file being dragged.
	**/
	var file : String; /**
		The paths to the files being dragged. (`files` will override `file` field)
	**/
	@:optional
	var files : Array<String>; /**
		The image must be non-empty on macOS.
	**/
	var icon : haxe.extern.EitherType<electron.NativeImage, String>; }):Void;
	/**
		resolves if the page is saved.
	**/
	function savePage(fullPath:String, saveType:String):js.lib.Promise<Any>;
	/**
		Shows pop-up dictionary that searches the selected word on the page.
	**/
	function showDefinitionForSelection():Void;
	/**
		Indicates whether _offscreen rendering_ is enabled.
	**/
	function isOffscreen():Bool;
	/**
		If _offscreen rendering_ is enabled and not painting, start painting.
	**/
	function startPainting():Void;
	/**
		If _offscreen rendering_ is enabled and painting, stop painting.
	**/
	function stopPainting():Void;
	/**
		If _offscreen rendering_ is enabled returns whether it is currently painting.
	**/
	function isPainting():Bool;
	/**
		If _offscreen rendering_ is enabled sets the frame rate to the specified number. Only values between 1 and 240 are accepted.
	**/
	function setFrameRate(fps:Int):Void;
	/**
		If _offscreen rendering_ is enabled returns the current frame rate.
	**/
	function getFrameRate():Int;
	/**
		Schedules a full repaint of the window this web contents is in.
		
		If _offscreen rendering_ is enabled invalidates the frame and generates a new one through the `'paint'` event.
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
		The identifier of a WebContents stream. This identifier can be used with `navigator.mediaDevices.getUserMedia` using a `chromeMediaSource` of `tab`. The identifier is restricted to the web contents that it is registered to and is only valid for 10 seconds.
	**/
	function getMediaSourceId(requestWebContents:electron.main.WebContents):String;
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
	/**
		Sets the image animation policy for this webContents.  The policy only affects _new_ images, existing images that are currently being animated are unaffected. This is a known limitation in Chromium, you can force image animation to be recalculated with `img.src = img.src` which will result in no network traffic but will update the animation policy.
		
		This corresponds to the animationPolicy accessibility feature in Chromium.
	**/
	function setImageAnimationPolicy(policy:String):Void;
}
@:enum abstract WebContentsEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
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
		Emitted when the document in the top-level frame is loaded.
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
		Emitted when the page calls `window.moveTo`, `window.resizeTo` or related APIs.
		
		By default, this will move the window. To prevent that behavior, call `event.preventDefault()`.
	**/
	var content_bounds_updated : electron.main.WebContentsEvent<Void -> Void> = "content-bounds-updated";
	/**
		Emitted _after_ successful creation of a window via `window.open` in the renderer. Not emitted if the creation of the window is canceled from `webContents.setWindowOpenHandler`.
		
		See `window.open()` for more details and how to use this in conjunction with `webContents.setWindowOpenHandler`.
	**/
	var did_create_window : electron.main.WebContentsEvent<Void -> Void> = "did-create-window";
	/**
		Emitted when a user or the page wants to start navigation on the main frame. It can happen when the `window.location` object is changed or a user clicks a link in the page.
		
		This event will not emit when the navigation is started programmatically with APIs like `webContents.loadURL` and `webContents.back`.
		
		It is also not emitted for in-page navigations, such as clicking anchor links or updating the `window.location.hash`. Use `did-navigate-in-page` event for this purpose.
		
		Calling `event.preventDefault()` will prevent the navigation.
	**/
	var will_navigate : electron.main.WebContentsEvent<Void -> Void> = "will-navigate";
	/**
		Emitted when a user or the page wants to start navigation in any frame. It can happen when the `window.location` object is changed or a user clicks a link in the page.
		
		Unlike `will-navigate`, `will-frame-navigate` is fired when the main frame or any of its subframes attempts to navigate. When the navigation event comes from the main frame, `isMainFrame` will be `true`.
		
		This event will not emit when the navigation is started programmatically with APIs like `webContents.loadURL` and `webContents.back`.
		
		It is also not emitted for in-page navigations, such as clicking anchor links or updating the `window.location.hash`. Use `did-navigate-in-page` event for this purpose.
		
		Calling `event.preventDefault()` will prevent the navigation.
	**/
	var will_frame_navigate : electron.main.WebContentsEvent<Void -> Void> = "will-frame-navigate";
	/**
		Emitted when any frame (including main) starts navigating.
	**/
	var did_start_navigation : electron.main.WebContentsEvent<Void -> Void> = "did-start-navigation";
	/**
		Emitted when a server side redirect occurs during navigation.  For example a 302 redirect.
		
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
		
		**Note:** This will be emitted for `BrowserViews` but will _not_ be respected - this is because we have chosen not to tie the `BrowserView` lifecycle to its owning BrowserWindow should one exist per the specification.
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
		Emitted when an input event is sent to the WebContents. See InputEvent for details.
	**/
	var input_event : electron.main.WebContentsEvent<Void -> Void> = "input-event";
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
		Emitted when the `WebContents` loses focus.
	**/
	var blur : electron.main.WebContentsEvent<Void -> Void> = "blur";
	/**
		Emitted when the `WebContents` gains focus.
		
		Note that on macOS, having focus means the `WebContents` is the first responder of window, so switching focus between windows would not trigger the `focus` and `blur` events of `WebContents`, as the first responder of each window is not changed.
		
		The `focus` and `blur` events of `WebContents` should only be used to detect focus change between different `WebContents` and `BrowserView` in the same window.
	**/
	var focus : electron.main.WebContentsEvent<Void -> Void> = "focus";
	/**
		Emitted when a link is clicked in DevTools or 'Open in new tab' is selected for a link in its context menu.
	**/
	var devtools_open_url : electron.main.WebContentsEvent<Void -> Void> = "devtools-open-url";
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
		Emitted when a result is available for `webContents.findInPage` request.
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
		Emitted when media becomes audible or inaudible.
	**/
	var audio_state_changed : electron.main.WebContentsEvent<Void -> Void> = "audio-state-changed";
	/**
		Emitted when a page's theme color changes. This is usually due to encountering a meta tag:
	**/
	var did_change_theme_color : electron.main.WebContentsEvent<Void -> Void> = "did-change-theme-color";
	/**
		Emitted when mouse moves over a link or the keyboard moves the focus to a link.
	**/
	var update_target_url : electron.main.WebContentsEvent<Void -> Void> = "update-target-url";
	/**
		Emitted when the cursor's type changes. The `type` parameter can be `pointer`, `crosshair`, `hand`, `text`, `wait`, `help`, `e-resize`, `n-resize`, `ne-resize`, `nw-resize`, `s-resize`, `se-resize`, `sw-resize`, `w-resize`, `ns-resize`, `ew-resize`, `nesw-resize`, `nwse-resize`, `col-resize`, `row-resize`, `m-panning`, `m-panning-vertical`, `m-panning-horizontal`, `e-panning`, `n-panning`, `ne-panning`, `nw-panning`, `s-panning`, `se-panning`, `sw-panning`, `w-panning`, `move`, `vertical-text`, `cell`, `context-menu`, `alias`, `progress`, `nodrop`, `copy`, `none`, `not-allowed`, `zoom-in`, `zoom-out`, `grab`, `grabbing`, `custom`, `null`, `drag-drop-none`, `drag-drop-move`, `drag-drop-copy`, `drag-drop-link`, `ns-no-resize`, `ew-no-resize`, `nesw-no-resize`, `nwse-no-resize`, or `default`.
		
		If the `type` parameter is `custom`, the `image` parameter will hold the custom cursor image in a `NativeImage`, and `scale`, `size` and `hotspot` will hold additional information about the custom cursor.
	**/
	var cursor_changed : electron.main.WebContentsEvent<Void -> Void> = "cursor-changed";
	/**
		Emitted when there is a new context menu that needs to be handled.
	**/
	var context_menu : electron.main.WebContentsEvent<Void -> Void> = "context-menu";
	/**
		Emitted when a bluetooth device needs to be selected when a call to `navigator.bluetooth.requestDevice` is made. `callback` should be called with the `deviceId` of the device to be selected.  Passing an empty string to `callback` will cancel the request.
		
		If an event listener is not added for this event, or if `event.preventDefault` is not called when handling this event, the first available device will be automatically selected.
		
		Due to the nature of bluetooth, scanning for devices when `navigator.bluetooth.requestDevice` is called may take time and will cause `select-bluetooth-device` to fire multiple times until `callback` is called with either a device id or an empty string to cancel the request.
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
		
		See also `webContents.ipc`, which provides an `IpcMain`-like interface for responding to IPC messages specifically from this WebContents.
	**/
	var ipc_message : electron.main.WebContentsEvent<Void -> Void> = "ipc-message";
	/**
		Emitted when the renderer process sends a synchronous message via `ipcRenderer.sendSync()`.
		
		See also `webContents.ipc`, which provides an `IpcMain`-like interface for responding to IPC messages specifically from this WebContents.
	**/
	var ipc_message_sync : electron.main.WebContentsEvent<Void -> Void> = "ipc-message-sync";
	/**
		Emitted when the `WebContents` preferred size has changed.
		
		This event will only be emitted when `enablePreferredSizeMode` is set to `true` in `webPreferences`.
	**/
	var preferred_size_changed : electron.main.WebContentsEvent<Void -> Void> = "preferred-size-changed";
	/**
		Emitted when the mainFrame, an `<iframe>`, or a nested `<iframe>` is loaded within the page.
	**/
	var frame_created : electron.main.WebContentsEvent<Void -> Void> = "frame-created";
}
