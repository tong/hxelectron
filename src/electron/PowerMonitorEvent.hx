package electron;
@:enum @:require("electron") abstract PowerMonitorEvent(String) from String to String {
	/**
		Emitted when the system is suspending.
	**/
	var suspend : String = "suspend";
	/**
		Emitted when system is resuming.
	**/
	var resume : String = "resume";
	/**
		Emitted when the system changes to AC power.
	**/
	var on_ac : String = "on-ac";
	/**
		Emitted when system changes to battery power.
	**/
	var on_battery : String = "on-battery";
}