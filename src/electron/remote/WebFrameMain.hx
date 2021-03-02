package electron.remote;
/**
	@see https://electronjs.org/docs/api/web-frame-main
**/
@:jsRequire("electron", "remote.WebFrameMain") extern class WebFrameMain extends js.node.events.EventEmitter<electron.remote.WebFrameMain> {
	/**
		A frame with the given process and routing IDs, or `undefined` if there is no WebFrameMain associated with the given IDs.
	**/
	static function fromId(processId:Int, routingId:Int):haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		A `string` representing the current URL of the frame.
	**/
	var url : String;
	/**
		A `WebFrameMain | null` representing top frame in the frame hierarchy to which `frame` belongs.
	**/
	var top : haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		A `WebFrameMain | null` representing parent frame of `frame`, the property would be `null` if `frame` is the top frame in the frame hierarchy.
	**/
	var parent : haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		A `WebFrameMain[]` collection containing the direct descendents of `frame`.
	**/
	var frames : Array<electron.remote.WebFrameMain>;
	/**
		A `WebFrameMain[]` collection containing every frame in the subtree of `frame`, including itself. This can be useful when traversing through all frames.
	**/
	var framesInSubtree : Array<electron.remote.WebFrameMain>;
	/**
		An `Integer` representing the id of the frame's internal FrameTreeNode instance. This id is browser-global and uniquely identifies a frame that hosts content. The identifier is fixed at the creation of the frame and stays constant for the lifetime of the frame. When the frame is removed, the id is not used again.
	**/
	var frameTreeNodeId : Int;
	/**
		A `String` representing the frame name.
	**/
	var name : String;
	/**
		An `Integer` representing the operating system `pid` of the process which owns this frame.
	**/
	var osProcessId : Int;
	/**
		An `Integer` representing the Chromium internal `pid` of the process which owns this frame. This is not the same as the OS process ID; to read that use `frame.osProcessId`.
	**/
	var processId : Int;
	/**
		An `Integer` representing the unique frame id in the current renderer process. Distinct `WebFrameMain` instances that refer to the same underlying frame will have the same `routingId`.
	**/
	var routingId : Int;
	/**
		A promise that resolves with the result of the executed code or is rejected if execution throws or results in a rejected promise.
		
		Evaluates `code` in page.
		
		In the browser window some HTML APIs like `requestFullScreen` can only be invoked by a gesture from the user. Setting `userGesture` to `true` will remove this limitation.
	**/
	function executeJavaScript(code:String, ?userGesture:Bool):js.lib.Promise<Any>;
	/**
		Whether the reload was initiated successfully. Only results in `false` when the frame has no history.
	**/
	function reload():Bool;
	/**
		Send an asynchronous message to the renderer process via `channel`, along with arguments. Arguments will be serialized with the [Structured Clone Algorithm][SCA], just like [`postMessage`][], so prototype chains will not be included. Sending Functions, Promises, Symbols, WeakMaps, or WeakSets will throw an exception.
		
		The renderer process can handle the message by listening to `channel` with the `ipcRenderer` module.
	**/
	function send(channel:String, args:haxe.extern.Rest<Any>):Void;
	/**
		Send a message to the renderer process, optionally transferring ownership of zero or more [`MessagePortMain`][] objects.
		
		The transferred `MessagePortMain` objects will be available in the renderer process by accessing the `ports` property of the emitted event. When they arrive in the renderer, they will be native DOM `MessagePort` objects.
		
		For example:
	**/
	function postMessage(channel:String, message:Any, ?transfer:Array<electron.remote.MessagePortMain>):Void;
}
@:enum abstract WebFrameMainEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
