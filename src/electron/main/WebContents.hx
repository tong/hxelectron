package electron.main;

import js.node.Buffer;
import js.node.events.EventEmitter;

@:enum abstract MarginsType(Int) from Int to Int {
    var _default = 0;
    var none = 1;
    var minimum = 2;
}

@:enum abstract PageSize(String) from String to String {
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

extern class WebContents extends EventEmitter<WebContents> {
    var session(default,null) : Session;
    function loadUrl( url : String, ?options : {httpReferrer:String,userAgent:String} ) : Void;
    // function loadURL( url : String, ?options : {httpReferrer:String,userAgent:String} ) : Void;
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
    function executeJavaScript( code : String, ?userGesture : Bool ) : Void;
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
    function hasServiceWorker( callback : Bool->Void ) : Void;
    function unregisterServiceWorker( callback : Bool->Void ) : Void;
    function print( ?options : {?silent:Bool,printBackground:Bool} ) : Void;
    function printToPDF( options : {marginsType:MarginsType,?pageSize:PageSize,?printBackground:Bool,?printSelectionOnly:Bool,?landscape:Bool}, callback : js.Error->Buffer->Void ) : Void;
    function addWorkSpace( path : String ) : Void;
    function removeWorkSpace( path : String ) : Void;
    function openDevTools( ?options : {detach:Bool} ) : Void;
    function closeDevTools() : Void;
    function isDevToolsOpened() : Bool;
    function toggleDevTools() : Void;
    function isDevToolsFocused() : Bool;
    function inspectElement( x : Int, y : Int ) : Void;
    function inspectServiceWorker() : Void;
    function send( channel : String, args : haxe.extern.Rest<String> ) : Void;
    function enableDeviceEmulation( parameters : {?screenPosition:ScreenPosition,?screenSize:{width:Int,height:Int},?viewPosition:{x:Int,y:Int},?deviceScaleFactor:Int,?viewSize:{width:Int,height:Int},?fitToView:Bool,?offset:{x:Float,y:Float},?scale:Float} ) : Void;
    function disableDeviceEmulation() : Void;
    function sendInputEvent(
        event : {
            type:InputEvent,modifiers:Array<InputEventModifier>,
            ?keyCode:Int,
            ?x:Int,?y:Int,?button:Button,?globalX:Int,?globalY:Int,?movementX:Int,?movementY:Int,?clickCount:Int,
            ?deltaX:Int,?deltaY:Int,?wheelTicksX:Int,?wheelTicksY:Int,?accelerationRatioX:Int,?accelerationRatioY:Int,?hasPreciseScrollingDeltas:Bool,?canScroll:Bool
        }
    ) : Void;
    function beginFrameSubscription( callback : Buffer->Void ) : Void;
    function endFrameSubscription() : Void;
    var devToolsWebContents(default,null) : WebContents;
    function savePage( fullPath : String, saveType : SaveType, callback : js.Error->Void ) : Void;
}
