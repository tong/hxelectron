package electron;
/**
	> Implement local AI language models
	
	Process: Utility
	@see https://electronjs.org/docs/api/language-model-utility
**/
@:jsRequire("electron", "LanguageModelUtility") extern class LanguageModelUtility extends js.node.events.EventEmitter<electron.LanguageModelUtility> {
	/**
		Creates a new `LanguageModelUtility` with the provided `options`.
	**/
	@:electron_experimental
	static function create(options:electron.LanguageModelCreateOptions):js.lib.Promise<electron.LanguageModelUtility>;
	/**
		Determines the availability of the language model and returns one of the following strings:
		
		* `available`
		* `downloadable`
		* `downloading`
		* `unavailable`
	**/
	@:electron_experimental
	static function availability(?options:electron.LanguageModelCreateCoreOptions):js.lib.Promise<String>;
	/**
		A `number` representing how many tokens are currently in the context window.
	**/
	@:electron_experimental
	var contextUsage : Float;
	/**
		A `number` representing the size of the context window, in tokens.
	**/
	@:electron_experimental
	var contextWindow : Float;
	function new(initialState:{ var contextUsage : Float; var contextWindow : Float; }):Void;
	/**
		Prompt the model for a response.
	**/
	@:electron_experimental
	function prompt(input:Array<electron.LanguageModelMessage>, options:electron.LanguageModelPromptOptions):haxe.extern.EitherType<js.lib.Promise<String>, js.lib.Promise<Dynamic>>;
	/**
		Append a message without prompting for a response.
	**/
	@:electron_experimental
	function append(input:Array<electron.LanguageModelMessage>, options:electron.LanguageModelAppendOptions):js.lib.Promise<Dynamic>;
	/**
		Measure how many tokens the input would use.
	**/
	@:electron_experimental
	function measureContextUsage(input:Array<electron.LanguageModelMessage>, options:electron.LanguageModelPromptOptions):js.lib.Promise<Float>;
	/**
		Clones the `LanguageModelUtility` such that the context and initial prompt should be preserved.
	**/
	@:electron_experimental
	function clone(options:electron.LanguageModelCloneOptions):js.lib.Promise<electron.LanguageModelUtility>;
	/**
		Destroys the model, and any ongoing executions are aborted.
	**/
	@:electron_experimental
	function destroy():Void;
}
enum abstract LanguageModelUtilityEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
