package electron;
/**
	@see https://electronjs.org/docs/api/structures/language-model-create-options
**/
typedef LanguageModelCreateOptions = { var signal : electron.AbortSignal; @:optional
	var initialPrompts : Array<electron.LanguageModelMessage>; } & electron.LanguageModelCreateCoreOptions;
