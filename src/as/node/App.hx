package as.node;

@:jsRequire("app")
extern class App {
	static function on(eventType : String, callback : Void -> Void) : Void;
	static function quit() : Void;
	static var commandLine(default, null) : CommandLine;
}
