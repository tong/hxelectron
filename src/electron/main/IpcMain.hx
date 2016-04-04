/**
    API v0.37.3
**/
package electron.main;

import js.node.events.EventEmitter;

@:jsRequire("ipc-main")
extern class IpcMain extends EventEmitter<Ipc> {

}
