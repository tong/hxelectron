package electron;
/**
	@see https://electronjs.org/docs/api/utility-process
**/
@:jsRequire("electron", "UtilityProcess") extern class UtilityProcess extends js.node.events.EventEmitter<electron.UtilityProcess> {
	static function fork(modulePath:String, ?args:Array<String>, ?options:{ /**
		Environment key-value pairs. Default is `process.env`.
	**/
	@:optional
	var env : Any; /**
		List of string arguments passed to the executable.
	**/
	@:optional
	var execArgv : Array<String>; /**
		Current working directory of the child process.
	**/
	@:optional
	var cwd : String; /**
		Allows configuring the mode for `stdout` and `stderr` of the child process. Default is `inherit`. String value can be one of `pipe`, `ignore`, `inherit`, for more details on these values you can refer to stdio documentation from Node.js. Currently this option only supports configuring `stdout` and `stderr` to either `pipe`, `inherit` or `ignore`. Configuring `stdin` to any property other than `ignore` is not supported and will result in an error. For example, the supported values will be processed as following:
	**/
	@:optional
	var stdio : haxe.extern.EitherType<Array<String>, String>; /**
		Name of the process that will appear in `name` property of `ProcessMetric` returned by `app.getAppMetrics` and `child-process-gone` event of `app`. Default is `Node Utility Process`.
	**/
	@:optional
	var serviceName : String; /**
		With this flag, the utility process will be launched via the `Electron Helper (Plugin).app` helper executable on macOS, which can be codesigned with `com.apple.security.cs.disable-library-validation` and `com.apple.security.cs.allow-unsigned-executable-memory` entitlements. This will allow the utility process to load unsigned libraries. Unless you specifically need this capability, it is best to leave this disabled. Default is `false`.
	**/
	@:optional
	var allowLoadingUnsignedLibraries : Bool; /**
		With this flag, all HTTP 401 and 407 network requests created via the net module will allow responding to them via the `app#login` event in the main process instead of the default `login` event on the `ClientRequest` object.
	**/
	@:optional
	var respondToAuthRequestsFromMainProcess : Bool; }):electron.UtilityProcess;
	/**
		A `Integer | undefined` representing the process identifier (PID) of the child process. If the child process fails to spawn due to errors, then the value is `undefined`. When the child process exits, then the value is `undefined` after the `exit` event is emitted.
	**/
	var pid : haxe.extern.EitherType<Int, Dynamic>;
	/**
		A `NodeJS.ReadableStream | null` that represents the child process's stdout. If the child was spawned with options.stdio[1] set to anything other than 'pipe', then this will be `null`. When the child process exits, then the value is `null` after the `exit` event is emitted.
	**/
	var stdout : haxe.extern.EitherType<js.node.stream.Readable<Dynamic>, Dynamic>;
	/**
		A `NodeJS.ReadableStream | null` that represents the child process's stderr. If the child was spawned with options.stdio[2] set to anything other than 'pipe', then this will be `null`. When the child process exits, then the value is `null` after the `exit` event is emitted.
	**/
	var stderr : haxe.extern.EitherType<js.node.stream.Readable<Dynamic>, Dynamic>;
	/**
		Send a message to the child process, optionally transferring ownership of zero or more `MessagePortMain` objects.
		
		For example:
	**/
	function postMessage(message:Any, ?transfer:Array<electron.main.MessagePortMain>):Void;
	/**
		Terminates the process gracefully. On POSIX, it uses SIGTERM but will ensure the process is reaped on exit. This function returns true if the kill is successful, and false otherwise.
	**/
	function kill():Bool;
}
enum abstract UtilityProcessEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted once the child process has spawned successfully.
	**/
	var spawn : electron.UtilityProcessEvent<Void -> Void> = "spawn";
	/**
		Emitted after the child process ends.
	**/
	var exit : electron.UtilityProcessEvent<Void -> Void> = "exit";
	/**
		Emitted when the child process sends a message using `process.parentPort.postMessage()`.
	**/
	var message : electron.UtilityProcessEvent<Void -> Void> = "message";
}
