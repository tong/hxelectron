/**
    API v0.37.3
**/
package electron.main;

import js.node.events.EventEmitter;

@:enum abstract DebuggerEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
    var detach = "detach";
    var message = "message";
}

extern class Debugger extends EventEmitter<Debugger>{
    function attach( ?protocolVersion:String ) : Void;
    function isAttached() : Bool;
    function detach() : Void;
    function sendCommand( method:String, ?commandParams:Dynamic, ?callback:Dynamic->Dynamic->Void ) : Void;
}