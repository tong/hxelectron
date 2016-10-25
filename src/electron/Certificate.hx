package electron;

///// GENERATED - DO NOT EDIT /////

/**
**/
@:require(electron) typedef Certificate = {
	/**
		PEM encoded data
	**/
	var data : String;
	/**
		Issuer's Common Name
	**/
	var issuerName : String;
	/**
		Subject's Common Name
	**/
	var subjectName : String;
	/**
		Hex value represented string
	**/
	var serialNumber : String;
	/**
		Start date of the certificate being valid in seconds
	**/
	var validStart : Float;
	/**
		End date of the certificate being valid in seconds
	**/
	var validExpiry : Float;
	/**
		Fingerprint of the certificate
	**/
	var fingerprint : String;
}