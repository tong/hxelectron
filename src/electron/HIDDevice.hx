package electron;
/**
	@see https://electronjs.org/docs/api/structures/hid-device
**/
typedef HIDDevice = {
	/**
		Unique identifier for the device.
	**/
	var deviceId : String;
	/**
		Name of the device.
	**/
	var name : String;
	/**
		The USB vendor ID.
	**/
	var vendorId : Int;
	/**
		The USB product ID.
	**/
	var productId : Int;
	/**
		The USB device serial number.
	**/
	@:optional
	var serialNumber : String;
	/**
		Unique identifier for the HID interface.  A device may have multiple HID interfaces.
	**/
	@:optional
	var guid : String;
	/**
		an array of report formats. See MDN documentation for more.
	**/
	var collections : Array<{ /**
	An integer representing the usage ID component of the HID usage associated with this collection.
**/
var usage : Int; /**
	An integer representing the usage page component of the HID usage associated with this collection.
**/
var usagePage : Int; /**
	An 8-bit value representing the collection type, which describes a different relationship between the grouped items.
**/
var type : Int; /**
	An array of sub-collections which takes the same format as a top-level collection.
**/
var children : Array<Any>; /**
	An array of inputReport items which represent individual input reports described in this collection.
**/
var inputReports : Array<Any>; /**
	An array of outputReport items which represent individual output reports described in this collection.
**/
var outputReports : Array<Any>; /**
	An array of featureReport items which represent individual feature reports described in this collection.
**/
var featureReports : Array<Any>; }>;
}
