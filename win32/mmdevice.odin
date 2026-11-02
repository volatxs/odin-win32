package win32

import "core:c"

// Bindings to the Windows Multimedia Device API.
// https://learn.microsoft.com/en-us/windows/win32/coreaudio/mmdevice-api

// From EDataFlow
Data_Flow :: enum c.int {
	// From eRender
	Render = 0,
	// From eCapture
	Capture = 1,
	// From eAll
	All = 2,
}

// From ERole
Role :: enum c.int {
	// From eConsole
	Console = 0,
	// From eMultimedia
	Multimedia = 1,
	// From eCommunications
	Communications = 2,
}

// From CLSCTX
Class_Execution_Context_Flag :: enum dword {
	// From CLSCTX_INPROC_SERVER
	In_Process_Server = 0,
	// From CLSCTX_INPROC_HANDLER
	In_Process_Handler = 1,
	// From CLSCTX_LOCAL_SERVER
	Local_Server = 2,
	// From CLSCTX_INPROC_SERVER16
	In_Process_Server16 = 3,
	// From CLSCTX_REMOTE_SERVER
	Remote_Server = 4,
	// From CLSCTX_INPROC_HANDLER16
	In_Process_Handler16 = 5,
	// From CLSCTX_RESERVED1
	Reserved1 = 6,
	// From CLSCTX_RESERVED2
	Reserved2 = 7,
	// From CLSCTX_RESERVED3
	Reserved3 = 8,
	// From CLSCTX_RESERVED4
	Reserved4 = 9,
	// From CLSCTX_NO_CODE_DOWNLOAD
	No_Code_Download = 10,
	// From CLSCTX_RESERVED5
	Reserved5 = 11,
	// From CLSCTX_NO_CUSTOM_MARSHAL
	No_Custom_Marshal = 12,
	// From CLSCTX_ENABLE_CODE_DOWNLOAD
	Enable_Code_Download = 13,
	// From CLSCTX_NO_FAILURE_LOG
	No_Failure_Log = 14,
	// From CLSCTX_DISABLE_AAA
	Disable_AAA = 15,
	// From CLSCTX_ENABLE_AAA
	Enable_AAA = 16,
	// From CLSCTX_FROM_DEFAULT_CONTEXT
	From_Default_Context = 17,
	// From CLSCTX_ACTIVATE_X86_SERVER
	Activate_X86_Server = 18,
	// From CLSCTX_ACTIVATE_32_BIT_SERVER
	Activate_32_Bit_Server = Activate_X86_Server,
	// From CLSCTX_ACTIVATE_64_BIT_SERVER
	Activate_64_Bit_Server = 19,
	// From CLSCTX_ENABLE_CLOAKING
	Enable_Cloaking = 20,
	// From CLSCTX_APPCONTAINER
	App_Container = 22,
	// From CLSCTX_ACTIVATE_AAA_AS_IU
	Activate_AAA_As_IU = 23,
	// From CLSCTX_RESERVED6
	Reserved6 = 24,
	// From CLSCTX_ACTIVATE_ARM32_SERVER
	Activate_ARM32_Server = 25,
	// From CLSCTX_ALLOW_LOWER_TRUST_REGISTRATION
	Allow_Lower_Trust_Registration = 26,
	// From CLSCTX_SERVER_MUST_BE_EQUAL_OR_GREATER_PRIVILEGE
	Server_Must_Be_Equal_Or_Greater_Privilege = 27,
	// From CLSCTX_DO_NOT_ELEVATE_SERVER
	Do_Not_Elevate_Server = 28,
	// From CLSCTX_PS_DLL
	PS_DLL = 31,
}

// From CLSCTX
Class_Execution_Context_Mask :: bit_set[Class_Execution_Context_Flag; dword]

// From CLSCTX_ALL
Class_Execution_Context_Mask_All :: Class_Execution_Context_Mask{
	.In_Process_Server,
	.In_Process_Handler,
	.Local_Server,
	.Remote_Server,
}

// From CLSCTX_SERVER
Class_Execution_Context_Mask_Server :: Class_Execution_Context_Mask{
	.In_Process_Server,
	.Local_Server,
	.Remote_Server,
}

// From __uuidof(MMDeviceEnumerator)
MM_Device_Enumerator_Class_ID := Class_ID {
	0xBCDE0395, 0xE52F, 0x467C, {0x8E, 0x3D, 0xC4, 0x57, 0x92, 0x91, 0x69, 0x2E},
}

// From __uuidof(IMMDeviceEnumerator)
MM_Device_Enumerator_Interface_ID := Interface_ID {
	0xA95664D2, 0x9614, 0x4F35, {0xA7, 0x46, 0xDE, 0x8D, 0xB6, 0x36, 0x17, 0xE6},
}

