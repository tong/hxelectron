package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/remove-password>
**/
@:require(js, electron) typedef RemovePassword = {
	/**
		.
	**/
	var type : String;
	/**
		When provided, the authentication info related to the origin will only be removed otherwise the entire cache will be cleared.
	**/
	var origin : String;
	/**
		Scheme of the authentication. Can be , , , . Must be provided if removing by .
	**/
	var scheme : String;
	/**
		Realm of the authentication. Must be provided if removing by .
	**/
	var realm : String;
	/**
		Credentials of the authentication. Must be provided if removing by .
	**/
	var username : String;
	/**
		Credentials of the authentication. Must be provided if removing by .
	**/
	var password : String;
}