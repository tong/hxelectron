package electron.main;
/**
	@see https://electronjs.org/docs/api/command-line
**/
@:jsRequire("electron", "CommandLine") extern class CommandLine extends js.node.events.EventEmitter<electron.main.CommandLine> {
	/**
		Append a switch (with optional `value`) to Chromium's command line.
		
		> [!NOTE] This will not affect `process.argv`. The intended usage of this function is to control Chromium's behavior.
	**/
	function appendSwitch(switch_:String, ?value:String):Void;
	/**
		Append an argument to Chromium's command line. The argument will be quoted correctly. Switches will precede arguments regardless of appending order.
		
		If you're appending an argument like `--switch=value`, consider using `appendSwitch('switch', 'value')` instead.
		
		> [!NOTE] This will not affect `process.argv`. The intended usage of this function is to control Chromium's behavior.
	**/
	function appendArgument(value:String):Void;
	/**
		Whether the command-line switch is present.
	**/
	function hasSwitch(switch_:String):Bool;
	/**
		The command-line switch value.
		
		This function is meant to obtain Chromium command line switches. It is not meant to be used for application-specific command line arguments. For the latter, please use `process.argv`.
		
		> [!NOTE] When the switch is not present or has no value, it returns empty string.
	**/
	function getSwitchValue(switch_:String):String;
	/**
		Removes the specified switch from Chromium's command line.
		
		> [!NOTE] This will not affect `process.argv`. The intended usage of this function is to control Chromium's behavior.
	**/
	function removeSwitch(switch_:String):Void;
}
enum abstract CommandLineEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
