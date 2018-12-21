package electron.main;
/**
	Create OS desktop notifications
	@see http://electronjs.org/docs/api/notification
**/
@:jsRequire("electron", "Notification") extern class Notification extends js.node.events.EventEmitter<electron.main.Notification> {
	static function isSupported():Bool;
	function new(options:{ /**
		A title for the notification, which will be shown at the top of the notification window when it is shown.
	**/
	var title : String; /**
		A subtitle for the notification, which will be displayed below the title.
	**/
	@:optional
	var subtitle : String; /**
		The body text of the notification, which will be displayed below the title or subtitle.
	**/
	var body : String; /**
		Whether or not to emit an OS notification noise when showing the notification.
	**/
	@:optional
	var silent : Bool; /**
		An icon to use in the notification.
	**/
	@:optional
	var icon : haxe.extern.EitherType<String, electron.NativeImage>; /**
		Whether or not to add an inline reply option to the notification.
	**/
	@:optional
	var hasReply : Bool; /**
		The placeholder to write in the inline reply input field.
	**/
	@:optional
	var replyPlaceholder : String; /**
		The name of the sound file to play when the notification is shown.
	**/
	@:optional
	var sound : String; /**
		Actions to add to the notification. Please read the available actions and limitations in the NotificationAction documentation.
	**/
	@:optional
	var actions : Array<electron.NotificationAction>; /**
		A custom title for the close button of an alert. An empty string will cause the default localized text to be used.
	**/
	@:optional
	var closeButtonText : String; }):Void;
	/**
		Immediately shows the notification to the user, please note this means unlike the HTML5 Notification implementation, instantiating a new Notification does not immediately show it to the user, you need to call this method before the OS will display it. If the notification has been shown before, this method will dismiss the previously shown notification and create a new one with identical properties.
	**/
	function show():Void;
	/**
		Dismisses the notification.
	**/
	function close():Void;
}
@:enum abstract NotificationEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the notification is shown to the user, note this could be fired multiple times as a notification can be shown multiple times through the show() method.
	**/
	var show : electron.main.NotificationEvent<js.html.Event -> Void> = "show";
	/**
		Emitted when the notification is clicked by the user.
	**/
	var click : electron.main.NotificationEvent<js.html.Event -> Void> = "click";
	/**
		Emitted when the notification is closed by manual intervention from the user. This event is not guaranteed to be emitted in all cases where the notification is closed.
	**/
	var close : electron.main.NotificationEvent<js.html.Event -> Void> = "close";
	/**
		Emitted when the user clicks the "Reply" button on a notification with hasReply: true.
	**/
	@:electron_platforms(["macOS"])
	var reply : electron.main.NotificationEvent<(js.html.Event, String) -> Void> = "reply";
	@:electron_platforms(["macOS"])
	var action : electron.main.NotificationEvent<(js.html.Event, Float) -> Void> = "action";
}
