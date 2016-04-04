/**
    API v0.37.3
**/
package electron.main;

import electron.common.NativeImage;

@:enum abstract WindowType(String) from String to String {
    var desktop = "desktop";
    var dock = "dock";
    var toolbar = "toolbar";
    var splash = "splash";
    var notification = "notification";
    var textured = "textured";
}

@:enum abstract TitleBarStyle(String) from String to String {
    var default = "default";
    var hidden = "hidden";
    @:native("hidden-inset") var hidden_inset = "hidden-inset";
}

typedef FontFamily = {
    @:optional var standard : String;
    @:optional var serif : String;
    @:optional var sansSerif : String;
    @:optional var monospace : String;
}

typedef WebPreferences = {
    @:optional var nodeIntegration : Bool;
    @:optional var preload : String;
    @:optional var session : Session;
    @:optional var partition : String;
    @:optional var zoomFactor : Float;
    @:optional var javascript : Bool;
    @:optional var webSecurity : Bool;
    @:optional var allowDisplayingInsecureContent : Bool;
    @:optional var allowRunningInsecureContent : Bool;
    @:optional var images : Bool;
    @:optional var textAreasAreResizable : Bool;
    @:optional var webgl : Bool;
    @:optional var webaudio : Bool;
    @:optional var plugins : Bool;
    @:optional var experimentalFeatures : Bool;
    @:optional var experimentalCanvasFeatures : Bool;
    @:optional var directWrite : Bool;
    @:optional var blinkFeatures : String;
    @:optional var defaultFontFamily : FontFamily;
    @:optional var defaultFontSize : Int;
    @:optional var defaultMonospaceFontSize : Int;
    @:optional var minimumFontSize : Int;
    @:optional var defaultEncoding : String;
}

typedef BrowserWindowOptions = {
    @:optional var width : Int;
    @:optional var height : Int;
    @:optional var x : Int;
    @:optional var y : Int;
    @:optional var useContentSize : Bool;
    @:optional var center : Bool;
    @:optional var minWidth : Int;
    @:optional var minHeight : Int;
    @:optional var maxWidth : Int;
    @:optional var maxHeight : Int;
    @:optional var resizable : Bool;
    @:optional var movable : Bool;
    @:optional var minimizable : Bool;
    @:optional var maximizable : Bool;
    @:optional var closable : Bool;
    @:optional var alwaysOnTop : Bool;
    @:optional var fullscreen : Bool;
    @:optional var fullscreenable : Bool;
    @:optional var skipTaskbar : Bool;
    @:optional var kiosk : Bool;
    @:optional var title : String;
    @:optional var icon : NativeImage;
    @:optional var show : Bool;
    @:optional var frame : Bool;
    @:optional var acceptFirstMouse : Bool;
    @:optional var disableAutoHideCursor : Bool;
    @:optional var autoHideMenuBar : Bool;
    @:optional var enableLargerThanScreen : Bool;
    @:optional var backgroundColor : String;
    @:optional var hasShadow : Bool;
    @:optional var darkTheme : Bool;
    @:optional var transparent : Bool;
    @:optional var type : WindowType;
    @:optional var titleBarStyle : TitleBarStyle;
    @:optional var webPreferences : WebPreferences;
}
