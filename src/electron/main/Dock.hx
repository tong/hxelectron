package electron.main;

@:enum abstract BounceType(String) from String to String {
    var critical = "critical";
    var informational = "informational";
}

@:jsRequire("Dock")
extern class Dock {
    function bounce( ?type : BounceType ) : Void;
    function cancelBounce( id : Int ) : Void;
    function setBadge( text : String ) : Void;
    function getBadge() : String;
    function hide() : String;
    function show() : String;
    function setMenu( menu : Dynamic ) : String; //TODO
}
