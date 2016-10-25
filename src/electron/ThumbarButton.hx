package electron;

///// GENERATED - DO NOT EDIT /////

/**
**/
@:require(electron) typedef ThumbarButton = {
	/**
		The icon showing in thumbnail toolbar.
	**/
	var icon : electron.NativeImage;
	var click : haxe.Constraints.Function;
	/**
		(optional) - The text of the button's tooltip.
	**/
	var tooltip : String;
	/**
		(optional) - Control specific states and behaviors of the button. By default, it is .
	**/
	var flags : Array<String>;
}