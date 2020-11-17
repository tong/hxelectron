package electron.main;
/**
	> Create a label in the touch bar for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-label
**/
@:jsRequire("electron", "TouchBarLabel") extern class TouchBarLabel extends js.node.events.EventEmitter<electron.main.TouchBarLabel> {
	/**
		A `String` representing the label's current text. Changing this value immediately updates the label in the touch bar.
	**/
	var label : String;
	/**
		A `String` representing the description of the label to be read by a screen reader.
	**/
	var accessibilityLabel : String;
	/**
		A `String` hex code representing the label's current text color. Changing this value immediately updates the label in the touch bar.
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
@:enum abstract TouchBarLabelEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
