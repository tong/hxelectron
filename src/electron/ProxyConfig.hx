package electron;
/**
	When `mode` is unspecified, `pacScript` and `proxyRules` are provided together, the `proxyRules` option is ignored and `pacScript` configuration is applied.
	
	The `proxyRules` has to follow the rules below:
	
	For example:
	
	* `http=foopy:80;ftp=foopy2` - Use HTTP proxy `foopy:80` for `http://` URLs, and HTTP proxy `foopy2:80` for `ftp://` URLs.
	* `foopy:80` - Use HTTP proxy `foopy:80` for all URLs.
	* `foopy:80,bar,direct://` - Use HTTP proxy `foopy:80` for all URLs, failing over to `bar` if `foopy:80` is unavailable, and after that using no proxy.
	* `socks4://foopy` - Use SOCKS v4 proxy `foopy:1080` for all URLs.
	* `http=foopy,socks5://bar.com` - Use HTTP proxy `foopy` for http URLs, and fail over to the SOCKS5 proxy `bar.com` if `foopy` is unavailable.
	* `http=foopy,direct://` - Use HTTP proxy `foopy` for http URLs, and use no proxy if `foopy` is unavailable.
	* `http=foopy;socks=foopy2` - Use HTTP proxy `foopy` for http URLs, and use `socks4://foopy2` for all other URLs.
	
	The `proxyBypassRules` is a comma separated list of rules described below:
	
	* `[ URL_SCHEME "://" ] HOSTNAME_PATTERN [ ":" <port> ]`
	
	Match all hostnames that match the pattern HOSTNAME_PATTERN.
	
	Examples: "foobar.com", "*foobar.com", "*.foobar.com", "*foobar.com:99", "https://x.*.y.com:99"
	* `"." HOSTNAME_SUFFIX_PATTERN [ ":" PORT ]`
	
	Match a particular domain suffix.
	
	Examples: ".google.com", ".com", "http://.google.com"
	* `[ SCHEME "://" ] IP_LITERAL [ ":" PORT ]`
	
	Match URLs which are IP address literals.
	
	Examples: "127.0.1", "[0:0::1]", "[::1]", "http://[::1]:99"
	* `IP_LITERAL "/" PREFIX_LENGTH_IN_BITS`
	
	Match any URL that is to an IP literal that falls between the given range. IP range is specified using CIDR notation.
	
	Examples: "192.168.1.1/16", "fefe:13::abc/33".
	* `<local>`
	
	Match local addresses. The meaning of `<local>` is whether the host matches one of: "127.0.0.1", "::1", "localhost".
	@see https://electronjs.org/docs/api/structures/proxy-config
**/
typedef ProxyConfig = {
	/**
		The proxy mode. Should be one of `direct`, `auto_detect`, `pac_script`, `fixed_servers` or `system`. Defaults to `pac_script` proxy mode if `pacScript` option is specified otherwise defaults to `fixed_servers`.
	**/
	@:optional
	var mode : String;
	/**
		The URL associated with the PAC file.
	**/
	@:optional
	var pacScript : String;
	/**
		Rules indicating which proxies to use.
	**/
	@:optional
	var proxyRules : String;
	/**
		Rules indicating which URLs should bypass the proxy settings.
	**/
	@:optional
	var proxyBypassRules : String;
}
