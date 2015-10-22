package electron.main;

import js.node.events.EventEmitter;

@:jsRequire("power-monitor")
extern class PowerMonitor extends EventEmitter<PowerMonitor> {}
