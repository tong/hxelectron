package electron.remote;
/**
	> Access information about media sources that can be used to capture audio and video from the desktop using the `navigator.mediaDevices.getUserMedia` API.
	
	Process: Main
	
	The following example shows how to capture video from a desktop window whose title is `Electron`:
	
	```
	// main.js
	const { app, BrowserWindow, desktopCapturer, session } = require('electron')
	
	app.whenReady().then(() => {
	  const mainWindow = new BrowserWindow()
	
	  session.defaultSession.setDisplayMediaRequestHandler((request, callback) => {
	    desktopCapturer.getSources({ types: ['screen'] }).then((sources) => {
	      // Grant access to the first screen found.
	      callback({ video: sources[0], audio: 'loopback' })
	    })
	    // If true, use the system picker if available.
	    // Note: this is currently experimental. If the system picker
	    // is available, it will be used and the media request handler
	    // will not be invoked.
	  }, { useSystemPicker: true })
	
	  mainWindow.loadFile('index.html')
	})
	```
	
	```
	// renderer.js
	const startButton = document.getElementById('startButton')
	const stopButton = document.getElementById('stopButton')
	const video = document.querySelector('video')
	
	startButton.addEventListener('click', () => {
	  navigator.mediaDevices.getDisplayMedia({
	    audio: true,
	    video: {
	      width: 320,
	      height: 240,
	      frameRate: 30
	    }
	  }).then(stream => {
	    video.srcObject = stream
	    video.onloadedmetadata = (e) => video.play()
	  }).catch(e => console.log(e))
	})
	
	stopButton.addEventListener('click', () => {
	  video.pause()
	})
	```
	
	```
	<!-- index.html -->
	<html>
	<meta http-equiv="content-security-policy" content="script-src 'self' 'unsafe-inline'" />
	  <body>
	    <button id="startButton" class="button">Start</button>
	    <button id="stopButton" class="button">Stop</button>
	    <video width="320" height="240" autoplay></video>
	    <script src="renderer.js"></script>
	  </body>
	</html>
	```
	
	See `navigator.mediaDevices.getDisplayMedia` for more information.
	
	> [!NOTE] `navigator.mediaDevices.getDisplayMedia` does not permit the use of `deviceId` for selection of a source - see specification.
	@see https://electronjs.org/docs/api/desktop-capturer
**/
@:jsRequire("electron", "remote.desktopCapturer") extern class DesktopCapturer extends js.node.events.EventEmitter<electron.remote.DesktopCapturer> {
	/**
		Resolves with an array of `DesktopCapturerSource` objects, each `DesktopCapturerSource` represents a screen or an individual window that can be captured.
		
		> [!NOTE] Capturing the screen contents requires user consent on macOS 10.15 Catalina or higher, which can detected by `systemPreferences.getMediaAccessStatus`.
	**/
	static function getSources(options:{ /**
		An array of strings that lists the types of desktop sources to be captured, available types can be `screen` and `window`.
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
enum abstract DesktopCapturerEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
