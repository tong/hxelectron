/**
    API v0.37.3
**/
package electron.main;

import js.node.events.EventEmitter;

@:enum abstract PowerMonitorEventType(String) from String to String {
    var suspend = "suspend";
    var resume = "resume";
    var on_ac = "on-ac";
    var on_battery = "on-battery";
}

@:jsRequire("power-monitor")
extern class PowerMonitor extends EventEmitter<PowerMonitor> {}
