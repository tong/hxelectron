package electron;
/**
	@see https://electronjs.org/docs/api/structures/webauthn-account
**/
typedef WebAuthnAccount = {
	/**
		URL-safe base64-encoded (no padding) credential ID of the discoverable credential. Matches `PublicKeyCredential.id` returned by `navigator.credentials.get()` in the renderer.
	**/
	var credentialId : String;
	/**
		URL-safe base64-encoded (no padding) user handle (`user.id`) that was provided when the credential was created.
	**/
	@:optional
	var userHandle : String;
	/**
		Human-palatable identifier for the account (for example, an email address or username).
	**/
	@:optional
	var name : String;
	/**
		Human-palatable name for the account, intended for display.
	**/
	@:optional
	var displayName : String;
}
