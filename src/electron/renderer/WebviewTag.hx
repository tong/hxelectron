package electron.renderer;
/**
	Display external web content in an isolated frame and process.
	@see http://electronjs.org/docs/api/webview-tag
**/
@:native("webviewTag") extern class WebviewTag extends js.html.Element {
	/**
		Returns the visible URL. Writing to this attribute initiates top-level navigation. Assigning src its own value will reload the current page. The src attribute can also accept data URLs, such as data:text/plain,Hello, world!.
	**/
	var src : Dynamic;
	/**
		When this attribute is present the webview container will automatically resize within the bounds specified by the attributes minwidth, minheight, maxwidth, and maxheight. These constraints do not impact the webview unless autosize is enabled. When autosize is enabled, the webview container size cannot be less than the minimum values or greater than the maximum.
	**/
	var autosize : Dynamic;
	/**
		When this attribute is present the guest page in webview will have node integration and can use node APIs like require and process to access low level system resources. Node integration is disabled by default in the guest page.
	**/
	var nodeintegration : Dynamic;
	/**
		When this attribute is false the guest page in webview will not have access to the remote module. The remote module is avaiable by default.
	**/
	var enableremotemodule : Dynamic;
	/**
		When this attribute is present the guest page in webview will be able to use browser plugins. Plugins are disabled by default.
	**/
	var plugins : Dynamic;
	/**
		Specifies a script that will be loaded before other scripts run in the guest page. The protocol of script's URL must be either file: or asar:, because it will be loaded by require in guest page under the hood. When the guest page doesn't have node integration this script will still have access to all Node APIs, but global objects injected by Node will be deleted after this script has finished executing. Note: This option will be appear as preloadURL (not preload) in the webPreferences specified to the will-attach-webview event.
	**/
	var preload : Dynamic;
	/**
		Sets the referrer URL for the guest page.
	**/
	var httpreferrer : Dynamic;
	/**
		Sets the user agent for the guest page before the page is navigated to. Once the page is loaded, use the setUserAgent method to change the user agent.
	**/
	var useragent : Dynamic;
	/**
		When this attribute is present the guest page will have web security disabled. Web security is enabled by default.
	**/
	var disablewebsecurity : Dynamic;
	/**
		Sets the session used by the page. If partition starts with persist:, the page will use a persistent session available to all pages in the app with the same partition. if there is no persist: prefix, the page will use an in-memory session. By assigning the same partition, multiple pages can share the same session. If the partition is unset then default session of the app will be used. This value can only be modified before the first navigation, since the session of an active renderer process cannot change. Subsequent attempts to modify the value will fail with a DOM exception.
	**/
	var partition : Dynamic;
	/**
		When this attribute is present the guest page will be allowed to open new windows. Popups are disabled by default.
	**/
	var allowpopups : Dynamic;
	/**
		A list of strings which specifies the web preferences to be set on the webview, separated by ,. The full list of supported preference strings can be found in BrowserWindow. The string follows the same format as the features string in window.open. A name by itself is given a true boolean value. A preference can be set to another value by including an =, followed by the value. Special values yes and 1 are interpreted as true, while no and 0 are interpreted as false.
	**/
	var webpreferences : Dynamic;
	/**
		A list of strings which specifies the blink features to be enabled separated by ,. The full list of supported feature strings can be found in the RuntimeEnabledFeatures.json5 file.
	**/
	var enableblinkfeatures : Dynamic;
	/**
		A list of strings which specifies the blink features to be disabled separated by ,. The full list of supported feature strings can be found in the RuntimeEnabledFeatures.json5 file.
	**/
	var disableblinkfeatures : Dynamic;
	/**
		Loads the url in the webview, the url must contain the protocol prefix, e.g. the http:// or file://.
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
		Extra headers separated by "\n"
	**/
	@:optional
	var extraHeaders : String; @:optional
	var postData : haxe.extern.EitherType<Array<electron.UploadRawData>, haxe.extern.EitherType<Array<electron.UploadFile>, Array<electron.UploadBlob>>>; /**
		Base url (with trailing path separator) for files to be loaded by the data url. This is needed only if the specified url is a data url and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):Void;
	/**
		Initiates a download of the resource at url without navigating.
	**/
	function downloadURL(url:String):Void;
	function getURL():String;
	function getTitle():String;
	function isLoading():Bool;
	function isLoadingMainFrame():Bool;
	function isWaitingForResponse():Bool;
	/**
		Stops any pending navigation.
	**/
	function stop():Void;
	/**
		Reloads the guest page.
	**/
	function reload():Void;
	/**
		Reloads the guest page and ignores cache.
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
		Makes the guest page go back.
	**/
	function goBack():Void;
	/**
		Makes the guest page go forward.
	**/
	function goForward():Void;
	/**
		Navigates to the specified absolute index.
	**/
	function goToIndex(index:Int):Void;
	/**
		Navigates to the specified offset from the "current entry".
	**/
	function goToOffset(offset:Int):Void;
	function isCrashed():Bool;
	/**
		Overrides the user agent for the guest page.
	**/
	function setUserAgent(userAgent:String):Void;
	function getUserAgent():String;
	/**
		Injects CSS into the guest page.
	**/
	function insertCSS(css:String):Void;
	/**
		Evaluates code in page. If userGesture is set, it will create the user gesture context in the page. HTML APIs like requestFullScreen, which require user action, can take advantage of this option for automation.
	**/
	function executeJavaScript(code:String, ?userGesture:Bool, ?callback:haxe.Constraints.Function):Void;
	/**
		Opens a DevTools window for guest page.
	**/
	function openDevTools():Void;
	/**
		Closes the DevTools window of guest page.
	**/
	function closeDevTools():Void;
	function isDevToolsOpened():Bool;
	function isDevToolsFocused():Bool;
	/**
		Starts inspecting element at position (x, y) of guest page.
	**/
	function inspectElement(x:Int, y:Int):Void;
	/**
		Opens the DevTools for the service worker context present in the guest page.
	**/
	function inspectServiceWorker():Void;
	/**
		Set guest page muted.
	**/
	function setAudioMuted(muted:Bool):Void;
	function isAudioMuted():Bool;
	function isCurrentlyAudible():Bool;
	/**
		Executes editing command undo in page.
	**/
	function undo():Void;
	/**
		Executes editing command redo in page.
	**/
	function redo():Void;
	/**
		Executes editing command cut in page.
	**/
	function cut():Void;
	/**
		Executes editing command copy in page.
	**/
	function copy():Void;
	/**
		Executes editing command paste in page.
	**/
	function paste():Void;
	/**
		Executes editing command pasteAndMatchStyle in page.
	**/
	function pasteAndMatchStyle():Void;
	/**
		Executes editing command delete in page.
	**/
	function delete():Void;
	/**
		Executes editing command selectAll in page.
	**/
	function selectAll():Void;
	/**
		Executes editing command unselect in page.
	**/
	function unselect():Void;
	/**
		Executes editing command replace in page.
	**/
	function replace(text:String):Void;
	/**
		Executes editing command replaceMisspelling in page.
	**/
	function replaceMisspelling(text:String):Void;
	/**
		Inserts text to the focused element.
	**/
	function insertText(text:String):Void;
	/**
		Starts a request to find all matches for the text in the web page. The result of the request can be obtained by subscribing to found-in-page event.
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
	var medialCapitalAsWordStart : Bool; }):Int;
	/**
		Stops any findInPage request for the webview with the provided action.
	**/
	function stopFindInPage(action:String):Void;
	/**
		Prints webview's web page. Same as webContents.print([options]).
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
		Prints webview's web page as PDF, Same as webContents.printToPDF(options, callback).
	**/
	function printToPDF(options:{ /**
		Specifies the type of margins to use. Uses 0 for default margin, 1 for no margin, and 2 for minimum margin.
	**/
	@:optional
	var marginsType : Int; /**
		Specify page size of the generated PDF. Can be A3, A4, A5, Legal, Letter, Tabloid or an Object containing height and width in microns.
	**/
	@:optional
	var pageSize : haxe.extern.EitherType<String, electron.Size>; /**
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
		Captures a snapshot of the webview's page. Same as webContents.capturePage([rect, ]callback).
	**/
	function capturePage(?rect:electron.Rectangle, callback:haxe.Constraints.Function):Void;
	/**
		Send an asynchronous message to renderer process via channel, you can also send arbitrary arguments. The renderer process can handle the message by listening to the channel event with the ipcRenderer module. See webContents.send for examples.
	**/
	function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Sends an input event to the page. See webContents.sendInputEvent for detailed description of event object.
	**/
	function sendInputEvent(event:Any):Void;
	/**
		Changes the zoom factor to the specified factor. Zoom factor is zoom percent divided by 100, so 300% = 3.0.
	**/
	function setZoomFactor(factor:Float):Void;
	/**
		Changes the zoom level to the specified level. The original size is 0 and each increment above or below represents zooming 20% larger or smaller to default limits of 300% and 50% of original size, respectively. The formula for this is scale := 1.2 ^ level.
	**/
	function setZoomLevel(level:Float):Void;
	/**
		Sends a request to get current zoom factor, the callback will be called with callback(zoomFactor).
	**/
	function getZoomFactor(callback:haxe.Constraints.Function):Void;
	/**
		Sends a request to get current zoom level, the callback will be called with callback(zoomLevel).
	**/
	function getZoomLevel(callback:haxe.Constraints.Function):Void;
	/**
		Sets the maximum and minimum pinch-to-zoom level.
	**/
	function setVisualZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
	/**
		Sets the maximum and minimum layout-based (i.e. non-visual) zoom level.
	**/
	function setLayoutZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
	/**
		Shows pop-up dictionary that searches the selected word on the page.
	**/
	@:electron_platforms(["macOS"])
	function showDefinitionForSelection():Void;
	/**
		It depends on the remote module, it is therefore not available when this module is disabled.
	**/
	function getWebContents():electron.main.WebContents;
}
