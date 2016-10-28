package electron;

/**
**/
@:require(js, electron) typedef ThumbarButton = {
	/**
		The icon showing in thumbnail toolbar.
	**/
	var icon : NativeImage;
	var click : haxe.Constraints.Function;
	/**
		(optional) - The text of the button's tooltip.
	**/
	@:optional
	var tooltip : String;
	/**
		(optional) - Control specific states and behaviors of the button. By default, it is .
	**/
	@:optional
	var flags : Array<String>;
}