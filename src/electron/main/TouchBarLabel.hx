package electron.main;
/**
	> Create a label in the touch bar for native macOS applications
	
	Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._
	@see https://electronjs.org/docs/api/touch-bar-label
**/
@:jsRequire("electron", "TouchBarLabel") extern class TouchBarLabel extends js.node.events.EventEmitter<electron.main.TouchBarLabel> {
	/**
		A `string` representing the label's current text. Changing this value immediately updates the label in the touch bar.
	**/
	var label : String;
	/**
		A `string` representing the description of the label to be read by a screen reader.
	**/
	var accessibilityLabel : String;
	/**
		A `string` hex code representing the label's current text color. Changing this value immediately updates the label in the touch bar.
	**/
	var textColor : String;
	function new(options:{ /**
		Text to display.
	**/
	@:optional
	var label : String; /**
		A short description of the button for use by screenreaders like VoiceOver.
	**/
	@:optional
	var accessibilityLabel : String; /**
		Hex color of text, i.e `#ABCDEF`.
	**/
	@:optional
	var textColor : String; }):Void;
}
enum abstract TouchBarLabelEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
