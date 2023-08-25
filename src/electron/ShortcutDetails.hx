package electron;
/**
	@see https://electronjs.org/docs/api/structures/shortcut-details
**/
typedef ShortcutDetails = {
	/**
		The target to launch from this shortcut.
	**/
	var target : String;
	/**
		The working directory. Default is empty.
	**/
	@:optional
	var cwd : String;
	/**
		The arguments to be applied to `target` when launching from this shortcut. Default is empty.
	**/
	@:optional
	var args : String;
	/**
		The description of the shortcut. Default is empty.
	**/
	@:optional
	var description : String;
	/**
		The path to the icon, can be a DLL or EXE. `icon` and `iconIndex` have to be set together. Default is empty, which uses the target's icon.
	**/
	@:optional
	var icon : String;
	/**
		The resource ID of icon when `icon` is a DLL or EXE. Default is 0.
	**/
	@:optional
	var iconIndex : Float;
	/**
		The Application User Model ID. Default is empty.
	**/
	@:optional
	var appUserModelId : String;
	/**
		The Application Toast Activator CLSID. Needed for participating in Action Center.
	**/
	@:optional
	var toastActivatorClsid : String;
}
