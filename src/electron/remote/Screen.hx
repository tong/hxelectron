package electron.remote;
/**
	> Retrieve information about screen size, displays, cursor position, etc.
	
	Process: Main
	
	This module cannot be used until the `ready` event of the `app` module is emitted.
	
	`screen` is an EventEmitter.
	
	**Note:** In the renderer / DevTools, `window.screen` is a reserved DOM property, so writing `let { screen } = require('electron')` will not work.
	
	An example of creating a window that fills the whole screen:
	
	```
	// Retrieve information about screen size, displays, cursor position, etc.
	//
	// For more info, see:
	// https://www.electronjs.org/docs/latest/api/screen
	
	const { app, BrowserWindow, screen } = require('electron/main')
	
	let mainWindow = null
	
	app.whenReady().then(() => {
	  // Create a window that fills the screen's available work area.
	  const primaryDisplay = screen.getPrimaryDisplay()
	  const { width, height } = primaryDisplay.workAreaSize
	
	  mainWindow = new BrowserWindow({ width, height })
	  mainWindow.loadURL('https://electronjs.org')
	})
	```
	
	Another example of creating a window in the external display:
	@see https://electronjs.org/docs/api/screen
**/
@:native('require(\"electron\").remote.screen') extern class Screen extends js.node.events.EventEmitter<electron.remote.Screen> {
	/**
		The current absolute position of the mouse pointer.
		
		**Note:** The return value is a DIP point, not a screen physical point.
	**/
	static function getCursorScreenPoint():electron.Point;
	/**
		The primary display.
	**/
	static function getPrimaryDisplay():electron.Display;
	/**
		An array of displays that are currently available.
	**/
	static function getAllDisplays():Array<electron.Display>;
	/**
		The display nearest the specified point.
	**/
	static function getDisplayNearestPoint(point:electron.Point):electron.Display;
	/**
		The display that most closely intersects the provided bounds.
	**/
	static function getDisplayMatching(rect:electron.Rectangle):electron.Display;
	/**
		Converts a screen physical point to a screen DIP point. The DPI scale is performed relative to the display containing the physical point.
	**/
	static function screenToDipPoint(point:electron.Point):electron.Point;
	/**
		Converts a screen DIP point to a screen physical point. The DPI scale is performed relative to the display containing the DIP point.
	**/
	static function dipToScreenPoint(point:electron.Point):electron.Point;
	/**
		Converts a screen physical rect to a screen DIP rect. The DPI scale is performed relative to the display nearest to `window`. If `window` is null, scaling will be performed to the display nearest to `rect`.
	**/
	static function screenToDipRect(window:haxe.extern.EitherType<electron.remote.BrowserWindow, Dynamic>, rect:electron.Rectangle):electron.Rectangle;
	/**
		Converts a screen DIP rect to a screen physical rect. The DPI scale is performed relative to the display nearest to `window`. If `window` is null, scaling will be performed to the display nearest to `rect`.
	**/
	static function dipToScreenRect(window:haxe.extern.EitherType<electron.remote.BrowserWindow, Dynamic>, rect:electron.Rectangle):electron.Rectangle;
}
enum abstract ScreenEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when `newDisplay` has been added.
	**/
	var display_added : electron.remote.ScreenEvent<Void -> Void> = "display-added";
	/**
		Emitted when `oldDisplay` has been removed.
	**/
	var display_removed : electron.remote.ScreenEvent<Void -> Void> = "display-removed";
	/**
		Emitted when one or more metrics change in a `display`. The `changedMetrics` is an array of strings that describe the changes. Possible changes are `bounds`, `workArea`, `scaleFactor` and `rotation`.
	**/
	var display_metrics_changed : electron.remote.ScreenEvent<Void -> Void> = "display-metrics-changed";
}
