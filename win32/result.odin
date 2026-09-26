package win32

import "core:c"

// From HRESULT
Result :: enum c.long {
	// From S_OK
	Success_Ok = 0,
	// From S_FALSE
	Success_False = 1,

	// From RPC_E_CHANGED_MODE
	RPC_Error_Changed_Mode = transmute(i32)u32(0x80010106),

	// From OLE_E_WRONGCOMPOBJ
	OLE_Error_Wrong_COMPOBJ = transmute(i32)u32(0x8004000E),
}
