package electron;
/**
	@see https://electronjs.org/docs/api/structures/usb-device
**/
typedef USBDevice = {
	/**
		A USBConfiguration object containing information about the currently selected configuration of a USB device.
	**/
	@:optional
	var configuration : { /**
		the configuration value of this configuration.
	**/
	var configurationValue : Int; /**
		the name provided by the device to describe this configuration.
	**/
	var configurationName : String; /**
		An array of USBInterface objects containing information about an interface provided by the USB device.
	**/
	var interfaces : Array<{ /**
	the interface number of this interface.
**/
var interfaceNumber : Int; /**
	the currently selected alternative configuration of this interface.
**/
var alternate : { /**
	the alternate setting number of this interface.
**/
var alternateSetting : Int; /**
	the class of this interface. See USB.org for class code descriptions.
**/
var interfaceClass : Int; /**
	the subclass of this interface.
**/
var interfaceSubclass : Int; /**
	the protocol supported by this interface.
**/
var interfaceProtocol : Int; /**
	the name of the interface, if one is provided by the device.
**/
@:optional
var interfaceName : String; /**
	an array containing instances of the USBEndpoint interface describing each of the endpoints that are part of this interface.
**/
var endpoints : Array<{ /**
	this endpoint's "endpoint number" which is a value from 1 to 15.
**/
var endpointNumber : Int; /**
	the direction in which this endpoint transfers data - can be either 'in' or 'out'.
**/
var direction : String; /**
	the type of this endpoint - can be either 'bulk', 'interrupt', or 'isochronous'.
**/
var type : String; /**
	the size of the packets that data sent through this endpoint will be divided into.
**/
var packetSize : Int; }>; }; /**
	an array containing instances of the USBAlternateInterface interface describing each of the alternative configurations possible for this interface.
**/
var alternates : Array<Any>; }>; };
	/**
		An array of USBConfiguration interfaces for controlling a paired USB device.
	**/
	var configurations : Array<Any>;
	/**
		The device class for the communication interface supported by the device.
	**/
	var deviceClass : Int;
	/**
		Unique identifier for the device.
	**/
	var deviceId : String;
	/**
		The device protocol for the communication interface supported by the device.
	**/
	var deviceProtocol : Int;
	/**
		The device subclass for the communication interface supported by the device.
	**/
	var deviceSubclass : Int;
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
	/**
		The manufacturer name of the device.
	**/
	@:optional
	var manufacturerName : String;
	/**
		The USB product ID.
	**/
	var productId : Int;
	/**
		Name of the device.
	**/
	@:optional
	var productName : String;
	/**
		The USB device serial number.
	**/
	@:optional
	var serialNumber : String;
	/**
		The USB protocol major version supported by the device.
	**/
	var usbVersionMajor : Int;
	/**
		The USB protocol minor version supported by the device.
	**/
	var usbVersionMinor : Int;
	/**
		The USB protocol subminor version supported by the device.
	**/
	var usbVersionSubminor : Int;
	/**
		The USB vendor ID.
	**/
	var vendorId : Int;
}
