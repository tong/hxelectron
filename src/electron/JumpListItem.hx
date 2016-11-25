package electron;

/**
**/
@:require(js, electron) typedef JumpListItem = {
	/**
		One of the following:
	**/
	var type : String;
	/**
		(optional) Path of the file to open, should only be set if is .
	**/
	@:optional
	var path : String;
	/**
		(optional) Path of the program to execute, usually you should specify which opens the current program. Should only be set if is .
	**/
	@:optional
	var program : String;
	/**
		(optional) The command line arguments when is executed. Should only be set if is .
	**/
	@:optional
	var args : String;
	/**
		(optional) The text to be displayed for the item in the Jump List. Should only be set if is .
	**/
	@:optional
	var title : String;
	/**
		(optional) Description of the task (displayed in a tooltip). Should only be set if is .
	**/
	@:optional
	var description : String;
	/**
		The absolute path to an icon to be displayed in a Jump List, which can be an arbitrary resource file that contains an icon (e.g. , , ). You can usually specify to show the program icon.
	**/
	var iconPath : String;
	/**
		The index of the icon in the resource file. If a resource file contains multiple icons this value can be used to specify the zero-based index of the icon that should be displayed for this task. If a resource file contains only one icon, this property should be set to zero.
	**/
	var iconIndex : Float;
}