package electron;
/**
	@see https://electronjs.org/docs/api/structures/language-model-message-content
**/
typedef LanguageModelMessageContent = {
	/**
		Can be one of the following values:
	**/
	var type : LanguageModelMessageContentType;
	var value : haxe.extern.EitherType<js.lib.ArrayBuffer, String>;
}
enum abstract LanguageModelMessageContentType(String) from String to String {
	var text = "text";
	var image = "image";
	var audio = "audio";
}
