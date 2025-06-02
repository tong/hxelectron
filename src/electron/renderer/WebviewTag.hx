package electron.renderer;
/**
	
	
	### Warning
	
	Electron's `webview` tag is based on Chromium's `webview`, which is undergoing dramatic architectural changes. This impacts the stability of `webviews`, including rendering, navigation, and event routing. We currently recommend to not use the `webview` tag and to consider alternatives, like `iframe`, a `WebContentsView`, or an architecture that avoids embedded content altogether.
	
	### Enabling
	
	By default the `webview` tag is disabled in Electron >= 5.  You need to enable the tag by setting the `webviewTag` webPreferences option when constructing your `BrowserWindow`. For more information see the BrowserWindow constructor docs.
	
	### Overview
	
	> Display external web content in an isolated frame and process.
	
	Process: Renderer
	 _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._
	
	Use the `webview` tag to embed 'guest' content (such as web pages) in your Electron app. The guest content is contained within the `webview` container. An embedded page within your app controls how the guest content is laid out and rendered.
	
	Unlike an `iframe`, the `webview` runs in a separate process than your app. It doesn't have the same permissions as your web page and all interactions between your app and embedded content will be asynchronous. This keeps your app safe from the embedded content.
	
	> [!NOTE] Most methods called on the webview from the host page require a synchronous call to the main process.
	
	### Example
	
	To embed a web page in your app, add the `webview` tag to your app's embedder page (this is the app page that will display the guest content). In its simplest form, the `webview` tag includes the `src` of the web page and css styles that control the appearance of the `webview` container:
	
	```
	<webview id="foo" src="https://www.github.com/" style="display:inline-flex; width:640px; height:480px"></webview>
	```
	
	If you want to control the guest content in any way, you can write JavaScript that listens for `webview` events and responds to those events using the `webview` methods. Here's sample code with two event listeners: one that listens for the web page to start loading, the other for the web page to stop loading, and displays a "loading..." message during the load time:
	
	```
	<script>
	  onload = () => {
	    const webview = document.querySelector('webview')
	    const indicator = document.querySelector('.indicator')
	
	    const loadstart = () => {
	      indicator.innerText = 'loading...'
	    }
	
	    const loadstop = () => {
	      indicator.innerText = ''
	    }
	
	    webview.addEventListener('did-start-loading', loadstart)
	    webview.addEventListener('did-stop-loading', loadstop)
	  }
	</script>
	```
	
	### Internal implementation
	
	Under the hood `webview` is implemented with Out-of-Process iframes (OOPIFs). The `webview` tag is essentially a custom element using shadow DOM to wrap an `iframe` element inside it.
	
	So the behavior of `webview` is very similar to a cross-domain `iframe`, as examples:
	
	* When clicking into a `webview`, the page focus will move from the embedder frame to `webview`.
	* You can not add keyboard, mouse, and scroll event listeners to `webview`.
	* All reactions between the embedder frame and `webview` are asynchronous.
	
	### CSS Styling Notes
	
	Please note that the `webview` tag's style uses `display:flex;` internally to ensure the child `iframe` element fills the full height and width of its `webview` container when used with traditional and flexbox layouts. Please do not overwrite the default `display:flex;` CSS property, unless specifying `display:inline-flex;` for inline layout.
	
	### Tag Attributes
	
	The `webview` tag has the following attributes:
	
	### `src`
	
	```
	<webview src="https://www.github.com/"></webview>
	```
	
	A `string` representing the visible URL. Writing to this attribute initiates top-level navigation.
	
	Assigning `src` its own value will reload the current page.
	
	The `src` attribute can also accept data URLs, such as `data:text/plain,Hello, world!`.
	
	### `nodeintegration`
	
	```
	<webview src="https://www.google.com/" nodeintegration></webview>
	```
	
	A `boolean`. When this attribute is present the guest page in `webview` will have node integration and can use node APIs like `require` and `process` to access low level system resources. Node integration is disabled by default in the guest page.
	
	### `nodeintegrationinsubframes`
	
	```
	<webview src="https://www.google.com/" nodeintegrationinsubframes></webview>
	```
	
	A `boolean` for the experimental option for enabling NodeJS support in sub-frames such as iframes inside the `webview`. All your preloads will load for every iframe, you can use `process.isMainFrame` to determine if you are in the main frame or not. This option is disabled by default in the guest page.
	
	### `plugins`
	
	```
	<webview src="https://www.github.com/" plugins></webview>
	```
	
	A `boolean`. When this attribute is present the guest page in `webview` will be able to use browser plugins. Plugins are disabled by default.
	
	### `preload`
	
	```
	<!-- from a file -->
	<webview src="https://www.github.com/" preload="./test.js"></webview>
	<!-- or if you want to load from an asar archive -->
	<webview src="https://www.github.com/" preload="./app.asar/test.js"></webview>
	```
	
	A `string` that specifies a script that will be loaded before other scripts run in the guest page. The protocol of script's URL must be `file:` (even when using `asar:` archives) because it will be loaded by Node's `require` under the hood, which treats `asar:` archives as virtual directories.
	
	When the guest page doesn't have node integration this script will still have access to all Node APIs, but global objects injected by Node will be deleted after this script has finished executing.
	
	### `httpreferrer`
	
	```
	<webview src="https://www.github.com/" httpreferrer="https://example.com/"></webview>
	```
	
	A `string` that sets the referrer URL for the guest page.
	
	### `useragent`
	
	```
	<webview src="https://www.github.com/" useragent="Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko"></webview>
	```
	
	A `string` that sets the user agent for the guest page before the page is navigated to. Once the page is loaded, use the `setUserAgent` method to change the user agent.
	
	### `disablewebsecurity`
	
	```
	<webview src="https://www.github.com/" disablewebsecurity></webview>
	```
	
	A `boolean`. When this attribute is present the guest page will have web security disabled. Web security is enabled by default.
	
	This value can only be modified before the first navigation.
	
	### `partition`
	
	```
	<webview src="https://github.com" partition="persist:github"></webview>
	<webview src="https://electronjs.org" partition="electron"></webview>
	```
	
	A `string` that sets the session used by the page. If `partition` starts with `persist:`, the page will use a persistent session available to all pages in the app with the same `partition`. if there is no `persist:` prefix, the page will use an in-memory session. By assigning the same `partition`, multiple pages can share the same session. If the `partition` is unset then default session of the app will be used.
	
	This value can only be modified before the first navigation, since the session of an active renderer process cannot change. Subsequent attempts to modify the value will fail with a DOM exception.
	
	### `allowpopups`
	
	```
	<webview src="https://www.github.com/" allowpopups></webview>
	```
	
	A `boolean`. When this attribute is present the guest page will be allowed to open new windows. Popups are disabled by default.
	
	### `webpreferences`
	
	```
	<webview src="https://github.com" webpreferences="allowRunningInsecureContent, javascript=no"></webview>
	```
	
	A `string` which is a comma separated list of strings which specifies the web preferences to be set on the webview. The full list of supported preference strings can be found in BrowserWindow.
	
	The string follows the same format as the features string in `window.open`. A name by itself is given a `true` boolean value. A preference can be set to another value by including an `=`, followed by the value. Special values `yes` and `1` are interpreted as `true`, while `no` and `0` are interpreted as `false`.
	
	### `enableblinkfeatures`
	
	```
	<webview src="https://www.github.com/" enableblinkfeatures="PreciseMemoryInfo, CSSVariables"></webview>
	```
	
	A `string` which is a list of strings which specifies the blink features to be enabled separated by `,`. The full list of supported feature strings can be found in the RuntimeEnabledFeatures.json5 file.
	
	### `disableblinkfeatures`
	
	```
	<webview src="https://www.github.com/" disableblinkfeatures="PreciseMemoryInfo, CSSVariables"></webview>
	```
	
	A `string` which is a list of strings which specifies the blink features to be disabled separated by `,`. The full list of supported feature strings can be found in the RuntimeEnabledFeatures.json5 file.
	@see https://electronjs.org/docs/api/webview-tag
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
	var httpReferrer : haxe.extern.EitherType<String, electron.Referrer>; /**
		A user agent originating the request.
	**/
	@:optional
	var userAgent : String; /**
		Extra headers separated by "\n"
	**/
	@:optional
	var extraHeaders : String; @:optional
	var postData : Array<haxe.extern.EitherType<electron.UploadRawData, electron.UploadFile>>; /**
		Base url (with trailing path separator) for files to be loaded by the data url. This is needed only if the specified `url` is a data url and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):js.lib.Promise<Any>;
	/**
		Initiates a download of the resource at `url` without navigating.
	**/
	function downloadURL(url:String, ?options:{ /**
		HTTP request headers.
	**/
	@:optional
	var headers : Record; }):Void;
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
		Centers the current text selection in page.
	**/
	function centerSelection():Void;
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
		Scrolls to the top of the current `<webview>`.
	**/
	function scrollToTop():Void;
	/**
		Scrolls to the bottom of the current `<webview>`.
	**/
	function scrollToBottom():Void;
	/**
		Adjusts the current text selection starting and ending points in the focused frame by the given amounts. A negative amount moves the selection towards the beginning of the document, and a positive amount moves the selection towards the end of the document.
		
		See `webContents.adjustSelection` for examples.
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
		Whether to begin a new text finding session with this request. Should be `true` for initial requests, and `false` for follow-up requests. Defaults to `false`.
	**/
	@:optional
	var findNext : Bool; /**
		Whether search should be case-sensitive, defaults to `false`.
	**/
	@:optional
	var matchCase : Bool; }):Int;
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
		Specify page size of the printed document. Can be `A3`, `A4`, `A5`, `Legal`, `Letter`, `Tabloid` or an Object containing `height` in microns.
	**/
	@:optional
	var pageSize : haxe.extern.EitherType<String, electron.Size>; }):js.lib.Promise<Any>;
	/**
		Resolves with the generated PDF data.
		
		Prints `webview`'s web page as PDF, Same as `webContents.printToPDF(options)`.
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
	var preferCSSPageSize : Bool; /**
		Whether or not to generate a tagged (accessible) PDF. Defaults to false. As this property is experimental, the generated PDF may not adhere fully to PDF/UA and WCAG standards.
	**/
	@:optional
	var generateTaggedPDF : Bool; /**
		Whether or not to generate a PDF document outline from content headers. Defaults to false.
	**/
	@:optional
	var generateDocumentOutline : Bool; }):js.lib.Promise<Any>;
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
		Send an asynchronous message to renderer process via `channel`, you can also send arbitrary arguments. The renderer process can handle the message by listening to the `channel` event with the `ipcRenderer` module.
		
		See webContents.sendToFrame for examples.
	**/
	function sendToFrame(frameId:Array<Float>, channel:String, args:haxe.extern.Rest<Any>):js.lib.Promise<Any>;
	/**
		Sends an input `event` to the page.
		
		See webContents.sendInputEvent for detailed description of `event` object.
	**/
	function sendInputEvent(event:haxe.extern.EitherType<electron.MouseInputEvent, haxe.extern.EitherType<electron.MouseWheelInputEvent, electron.KeyboardInputEvent>>):js.lib.Promise<Any>;
	/**
		Changes the zoom factor to the specified factor. Zoom factor is zoom percent divided by 100, so 300% = 3.0.
	**/
	function setZoomFactor(factor:Float):Void;
	/**
		Changes the zoom level to the specified level. The original size is 0 and each increment above or below represents zooming 20% larger or smaller to default limits of 300% and 50% of original size, respectively. The formula for this is `scale := 1.2 ^ level`.
		
		> [!NOTE] The zoom policy at the Chromium level is same-origin, meaning that the zoom level for a specific domain propagates across all instances of windows with the same domain. Differentiating the window URLs will make zoom work per-window.
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
