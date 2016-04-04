/**
  API v0.37.3
**/
package electron.main;

import js.node.events.EventEmitter;
import npm.common.Callback;

typedef Data = {
  var bytes : js.node.Buffer;
  var file : String;
}

typedef RequestObject = {
  var url : String;
  var referrer : String;
  var method : String;
  @:optional var uploadedData : Array<Data>;
}

typedef RedirectRequestObject = {
  var url : String;
  var method : String;
  @:optional var session : Session;
  @:optional var uploadedData : {contentType:String, data:String};
}


@:jsRequire("protocol")
extern class Protocol {
  // TODO check types and callbacks
    static function registerStandardSchemes( schemes : Array<String> ) : Void;
    static function registerServiceWorkerSchemes( schemes : Array<String> ) : Void;
    static function registerFileProtocol( scheme : Array<String>, handler : RequestObject->(Dynamic->Void)->Void, ?completion : Dynamic->Void ) : Void;
    static function registerBufferProtocol( scheme : Array<String>, handler : RequestObject->(Dynamic->Void)->Void, ?completion : Void->Void ) : js.node.Buffer;
    static function registerStringProtocol( scheme : Array<String>, handler : RequestObject->(Dynamic->Void)->Void, ?completion : Void->Void ) : String;
    static function registerHttpProtocol( scheme : Array<String>, handler : RedirectRequestObject->(Dynamic->Void)->Void, ?completion : Void->Void ) : Void;
    static function unregisterProtocol(scheme : String, ?callback : Void->Void) : Void;
    static function isProtocolHandled(scheme : String, callback : Callback<Bool>) : Void;
    static function interceptFileProtocol(scheme : String, handler : Void -> String, ?callback : Void -> Void) : Void;
    static function interceptStringProtocol(scheme : String, handler : Void -> String, ?callback : Void -> Void) : Void;
    static function interceptBufferProtocol(scheme : String, handler : Void -> js.node.Buffer, ?callback : Void -> Void) : Void;
    static function interceptHttpProtocol(scheme : String, handler : Void -> js.node.Http, ?callback : Void -> Void) : Void;
    static function uninterceptProtocol(scheme : String, ?callback : Void -> Void) : Void;
}
