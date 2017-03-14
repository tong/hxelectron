package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/certificate>
**/
@:require(js, electron) typedef Certificate = {
	/**
		PEM encoded data
	**/
	var data : String;
	/**
		Issuer principal
	**/
	var issuer : CertificatePrincipal;
	/**
		Issuer's Common Name
	**/
	var issuerName : String;
	/**
		Issuer certificate (if not self-signed)
	**/
	var issuerCert : Certificate;
	/**
		Subject principal
	**/
	var subject : CertificatePrincipal;
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