package electron;
/**
	@see https://electronjs.org/docs/api/structures/language-model-prompt-options
**/
typedef LanguageModelPromptOptions = {
	/**
		a JSON schema object or a `RegExp` used to constrain the response to match the specified restraints.
	**/
	@:optional
	var responseConstraint : haxe.extern.EitherType<Any, js.lib.RegExp>;
	var signal : electron.AbortSignal;
}
