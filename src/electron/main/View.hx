package electron.main;
/**
	> Create and layout native views.
	
	Process: Main
	
	This module cannot be used until the `ready` event of the `app` module is emitted.
	
	### Class: View
	
	> A basic native view.
	
	Process: Main
	
	`View` is an EventEmitter.
	@see https://electronjs.org/docs/api/view
**/
@:jsRequire("electron", "View") extern class View extends js.node.events.EventEmitter<electron.main.View> {
	/**
		A `View[]` property representing the child views of this view.
	**/
	var children : Array<electron.main.View>;
	function new():Void;
	/**
		If the same View is added to a parent which already contains it, it will be reordered such that it becomes the topmost view.
	**/
	function addChildView(view:electron.main.View, ?index:Int):Void;
	/**
		If the view passed as a parameter is not a child of this view, this method is a no-op.
	**/
	function removeChildView(view:electron.main.View):Void;
	function setBounds(bounds:electron.Rectangle):Void;
	/**
		The bounds of this View, relative to its parent.
	**/
	function getBounds():electron.Rectangle;
	/**
		Examples of valid `color` values:
		
		* Hex
		  * `#fff` (RGB)
		  * `#ffff` (ARGB)
		  * `#ffffff` (RRGGBB)
		  * `#ffffffff` (AARRGGBB)
		* RGB
		  * `rgb\(([\d]+),\s*([\d]+),\s*([\d]+)\)`
		    * e.g. `rgb(255, 255, 255)`
		* RGBA
		  * `rgba\(([\d]+),\s*([\d]+),\s*([\d]+),\s*([\d.]+)\)`
		    * e.g. `rgba(255, 255, 255, 1.0)`
		* HSL
		  * `hsl\((-?[\d.]+),\s*([\d.]+)%,\s*([\d.]+)%\)`
		    * e.g. `hsl(200, 20%, 50%)`
		* HSLA
		  * `hsla\((-?[\d.]+),\s*([\d.]+)%,\s*([\d.]+)%,\s*([\d.]+)\)`
		    * e.g. `hsla(200, 20%, 50%, 0.5)`
		* Color name
		  * Options are listed in SkParseColor.cpp
		  * Similar to CSS Color Module Level 3 keywords, but case-sensitive.
		    * e.g. `blueviolet` or `red`
		
		> [!NOTE] Hex format with alpha takes `AARRGGBB` or `ARGB`, _not_ `RRGGBBAA` or `RGB`.
	**/
	function setBackgroundColor(color:String):Void;
	/**
		> [!NOTE] The area cutout of the view's border still captures clicks.
	**/
	function setBorderRadius(radius:Int):Void;
	function setVisible(visible:Bool):Void;
	/**
		Whether the view should be drawn. Note that this is different from whether the view is visible on screen—it may still be obscured or out of view.
	**/
	function getVisible():Bool;
}
enum abstract ViewEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the view's bounds have changed in response to being laid out. The new bounds can be retrieved with `view.getBounds()`.
	**/
	var bounds_changed : electron.main.ViewEvent<Void -> Void> = "bounds-changed";
}
