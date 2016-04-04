/**
    API v0.37.3
**/
package electron.main;

import js.node.Buffer;
import js.node.events.EventEmitter;

@:enum abstract MarginsType(Int) from Int to Int {
    var _default = 0;
    var none = 1;
    var minimum = 2;
}

@:enum abstract PageSize(String) from String to String {
    var A5 = "A5";
    var A4 = "A4";
    var A3 = "A3";
    var Legal = "Legal";
    var Letter = "Letter";
    var Tabloid = "Tabloid";
}

@:enum abstract ScreenPosition(String) from String to String {
    var desktop = "desktop";
    var mobile = "mobile";
}

@:enum abstract InputEvent(String) from String to String {
    var mouseDown = "mouseDown";
    var mouseUp = "mouseUp";
    var mouseEnter = "mouseEnter";
    var mouseLeave = "mouseLeave";
    var contextMenu = "contextMenu";
    var mouseWheel = "mouseWheel";
    var keyDown = "keyDown";
    var keyUp = "keyUp";
    var char = "char";
}

@:enum abstract InputEventModifier(String) from String to String {
    var shift = "shift";
    var control = "control";
    var alt = "alt";
    var meta = "meta";
    var isKeypad = "isKeypad";
    var isAutoRepeat = "isAutoRepeat";
    var leftButtonDown = "leftButtonDown";
    var middleButtonDown = "middleButtonDown";
    var rightButtonDown = "rightButtonDown";
    var capsLock = "capsLock";
    var numLock = "numLock";
    var left = "left";
    var right = "right";
}

@:enum abstract Button(String) from String to String {
    var left = "left";
    var middle = "middle";
    var right = "right";
}

@:enum abstract SaveType(String) from String to String {
    var HTMLOnly = "HTMLOnly";
    var HTMLComplete = "HTMLComplete";
    var MHTML = "MHTML";
}

@:enum abstract FindInPageAction(String) from String to String
{
    var clearSelection = "clearSelection";
    var keepSelection = "keepSelection";
    var activateSelection = "activateSelection";
}

@:enum abstract WebContentsEvent<T:Function>(Event<T>) to Event<T> {
    var did_finish_load : WebContentsEvent<Void->Void> = "did-finish-load";
    var did_fail_load : WebContentsEvent<Void->Void> = "did-fail-load";
    var did_frame_finish_load : WebContentsEvent<Void->Void> = "did-frame-finish-load";
    var did_start_loading : WebContentsEvent<Void->Void> = "did-start-loading";
    var did_stop_loading : WebContentsEvent<Void->Void> = "did-stop-loading";
    var did_get_response_details : WebContentsEvent<Void->Void> = "did-get-response-details";
    var did_get_redirect_request : WebContentsEvent<Void->Void> = "did-get-redirect-request";
    var dom_ready : WebContentsEvent<Void->Void> = "dom-ready";
    var page_favicon_updated : WebContentsEvent<Void->Void> = "page-favicon-updated";
    var new_window : WebContentsEvent<Void->Void> = "new-window";
    var will_navigate : WebContentsEvent<Void->Void> = "will-navigate";
    var did_navigate : WebContentsEvent<Void->Void> = "did-navigate";
    var did_navigate_in_page : WebContentsEvent<Void->Void> = "did-navigate-in-page";
    var crashed : WebContentsEvent<Void->Void> = "crashed";
    var plugin_crashed : WebContentsEvent<Void->Void> = "plugin-crashed";
    var destroyed : WebContentsEvent<Void->Void> = "destroyed";
    var devtools_opened : WebContentsEvent<Void->Void> = "devtools-opened";
    var devtools_closed : WebContentsEvent<Void->Void> = "devtools-closed";
    var devtools_focused : WebContentsEvent<Void->Void> = "devtools-focused";
    var certificate_error : WebContentsEvent<Void->Void> = "certificate-error";
    var select_client_certificate : WebContentsEvent<Void->Void> = "select-client-certificate";
    var login : WebContentsEvent<Void->Void> = "login";
    var found_in_page : WebContentsEvent<Void->Void> = "found-in-page";
    var media_started_played : WebContentsEvent<Void->Void> = "media-started-playing";
    var media_paused : WebContentsEvent<Void->Void> = "media-paused";
    var did_change_theme_color : WebContentsEvent<Void->Void> = "did-change-theme-color";
    var cursor_changed : WebContentsEvent<Void->Void> = "cursor-changed";
}

