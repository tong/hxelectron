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
	@:optional
	var displayName : String;
	/**
		The USB vendor ID.
	**/
	@:optional
	var vendorId : String;
	/**
		The USB product ID.
	**/
	@:optional
	var productId : String;
	/**
		The USB device serial number.
	**/
	@:optional
	var serialNumber : String;
	/**
		Represents a single serial port on macOS can be enumerated by multiple drivers.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var usbDriverName : String;
	/**
		A stable identifier on Windows that can be used for device permissions.
	**/
	@:electron_platforms(["Windows"])
	@:optional
	var deviceInstanceId : String;
}
