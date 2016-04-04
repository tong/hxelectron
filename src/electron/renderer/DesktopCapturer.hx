/**
    API v0.37.3
**/
package electron.renderer;

typedef CaptureOptions = {
    var types : Array<String>;
    @:optional var thumnailSize:{width:Int,height:Int};
}

typedef Source = {
    var id : String;
    var name : String;
    var thumbnail : electron.common.NativeImage;
}

@:jsRequire("desktop-capturer")
extern class DesktopCapturer {
    static function getSources(options:CaptureOptions, callback:js.Error->Array<Source>->Void) : Void;
}