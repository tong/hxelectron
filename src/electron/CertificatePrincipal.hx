package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/certificate-principal>
**/
@:require(js, electron) @:electron typedef CertificatePrincipal = {
	/**
		Common Name
	**/
	var commonName : String;
	/**
		Organization names
	**/
	var organizations : Array<String>;
	/**
		Organization Unit names
	**/
	var organizationUnits : Array<String>;
	/**
		Locality
	**/
	var locality : String;
	/**
		State or province
	**/
	var state : String;
	/**
		Country or region
	**/
	var country : String;
}