package electron.main;

@:enum abstract PowerSaveBlockerType(String) from String to String {
    var prevent_app_suspension = "prevent-app-suspension";
    var prevent_display_sleep = "prevent-display-sleep";
}

@:jsRequire("power-save-blocker")
extern class PowerSaveBlocker {
    static function start( type : PowerSaveBlockerType ) : Int;
    static function stop( id : Int ) : Void;
    static function isStarted( id : Int ) : Bool;
}
