package electron.remote;
/**
	> Create a button in the touch bar for native macOS applications
	
	Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._
	@see https://electronjs.org/docs/api/touch-bar-button
**/
@:jsRequire("electron", "remote.TouchBarButton") extern class TouchBarButton extends js.node.events.EventEmitter<electron.remote.TouchBarButton> {
	/**
		A `string` representing the description of the button to be read by a screen reader. Will only be read by screen readers if no label is set.
	**/
	var accessibilityLabel : String;
	/**
		A `string` representing the button's current text. Changing this value immediately updates the button in the touch bar.
	**/
	var label : String;
	/**
		A `string` hex code representing the button's current background color. Changing this value immediately updates the button in the touch bar.
	**/
	var backgroundColor : String;
	/**
		A `NativeImage` representing the button's current icon. Changing this value immediately updates the button in the touch bar.
	**/
	var icon : electron.NativeImage;
	/**
		A `string` - Can be `left`, `right` or `overlay`.  Defaults to `overlay`.
	**/
	var iconPosition : String;
	/**
		A `boolean` representing whether the button is in an enabled state.
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
	var icon : haxe.extern.EitherType<electron.NativeImage, String>; /**
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
enum abstract TouchBarButtonEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
