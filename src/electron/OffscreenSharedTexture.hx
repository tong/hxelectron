package electron;
/**
	@see https://electronjs.org/docs/api/structures/offscreen-shared-texture
**/
typedef OffscreenSharedTexture = {
	/**
		The shared texture info.
	**/
	var textureInfo : { /**
		The widget type of the texture. Can be `popup` or `frame`.
	**/
	var widgetType : String; /**
		The pixel format of the texture. Can be `rgba` or `bgra`.
	**/
	var pixelFormat : String; /**
		The full dimensions of the video frame.
	**/
	var codedSize : electron.Size; /**
		A subsection of [0, 0, codedSize.width(), codedSize.height()]. In OSR case, it is expected to have the full section area.
	**/
	var visibleRect : electron.Rectangle; /**
		The region of the video frame that capturer would like to populate. In OSR case, it is the same with `dirtyRect` that needs to be painted.
	**/
	var contentRect : electron.Rectangle; /**
		The time in microseconds since the capture start.
	**/
	var timestamp : Float; /**
		Extra metadata. See comments in src\media\base\video_frame_metadata.h for accurate details.
	**/
	var metadata : { /**
		Updated area of frame, can be considered as the `dirty` area.
	**/
	@:optional
	var captureUpdateRect : electron.Rectangle; /**
		May reflect the frame's contents origin if region capture is used internally.
	**/
	@:optional
	var regionCaptureRect : electron.Rectangle; /**
		Full size of the source frame.
	**/
	@:optional
	var sourceSize : electron.Rectangle; /**
		The increasing count of captured frame. May contain gaps if frames are dropped between two consecutively received frames.
	**/
	@:optional
	var frameCount : Float; }; /**
		The handle to the shared texture.
	**/
	var sharedTextureHandle : js.node.Buffer; /**
		Each plane's info of the shared texture.
	**/
	var planes : Array<{ /**
	The strides and offsets in bytes to be used when accessing the buffers via a memory mapping. One per plane per entry.
**/
var stride : Float; /**
	The strides and offsets in bytes to be used when accessing the buffers via a memory mapping. One per plane per entry.
**/
var offset : Float; /**
	Size in bytes of the plane. This is necessary to map the buffers.
**/
var size : Float; /**
	File descriptor for the underlying memory object (usually dmabuf).
**/
var fd : Float; }>; /**
		The modifier is retrieved from GBM library and passed to EGL driver.
	**/
	var modifier : String; };
	/**
		Release the resources. The `texture` cannot be directly passed to another process, users need to maintain texture lifecycles in main process, but it is safe to pass the `textureInfo` to another process. Only a limited number of textures can exist at the same time, so it's important that you call `texture.release()` as soon as you're done with the texture.
	**/
	var release : haxe.Constraints.Function;
}
