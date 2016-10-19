package electron;
@:jsRequire("electron", "WebContents") @:require("electron") extern class WebContents extends js.node.events.EventEmitter<electron.WebContents> {
	/**
		A Integer representing the unique ID of this WebContents.
	**/
	var id : Dynamic;
	/**
		A Session object (session) used by this webContents.
	**/
	var session : Dynamic;
	/**
		A WebContents that might own this WebContents.
	**/
	var hostWebContents : Dynamic;
	/**
		A WebContents of DevTools for this WebContents. Note: Users should never store this object because it may become null when the DevTools has been closed.
	**/
	var devToolsWebContents : Dynamic;
	/**
		A Debugger instance for this webContents.
	**/
	var debugger : Dynamic;
	/**
		Loads the url in the window. The url must contain the protocol prefix, e.g. the http:// or file://. If the load should bypass http cache then use the pragma header to achieve it.
	**/
	function loadURL(url:String, ?options:{ @:optional
	var httpReferrer : String; @:optional
	var userAgent : String; @:optional
	var extraHeaders : String; }):Void;
	/**
		Initiates a download of the resource at url without navigating. The will-download event of session will be triggered.
	**/
	function downloadURL(url:String):Void;
	function getURL():String;
	function getTitle():String;
	function isDestroyed():Bool;
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
		Evaluates code in page. In the browser window some HTML APIs like requestFullScreen can only be invoked by a gesture from the user. Setting userGesture to true will remove this limitation.
	**/
	function executeJavaScript(code:String, ?userGesture:Bool, callback:haxe.Constraints.Function):Void;
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
		Sets the maximum and minimum zoom level.
	**/
	function setZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
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
	function findInPage(text:String, ?options:{ @:optional
	var forward : Bool; @:optional
	var findNext : Bool; @:optional
	var matchCase : Bool; @:optional
	var wordStart : Bool; @:optional
	var medialCapitalAsWordStart : Bool; }):Void;
	/**
		Stops any findInPage request for the webContents with the provided action.
	**/
	function stopFindInPage(action:String):Void;
	/**
		Captures a snapshot of the page within rect. Upon completion callback will be called with callback(image). The image is an instance of NativeImage that stores data of the snapshot. Omitting rect will capture the whole visible page.
	**/
	function capturePage(rect:electron.Rectangle, callback:haxe.Constraints.Function):Void;
	/**
		Checks if any ServiceWorker is registered and returns a boolean as response to callback.
	**/
	function hasServiceWorker(callback:haxe.Constraints.Function):Void;
	/**
		Unregisters any ServiceWorker if present and returns a boolean as response to callback when the JS promise is fulfilled or false when the JS promise is rejected.
	**/
	function unregisterServiceWorker(callback:haxe.Constraints.Function):Void;
	/**
		Prints window's web page. When silent is set to true, Electron will pick up system's default printer and default settings for printing. Calling window.print() in web page is equivalent to calling webContents.print({silent: false, printBackground: false}). Use page-break-before: always; CSS style to force to print to a new page.
	**/
	function print(?options:{ @:optional
	var silent : Bool; @:optional
	var printBackground : Bool; }):Void;
	/**
		Prints window's web page as PDF with Chromium's preview printing custom settings. The callback will be called with callback(error, data) on completion. The data is a Buffer that contains the generated PDF data. By default, an empty options will be regarded as: Use page-break-before: always; CSS style to force to print to a new page. An example of webContents.printToPDF:
	**/
	function printToPDF(options:{ @:optional
	var marginsType : Int; @:optional
	var pageSize : String; @:optional
	var printBackground : Bool; @:optional
	var printSelectionOnly : Bool; @:optional
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
	function openDevTools(?options:{ @:optional
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
	function send(channel:String):Void;
	/**
		Enable device emulation with the given parameters.
	**/
	function enableDeviceEmulation(parameters:{ @:optional
	var screenPosition : String; @:optional
	var screenSize : { @:optional
	var width : Int; @:optional
	var height : Int; }; @:optional
	var viewPosition : { @:optional
	var x : Int; @:optional
	var y : Int; }; @:optional
	var deviceScaleFactor : Int; @:optional
	var viewSize : { @:optional
	var width : Int; @:optional
	var height : Int; }; @:optional
	var fitToView : Bool; @:optional
	var offset : { @:optional
	var x : Float; @:optional
	var y : Float; }; @:optional
	var scale : Float; }):Void;
	/**
		Disable device emulation enabled by webContents.enableDeviceEmulation.
	**/
	function disableDeviceEmulation():Void;
	/**
		Sends an input event to the page. For keyboard events, the event object also have following properties: For mouse events, the event object also have following properties: For the mouseWheel event, the event object also have following properties:
	**/
	function sendInputEvent(event:{ @:optional
	var type : String; @:optional
	var modifiers : Array<String>; }):Void;
	/**
		Begin subscribing for presentation events and captured frames, the callback will be called with callback(frameBuffer, dirtyRect) when there is a presentation event. The frameBuffer is a Buffer that contains raw pixel data. On most machines, the pixel data is effectively stored in 32bit BGRA format, but the actual representation depends on the endianness of the processor (most modern processors are little-endian, on machines with big-endian processors the data is in 32bit ARGB format). The dirtyRect is an object with x, y, width, height properties that describes which part of the page was repainted. If onlyDirty is set to true, frameBuffer will only contain the repainted area. onlyDirty defaults to false.
	**/
	function beginFrameSubscription(onlyDirty:Bool, callback:haxe.Constraints.Function):Void;
	/**
		End subscribing for frame presentation events.
	**/
	function endFrameSubscription():Void;
	/**
		Sets the item as dragging item for current drag-drop operation, file is the absolute path of the file to be dragged, and icon is the image showing under the cursor when dragging.
	**/
	function startDrag(item:Dynamic):Void;
	/**
		Returns true if the process of saving page has been initiated successfully.
	**/
	function savePage(fullPath:String, saveType:String, callback:haxe.Constraints.Function):Void;
	/**
		Shows pop-up dictionary that searches the selected word on the page.
	**/
	function showDefinitionForSelection():Void;
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
		If offscreen rendering is enabled invalidates the frame and generates a new one through the 'paint' event.
	**/
	function invalidate():Void;
}