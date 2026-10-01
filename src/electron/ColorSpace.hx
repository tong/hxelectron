package electron;
/**
	@see https://electronjs.org/docs/api/structures/color-space
**/
typedef ColorSpace = {
	/**
		The color primaries of the color space. Can be one of the following values:
	**/
	var primaries : ColorSpacePrimaries;
	/**
		The transfer function of the color space. Can be one of the following values:
	**/
	var transfer : ColorSpaceTransfer;
	/**
		The color matrix of the color space. Can be one of the following values:
	**/
	var matrix : ColorSpaceMatrix;
	/**
		The color range of the color space. Can be one of the following values:
	**/
	var range : ColorSpaceRange;
}
enum abstract ColorSpacePrimaries(String) from String to String {
	/**
		BT709 primaries (also used for sRGB)
	**/
	var bt709 = "bt709";
	/**
		BT470M primaries
	**/
	var bt470m = "bt470m";
	/**
		BT470BG primaries
	**/
	var bt470bg = "bt470bg";
	/**
		SMPTE170M primaries
	**/
	var smpte170m = "smpte170m";
	/**
		SMPTE240M primaries
	**/
	var smpte240m = "smpte240m";
	/**
		Film primaries
	**/
	var film = "film";
	/**
		BT2020 primaries
	**/
	var bt2020 = "bt2020";
	/**
		SMPTEST428-1 primaries
	**/
	var smptest428_1 = "smptest428-1";
	/**
		SMPTEST431-2 primaries
	**/
	var smptest431_2 = "smptest431-2";
	/**
		P3 primaries
	**/
	var p3 = "p3";
	/**
		XYZ D50 primaries
	**/
	var xyz_d50 = "xyz-d50";
	/**
		Adobe RGB primaries
	**/
	var adobe_rgb = "adobe-rgb";
	/**
		Apple Generic RGB primaries
	**/
	var apple_generic_rgb = "apple-generic-rgb";
	/**
		Wide Gamut Color Spin primaries
	**/
	var wide_gamut_color_spin = "wide-gamut-color-spin";
	/**
		EBU 3213-E primaries
	**/
	var ebu_3213_e = "ebu-3213-e";
	/**
		Custom primaries
	**/
	var custom = "custom";
	/**
		Invalid primaries
	**/
	var invalid = "invalid";
}
enum abstract ColorSpaceTransfer(String) from String to String {
	/**
		BT709 transfer function
	**/
	var bt709 = "bt709";
	/**
		BT709 Apple transfer function
	**/
	var bt709_apple = "bt709-apple";
	/**
		Gamma 1.8 transfer function
	**/
	var gamma18 = "gamma18";
	/**
		Gamma 2.2 transfer function
	**/
	var gamma22 = "gamma22";
	/**
		Gamma 2.4 transfer function
	**/
	var gamma24 = "gamma24";
	/**
		Gamma 2.8 transfer function
	**/
	var gamma28 = "gamma28";
	/**
		SMPTE170M transfer function
	**/
	var smpte170m = "smpte170m";
	/**
		SMPTE240M transfer function
	**/
	var smpte240m = "smpte240m";
	/**
		Linear transfer function
	**/
	var linear = "linear";
	/**
		Log transfer function
	**/
	var log = "log";
	/**
		Log Square Root transfer function
	**/
	var log_sqrt = "log-sqrt";
	/**
		IEC61966-2-4 transfer function
	**/
	var iec61966_2_4 = "iec61966-2-4";
	/**
		BT1361 ECG transfer function
	**/
	var bt1361_ecg = "bt1361-ecg";
	/**
		sRGB transfer function
	**/
	var srgb = "srgb";
	/**
		BT2020-10 transfer function
	**/
	var bt2020_10 = "bt2020-10";
	/**
		BT2020-12 transfer function
	**/
	var bt2020_12 = "bt2020-12";
	/**
		PQ (Perceptual Quantizer) transfer function
	**/
	var pq = "pq";
	/**
		SMPTEST428-1 transfer function
	**/
	var smptest428_1 = "smptest428-1";
	/**
		HLG (Hybrid Log-Gamma) transfer function
	**/
	var hlg = "hlg";
	/**
		sRGB HDR transfer function
	**/
	var srgb_hdr = "srgb-hdr";
	/**
		Linear HDR transfer function
	**/
	var linear_hdr = "linear-hdr";
	/**
		Custom transfer function
	**/
	var custom = "custom";
	/**
		Custom HDR transfer function
	**/
	var custom_hdr = "custom-hdr";
	/**
		scRGB Linear 80 nits transfer function
	**/
	var scrgb_linear_80_nits = "scrgb-linear-80-nits";
	/**
		Invalid transfer function
	**/
	var invalid = "invalid";
}
enum abstract ColorSpaceMatrix(String) from String to String {
	/**
		RGB matrix
	**/
	var rgb = "rgb";
	/**
		BT709 matrix
	**/
	var bt709 = "bt709";
	/**
		FCC matrix
	**/
	var fcc = "fcc";
	/**
		BT470BG matrix
	**/
	var bt470bg = "bt470bg";
	/**
		SMPTE170M matrix
	**/
	var smpte170m = "smpte170m";
	/**
		SMPTE240M matrix
	**/
	var smpte240m = "smpte240m";
	/**
		YCoCg matrix
	**/
	var ycocg = "ycocg";
	/**
		BT2020 NCL matrix
	**/
	var bt2020_ncl = "bt2020-ncl";
	/**
		YDzDx matrix
	**/
	var ydzdx = "ydzdx";
	/**
		GBR matrix
	**/
	var gbr = "gbr";
	/**
		Invalid matrix
	**/
	var invalid = "invalid";
}
enum abstract ColorSpaceRange(String) from String to String {
	/**
		Limited color range (RGB values ranging from 16 to 235)
	**/
	var limited = "limited";
	/**
		Full color range (RGB values from 0 to 255)
	**/
	var full = "full";
	/**
		Range defined by the transfer function and matrix
	**/
	var derived = "derived";
	/**
		Invalid range
	**/
	var invalid = "invalid";
}
