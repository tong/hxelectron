package electron.main;

/**
	Create OS desktop notifications

	See: <http://electron.atom.io/docs/api/notification>
**/
@:require(js, electron) @:jsRequire("electron", "Notification") extern class Notification extends js.node.events.EventEmitter<electron.main.Notification> {
	function new(options:{ /**
		A title for the notification, which will be shown at the top of the notification window when it is shown
	**/
	@:optional
	var title : String; /**
		A subtitle for the notification, which will be displayed below the title.
	**/
	@:optional
	var subtitle : String; /**
		The body text of the notification, which will be displayed below the title or subtitle
	**/
	@:optional
	var body : String; /**
		Whether or not to emit an OS notification noise when showing the notification
	**/
	@:optional
	var silent : Bool; /**
		An icon to use in the notification
	**/
	@:optional
	var icon : NativeImage; /**
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
		Actions to add to the notification. Please read the available actions and limitations in the NotificationAction documentation
	**/
	@:optional
	var actions : Array<NotificationAction>; }):Void;
	/**
		Immediately shows the notification to the user, please note this means unlike the HTML5 Notification implementation, simply instantiating a new Notification does not immediately show it to the user, you need to call this method before the OS will display it.
	**/
	function show():Void;
	static function isSupported():Bool;
}

/**
**/
@:require(js, electron) @:enum abstract NotificationEvent(String) from String to String {
	/**
		Emitted when the notification is shown to the user, note this could be fired multiple times as a notification can be shown multiple times through the show() method.
	**/
	var show : String = "show";
	/**
		Emitted when the notification is clicked by the user.
	**/
	var click : String = "click";
	/**
		Emitted when the notification is closed by manual intervention from the user. This event is not guarunteed to be emitted in all cases where the notification is closed.
	**/
	var close : String = "close";
	/**
		Emitted when the user clicks the "Reply" button on a notification with hasReply: true.
	**/
	var reply : String = "reply";
	var action : String = "action";
}