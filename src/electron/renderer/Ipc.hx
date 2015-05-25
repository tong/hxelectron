package electron.renderer;

import haxe.extern.Rest;
import js.node.events.EventEmitter;

@:jsRequire("ipc")
extern class Ipc extends EventEmitter<Ipc> {
  static function send(channel : String, args : Rest<Dynamic>) : Void;
  static function sendSync(channel : String, args : Rest<Dynamic>) : Void;
  static function sendToHost(channel : String, args : Rest<Dynamic>) : Void;
}
