package electron;
/**
	@see https://electronjs.org/docs/api/structures/usb-device
**/
typedef USBDevice = {
	/**
		Unique identifier for the device.
	**/
	var deviceId : String;
	/**
		The USB vendor ID.
	**/
	var vendorId : Int;
	/**
		The USB product ID.
	**/
	var productId : Int;
	/**
		Name of the device.
	**/
	var productName : String;
	/**
		The USB device serial number.
	**/
	var serialNumber : String;
	/**
		The manufacturer name of the device.
	**/
	var manufacturerName : String;
	/**
		The USB protocol major version supported by the device
	**/
	var usbVersionMajor : Int;
	/**
		The USB protocol minor version supported by the device
	**/
	var usbVersionMinor : Int;
	/**
		The USB protocol subminor version supported by the device
	**/
	var usbVersionSubminor : Int;
	/**
		The device class for the communication interface supported by the device
	**/
	var deviceClass : Int;
	/**
		The device subclass for the communication interface supported by the device
	**/
	var deviceSubclass : Int;
	/**
		The device protocol for the communication interface supported by the device
	**/
	var deviceProtocol : Int;
	/**
		The major version number of the device as defined by the device manufacturer.
	**/
	var deviceVersionMajor : Int;
	/**
		The minor version number of the device as defined by the device manufacturer.
	**/
	var deviceVersionMinor : Int;
	/**
		The subminor version number of the device as defined by the device manufacturer.
	**/
	var deviceVersionSubminor : Int;
}
