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
  static function registerProtocol(scheme : String, handler : Dynamic -> Dynamic, callback : Callback<String>) : Void;
  static function unregisterProtocol(scheme : String, callback : Callback<String>) : Void;
  static function isHandledProtocol(scheme : String, callback : Callback<Bool>) : Void;
  // TODO check types
  static function interceptProtocol(scheme : String, handler : Void -> Void, callback : Void -> Void) : Void;
  // TODO check types
  static function uninterceptProtocol(scheme : String, callback : Void -> Void) : Void;
}
