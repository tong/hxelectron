package electron;
/**
	@see http://electronjs.org/docs/api/structures/thumbar-button
**/
typedef ThumbarButton = {
	/**
		The icon showing in thumbnail toolbar.
	**/
	var icon : electron.NativeImage;
	var click : haxe.Constraints.Function;
	/**
		The text of the button's tooltip.
	**/
	var tooltip : String;
	/**
		Control specific states and behaviors of the button. By default, it is ['enabled'].
	**/
	var flags : Array<String>;
}
