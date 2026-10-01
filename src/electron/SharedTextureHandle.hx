package electron;
/**
	@see https://electronjs.org/docs/api/structures/shared-texture-handle
**/
typedef SharedTextureHandle = {
	/**
		NT HANDLE holds the shared texture. Note that this NT HANDLE is local to current process.  Output textures of `rgba`, `bgra`, `rgbaf16` formats don't have a keyed mutex on the texture handle, but `nv12` format texture handles do have a keyed mutex.
	**/
	@:optional
	var ntHandle : js.node.Buffer;
	/**
		IOSurfaceRef holds the shared texture. Note that this IOSurface is local to current process (not global).
	**/
	@:optional
	var ioSurface : js.node.Buffer;
	/**
		Structure contains planes of shared texture.
	**/
	@:optional
	var nativePixmap : { /**
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
	var modifier : String; /**
		Indicates whether supports zero copy import to WebGPU.
	**/
	var supportsZeroCopyWebGpuImport : Bool; };
}
