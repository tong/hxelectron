package electron;
/**
	@see https://electronjs.org/docs/api/structures/cookie
**/
typedef Cookie = {
	/**
		The name of the cookie.
	**/
	var name : String;
	/**
		The value of the cookie.
	**/
	var value : String;
	/**
		The domain of the cookie; this will be normalized with a preceding dot so that it's also valid for subdomains.
	**/
	@:optional
	var domain : String;
	/**
		Whether the cookie is a host-only cookie; this will only be `true` if no domain was passed.
	**/
	@:optional
	var hostOnly : Bool;
	/**
		The path of the cookie.
	**/
	@:optional
	var path : String;
	/**
		Whether the cookie is marked as secure.
	**/
	@:optional
	var secure : Bool;
	/**
		Whether the cookie is marked as HTTP only.
	**/
	@:optional
	var httpOnly : Bool;
	/**
		Whether the cookie is a session cookie or a persistent cookie with an expiration date.
	**/
	@:optional
	var session : Bool;
	/**
		The expiration date of the cookie as the number of seconds since the UNIX epoch. Not provided for session cookies.
	**/
	@:optional
	var expirationDate : Float;
	/**
		The Same Site policy applied to this cookie.  Can be `unspecified`, `no_restriction`, `lax` or `strict`.
	**/
	var sameSite : String;
}
