package electron.renderer;

/**
**/
@:require(js, electron) @:jsRequire("electron", "webFrame") extern class WebFrame {
	/**
		Changes the zoom factor to the specified factor. Zoom factor is zoom percent divided by 100, so 300% = 3.0.
	**/
	static function setZoomFactor(factor:Float):Void;
	static function getZoomFactor():Float;
	/**
		Changes the zoom level to the specified level. The original size is 0 and each increment above or below represents zooming 20% larger or smaller to default limits of 300% and 50% of original size, respectively.
	**/
	static function setZoomLevel(level:Float):Void;
	static function getZoomLevel():Float;
	/**
		Deprecated: Call setVisualZoomLevelLimits instead to set the visual zoom level limits. This method will be removed in Electron 2.0.
	**/
	static function setZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
	/**
		Sets the maximum and minimum pinch-to-zoom level.
	**/
	static function setVisualZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
	/**
		Sets the maximum and minimum layout-based (i.e. non-visual) zoom level.
	**/
	static function setLayoutZoomLevelLimits(minimumLevel:Float, maximumLevel:Float):Void;
	/**
		Sets a provider for spell checking in input fields and text areas. The provider must be an object that has a spellCheck method that returns whether the word passed is correctly spelled. An example of using node-spellchecker as provider:
	**/
	static function setSpellCheckProvider(language:String, autoCorrectWord:Bool, provider:{ /**
		Returns
	**/
	@:optional
	var spellCheck : haxe.Constraints.Function; }):Void;
	/**
		Registers the scheme as secure scheme. Secure schemes do not trigger mixed content warnings. For example, https and data are secure schemes because they cannot be corrupted by active network attackers.
	**/
	static function registerURLSchemeAsSecure(scheme:String):Void;
	/**
		Resources will be loaded from this scheme regardless of the current page's Content Security Policy.
	**/
	static function registerURLSchemeAsBypassingCSP(scheme:String):Void;
	/**
		Registers the scheme as secure, bypasses content security policy for resources, allows registering ServiceWorker and supports fetch API. Specify an option with the value of false to omit it from the registration. An example of registering a privileged scheme, without bypassing Content Security Policy:
	**/
	static function registerURLSchemeAsPrivileged(scheme:String, ?options:{ /**
		(optional) Default true.
	**/
	@:optional
	var secure : Bool; /**
		(optional) Default true.
	**/
	@:optional
	var bypassCSP : Bool; /**
		(optional) Default true.
	**/
	@:optional
	var allowServiceWorkers : Bool; /**
		(optional) Default true.
	**/
	@:optional
	var supportFetchAPI : Bool; /**
		(optional) Default true.
	**/
	@:optional
	var corsEnabled : Bool; }):Void;
	/**
		Inserts text to the focused element.
	**/
	static function insertText(text:String):Void;
	/**
		Evaluates code in page. In the browser window some HTML APIs like requestFullScreen can only be invoked by a gesture from the user. Setting userGesture to true will remove this limitation.
	**/
	static function executeJavaScript(code:String, ?userGesture:Bool, ?callback:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Returns an object describing usage information of Blink's internal memory caches. This will generate:
	**/
	static function getResourceUsage():{ @:optional
	var images : MemoryUsageDetails; @:optional
	var cssStyleSheets : MemoryUsageDetails; @:optional
	var xslStyleSheets : MemoryUsageDetails; @:optional
	var fonts : MemoryUsageDetails; @:optional
	var other : MemoryUsageDetails; };
	/**
		Attempts to free memory that is no longer being used (like images from a previous navigation). Note that blindly calling this method probably makes Electron slower since it will have to refill these emptied caches, you should only call it if an event in your app has occurred that makes you think your page is actually using less memory (i.e. you have navigated from a super heavy page to a mostly empty one, and intend to stay there).
	**/
	static function clearCache():Void;
}