typedef PrintToPDFOptions = {
    marginsType:MarginsType,
    @:optional var pageSize:PageSize;
    @:optional var printBackground:Bool;
    @:optional var printSelectionOnly:Bool;
    @:optional var landscape:Bool;
}

typedef PrintOptions = {
    var silent:Bool;
    var printBackground:Bool;
}

typedef LoadURLOptions = {
    var httpReferrer:String;
    var userAgent:String;
    var extraHeaders:String;
}

extern class WebContents extends EventEmitter<WebContents> {
    var session(default,null) : Session;
    var devToolsWebContents(default,null) : WebContents;
    var hostWebContents(default, null) : WebContents;
    var devToolsWebContents(default, null) : WebContents;
    var debugger(default, null) : Debugger;

    function loadURL( url : String, ?options : LoadURLOptions ) : Void;
    function downloadURL(url : String) : Void;
    function getUrl() : String;
    function getTitle() : String;
    function isLoading() : Bool;
    function isWaitingForResponse() : Bool;
    function stop() : Void;
    function reload() : Void;
    function reloadIgnoringCache() : Void;
    function canGoBack() : Bool;
    function canGoForward() : Bool;
    function canGoToOffset( offset : Int ) : Bool;
    function clearHistory() : Void;
    function goBack() : Void;
    function goForward() : Void;
    function goToIndex( index : Int ) : Void;
    function goToOffset( offset : Int ) : Void;
    function isCrashed() : Bool;
    function setUserAgent( userAgent : String ) : Void;
    function getUserAgent() : String;
    function insertCSS( css : String ) : Void;
    function executeJavaScript( code : String, ?userGesture : Boo, ?callback:Dynamic->Void ) : Void;
    function setAudioMuted( muted : Bool ) : Void;
    function isAudioMuted() : Bool;
    function undo() : Void;
    function redo() : Void;
    function cut() : Void;
    function copy() : Void;
    function paste() : Void;
    function pasteAndMatchStyle() : Void;
    function delete() : Void;
    function selectAll() : Void;
    function unselect() : Void;
    function replace( text : String ) : Void;
    function replaceMisspelling( text : String ) : Void;
    function insertText( text:String ) : Void;
    function findInPage( text:String, ?options:{forward:Bool, findNext:Bool, matchCase:Bool, wordStart:Bool, medialCapitalAsWordStart:Bool}) : Int;
    function stopFindInPage( action:FindInPageAction ) : Void;
    function hasServiceWorker( callback : Bool->Void ) : Void;
    function unregisterServiceWorker( callback : Bool->Void ) : Void;
    function print( ?options : PrintOptions ) : Void;
    function printToPDF( options : PrintToPDFOptions, callback : js.Error->Buffer->Void ) : Void;
    function addWorkSpace( path : String ) : Void;
    function removeWorkSpace( path : String ) : Void;
    function openDevTools( ?options : {detach:Bool} ) : Void;
    function closeDevTools() : Void;
    function isDevToolsOpened() : Bool;
    function isDevToolsFocused() : Bool;
    function toggleDevTools() : Void;
    function inspectElement( x : Int, y : Int ) : Void;
    function inspectServiceWorker() : Void;
    function send( channel : String, ?args : haxe.extern.Rest<String> ) : Void;
    function enableDeviceEmulation( parameters : {?screenPosition:ScreenPosition,?screenSize:{width:Int,height:Int},?viewPosition:{x:Int,y:Int},?deviceScaleFactor:Int,?viewSize:{width:Int,height:Int},?fitToView:Bool,?offset:{x:Float,y:Float},?scale:Float} ) : Void;
    function disableDeviceEmulation() : Void;
    function sendInputEvent(
        event : {
            type:InputEvent,
            modifiers:Array<InputEventModifier>,
            ?keyCode:Int,
            ?x:Int,?y:Int,?button:Button,?globalX:Int,?globalY:Int,?movementX:Int,?movementY:Int,?clickCount:Int,
            ?deltaX:Int,?deltaY:Int,?wheelTicksX:Int,?wheelTicksY:Int,?accelerationRatioX:Int,?accelerationRatioY:Int,?hasPreciseScrollingDeltas:Bool,?canScroll:Bool
        }
    ) : Void;
    function beginFrameSubscription( callback : Buffer->Void ) : Void;
    function endFrameSubscription() : Void;
    function savePage( fullPath : String, saveType : SaveType, callback : js.Error->Void ) : Void;
}
