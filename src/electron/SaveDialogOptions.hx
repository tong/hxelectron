package electron;
typedef SaveDialogOptions = {
	/**
		The dialog title. Cannot be displayed on some _Linux_ desktop environments.
	**/
	@:optional
	var title : String;
	/**
		Absolute directory path, absolute file path, or file name to use by default. If not provided, the dialog will default to the user's Downloads folder, or their home directory if Downloads doesn't exist.
	**/
	@:optional
	var defaultPath : String;
	/**
		Custom label for the confirmation button, when left empty the default label will be used.
	**/
	@:optional
	var buttonLabel : String;
	@:optional
	var filters : Array<electron.FileFilter>;
	/**
		Message to display above text fields.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var message : String;
	/**
		Custom label for the text displayed in front of the filename text field.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var nameFieldLabel : String;
	/**
		Show the tags input box, defaults to `true`.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var showsTagField : Bool;
	@:optional
	var properties : Array<SaveDialogOptionsProperties>;
	/**
		Create a security scoped bookmark when packaged for the Mac App Store. If this option is enabled and the file doesn't already exist a blank file will be created at the chosen path.
	**/
	@:electron_platforms(["macOS", "MAS"])
	@:optional
	var securityScopedBookmarks : Bool;
}
enum abstract SaveDialogOptionsProperties(String) from String to String {
	/**
		Show hidden files in dialog.
	**/
	var showHiddenFiles = "showHiddenFiles";
	/**
		Allow creating new directories from dialog.
	**/
	var createDirectory = "createDirectory";
	/**
		Treat packages, such as `.app` folders, as a directory instead of a file.
	**/
	var treatPackageAsDirectory = "treatPackageAsDirectory";
	/**
		Sets whether the user will be presented a confirmation dialog if the user types a file name that already exists.
	**/
	var showOverwriteConfirmation = "showOverwriteConfirmation";
	/**
		Do not add the item being saved to the recent documents list.
	**/
	var dontAddToRecent = "dontAddToRecent";
}
