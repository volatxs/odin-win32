package win32

import "core:c"

// From AUDCLNT_SHAREMODE
// https://learn.microsoft.com/en-gb/windows/win32/api/audiosessiontypes/ne-audiosessiontypes-audclnt_sharemode
Audio_Client_Share_Mode :: enum c.int {
	// From AUDCLNT_SHAREMODE_SHARED
	Shared = 0,
	// From AUDCLNT_SHAREMODE_EXCLUSIVE
	Exclusive = 1,
}

// From AUDCLNT_STREAMFLAGS_XXX
// From AUDCLNT_SESSIONFLAGS_XXX
Audio_Client_Init_Options_Flag :: enum dword {
	// From AUDCLNT_STREAMFLAGS_CROSSPROCESS
	Cross_Process = 16,
	// From AUDCLNT_STREAMFLAGS_LOOPBACK
	Loopback = 17,
	// From AUDCLNT_STREAMFLAGS_EVENTCALLBACK
	Event_Callback = 18,
	// From AUDCLNT_STREAMFLAGS_NOPERSIST
	No_Persist = 19,
	// From AUDCLNT_STREAMFLAGS_RATEADJUST
	Rate_Adjust = 20,
	// From AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY
	Src_Default_Quality = 27,
	// From AUDCLNT_STREAMFLAGS_AUTOCONVERTPCM
	Auto_Convert_PCM = 31,
	// From AUDCLNT_SESSIONFLAGS_EXPIREWHENUNOWNED
	Expire_When_Unowned = 28,
	// From AUDCLNT_SESSIONFLAGS_DISPLAY_HIDE
	Display_Hide = 29,
	// From AUDCLNT_SESSIONFLAGS_DISPLAY_HIDEWHENEXPIRED
	Display_Hide_When_Expired = 30,
}

// From AUDCLNT_STREAMFLAGS_XXX
// From AUDCLNT_SESSIONFLAGS_XXX
Audio_Client_Init_Options_Mask :: bit_set[Audio_Client_Init_Options_Flag; dword]

// From REFERENCE_TIME
Reference_Time :: distinct long_long

// From WAVEFORMATEX
// https://learn.microsoft.com/en-us/windows/win32/api/mmeapi/ns-mmeapi-waveformatex
Wave_Format_Ex :: struct {
	// From wFormatTag
	format: Wave_Format,
	// From nChannels
	channel_count: word,
	// From nSamplesPerSec
	samples_per_sec: dword,
	// From nAvgBytesPerSec
	average_bytes_per_sec: dword,
	// From nBlockAlign
	block_alignment: word,
	// From wBitsPerSample
	bits_per_sample: word,
	// From cbSize
	size_bytes: word,
}

// From IAudioClient
// https://learn.microsoft.com/en-us/windows/win32/api/audioclient/nn-audioclient-iaudioclient
IAudio_Client_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From Initialize
	initialize: proc "stdcall" (
		this: ^IAudio_Client,
		// From ShareMode
		share_mode: Audio_Client_Share_Mode,
		// From StreamFlags
		flags: Audio_Client_Init_Options_Mask,
		// From hnsBufferDuration
		buffer_duration: Reference_Time,
		// From hnsPeriodicity
		periodicity: Reference_Time,
		// From pFormat
		format: ^Wave_Format_Ex,
		// From AudioSessionGuid
		audio_session_guid: ^GUID,
	) -> Result,

	// From GetBufferSize
	get_buffer_size: proc "stdcall" (
		this: ^IAudio_Client,
		// From pNumBufferFrames
		buffer_frame_count: ^uint32,
	) -> Result,

	// From GetStreamLatency
	get_stream_latency: proc "stdcall" (
		this: ^IAudio_Client,
		// From phnsLatency
		latency: ^Reference_Time,
	) -> Result,

	// From GetCurrentPadding
	get_current_padding: proc "stdcall" (
		this: ^IAudio_Client,
		// From pNumPaddingFrames
		padding_frame_count: ^uint32,
	) -> Result,

	// From IsFormatSupported
	is_format_supported: proc "stdcall" (
		this: ^IAudio_Client,
		// From ShareMode
		share_mode: Audio_Client_Share_Mode,
		// From pFormat
		format: ^Wave_Format_Ex,
		// ppClosestMatch
		closest_match: ^^Wave_Format_Ex,
	) -> Result,

	// From GetMixFormat
	get_mix_format: proc "stdcall" (
		this: ^IAudio_Client,
		// From ppDeviceFormat
		device_format: ^^Wave_Format_Ex,
	) -> Result,

	// From GetDevicePeriod
	get_device_period: proc "stdcall" (
		this: ^IAudio_Client,
		// From phnsDefaultDevicePeriod
		default_device_period: ^Reference_Time,
		// From phnsMinimumDevicePeriod
		minimum_device_period: ^Reference_Time,
	) -> Result,

	// From Start
	start: proc "stdcall" (this: ^IAudio_Client) -> Result,

	// From Stop
	stop: proc "stdcall" (this: ^IAudio_Client) -> Result,

	// From Reset
	reset: proc "stdcall" (this: ^IAudio_Client) -> Result,

	// From SetEventHandle
	set_event_handle: proc "stdcall" (
		this: ^IAudio_Client,
		// From eventHandle
		event_handle: handle,
	) -> Result,

	// From GetService
	get_service: proc "stdcall" (
		this: ^IAudio_Client,
		// From riid
		riid: ^Interface_ID,
		// From ppv
		obj: ^rawptr,
	) -> Result,
}

// From IAudioClient
// https://learn.microsoft.com/en-us/windows/win32/api/audioclient/nn-audioclient-iaudioclient
IAudio_Client :: struct #raw_union {
	iunknown: IUnknown,
	using iaudio_client_vtable: ^IAudio_Client_VTable,
}
