/**
    API v0.37.3
**/
package electron.main;

import electron.common.NativeImage;

@:enum abstract BounceType(String) from String to String {
    var critical = "critical";
    var informational = "informational";
}

@:jsRequire("Dock")
extern class Dock {
    function bounce(?type : BounceType) : Int;
    function cancelBounce(id : Int) : Void;
    function setBadge(text : String) : Void;//OSX
    function getBadge() : String;//OSX
    function hide() : String;//OSX
    function show() : String;//OSX
    function setMenu(menu : Menu) : String;//OSX
    function setIcon(image : NativeImage) : Void;//OSX
}
