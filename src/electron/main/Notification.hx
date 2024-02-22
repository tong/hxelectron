package electron.main;
/**
	> Create OS desktop notifications
	
	Process: Main
	
	:::info Renderer process notifications
	
	If you want to show notifications from a renderer process you should use the web Notifications API
	
	:::
	
	### Class: Notification
	
	> Create OS desktop notifications
	
	Process: Main
	
	`Notification` is an EventEmitter.
	
	It creates a new `Notification` with native properties as set by the `options`.
	
	### Static Methods
	
	The `Notification` class has the following static methods:
	
	### `Notification.isSupported()`
	
	Returns `boolean` - Whether or not desktop notifications are supported on the current system
	@see https://electronjs.org/docs/api/notification
**/
@:jsRequire("electron", "Notification") extern class Notification extends js.node.events.EventEmitter<electron.main.Notification> {
	/**
		Whether or not desktop notifications are supported on the current system
	**/
	static function isSupported():Bool;
	/**
		A `string` property representing the title of the notification.
	**/
	var title : String;
	/**
		A `string` property representing the subtitle of the notification.
	**/
	var subtitle : String;
	/**
		A `string` property representing the body of the notification.
	**/
	var body : String;
	/**
		A `string` property representing the reply placeholder of the notification.
	**/
	var replyPlaceholder : String;
	/**
		A `string` property representing the sound of the notification.
	**/
	var sound : String;
	/**
		A `string` property representing the close button text of the notification.
	**/
	var closeButtonText : String;
	/**
		A `boolean` property representing whether the notification is silent.
	**/
	var silent : Bool;
	/**
		A `boolean` property representing whether the notification has a reply action.
	**/
	var hasReply : Bool;
	/**
		A `string` property representing the urgency level of the notification. Can be 'normal', 'critical', or 'low'.
		
		Default is 'low' - see NotifyUrgency for more information.
	**/
	var urgency : String;
	/**
		A `string` property representing the type of timeout duration for the notification. Can be 'default' or 'never'.
		
		If `timeoutType` is set to 'never', the notification never expires. It stays open until closed by the calling API or the user.
	**/
	var timeoutType : String;
	/**
		A `NotificationAction[]` property representing the actions of the notification.
	**/
	var actions : Array<electron.NotificationAction>;
	/**
		A `string` property representing the custom Toast XML of the notification.
	**/
	var toastXml : String;
	function new(?options:{ /**
		A title for the notification, which will be displayed at the top of the notification window when it is shown.
	**/
	@:optional
	var title : String; /**
		A subtitle for the notification, which will be displayed below the title.
	**/
	@:optional
	var subtitle : String; /**
		The body text of the notification, which will be displayed below the title or subtitle.
	**/
	@:optional
	var body : String; /**
		Whether or not to suppress the OS notification noise when showing the notification.
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
		The timeout duration of the notification. Can be 'default' or 'never'.
	**/
	@:optional
	var timeoutType : String; /**
		The placeholder to write in the inline reply input field.
	**/
	@:optional
	var replyPlaceholder : String; /**
		The name of the sound file to play when the notification is shown.
	**/
	@:optional
	var sound : String; /**
		The urgency level of the notification. Can be 'normal', 'critical', or 'low'.
	**/
	@:optional
	var urgency : String; /**
		Actions to add to the notification. Please read the available actions and limitations in the `NotificationAction` documentation.
	**/
	@:optional
	var actions : Array<electron.NotificationAction>; /**
		A custom title for the close button of an alert. An empty string will cause the default localized text to be used.
	**/
	@:optional
	var closeButtonText : String; /**
		A custom description of the Notification on Windows superseding all properties above. Provides full customization of design and behavior of the notification.
	**/
	@:optional
	var toastXml : String; }):Void;
	/**
		Immediately shows the notification to the user. Unlike the web notification API, instantiating a `new Notification()` does not immediately show it to the user. Instead, you need to call this method before the OS will display it.
		
		If the notification has been shown before, this method will dismiss the previously shown notification and create a new one with identical properties.
	**/
	function show():Void;
	/**
		Dismisses the notification.
		
		On Windows, calling `notification.close()` while the notification is visible on screen will dismiss the notification and remove it from the Action Center. If `notification.close()` is called after the notification is no longer visible on screen, calling `notification.close()` will try remove it from the Action Center.
	**/
	function close():Void;
}
enum abstract NotificationEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the notification is shown to the user. Note that this event can be fired multiple times as a notification can be shown multiple times through the `show()` method.
	**/
	var show : electron.main.NotificationEvent<Void -> Void> = "show";
	/**
		Emitted when the notification is clicked by the user.
	**/
	var click : electron.main.NotificationEvent<Void -> Void> = "click";
	/**
		Emitted when the notification is closed by manual intervention from the user.
		
		This event is not guaranteed to be emitted in all cases where the notification is closed.
		
		On Windows, the `close` event can be emitted in one of three ways: programmatic dismissal with `notification.close()`, by the user closing the notification, or via system timeout. If a notification is in the Action Center after the initial `close` event is emitted, a call to `notification.close()` will remove the notification from the action center but the `close` event will not be emitted again.
	**/
	var close : electron.main.NotificationEvent<Void -> Void> = "close";
	/**
		Emitted when the user clicks the "Reply" button on a notification with `hasReply: true`.
	**/
	var reply : electron.main.NotificationEvent<Void -> Void> = "reply";
	var action : electron.main.NotificationEvent<Void -> Void> = "action";
	/**
		Emitted when an error is encountered while creating and showing the native notification.
	**/
	var failed : electron.main.NotificationEvent<Void -> Void> = "failed";
}
