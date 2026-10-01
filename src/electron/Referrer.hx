package electron;
/**
	@see https://electronjs.org/docs/api/structures/referrer
**/
typedef Referrer = {
	/**
		HTTP Referrer URL.
	**/
	var url : String;
	/**
		Can be `default`, `unsafe-url`, `no-referrer-when-downgrade`, `no-referrer`, `origin`, `strict-origin-when-cross-origin`, `same-origin` or `strict-origin`. See the Referrer-Policy spec for more details on the meaning of these values.
	**/
	var policy : ReferrerPolicy;
}
enum abstract ReferrerPolicy(String) from String to String {
	var default_ = "default";
	var unsafe_url = "unsafe-url";
	var no_referrer_when_downgrade = "no-referrer-when-downgrade";
	var no_referrer = "no-referrer";
	var origin = "origin";
	var strict_origin_when_cross_origin = "strict-origin-when-cross-origin";
	var same_origin = "same-origin";
	var strict_origin = "strict-origin";
}
