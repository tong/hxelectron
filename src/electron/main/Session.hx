/**
    API v0.37.3
**/
package electron.main;

import js.node.events.EventEmitter;

typedef Cookie = {
    var name : String;
    var value : String;
    var domain : String;
    var hostOnly : Bool;
    var path : String;
    var secure : Bool;
    var httpOnly : Bool;
    var session : Bool;
    @:optional var expirationDate : Float;
}

typedef Cookies = {
    function get( details : {?url:String,?name:String,?domain:String,?path:String,?secure:Bool,?session:Bool}, callback : js.Error->Array<Cookie>->Void ) : Void;
    function set( details : {?url:String,?name:String,?value:String,?domain:String,?path:String,?secure:Bool,?session:Bool,?expirationDate:Float}, callback : js.Error->Void ) : Void;
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

@:enum abstract SessionEvent(String) from String to String {
    var will_download = "will-download";
}

@:enum abstract Quota(String) from String to String {
    var temporary = "temporary";
    var persistent = "persistent";
    var syncable = "syncable";
}

typedef WebRequestFilter = {
    var urls : Array<String>;
}

typedef WebRequest = {
    function onBeforeRequest(?filter:WebRequestFilter, listener:{id:Int,url:String,method:String,resourceType:String,timestamp:Float,?uploadedData:Array<Data>}->({?cancel:Bool->?redirectUrl:String}->Void)->Void);
    function onBeforeSendHeaders(?filter:WebRequestFilter, listener:{id:Int,url:String,method:String,resourceType:String,timestamp:Float,requestHeaders:Dynamic}->({?cancel:Bool->?requestHeaders:Dynamic}->Void)->Void);
    function onSendHeaders(?filter:WebRequestFilter, listener:{id:Int,url:String,method:String,resourceType:String,timestamp:Float,requestHeaders:Dynamic}->Void);
    function onHeadersReceived(?filter:WebRequestFilter, listener:{id:Int,url:String,method:String,resourceType:String,timestamp:Float,statusLine:String,statusCode:Int,responseHeaders:Dynamic}->{cancel:Bool->responseHeaders:Dynamic->Void}->Void);
    function onResponseStarted(?filter:WebRequestFilter, listener:{id:Int,url:String,method:String,resourceType:String,timestamp:Float,responseHeaders:Dynamic,fromCache:Bool,statusLine:String,statusCode:Int}->Void);
    function onBeforeRedirect(?filter:WebRequestFilter, listener:{id:Int,url:String,method:String,resourceType:String,timestamp:Float,redirectURL:String,statusCode:Int,?ip:String,fromCache:Bool,responseHeaders:Dynamic}->Void);
    function onCompleted(?filter:WebRequestFilter, listener:{id:Int,url:String,method:String,resourceType:String,timestamp:Float,responseHeaders:Dynamic,fromCache:Bool,statusCode:Int,statusLine:String}->Void);
    function onErrorOccurred(?filter:WebRequestFilter, listener:{id:Int,url:String,method:String,resourceType:String,timestamp:Float,fromCache:Bool,error:String}->Void);
}

extern class Session extends EventEmitter<Session> {
    static var defaultSession(default, null) : Session;
    static function fromPartition( partition:String ) : Session;

    var cookies(default, null) : Cookies;
    var webRequest(default, null) : WebRequest;
    function getCacheSize(callback : Int->Void) : Void;
    function clearCache(callback : Void->Void) : Void;
    function clearStorageData( ?options : {origin:String,storages:Array<Storage>,quotas:Array<Quota>}, callback : Void->Void ) : Void;
    function flushStorageData() : Void;
    function setProxy( config : {pacScript:String, proxyRules:String}, callback : Void->Void ) : Void;
    function resolveProxy(url:String, callback:Void->Void) : Void;
    function setDownloadPath( path : String ) : Void;
    function enableNetworkEmulation( options : {?offline:Bool,?latency:Float,?downloadThroughput:Float,?uploadThroughput:Float} ) : Void;
    function disableNetworkEmulation() : Void;
    function setCertificateVerifyProc(proc:String->String->(Bool->Void)->Void) : Void;
    function setPermissionRequestHandler(handler:WebContents->String->(Bool->Void)->Void) : Void;
    function clearHostResolverCache(?callback:Void->Void) : Void;
}
