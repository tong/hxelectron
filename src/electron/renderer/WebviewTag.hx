package electron.renderer;
/**
	@see http://electronjs.org/docs/api/webview-tag
**/
@:native("webviewTag") extern class WebviewTag extends js.html.Element {
	/**
		The promise will resolve when the page has finished loading (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`).
		
		Loads the `url` in the webview, the `url` must contain the protocol prefix, e.g. the `http://` or `file://`.
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
		Extra headers separated by "\n"
	**/
	@:optional
	var extraHeaders : String; @:optional
	var postData : haxe.extern.EitherType<Array<Dynamic>, haxe.extern.EitherType<Array<Dynamic>, Array<Dynamic>>>; /**
		Base url (with trailing path separator) for files to be loaded by the data url. This is needed only if the specified `url` is a data url and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):js.lib.Promise<Any>;
	/**
		Initiates a download of the resource at `url` without navigating.
	**/
	function downloadURL(url:String):Void;
	/**
		The URL of guest page.
	**/
	function getURL():String;
	/**
		The title of guest page.
	**/
	function getTitle():String;
	/**
		Whether guest page is still loading resources.
	**/
	function isLoading():Bool;
	/**
		Whether the main frame (and not just iframes or frames within it) is still loading.
	**/
	function isLoadingMainFrame():Bool;
	/**
		Whether the guest page is waiting for a first-response for the main resource of the page.
	**/
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
	/**
		Whether the guest page can go back.
	**/
	function canGoBack():Bool;
	/**
		Whether the guest page can go forward.
	**/
	function canGoForward():Bool;
	/**
		Whether the guest page can go to `offset`.
	**/
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
	/**
		Whether the renderer process has crashed.
	**/
	function isCrashed():Bool;
	/**
		Overrides the user agent for the guest page.
	**/
	function setUserAgent(userAgent:String):Void;
	/**
		The user agent for guest page.
	**/
	function getUserAgent():String;
	/**
		A promise that resolves with a key for the inserted CSS that can later be used to remove the CSS via `<webview>.removeInsertedCSS(key)`.
		
		Injects CSS into the current web page and returns a unique key for the inserted stylesheet.
	**/
	function insertCSS(css:String):js.lib.Promise<Any>;
	/**
		Resolves if the removal was successful.
		
		Removes the inserted CSS from the current web page. The stylesheet is identified by its key, which is returned from `<webview>.insertCSS(css)`.
	**/
	function removeInsertedCSS(key:String):js.lib.Promise<Any>;
	/**
		A promise that resolves with the result of the executed code or is rejected if the result of the code is a rejected promise.
		
		Evaluates `code` in page. If `userGesture` is set, it will create the user gesture context in the page. HTML APIs like `requestFullScreen`, which require user action, can take advantage of this option for automation.
	**/
	function executeJavaScript(code:String, ?userGesture:Bool):js.lib.Promise<Any>;
	/**
		Opens a DevTools window for guest page.
	**/
	function openDevTools():Void;
	/**
		Closes the DevTools window of guest page.
	**/
	function closeDevTools():Void;
	/**
		Whether guest page has a DevTools window attached.
	**/
	function isDevToolsOpened():Bool;
	/**
		Whether DevTools window of guest page is focused.
	**/
	function isDevToolsFocused():Bool;
	/**
		Starts inspecting element at position (`x`, `y`) of guest page.
	**/
	function inspectElement(x:Int, y:Int):Void;
	/**
		Opens the DevTools for the shared worker context present in the guest page.
	**/
	function inspectSharedWorker():Void;
	/**
		Opens the DevTools for the service worker context present in the guest page.
	**/
	function inspectServiceWorker():Void;
	/**
		Set guest page muted.
	**/
	function setAudioMuted(muted:Bool):Void;
	/**
		Whether guest page has been muted.
	**/
	function isAudioMuted():Bool;
	/**
		Whether audio is currently playing.
	**/
	function isCurrentlyAudible():Bool;
	/**
		Executes editing command `undo` in page.
	**/
	function undo():Void;
	/**
		Executes editing command `redo` in page.
	**/
	function redo():Void;
	/**
		Executes editing command `cut` in page.
	**/
	function cut():Void;
	/**
		Executes editing command `copy` in page.
	**/
	function copy():Void;
	/**
		Executes editing command `paste` in page.
	**/
	function paste():Void;
	/**
		Executes editing command `pasteAndMatchStyle` in page.
	**/
	function pasteAndMatchStyle():Void;
	/**
		Executes editing command `delete` in page.
	**/
	function delete():Void;
	/**
		Executes editing command `selectAll` in page.
	**/
	function selectAll():Void;
	/**
		Executes editing command `unselect` in page.
	**/
	function unselect():Void;
	/**
		Executes editing command `replace` in page.
	**/
	function replace(text:String):Void;
	/**
		Executes editing command `replaceMisspelling` in page.
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
	var matchCase : Bool; /**
		Whether to look only at the start of words. defaults to `false`.
	**/
	@:optional
	var wordStart : Bool; /**
		When combined with `wordStart`, accepts a match in the middle of a word if the match begins with an uppercase letter followed by a lowercase or non-letter. Accepts several other intra-word matches, defaults to `false`.
	**/
	@:optional
	var medialCapitalAsWordStart : Bool; }):Int;
	/**
		Stops any `findInPage` request for the `webview` with the provided `action`.
	**/
	function stopFindInPage(action:String):Void;
	/**
		Prints `webview`'s web page. Same as `webContents.print([options])`.
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
		The page range to print.
	**/
	@:optional
	var pageRanges : Record; /**
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
	var pageSize : haxe.extern.EitherType<Dynamic, Dynamic>; }):js.lib.Promise<Any>;
	/**
		Resolves with the generated PDF data.
		
		Prints `webview`'s web page as PDF, Same as `webContents.printToPDF(options)`.
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
		Specifies the type of margins to use. Uses 0 for default margin, 1 for no margin, and 2 for minimum margin. and `width` in microns.
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
		Specify page size of the generated PDF. Can be `A3`, `A4`, `A5`, `Legal`, `Letter`, `Tabloid` or an Object containing `height`
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
		Resolves with a NativeImage
		
		Captures a snapshot of the page within `rect`. Omitting `rect` will capture the whole visible page.
	**/
	function capturePage(?rect:electron.Rectangle):js.lib.Promise<Any>;
	/**
		Send an asynchronous message to renderer process via `channel`, you can also send arbitrary arguments. The renderer process can handle the message by listening to the `channel` event with the `ipcRenderer` module.
		
		See webContents.send for examples.
	**/
	function send(channel:String, args:haxe.extern.Rest<Any>):js.lib.Promise<Any>;
	/**
		Sends an input `event` to the page.
		
		See webContents.sendInputEvent for detailed description of `event` object.
	**/
	function sendInputEvent(event:haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, Dynamic>>):js.lib.Promise<Any>;
	/**
		Changes the zoom factor to the specified factor. Zoom factor is zoom percent divided by 100, so 300% = 3.0.
	**/
	function setZoomFactor(factor:Float):Void;
	/**
		Changes the zoom level to the specified level. The original size is 0 and each increment above or below represents zooming 20% larger or smaller to default limits of 300% and 50% of original size, respectively. The formula for this is `scale := 1.2 ^ level`.
	**/
	function setZoomLevel(level:Float):Void;
	/**
		the current zoom factor.
	**/
	function getZoomFactor():Float;
	/**
		the current zoom level.
	**/
	function getZoomLevel():Float;
	/**
		Sets the maximum and minimum pinch-to-zoom level.
	**/
	function setVisualZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):js.lib.Promise<Any>;
	/**
		Shows pop-up dictionary that searches the selected word on the page.
	**/
	function showDefinitionForSelection():Void;
	/**
		The WebContents ID of this `webview`.
	**/
	function getWebContentsId():Float;
}
