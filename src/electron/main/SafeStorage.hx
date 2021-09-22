package electron.main;
/**
	> Allows access to simple encryption and decryption of strings for storage on the local machine.
	
	Process: Main
	
	This module protects data stored on disk from being accessed by other applications or users with full disk access.
	
	Note that on Mac, access to the system Keychain is required and these calls can block the current thread to collect user input. The same is true for Linux, if a password management tool is available.
	@see https://electronjs.org/docs/api/safe-storage
**/
@:jsRequire("electron", "safeStorage") extern class SafeStorage extends js.node.events.EventEmitter<electron.main.SafeStorage> {
	/**
		Whether encryption is available.
		
		On Linux, returns true if the secret key is available. On MacOS, returns true if Keychain is available. On Windows, returns true with no other preconditions.
	**/
	static function isEncryptionAvailable():Bool;
	/**
		An array of bytes representing the encrypted string.
		
		This function will throw an error if encryption fails.
	**/
	static function encryptString(plainText:String):js.node.Buffer;
	/**
		the decrypted string. Decrypts the encrypted buffer obtained  with `safeStorage.encryptString` back into a string.
		
		This function will throw an error if decryption fails.
	**/
	static function decryptString(encrypted:js.node.Buffer):String;
}
@:enum abstract SafeStorageEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
