package electron;

///// GENERATED - DO NOT EDIT /////

/**
**/
@:enum @:require(electron) abstract ScreenEvent(String) from String to String {
	/**
		Emitted when newDisplay has been added.
	**/
	var display_added : String = "display-added";
	/**
		Emitted when oldDisplay has been removed.
	**/
	var display_removed : String = "display-removed";
	/**
		Emitted when one or more metrics change in a display. The changedMetrics is an array of strings that describe the changes. Possible changes are bounds, workArea, scaleFactor and rotation.
	**/
	var display_metrics_changed : String = "display-metrics-changed";
}