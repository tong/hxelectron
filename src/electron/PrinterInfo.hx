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
		an object containing a variable number of platform-specific printer information.
	**/
	var options : Any;
}
