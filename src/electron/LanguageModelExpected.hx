package electron;
/**
	@see https://electronjs.org/docs/api/structures/language-model-expected
**/
typedef LanguageModelExpected = {
	/**
		Can be one of the following values:
	**/
	var type : LanguageModelExpectedType;
	@:optional
	var languages : Array<String>;
}
enum abstract LanguageModelExpectedType(String) from String to String {
	var text = "text";
	var image = "image";
	var audio = "audio";
}
