package electron.main;

import js.node.events.EventEmitter;
import electron.common.NativeImage;
import haxe.Constraints.Function;

@:enum abstract BrowserWindowEvent<T:Function>(Event<T>) to Event<T> {
    var page_title_updated : BrowserWindowEvent<Void->Void> = "page-title-updated";
    var close : BrowserWindowEvent<Void->Void> = "close";
    var closed : BrowserWindowEvent<Void->Void> = "closed";
    var unresponsive : BrowserWindowEvent<Void->Void> = "unresponsive";
    var responsive : BrowserWindowEvent<Void->Void> = "responsive";
    var blur : BrowserWindowEvent<Void->Void> = "blur";
    var focus : BrowserWindowEvent<Void->Void> = "focus";
    var maximize : BrowserWindowEvent<Void->Void> = "maximize";
    var unmaximize : BrowserWindowEvent<Void->Void> = "unmaximize";
    var minimize : BrowserWindowEvent<Void->Void> = "minimize";
    var restore : BrowserWindowEvent<Void->Void> = "restore";
    var resize : BrowserWindowEvent<Void->Void> = "resize";
    var move : BrowserWindowEvent<Void->Void> = "move";
    var enter_full_screen : BrowserWindowEvent<Void->Void> = "enter-full-screen";
    var leave_full_screen : BrowserWindowEvent<Void->Void> = "leave-full-screen";
    var enter_html_full_screen : BrowserWindowEvent<Void->Void> = "enter-html-full-screen";
    var leave_html_full_screen : BrowserWindowEvent<Void->Void> = "leave-html-full-screen";
    var app_command : BrowserWindowEvent<String->Void> = "app-command";
}

@:jsRequire("browser-window")
extern class BrowserWindow extends EventEmitter<BrowserWindow> {
    static function getAllWindows() : Array<BrowserWindow>;
    static function getFocusedWindow() : BrowserWindow;
    static function fromWebContents( webContents : WebContents ) : BrowserWindow;
    static function fromId( id : Int ) : BrowserWindow;
    static function addDevToolsExtension( path : String ) : BrowserWindow;
    static function removeDevToolsExtension( name : String ) : BrowserWindow;
    var webContents(default,null) : WebContents;
    var id(default,null) : Int;
    function new( options : BrowserWindowOptions ) : Void;
    function destroy() : Void;
    function close() : Void;
    function focus() : Void;
    function isFocused() : Bool;
    function show() : Void;
    function showInactive() : Void;
    function hide() : Void;
    function isVisible() : Bool;
    function maximize() : Void;
    function unmaximize() : Void;
    function isMaximized() : Bool;
    function restore() : Void;
    function isMinimized() : Bool;
    function setFullScreen( flag : Bool ) : Void;
    function isFullScreen( flag : Bool ) : Void;
    function setAspectRatio( aspectRatio : Float, ?extraSize : {width:Int,height:Int} ) : Void;
    function setBounds( options : {x:Int,y:Int,width:Int,height:Int} ) : Void;
    function getBounds() : {x:Int,y:Int,width:Int,height:Int};
    function setSize( width : Int, height : Int ) : Void;
    function getSize() : Array<Int>;
    function setContentSize( width : Int, height : Int ) : Void;
    function getContentSize() : Array<Int>;
    function setMinimumSize( width : Int, height : Int ) : Void;
    function getMinimumSize() : Array<Int>;
    function setMaximumSize( width : Int, height : Int ) : Void;
    function getMaximumSize() : Array<Int>;
    function setResizable( resizable : Bool ) : Void;
    function isResizable() : Bool;
    function setAlwaysOnTop( flag : Bool ) : Void;
    function isAlwaysOnTop() : Bool;
    function center() : Void;
    function setPosition( x : Int, y : Int ) : Void;
    function getPosition() : Array<Int>;
    function setTitle( title : String ) : Void;
    function getTitle() : String;
    function flashFrame( flag : Bool ) : Void;
    function setSkipTaskbar( skip : Bool ) : Void;
    function setKiosk( flag : Bool ) : Void;
    function isKiosk() : Bool;
    function setRepresentedFilename( filename : String ) : Void;
    function getRepresentedFilename() : String;
    function setDocumentEdited( edited : Bool ) : Void;
    function isDocumentEdited() : Bool;
    function focusOnWebView() : Void;
    function blurWebView() : Void;
    function capturePage( ?rect : {x:Int,y:Int,width:Int,height:Int}, callback : NativeImage->Void ) : Void;
    function print( ?options : Dynamic ) : Void; //TODO
    function printToPDF( options : Dynamic, callback : Dynamic->Void ) : Void; //TODO
    function loadUrl( url : String, ?options : Dynamic ) : Void;
    function reload() : Void;
    function setMenu( menu : Menu ) : Void;
    function setProgressBar( progress : Float ) : Void;
    function setOverlayIcon( overlay : NativeImage, description : String ) : Void;
    function setThumbarButtons( buttons : Array<{icon:NativeImage,?tooltip:Bool,?flags:Array<String>,click:Void->Void}> ) : Void; //TODO flags type
    function showDefinitionForSelection() : Void;
    function setAutoHideMenuBar( hide : Bool ) : Void;
    function isMenuBarAutoHide() : Bool;
    function setMenuBarVisibility( visible : Bool ) : Void;
    function isMenuBarVisible() : Bool;
    function setVisibleOnAllWorkspaces( visible : Bool ) : Void;
    function isVisibleOnAllWorkspaces() : Bool;
    //function on( eventType : BrowserWindowEventType, callback : Void->Void ) : Void; //TODO

    // Old API
    function openDevTools(?options : { ?detach : Bool }) : Void;
    function closeDevTools( ?options : Dynamic ) : Void;
}
