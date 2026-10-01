package electron.main;
/**
	Process: Main
	
	> Register for and receive notifications from remote push notification services
	
	For example, when registering for push notifications via Apple push notification services (APNS):
	@see https://electronjs.org/docs/api/push-notifications
**/
@:jsRequire("electron", "pushNotifications") extern class PushNotifications extends js.node.events.EventEmitter<electron.main.PushNotifications> {
	/**
		Registers the app with Apple Push Notification service (APNS) to receive Badge, Sound, and Alert notifications. If registration is successful, the promise will be resolved with the APNS device token. Otherwise, the promise will be rejected with an error message. See: https://developer.apple.com/documentation/appkit/nsapplication/1428476-registerforremotenotificationtyp?language=objc
	**/
	@:electron_platforms(["macOS"])
	static function registerForAPNSNotifications():js.lib.Promise<String>;
	/**
		Unregisters the app from notifications received from APNS.
		
		Apps unregistered through this method can always reregister.
		
		See: https://developer.apple.com/documentation/appkit/nsapplication/1428747-unregisterforremotenotifications?language=objc
	**/
	@:electron_platforms(["macOS"])
	static function unregisterForAPNSNotifications():Void;
	static function on<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function once<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function addListener<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function removeListener<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function off<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function removeAllListeners<T:(haxe.Constraints.Function)>(?event:js.node.events.EventEmitter.Event<T>):Void;
}
enum abstract PushNotificationsEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the app receives a remote notification while running. See: https://developer.apple.com/documentation/appkit/nsapplicationdelegate/1428430-application?language=objc
	**/
	@:electron_platforms(["macOS"])
	var received_apns_notification : electron.main.PushNotificationsEvent<(js.html.Event, haxe.DynamicAccess<Any>) -> Void> = "received-apns-notification";
}
