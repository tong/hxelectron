package electron;
/**
	@see https://electronjs.org/docs/api/utility-process
**/
@:jsRequire("electron", "UtilityProcess") extern class UtilityProcess extends js.node.events.EventEmitter<electron.UtilityProcess> {
	/**
		> [!NOTE] `utilityProcess.fork` can only be called after the `ready` event has been emitted on `App`.
	**/
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
		Sets the session used by the process for network requests. By default, network requests from the utility process will use the system network context which does not have HTTP cache support. Setting a session enables HTTP caching and other session-specific network features. See session for more information.
	**/
	@:optional
	var session : electron.main.Session; /**
		Sets the session used by the process according to the session's partition string. If `partition` starts with `persist:`, the process will use a persistent session available to all pages in the app with the same `partition`. If there is no `persist:` prefix, the process will use an in-memory session. By assigning the same `partition`, multiple processes can share the same session. If the `session` option is set, this option is ignored.
	**/
	@:optional
	var partition : String; /**
		Allows configuring the mode for `stdout` and `stderr` of the child process. Default is `inherit`. String value can be one of `pipe`, `ignore`, `inherit`, for more details on these values you can refer to stdio documentation from Node.js. Currently this option only supports configuring `stdout` and `stderr` to either `pipe`, `inherit` or `ignore`. Configuring `stdin` to any property other than `ignore` is not supported and will result in an error. For example, the supported values will be processed as following:
	**/
	@:optional
	var stdio : String; /**
		Name of the process that will appear in `name` property of `ProcessMetric` returned by `app.getAppMetrics` and `child-process-gone` event of `app`. Default is `Node Utility Process`.
	**/
	@:optional
	var serviceName : String; /**
		With this flag, the utility process will be launched via the `Electron Helper (Plugin).app` helper executable on macOS, which can be codesigned with `com.apple.security.cs.disable-library-validation` and `com.apple.security.cs.allow-unsigned-executable-memory` entitlements. This will allow the utility process to load unsigned libraries. Unless you specifically need this capability, it is best to leave this disabled. Default is `false`.
	**/
	@:optional
	var allowLoadingUnsignedLibraries : Bool; /**
		With this flag, the utility process will disclaim responsibility for the child process. This causes the operating system to consider the child process as a separate entity for purposes of security policies like Transparency, Consent, and Control (TCC). When responsibility is disclaimed, the parent process will not be attributed for any TCC requests initiated by the child process. This is useful when launching processes that run third-party or otherwise untrusted code. Default is `false`.
	**/
	@:optional
	var disclaim : Bool; /**
		With this flag, all HTTP 401 and 407 network requests created via the net module will allow responding to them via the `login` event on the `UtilityProcess` instance when a `session` is provided, or via the `app#login` event in the main process when using the default system network context. This flag also routes client-certificate selection to the `app#select-client-certificate` event in the main process; without it, `net` requests from the utility process proceed without a client certificate. Without this flag, auth challenges are handled by the default `login` event on the `ClientRequest` object. Default is `false`.
	**/
	@:optional
	var respondToAuthRequestsFromMainProcess : Bool; }):electron.UtilityProcess;
	/**
		A `Integer | undefined` representing the process identifier (PID) of the child process. Until the child process has spawned successfully, the value is `undefined`. When the child process exits, then the value is `undefined` after the `exit` event is emitted.
		
		> [!NOTE] You can use the `pid` to determine if the process is currently running.
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
		Emitted when the child process needs to terminate due to non continuable error from V8.
		
		No matter if you listen to the `error` event, the `exit` event will be emitted after the child process terminates.
	**/
	var error : electron.UtilityProcessEvent<Void -> Void> = "error";
	/**
		Emitted after the child process ends.
	**/
	var exit : electron.UtilityProcessEvent<Void -> Void> = "exit";
	/**
		Emitted when the child process sends a message using `process.parentPort.postMessage()`.
	**/
	var message : electron.UtilityProcessEvent<Void -> Void> = "message";
	/**
		Emitted when the utility process encounters an HTTP 401 or 407 authentication challenge, if the process was created with both `respondToAuthRequestsFromMainProcess: true` and a `session` option. The `callback` should be called with credentials to respond to the challenge. Calling `callback` without arguments will cancel the request.
		
		This behaves the same as the `login` event on `app` but is scoped to the individual utility process instance.
	**/
	var login : electron.UtilityProcessEvent<Void -> Void> = "login";
}
