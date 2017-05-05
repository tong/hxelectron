package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/thumbar-button>
**/
@:require(js, electron) typedef ThumbarButton = {
	/**
		The icon showing in thumbnail toolbar.
	**/
	var icon : NativeImage;
	var click : haxe.Constraints.Function;
	/**
		The text of the button's tooltip.
	**/
	var tooltip : String;
	/**
		Control specific states and behaviors of the button. By default, it is .
	**/
	var flags : String;
}