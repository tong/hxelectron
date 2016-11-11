package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "WebContents") extern class WebContents extends js.node.events.EventEmitter<electron.main.WebContents> {
	/**
		A Integer representing the unique ID of this WebContents.
	**/
	var id : Int;
	/**
		A Session object (session) used by this webContents.
	**/
	var session : Session;
	/**
		A WebContents that might own this WebContents.
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
		Evaluates code in page. In the browser window some HTML APIs like requestFullScreen can only be invoked by a gesture from the user. Setting userGesture to true will remove this limitation. If the result of the executed code is a promise the callback result will be the resolved value of the promise.  We recommend that you use the returned Promise to handle code that results in a Promise.
	**/
	function executeJavaScript(code:String, ?userGesture:Bool, ?callback:haxe.Constraints.Function):js.Promise<Dynamic>;
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
	function findInPage(text:String, ?options:{ /**
		Whether to search forward or backward, defaults to .
	**/
	@:optional
	var forward : Bool; /**
		Whether the operation is first request or a follow up, defaults to .
	**/
	@:optional
	var findNext : Bool; /**
		Whether search should be case-sensitive, defaults to .
	**/
	@:optional
	var matchCase : Bool; /**
		Whether to look only at the start of words. defaults to .
	**/
	@:optional
	var wordStart : Bool; /**
		When combined with , accepts a match in the middle of a word if the match begins with an uppercase letter followed by a lowercase or non-letter. Accepts several other intra-word matches, defaults to .
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
		Prints window's web page. When silent is set to true, Electron will pick up system's default printer and default settings for printing. Calling window.print() in web page is equivalent to calling webContents.print({silent: false, printBackground: false}). Use page-break-before: always; CSS style to force to print to a new page.
	**/
	function print(?options:{ /**
		Don't ask user for print settings. Default is .
	**/
	@:optional
	var silent : Bool; /**
		Also prints the background color and image of the web page. Default is .
	**/
	@:optional
	var printBackground : Bool; }):Void;
	/**
		Prints window's web page as PDF with Chromium's preview printing custom settings. The callback will be called with callback(error, data) on completion. The data is a Buffer that contains the generated PDF data. By default, an empty options will be regarded as: Use page-break-before: always; CSS style to force to print to a new page. An example of webContents.printToPDF:
	**/
	function printToPDF(options:{ /**
		Specifies the type of margins to use. Uses 0 for default margin, 1 for no margin, and 2 for minimum margin.
	**/
	@:optional
	var marginsType : Int; /**
		Specify page size of the generated PDF. Can be , , , , , or an Object containing and in microns.
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
		for landscape, for portrait.
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
		Opens the devtools with specified dock state, can be , , , . Defaults to last used dock state. In mode it's possible to dock back. In mode it's not.
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
	function send(channel:String):Void;
	/**
		Enable device emulation with the given parameters.
	**/
	function enableDeviceEmulation(parameters:{ /**
		Specify the screen type to emulate (default: )
	**/
	@:optional
	var screenPosition : String; /**
		Set the emulated screen size (screenPosition == mobile)
	**/
	@:optional
	var screenSize : { /**
		Set the emulated screen width
	**/
	@:optional
	var width : Int; /**
		Set the emulated screen height
	**/
	@:optional
	var height : Int; }; /**
		Position the view on the screen (screenPosition == mobile) (default: )
	**/
	@:optional
	var viewPosition : { /**
		Set the x axis offset from top left corner
	**/
	@:optional
	var x : Int; /**
		Set the y axis offset from top left corner
	**/
	@:optional
	var y : Int; }; /**
		Set the device scale factor (if zero defaults to original device scale factor) (default: )
	**/
	@:optional
	var deviceScaleFactor : Int; /**
		Set the emulated view size (empty means no override)
	**/
	@:optional
	var viewSize : { /**
		Set the emulated view width
	**/
	@:optional
	var width : Int; /**
		Set the emulated view height
	**/
	@:optional
	var height : Int; }; /**
		Whether emulated view should be scaled down if necessary to fit into available space (default: )
	**/
	@:optional
	var fitToView : Bool; /**
		Offset of the emulated view inside available space (not in fit to view mode) (default: )
	**/
	@:optional
	var offset : { /**
		Set the x axis offset from top left corner
	**/
	@:optional
	var x : Float; /**
		Set the y axis offset from top left corner
	**/
	@:optional
	var y : Float; }; /**
		Scale of emulated view inside available space (not in fit to view mode) (default: )
	**/
	@:optional
	var scale : Float; }):Void;
	/**
		Disable device emulation enabled by webContents.enableDeviceEmulation.
	**/
	function disableDeviceEmulation():Void;
	/**
		Sends an input event to the page. For keyboard events, the event object also have following properties: For mouse events, the event object also have following properties: For the mouseWheel event, the event object also have following properties:
	**/
	function sendInputEvent(event:{ /**
		() - The type of the event, can be , , , , , , , , , .
	**/
	@:optional
	var type : String; /**
		An array of modifiers of the event, can include , , , , , , , , , , , , .
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
	function startDrag(item:{ @:optional
	var file : String; @:optional
	var icon : NativeImage; }):Void;
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