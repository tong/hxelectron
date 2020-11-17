package electron;
/**
	@see https://electronjs.org/docs/api/structures/task
**/
typedef Task = {
	/**
		Path of the program to execute, usually you should specify `process.execPath` which opens the current program.
	**/
	var program : String;
	/**
		The command line arguments when `program` is executed.
	**/
	var arguments : String;
	/**
		The string to be displayed in a JumpList.
	**/
	var title : String;
	/**
		Description of this task.
	**/
	var description : String;
	/**
		The absolute path to an icon to be displayed in a JumpList, which can be an arbitrary resource file that contains an icon. You can usually specify `process.execPath` to show the icon of the program.
	**/
	var iconPath : String;
	/**
		The icon index in the icon file. If an icon file consists of two or more icons, set this value to identify the icon. If an icon file consists of one icon, this value is 0.
	**/
	var iconIndex : Float;
	/**
		The working directory. Default is empty.
	**/
	var workingDirectory : String;
}
