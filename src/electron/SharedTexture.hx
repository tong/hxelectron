package electron;
/**
	> Import shared textures into Electron and converts platform specific handles into `VideoFrame`. Supports all Web rendering systems, and can be transferred across Electron processes. Read here for more information.
	
	Process: Main, Renderer
	@see https://electronjs.org/docs/api/shared-texture
**/
@:jsRequire("electron", "sharedTexture") extern class SharedTexture extends js.node.events.EventEmitter<electron.SharedTexture> {
	/**
		A `SharedTextureSubtle` property, provides subtle APIs for interacting with shared texture for advanced users.
	**/
	@:electron_experimental
	static var subtle : electron.SharedTextureSubtle;
	/**
		Imports the shared texture from the given options.
		
		> [!NOTE] This method is only available in the main process.
		
		The imported shared texture.
	**/
	@:electron_experimental
	static function importSharedTexture(options:{ /**
		The information of the shared texture to import.
	**/
	var textureInfo : electron.SharedTextureImportTextureInfo; /**
		Called when all references in all processes are released. You should keep the imported texture valid until this callback is called.
	**/
	@:optional
	var allReferencesReleased : haxe.Constraints.Function; }):electron.SharedTextureImported;
	/**
		Send the imported shared texture to a renderer process. You must register a receiver at renderer process before calling this method. This method has a 1000ms timeout. Ensure the receiver is set and the renderer process is alive before calling this method.
		
		> [!NOTE] This method is only available in the main process.
		
		Resolves when the transfer is complete.
	**/
	@:electron_experimental
	static function sendSharedTexture(options:{ /**
		The target frame to transfer the shared texture to. For `WebContents`, you can pass `webContents.mainFrame`. If you provide a `webFrameMain` that is not a main frame, you'll need to enable `webPreferences.nodeIntegrationInSubFrames` for this, since this feature requires IPC between main and the frame.
	**/
	var frame : electron.main.WebFrameMain; /**
		The imported shared texture.
	**/
	var importedSharedTexture : electron.SharedTextureImported; }, args:haxe.extern.Rest<Any>):js.lib.Promise<Void>;
	/**
		Set a callback to receive imported shared textures from the main process.
		
		> [!NOTE] This method is only available in the renderer process.
	**/
	@:electron_experimental
	static function setSharedTextureReceiver(callback:haxe.Constraints.Function):Void;
}
enum abstract SharedTextureEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
