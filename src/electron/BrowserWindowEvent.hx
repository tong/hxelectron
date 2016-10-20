package electron;
@:enum @:require(electron) abstract BrowserWindowEvent(String) from String to String {
	/**
		Emitted when the document changed its title, calling event.preventDefault() will prevent the native window's title from changing.
	**/
	var page_title_updated : String = "page-title-updated";
	/**
		Emitted when the window is going to be closed. It's emitted before the beforeunload and unload event of the DOM. Calling event.preventDefault() will cancel the close. Usually you would want to use the beforeunload handler to decide whether the window should be closed, which will also be called when the window is reloaded. In Electron, returning any value other than undefined would cancel the close. For example:
	**/
	var close : String = "close";
	/**
		Emitted when the window is closed. After you have received this event you should remove the reference to the window and avoid using it any more.
	**/
	var closed : String = "closed";
	/**
		Emitted when the web page becomes unresponsive.
	**/
	var unresponsive : String = "unresponsive";
	/**
		Emitted when the unresponsive web page becomes responsive again.
	**/
	var responsive : String = "responsive";
	/**
		Emitted when the window loses focus.
	**/
	var blur : String = "blur";
	/**
		Emitted when the window gains focus.
	**/
	var focus : String = "focus";
	/**
		Emitted when the window is shown.
	**/
	var show : String = "show";
	/**
		Emitted when the window is hidden.
	**/
	var hide : String = "hide";
	/**
		Emitted when the web page has been rendered and window can be displayed without a visual flash.
	**/
	var ready_to_show : String = "ready-to-show";
	/**
		Emitted when window is maximized.
	**/
	var maximize : String = "maximize";
	/**
		Emitted when the window exits from a maximized state.
	**/
	var unmaximize : String = "unmaximize";
	/**
		Emitted when the window is minimized.
	**/
	var minimize : String = "minimize";
	/**
		Emitted when the window is restored from a minimized state.
	**/
	var restore : String = "restore";
	/**
		Emitted when the window is being resized.
	**/
	var resize : String = "resize";
	/**
		Emitted when the window is being moved to a new position. Note: On macOS this event is just an alias of moved.
	**/
	var move : String = "move";
	/**
		Emitted once when the window is moved to a new position.
	**/
	var moved : String = "moved";
	/**
		Emitted when the window enters a full-screen state.
	**/
	var enter_full_screen : String = "enter-full-screen";
	/**
		Emitted when the window leaves a full-screen state.
	**/
	var leave_full_screen : String = "leave-full-screen";
	/**
		Emitted when the window enters a full-screen state triggered by HTML API.
	**/
	var enter_html_full_screen : String = "enter-html-full-screen";
	/**
		Emitted when the window leaves a full-screen state triggered by HTML API.
	**/
	var leave_html_full_screen : String = "leave-html-full-screen";
	/**
		Emitted when an App Command is invoked. These are typically related to keyboard media keys or browser commands, as well as the "Back" button built into some mice on Windows. Commands are lowercased, underscores are replaced with hyphens, and the APPCOMMAND_ prefix is stripped off. e.g. APPCOMMAND_BROWSER_BACKWARD is emitted as browser-backward.
	**/
	var app_command : String = "app-command";
	/**
		Emitted when scroll wheel event phase has begun.
	**/
	var scroll_touch_begin : String = "scroll-touch-begin";
	/**
		Emitted when scroll wheel event phase has ended.
	**/
	var scroll_touch_end : String = "scroll-touch-end";
	/**
		Emitted when scroll wheel event phase filed upon reaching the edge of element.
	**/
	var scroll_touch_edge : String = "scroll-touch-edge";
	/**
		Emitted on 3-finger swipe. Possible directions are up, right, down, left.
	**/
	var swipe : String = "swipe";
}