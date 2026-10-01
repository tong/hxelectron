package electron.main;
/**
	> Create OS desktop notifications
	
	Process: Main
	
	> [!NOTE] If you want to show notifications from a renderer process you should use the web Notifications API
	
	> [!NOTE] On MacOS, notifications use the UNNotification API as their underlying framework. This API requires an application to be code-signed in order for notifications to appear. Unsigned binaries will emit a `failed` event when notifications are called.
	
	### Class: Notification
	
	> Create OS desktop notifications
	
	Process: Main
	
	`Notification` is an EventEmitter.
	
	It creates a new `Notification` with native properties as set by the `options`.
	
	> [!WARNING] Electron's built-in classes cannot be subclassed in user code. For more information, see the FAQ.
	
	### Static Methods
	
	The `Notification` class has the following static methods:
	
	### `Notification.isSupported()`
	
	Returns `boolean` - Whether or not desktop notifications are supported on the current system
	
	### `Notification.handleActivation(callback)` _Windows_
	
	* `callback` Function
	  * `details` ActivationArguments - Details about the notification activation.
	
	Registers a callback to handle all notification activations. The callback is invoked whenever a notification is clicked, replied to, or has an action button pressed - regardless of whether the original `Notification` object is still in memory.
	
	This method handles timing automatically:
	
	* If an activation already occurred before calling this method, the callback is invoked immediately with those details.
	* For all subsequent activations, the callback is invoked when they occur.
	
	The callback remains registered until replaced by another call to `handleActivation`.
	
	This provides a centralized way to handle notification interactions that works in all scenarios:
	
	* Cold start (app launched from notification click)
	* Notifications persisted in AC that have no in-memory representation after app re-start
	* Notification object was garbage collected
	* Notification object is still in memory (callback is invoked in addition to instance events)
	
	```
	const { Notification, app } = require('electron')
	
	app.whenReady().then(() => {
	  // Register handler for all notification activations
	  Notification.handleActivation((details) => {
	    console.log('Notification activated:', details.type)
	    if (details.type === 'reply') {
	      console.log('User reply:', details.reply)
	    } else if (details.type === 'action') {
	      console.log('Action index:', details.actionIndex)
	    }
	  })
	})
	```
	
	### `Notification.getHistory()` _macOS_
	
	Returns `Promise<Notification[]>` - Resolves with an array of `Notification` objects representing all delivered notifications still present in Notification Center.
	
	Each returned `Notification` is a live object connected to the corresponding delivered notification. Interaction events (`click`, `reply`, `action`, `close`) will fire on these objects when the user interacts with the notification in Notification Center. This is useful after an app restart to re-attach event handlers to notifications from a previous session.
	
	The returned notifications have their `id`, `groupId`, `title`, `subtitle`, and `body` properties populated from information available in the Notification Center. Other properties (e.g., `actions`, `silent`, `icon`) are not available from delivered notifications and will have default values.
	
	> [!NOTE] Like all macOS notification APIs, this method requires the application to be code-signed. In unsigned development builds, notifications are not delivered to Notification Center and this method will resolve with an empty array.
	
	> [!NOTE] Unlike notifications created with `new Notification()`, notifications returned by `getHistory()` will remain visible in Notification Center when the object is garbage collected. Calling `show()` on a restored notification will remove the original from Notification Center and post a new one with the same properties.
	
	```
	const { Notification, app } = require('electron')
	
	app.whenReady().then(async () => {
	  // Restore notifications from a previous session
	  const notifications = await Notification.getHistory()
	  for (const n of notifications) {
	    console.log(`Found delivered notification: ${n.id} - ${n.title}`)
	    n.on('click', () => {
	      console.log(`User clicked: ${n.id}`)
	    })
	    n.on('reply', (event) => {
	      console.log(`User replied to ${n.id}: ${event.reply}`)
	    })
	  }
	  // Keep references so events continue to fire
	})
	```
	
	### `Notification.remove(id)` _macOS_
	
	* `id` (string | string[]) - The notification identifier(s) to remove. These correspond to the `id` values set in the `Notification` constructor.
	
	Removes one or more delivered notifications from Notification Center by their identifier(s).
	
	```
	const { Notification } = require('electron')
	
	// Remove a single notification
	Notification.remove('my-notification-id')
	
	// Remove multiple notifications
	Notification.remove(['msg-1', 'msg-2', 'msg-3'])
	```
	
	### `Notification.removeAll()` _macOS_
	
	Removes all of the app's delivered notifications from Notification Center.
	
	```
	const { Notification } = require('electron')
	
	Notification.removeAll()
	```
	
	### `Notification.removeGroup(groupId)` _macOS_
	
	* `groupId` string - The group identifier of the notifications to remove. This corresponds to the `groupId` value set in the `Notification` constructor.
	
	Removes all delivered notifications with the given `groupId` from Notification Center.
	
	```
	const { Notification } = require('electron')
	
	// Remove all notifications in the 'chat-thread-1' group
	Notification.removeGroup('chat-thread-1')
	```
	@see https://electronjs.org/docs/api/notification
**/
@:jsRequire("electron", "Notification") extern class Notification extends js.node.events.EventEmitter<electron.main.Notification> {
	/**
		Whether or not desktop notifications are supported on the current system
	**/
	static function isSupported():Bool;
	/**
		Registers a callback to handle all notification activations. The callback is invoked whenever a notification is clicked, replied to, or has an action button pressed - regardless of whether the original `Notification` object is still in memory.
		
		This method handles timing automatically:
		
		* If an activation already occurred before calling this method, the callback is invoked immediately with those details.
		* For all subsequent activations, the callback is invoked when they occur.
		
		The callback remains registered until replaced by another call to `handleActivation`.
		
		This provides a centralized way to handle notification interactions that works in all scenarios:
		
		* Cold start (app launched from notification click)
		* Notifications persisted in AC that have no in-memory representation after app re-start
		* Notification object was garbage collected
		* Notification object is still in memory (callback is invoked in addition to instance events)
	**/
	@:electron_platforms(["Windows"])
	static function handleActivation(callback:haxe.Constraints.Function):Void;
	/**
		Resolves with an array of `Notification` objects representing all delivered notifications still present in Notification Center.
		
		Each returned `Notification` is a live object connected to the corresponding delivered notification. Interaction events (`click`, `reply`, `action`, `close`) will fire on these objects when the user interacts with the notification in Notification Center. This is useful after an app restart to re-attach event handlers to notifications from a previous session.
		
		The returned notifications have their `id`, `groupId`, `title`, `subtitle`, and `body` properties populated from information available in the Notification Center. Other properties (e.g., `actions`, `silent`, `icon`) are not available from delivered notifications and will have default values.
		
		> [!NOTE] Like all macOS notification APIs, this method requires the application to be code-signed. In unsigned development builds, notifications are not delivered to Notification Center and this method will resolve with an empty array.
		
		> [!NOTE] Unlike notifications created with `new Notification()`, notifications returned by `getHistory()` will remain visible in Notification Center when the object is garbage collected. Calling `show()` on a restored notification will remove the original from Notification Center and post a new one with the same properties.
	**/
	@:electron_platforms(["macOS"])
	static function getHistory():js.lib.Promise<Array<electron.main.Notification>>;
	/**
		Removes one or more delivered notifications from Notification Center by their identifier(s).
	**/
	@:electron_platforms(["macOS"])
	static function remove(id:String):Void;
	/**
		Removes all of the app's delivered notifications from Notification Center.
	**/
	@:electron_platforms(["macOS"])
	static function removeAll():Void;
	/**
		Removes all delivered notifications with the given `groupId` from Notification Center.
	**/
	@:electron_platforms(["macOS"])
	static function removeGroup(groupId:String):Void;
	/**
		A `string` property representing the unique identifier of the notification. This is set at construction time — either from the `id` option or as a generated UUID if none was provided.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var id : String;
	/**
		A `string` property representing the group identifier of the notification. Notifications with the same `groupId` will be visually grouped together in Notification Center (macOS) or Action Center (Windows).
	**/
	@:electron_platforms(["macOS", "Windows"])
	var groupId : String;
	/**
		A `string` property representing the title of the notification group header.
	**/
	@:electron_platforms(["Windows"])
	var groupTitle : String;
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
	@:electron_platforms(["Linux"])
	var urgency : NotificationUrgency;
	/**
		A `string` property representing the type of timeout duration for the notification. Can be 'default' or 'never'.
		
		If `timeoutType` is set to 'never', the notification never expires. It stays open until closed by the calling API or the user.
	**/
	@:electron_platforms(["Windows", "Linux"])
	var timeoutType : NotificationTimeoutType;
	/**
		A `NotificationAction[]` property representing the actions of the notification.
	**/
	var actions : Array<electron.NotificationAction>;
	/**
		A `string` property representing the custom Toast XML of the notification.
	**/
	@:electron_platforms(["Windows"])
	var toastXml : String;
	function new(?options:{ /**
		A unique identifier for the notification. On macOS, maps to `UNNotificationRequest`'s `identifier` property. On Windows, maps to the toast notification's `Tag` property. Defaults to a random UUID if not provided or if an empty string is passed. Use this identifier with `Notification.remove()` to remove specific delivered notifications, or with `Notification.getHistory()` to identify them.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var id : String; /**
		A string identifier used to visually group notifications together in Notification Center / Action Center. On macOS, maps to `UNNotificationContent`'s `threadIdentifier` property. On Windows, maps to the toast notification's `Group` property. Use this identifier with `Notification.removeGroup()` to remove all notifications in a group.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var groupId : String; /**
		A title for the notification group header. When both `groupId` and `groupTitle` are specified, Windows will display a header above the notification that groups related notifications together. Maps to the toast notification's `header` element.
	**/
	@:electron_platforms(["Windows"])
	@:optional
	var groupTitle : String; /**
		A title for the notification, which will be displayed at the top of the notification window when it is shown.
	**/
	@:optional
	var title : String; /**
		A subtitle for the notification, which will be displayed below the title.
	**/
	@:electron_platforms(["macOS"])
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
		An icon to use in the notification. If a string is passed, it must be a valid path to a local icon file.
	**/
	@:optional
	var icon : haxe.extern.EitherType<String, electron.NativeImage>; /**
		Whether or not to add an inline reply option to the notification.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var hasReply : Bool; /**
		The timeout duration of the notification. Can be 'default' or 'never'.
	**/
	@:electron_platforms(["Windows", "Linux"])
	@:optional
	var timeoutType : NotificationTimeoutType; /**
		The placeholder to write in the inline reply input field.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var replyPlaceholder : String; /**
		The name of the sound file to play when the notification is shown.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var sound : String; /**
		The urgency level of the notification. Can be 'normal', 'critical', or 'low'.
	**/
	@:electron_platforms(["Windows", "Linux"])
	@:optional
	var urgency : NotificationUrgency; /**
		Actions to add to the notification. Please read the available actions and limitations in the `NotificationAction` documentation.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var actions : Array<electron.NotificationAction>; /**
		A custom title for the close button of an alert. An empty string will cause the default localized text to be used.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var closeButtonText : String; /**
		A custom description of the Notification on Windows superseding all properties above. Provides full customization of design and behavior of the notification.
	**/
	@:electron_platforms(["Windows"])
	@:optional
	var toastXml : String; }):Void;
	/**
		Immediately shows the notification to the user. Unlike the web notification API, instantiating a `new Notification()` does not immediately show it to the user. Instead, you need to call this method before the OS will display it.
		
		If the notification has been shown before, this method will dismiss the previously shown notification and create a new one with identical properties.
		
		On macOS, calling `show()` on a notification returned by `Notification.getHistory()` will remove the original notification from Notification Center and post a new one with the same properties.
	**/
	function show():Void;
	/**
		Dismisses the notification.
		
		On Windows, calling `notification.close()` while the notification is visible on screen will dismiss the notification and remove it from the Action Center. If `notification.close()` is called after the notification is no longer visible on screen, calling `notification.close()` will try remove it from the Action Center.
	**/
	function close():Void;
}
enum abstract NotificationEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the notification is shown to the user. Note that this event can be fired multiple times as a notification can be shown multiple times through the `show()` method.
	**/
	var show : electron.main.NotificationEvent<js.html.Event -> Void> = "show";
	/**
		Emitted when the notification is clicked by the user.
	**/
	var click : electron.main.NotificationEvent<js.html.Event -> Void> = "click";
	/**
		Emitted when the notification is closed by manual intervention from the user.
		
		This event is not guaranteed to be emitted in all cases where the notification is closed.
		
		On Windows, the `close` event can be emitted in one of three ways: programmatic dismissal with `notification.close()`, by the user closing the notification, or via system timeout. If a notification is in the Action Center after the initial `close` event is emitted, a call to `notification.close()` will remove the notification from the action center but the `close` event will not be emitted again.
	**/
	var close : electron.main.NotificationEvent<js.html.Event -> Void> = "close";
	/**
		Emitted when the user clicks the "Reply" button on a notification with `hasReply: true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var reply : electron.main.NotificationEvent<(js.html.Event, String) -> Void> = "reply";
	@:electron_platforms(["macOS", "Windows"])
	var action : electron.main.NotificationEvent<(js.html.Event, Float, Float) -> Void> = "action";
	/**
		Emitted when an error is encountered while creating and showing the native notification.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var failed : electron.main.NotificationEvent<(js.html.Event, String) -> Void> = "failed";
}
enum abstract NotificationUrgency(String) from String to String {
	var normal = "normal";
	var critical = "critical";
	var low = "low";
}
enum abstract NotificationTimeoutType(String) from String to String {
	var default_ = "default";
	var never = "never";
}
