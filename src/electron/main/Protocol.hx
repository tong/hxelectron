package electron.main;

import js.node.events.EventEmitter;
import npm.common.Callback;

@:jsRequire("protocol")
extern class Protocol {
  // Class: protocol.RequestFileJob(path)
  // Class: protocol.RequestStringJob(options)
  // Class: protocol.RequestBufferJob(options)
  // Class: protocol.RequestErrorJob(code)

  // TODO remove Dynamic
  // TODO check types
    static function registerStandardSchemes( schemes : Array<String> ) : Void;
    static function registerFileProtocol( scheme : Array<String>, handler : Dynamic->Void, ?completion : Void->Void ) : Void;
    static function registerBufferProtocol( scheme : Array<String>, handler : Dynamic->Void, ?completion : Void->Void ) : Void;
    static function registerStringProtocol( scheme : Array<String>, handler : Dynamic->Void, ?completion : Void->Void ) : Void;
    static function registerHttpProtocol( scheme : Array<String>, handler : Dynamic->Void, ?completion : Void->Void ) : Void;
    static function unregisterProtocol(scheme : String, callback : Callback<String>) : Void;
    static function isProtocolHandled(scheme : String, callback : Callback<Bool>) : Void;
    static function interceptFileProtocol(scheme : String, handler : Void -> Void, callback : Void -> Void) : Void;
    static function interceptStringProtocol(scheme : String, handler : Void -> Void, callback : Void -> Void) : Void;
    static function interceptBufferProtocol(scheme : String, handler : Void -> Void, callback : Void -> Void) : Void;
    static function interceptHttpProtocol(scheme : String, handler : Void -> Void, callback : Void -> Void) : Void;
    static function uninterceptProtocol(scheme : String, callback : Void -> Void) : Void;
}
