package electron.main;

@:enum abstract WindowType(String) from String to String {
    var desktop = "desktop";
    var dock = "dock";
    var toolbar = "toolbar";
    var splash = "splash";
    var notification = "notification";
}

typedef WebPreferences = {
    @:optional @:native("node-integration") var node_integration : Bool;
    @:optional var preload : String;
    @:optional var partition : String;
    @:optional @:native("zoom-factor") var zoom_factor : Float;
    @:optional var javascript : Bool;
    @:optional @:native("web-security") var web_security : Bool;
    @:optional @:native("allow-displaying-insecure-content") var allow_displaying_insecure_content : Bool;
    @:optional @:native("allow-running-insecure-content") var allow_running_insecure_content : Bool;
    @:optional var images : Bool;
    @:optional var java : Bool;
    @:optional @:native("text-areas-are-resizable") var text_areas_are_resizable : Bool;
    @:optional var webgl : Bool;
    @:optional var webaudio : Bool;
    @:optional var plugins : Bool;
    @:optional @:native("experimental-features") var experimental_features : Bool;
    @:optional @:native("experimental-canvas-features") var experimental_canvas_features : Bool;
    @:optional @:native("overlay-scrollbars") var overlay_scrollbars : Bool;
    @:optional @:native("overlay-fullscreen-video") var overlay_fullscreen_video : Bool;
    @:optional @:native("shared-worker") var shared_worker : Bool;
    @:optional @:native("direct-write") var direct_write : Bool;
    @:optional @:native("page-visibility") var page_visibility : Bool;
}

typedef BrowserWindowOptions = {
    @:optional var width : Int;
    @:optional var height : Int;
    @:optional var x : Int;
    @:optional var y : Int;
    @:native("use-content-size") @:optional var use_content_size : Bool;
    @:optional var center : Bool;
    @:native("min-width") @:optional var min_width : Bool;
    @:native("min-height") @:optional var min_height : Bool;
    @:native("max-width") @:optional var max_width : Bool;
    @:native("max-height") @:optional var max_height : Bool;
    @:optional var minWidth : Int;
    @:optional var minHeight : Int;
    @:optional var maxWidth : Int;
    @:optional var maxHeight : Int;
    @:optional var resizable : Bool;
    @:native("always-on-top") @:optional var always_on_top : Bool;
    @:optional var fullscreen : Bool;
    @:native("skip-taskbar") @:optional var skip_taskbar : Bool;
    @:optional var kiosk : Bool;
    @:optional var title : String;
    @:optional var icon : electron.common.NativeImage;
    @:optional var show : Bool;
    @:optional var frame : Bool;
    @:native("accept-first-mouse") @:optional var accept_first_mouse : Bool;
    @:native("disable-auto-hide-cursor") @:optional var disable_auto_hide_cursor : Bool;
    @:native("auto-hide-menu-bar") @:optional var auto_hide_menu_bar : Bool;
    @:native("enable-larger-than-screen") @:optional var enable_larger_than_screen : Bool;
    @:native("dark-theme") @:optional var dark_theme : Bool;
    @:optional var transparent : Bool;
    @:optional var type : WindowType;
    @:native("standard-window") @:optional var standard_window : Bool;
    @:native("title-bar-style") @:optional var title_bar_style : Bool;
    @:native("web-preferences") @:optional var web_preferences : WebPreferences;
}
