package electron.main;
/**
	> Create a button in the touch bar for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-button
**/
@:jsRequire("electron", "TouchBarButton") extern class TouchBarButton extends js.node.events.EventEmitter<electron.main.TouchBarButton> {
	/**
		A `String` representing the description of the button to be read by a screen reader. Will only be read by screen readers if no label is set.
	**/
	var accessibilityLabel : String;
	/**
		A `String` representing the button's current text. Changing this value immediately updates the button in the touch bar.
	**/
	var label : String;
	/**
		A `String` hex code representing the button's current background color. Changing this value immediately updates the button in the touch bar.
	**/
	var backgroundColor : String;
	/**
		A `NativeImage` representing the button's current icon. Changing this value immediately updates the button in the touch bar.
	**/
	var icon : electron.NativeImage;
	/**
		A `String` - Can be `left`, `right` or `overlay`.  Defaults to `overlay`.
	**/
	var iconPosition : String;
	/**
		A `Boolean` representing whether the button is in an enabled state.
	**/
	var enabled : Bool;
	function new(options:{ /**
		Button text.
	**/
	@:optional
	var label : String; /**
		A short description of the button for use by screenreaders like VoiceOver.
	**/
	@:optional
	var accessibilityLabel : String; /**
		Button background color in hex format, i.e `#ABCDEF`.
	**/
	@:optional
	var backgroundColor : String; /**
		Button icon.
	**/
	@:optional
	var icon : haxe.extern.EitherType<Dynamic, Dynamic>; /**
		Can be `left`, `right` or `overlay`. Defaults to `overlay`.
	**/
	@:optional
	var iconPosition : String; /**
		Function to call when the button is clicked.
	**/
	@:optional
	var click : haxe.Constraints.Function; /**
		Whether the button is in an enabled state.  Default is `true`.
	**/
	@:optional
	var enabled : Bool; }):Void;
}
@:enum abstract TouchBarButtonEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
