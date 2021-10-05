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
	var serialNumber : String;
	/**
		Unique identifier for the HID interface.  A device may have multiple HID interfaces.
	**/
	var guid : String;
}
