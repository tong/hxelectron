/**
    API v0.37.3
**/
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
    var show : BrowserWindowEvent<Void->Void> = "show";
    var hide : BrowserWindowEvent<Void->Void> = "hide";
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
    var app_command : BrowserWindowEvent<String->Void> = "app-command";//WIN
    var scroll_touch_begin : BrowserWindowEvent<String->Void> = "scroll-touch-begin";//OSX
    var scroll_touch_end : BrowserWindowEvent<String->Void> = "scroll-touch-end";//OSX
}

@:enum abstract ButtonFlags(String) from String to String{
    var enabled = "enabled";
    var disabled = "disabled";
    var dismissonclick = "dismissonclick";
    var nobackground = "nobackground";
    var hidden = "hidden";
    var noninteractive = "noninteractive";
}

@:jsRequire("browser-window")
extern class BrowserWindow extends EventEmitter<BrowserWindow> {
    static function getAllWindows() : Array<BrowserWindow>;
    static function getFocusedWindow() : BrowserWindow;
    static function fromWebContents( webContents : WebContents ) : BrowserWindow;
    static function fromId(id : Int) : BrowserWindow;
    static function addDevToolsExtension(path : String) : BrowserWindow;
    static function removeDevToolsExtension(name : String) : BrowserWindow;
    var webContents(default,null) : WebContents;
    var id(default,null) : Int;
    function new( options : BrowserWindowOptions ) : Void;
    function destroy() : Void;
    function close() : Void;
    function focus() : Void;
    function blur() : Void;
    function isFocused() : Bool;
    function show() : Void;
    function showInactive() : Void;
    function hide() : Void;
    function isVisible() : Bool;
    function maximize() : Void;
    function unmaximize() : Void;
    function isMaximized() : Bool;
    function minimize() : Void;
    function restore() : Void;
    function isMinimized() : Bool;
    function setFullScreen( flag : Bool ) : Void;
    function isFullScreen() : Bool;
    function setAspectRatio( aspectRatio : Float, ?extraSize : {width:Int,height:Int} ) : Void;//OSX
    function setBounds( options : {x:Int,y:Int,width:Int,height:Int}, ?animate:Bool ) : Void;
    function getBounds() : {x:Int,y:Int,width:Int,height:Int};
    function setSize( width : Int, height : Int, ?animate:Bool ) : Void;
    function getSize() : Array<Int>;
    function setContentSize( width : Int, height : Int, ?animate:Bool ) : Void;
    function getContentSize() : Array<Int>;
    function setMinimumSize( width : Int, height : Int ) : Void;
    function getMinimumSize() : Array<Int>;
    function setMaximumSize( width : Int, height : Int ) : Void;
    function getMaximumSize() : Array<Int>;
    function setResizable( resizable : Bool ) : Void;
    function isResizable() : Bool;
    function setMovable( movable:Bool ) : Void; //WIN, OSX
    function isMoveable() : Bool;//WIN, OSX
    function setMinimizable( minimizable:Bool ) : Void;//OSX, WIN
    function isMinimizable() : Bool; //Win, OSX
    function setMaximizable( maximizable:Bool ) : Void;//OSX, WIN
    function isMaximizable() : Bool; //Win, OSX
    function setFullScreenable( fullscreenable:Bool ) : Void;
    function isFullScreenable() : Bool;
    function setClosable( closable:Bool ) : Void; //OSX, WIN
    function isClosable() : Bool; //OSX, WIN
    function setAlwaysOnTop( flag : Bool ) : Void;
    function isAlwaysOnTop() : Bool;
    function center() : Void;
    function setPosition( x : Int, y : Int, ?animate:Bool ) : Void;
    function getPosition() : Array<Int>;
    function setTitle( title : String ) : Void;
    function getTitle() : String;
    function flashFrame( flag : Bool ) : Void;
    function setSkipTaskbar( skip : Bool ) : Void;
    function setKiosk( flag : Bool ) : Void;
    function isKiosk() : Bool;
    function getNativeWindowHandle() : js.node.Buffer;
    function hookWindowMessage( message:Int, callback:Void->Void ) : Void;//WIN
    function isWindowMessageHooked( message:Int ) : Bool;//WIN
    function unhookWindowMessage( message:Int ) : Void;//WIN
    function unhookAllWindowMessages() : Void;//WIN
    function setRepresentedFilename( filename : String ) : Void;//OSX
    function getRepresentedFilename() : String;//OSX
    function setDocumentEdited( edited : Bool ) : Void;//OSX
    function isDocumentEdited() : Bool;//OSX
    function focusOnWebView() : Void;
    function blurWebView() : Void;
    function capturePage( ?rect : {x:Int,y:Int,width:Int,height:Int}, callback : NativeImage->Void ) : Void;
    function print( ?options : WebContents.PrintOptions ) : Void;
    function printToPDF( options : WebContents.PrintToPDFOptions, callback : Dynamic->Void ) : Void;
    function loadURL( url : String, ?options : WebContents.LoadURLOptions ) : Void;
    function reload() : Void;
    function setMenu( menu : Menu ) : Void;//LIN, WIN
    function setProgressBar( progress : Float ) : Void;
    function setOverlayIcon( overlay : NativeImage, description : String ) : Void;
    function setHasShadow( value:Bool ) : Void;//OSX
    function hasShadow() : Bool;//OSX
    function setThumbarButtons( buttons : Array<{icon:NativeImage,?tooltip:Bool,?flags:Array<ButtonFlags>,click:Void->Void}> ) : Void; //TODO flags type
    function showDefinitionForSelection() : Void;//OSX
    function setAutoHideMenuBar( hide : Bool ) : Void;
    function isMenuBarAutoHide() : Bool;
    function setMenuBarVisibility( visible : Bool ) : Void;
    function isMenuBarVisible() : Bool;
    function setVisibleOnAllWorkspaces( visible : Bool ) : Void;
    function isVisibleOnAllWorkspaces() : Bool;
    function setIgnoreMouseEvents( ignore:Bool ) : Void;
}
