package electron.main;
/**
	@see https://electronjs.org/docs/api/command-line
**/
@:jsRequire("electron", "CommandLine") extern class CommandLine extends js.node.events.EventEmitter<electron.main.CommandLine> {
	/**
		Append a switch (with optional `value`) to Chromium's command line.
		
		**Note:** This will not affect `process.argv`. The intended usage of this function is to control Chromium's behavior.
	**/
	function appendSwitch(switch_:String, ?value:String):Void;
	/**
		Append an argument to Chromium's command line. The argument will be quoted correctly. Switches will precede arguments regardless of appending order.
		
		If you're appending an argument like `--switch=value`, consider using `appendSwitch('switch', 'value')` instead.
		
		**Note:** This will not affect `process.argv`. The intended usage of this function is to control Chromium's behavior.
	**/
	function appendArgument(value:String):Void;
	/**
		Whether the command-line switch is present.
	**/
	function hasSwitch(switch_:String):Bool;
	/**
		The command-line switch value.
		
		**Note:** When the switch is not present or has no value, it returns empty string.
	**/
	function getSwitchValue(switch_:String):String;
}
@:enum abstract CommandLineEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
