package electron;
/**
	@see https://electronjs.org/docs/api/structures/printer-info
**/
typedef PrinterInfo = {
	/**
		the name of the printer as understood by the OS.
	**/
	var name : String;
	/**
		the name of the printer as shown in Print Preview.
	**/
	var displayName : String;
	/**
		a longer description of the printer's type.
	**/
	var description : String;
	/**
		the current status of the printer.
	**/
	var status : Float;
	/**
		whether or not a given printer is set as the default printer on the OS.
	**/
	var isDefault : Bool;
	/**
		an object containing a variable number of platform-specific printer information.
	**/
	var options : Any;
}
