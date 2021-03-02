package electron;
/**
	@see https://electronjs.org/docs/api/structures/serial-port
**/
typedef SerialPort = {
	/**
		Unique identifier for the port.
	**/
	var portId : String;
	/**
		Name of the port.
	**/
	var portName : String;
	/**
		A string suitable for display to the user for describing this device.
	**/
	var displayName : String;
	/**
		Optional USB vendor ID.
	**/
	var vendorId : String;
	/**
		Optional USB product ID.
	**/
	var productId : String;
	/**
		The USB device serial number.
	**/
	var serialNumber : String;
	/**
		Represents a single serial port on macOS can be enumerated by multiple drivers.
	**/
	var usbDriverName : String;
	/**
		A stable identifier on Windows that can be used for device permissions.
	**/
	var deviceInstanceId : String;
}
