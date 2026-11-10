package electron;
/**
	@see https://electronjs.org/docs/api/structures/language-model-create-core-options
**/
typedef LanguageModelCreateCoreOptions = {
	@:optional
	var expectedInputs : Array<electron.LanguageModelExpected>;
	@:optional
	var expectedOutputs : Array<electron.LanguageModelExpected>;
}
