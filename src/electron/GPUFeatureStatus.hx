package electron;
/**
	Possible values:
	
	* `disabled_software` - Software only. Hardware acceleration disabled (yellow)
	* `disabled_off` - Disabled (red)
	* `disabled_off_ok` - Disabled (yellow)
	* `unavailable_software` - Software only, hardware acceleration unavailable (yellow)
	* `unavailable_off` - Unavailable (red)
	* `unavailable_off_ok` - Unavailable (yellow)
	* `enabled_readback` - Hardware accelerated but at reduced performance (yellow)
	* `enabled_force` - Hardware accelerated on all pages (green)
	* `enabled` - Hardware accelerated (green)
	* `enabled_on` - Enabled (green)
	* `enabled_force_on` - Force enabled (green)
	@see https://electronjs.org/docs/api/structures/gpu-feature-status
**/
typedef GPUFeatureStatus = {
	/**
		Canvas.
	**/
	@:native("2d_canvas")
	var _2d_canvas : String;
	/**
		Flash.
	**/
	var flash_3d : String;
	/**
		Flash Stage3D.
	**/
	var flash_stage3d : String;
	/**
		Flash Stage3D Baseline profile.
	**/
	var flash_stage3d_baseline : String;
	/**
		Compositing.
	**/
	var gpu_compositing : String;
	/**
		Multiple Raster Threads.
	**/
	var multiple_raster_threads : String;
	/**
		Native GpuMemoryBuffers.
	**/
	var native_gpu_memory_buffers : String;
	/**
		Rasterization.
	**/
	var rasterization : String;
	/**
		Video Decode.
	**/
	var video_decode : String;
	/**
		Video Encode.
	**/
	var video_encode : String;
	/**
		VPx Video Decode.
	**/
	var vpx_decode : String;
	/**
		WebGL.
	**/
	var webgl : String;
	/**
		WebGL2.
	**/
	var webgl2 : String;
}
