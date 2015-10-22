package electron.main;

import js.node.events.EventEmitter;

typedef Cookie = {
    var name : String;
    var value : String;
    var domain : String;
    var host_only : Bool;
    var path : String;
    var secure : Bool;
    var http_only : Bool;
    var session : Bool;
    @:optional var expirationDate : Float;
}

typedef Cookies = {
    function get( details : {?url:String,?name:String,?domain:String,?path:String,?secure:Bool,?session:Bool}, callback : js.Error->Array<Cookie>->Void ) : Void;
    function set( details : {?url:String,?name:String,?value:String,?path:String,?secure:Bool,?session:Bool,?expirationDate:Float}, callback : js.Error->Void ) : Void;
    function remove( details : {?url:String,?name:String}, callback : js.Error->Void ) : Void;
}

@:enum abstract Storage(String) from String to String {
    var appcache = "appcache";
    var cookies = "cookies";
    var filesystem = "filesystem";
    var indexdb = "indexdb";
    var localstorage = "localstorage";
    var shadercache = "shadercache";
    var websql = "websql";
    var serviceworkers = "serviceworkers";
}

@:enum abstract Quota(String) from String to String {
    var temporary = "temporary";
    var persistent = "persistent";
    var syncable = "syncable";
}

extern class Session extends EventEmitter<Session> {
    var cookies(default,null) : Cookies;
    function clearCache() : Void;
    function clearStorageData( ?options : {origin:String,storages:Array<Storage>,quotas:Array<Quota>}, callback : Void->Void ) : Void;
    function setProxy( config : String, callback : Void->Void ) : Void;
    function setDownloadPath( path : String ) : Void;
    function enableNetworkEmulation( options : {?offline:Bool,?latency:Float,?downloadThroughput:Float,?uploadThroughput:Float} ) : Void;
    function disableNetworkEmulation() : Void;
}
