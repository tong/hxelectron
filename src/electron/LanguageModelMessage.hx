package electron;
/**
	@see https://electronjs.org/docs/api/structures/language-model-message
**/
typedef LanguageModelMessage = {
	/**
		Can be one of the following values:
	**/
	var role : LanguageModelMessageRole;
	var content : Array<electron.LanguageModelMessageContent>;
	@:optional
	var prefix : Bool;
}
enum abstract LanguageModelMessageRole(String) from String to String {
	var system = "system";
	var user = "user";
	var assistant = "assistant";
}