// From IMMDevice
IMM_Device_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From Activate
	activate: proc "stdcall" (
		this: ^IMM_Device,
		// From iid
		iid: Interface_ID,
		// From dwClsCtx
		cls_ctx: Class_Execution_Context_Mask,
		// From pActivationParams
		activation_params: Property_Variant,
		// From ppInterface
		interface: ^rawptr,
	) -> Result,

	// From OpenPropertyStore
	open_property_store: proc "stdcall" (
		this: ^IMM_Device,
		// From stgmAccess
		stgm_access: Storage_Mode,
		// From ppProperties
		properties: ^^IProperty_Store,
	) -> Result,

	// From GetId
	get_id: proc "stdcall" (
		this: ^IMM_Device,
		// From ppstrId
		id: ^wstr,
	) -> Result,

	// From GetState
	get_state: proc "stdcall" (
		this: ^IMM_Device,
		// From pdwState
		state: ^Device_State,
	) -> Result,
}

// From IMMDevice
IMM_Device :: struct #raw_union {
	iunknown: IUnknown,
	using imm_device_vtable: ^IMM_Device_VTable,
}

// From IMMDeviceCollection
IMM_Device_Collection_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From GetCount
	get_count: proc "stdcall" (
		this: ^IMM_Device_Collection,
		// From pcDevices
		device_count: ^uint,
	) -> Result,

	// From Item
	item: proc "stdcall" (
		this: ^IMM_Device_Collection,
		// From nDevice
		device_num: uint,
		// From ppDevice
		device: ^^IMM_Device,
	) -> Result,
}

IMM_Device_Collection :: struct #raw_union {
	iunknown: IUnknown,
	using imm_device_collection_vtable: ^IMM_Device_Collection_VTable,
}

IMM_Notification_Client_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From OnDeviceStateChanged
	on_device_state_changed: proc "stdcall" (
		this: ^IMM_Notification_Client,
		// From pwstrDeviceId,
		device_id: wstr,
		// From dwNewState
		new_state: Device_State,
	) -> Result,

	// From OnDeviceAdded
	on_device_added: proc "stdcall" (
		this: ^IMM_Notification_Client,
		// From pwstrDeviceId
		device_id: wstr,
	) -> Result,

	// From OnDeviceRemoved
	on_device_removed: proc "stdcall" (
		this: ^IMM_Notification_Client,
		// From pwstrDeviceId
		device_id: wstr,
	) -> Result,

	// From OnDefaultDeviceChanged
	on_default_device_changed: proc "stdcall" (
		this: ^IMM_Notification_Client,
		// From flow
		flow: Data_Flow,
		// From role
		role: Role,
		// From pwstrDefaultDeviceId
		default_device_id: wstr,
	) -> Result,

	// From OnPropertyValueChanged
	on_property_value_changed: proc "stdcall" (
		this: ^IMM_Notification_Client,
		// From pwstrDeviceId
		device_id: wstr,
		// From key
		key: Property_Key,
	) -> Result,
}

IMM_Notification_Client :: struct #raw_union {
	iunknown: IUnknown,
	using imm_notification_client_vtable: ^IMM_Notification_Client_VTable,
}

// From IMMDeviceEnumerator
IMM_Device_Enumerator_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From EnumAudioEndpoints
	enum_audio_endpoints: proc "stdcall" (
		this: ^IMM_Device_Enumerator,
		// From dataFlow
		data_flow: Data_Flow,
		// From dwStateMask
		state_mask: Device_State_Mask,
		// From ppDevices
		devices: ^^IMM_Device_Collection,
	) -> Result,

	// From GetDefaultAudioEndpoint
	get_default_audio_endpoint: proc "stdcall" (
		this: ^IMM_Device_Enumerator,
		// From dataFlow
		data_flow: Data_Flow,
		// From role
		role: Role,
		// From ppEndpoint
		endpoint: ^^IMM_Device,
	) -> Result,

	// From GetDevice
	get_device: proc "stdcall" (
		this: ^IMM_Device_Enumerator,
		// From pwstrId
		id: wstr,
		// From ppDevice
		device: ^^IMM_Device,
	) -> Result,

	// From RegisterEndpointNotificationCallback
	register_endpoint_notification_callback: proc "stdcall" (
		this: ^IMM_Device_Enumerator,
		// From pClient
		client: ^IMM_Notification_Client,
	) -> Result,

	// From UnregisterEndpointNotificationCallback
	unregister_endpoint_notification_callback: proc "stdcall" (
		this: ^IMM_Device_Enumerator,
		// From pClient
		client: ^IMM_Notification_Client,
	) -> Result,
}

IMM_Device_Enumerator :: struct #raw_union {
	iunknown: IUnknown,
	using imm_device_enumerator_vtable: ^IMM_Device_Enumerator_VTable,
}
