package win32

import "core:c"

// From HRESULT
Result :: enum long {
	// From S_OK
	Success_Ok = 0,
	// From S_FALSE
	Success_False = 1,

	// From E_PENDING
	Error_Pending = transmute(long)ulong(0x8000000A),

	// From RPC_E_CHANGED_MODE
	RPC_Error_Changed_Mode = transmute(long)ulong(0x80010106),

	// From STG_E_INVALIDFUNCTION
	Storage_Error_Invalid_Function = transmute(long)ulong(0x80030001),
	// From STG_E_INSUFFICIENTMEMORY
	Storage_Error_Insufficient_Memory = transmute(long)ulong(0x80030008),
	// From STG_E_INVALIDPOINTER
	Storage_Error_Invalid_Pointer = transmute(long)ulong(0x80030009),
	// From STG_E_LOCKVIOLATION
	Storage_Error_Lock_Violation = transmute(long)ulong(0x80030021),
	// From STG_E_REVERTED
	Storage_Error_Reverted = transmute(long)ulong(0x80030102),

	// From STG_E_MEDIUMFULL
	Storage_Error_Medium_Full = transmute(long)ulong(0x80030070),

	// From OLE_E_WRONGCOMPOBJ
	OLE_Error_Wrong_COMPOBJ = transmute(long)ulong(0x8004000E),
}

// From SCODE
Status_Code :: enum long {
}
