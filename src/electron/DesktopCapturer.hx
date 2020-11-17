package electron;
/**
	> Access information about media sources that can be used to capture audio and video from the desktop using the `navigator.mediaDevices.getUserMedia` API.
	
	Process: Main, Renderer
	
	The following example shows how to capture video from a desktop window whose title is `Electron`:
	
	```
	// In the renderer process.
	const { desktopCapturer } = require('electron')
	
	desktopCapturer.getSources({ types: ['window', 'screen'] }).then(async sources => {
	  for (const source of sources) {
	    if (source.name === 'Electron') {
	      try {
	        const stream = await navigator.mediaDevices.getUserMedia({
	          audio: false,
	          video: {
	            mandatory: {
	              chromeMediaSource: 'desktop',
	              chromeMediaSourceId: source.id,
	              minWidth: 1280,
	              maxWidth: 1280,
	              minHeight: 720,
	              maxHeight: 720
	            }
	          }
	        })
	        handleStream(stream)
	      } catch (e) {
	        handleError(e)
	      }
	      return
	    }
	  }
	})
	
	function handleStream (stream) {
	  const video = document.querySelector('video')
	  video.srcObject = stream
	  video.onloadedmetadata = (e) => video.play()
	}
	
	function handleError (e) {
	  console.log(e)
	}
	```
	
	To capture video from a source provided by `desktopCapturer` the constraints passed to `navigator.mediaDevices.getUserMedia` must include `chromeMediaSource: 'desktop'`, and `audio: false`.
	
	To capture both audio and video from the entire desktop the constraints passed to `navigator.mediaDevices.getUserMedia` must include `chromeMediaSource: 'desktop'`, for both `audio` and `video`, but should not include a `chromeMediaSourceId` constraint.
	@see https://electronjs.org/docs/api/desktop-capturer
**/
@:jsRequire("electron", "desktopCapturer") extern class DesktopCapturer extends js.node.events.EventEmitter<electron.DesktopCapturer> {
	/**
		Resolves with an array of `DesktopCapturerSource` objects, each `DesktopCapturerSource` represents a screen or an individual window that can be captured.
		
		**Note** Capturing the screen contents requires user consent on macOS 10.15 Catalina or higher, which can detected by `systemPreferences.getMediaAccessStatus`.
	**/
	static function getSources(options:{ /**
		An array of Strings that lists the types of desktop sources to be captured, available types are `screen` and `window`.
	**/
	var types : Array<String>; /**
		The size that the media source thumbnail should be scaled to. Default is `150` x `150`. Set width or height to 0 when you do not need the thumbnails. This will save the processing time required for capturing the content of each window and screen.
	**/
	@:optional
	var thumbnailSize : electron.Size; /**
		Set to true to enable fetching window icons. The default value is false. When false the appIcon property of the sources return null. Same if a source has the type screen.
	**/
	@:optional
	var fetchWindowIcons : Bool; }):js.lib.Promise<Any>;
}
@:enum abstract DesktopCapturerEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
