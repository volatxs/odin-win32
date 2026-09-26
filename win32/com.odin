package win32

// Bindings for the Component Object Model (COM) library.
// https://learn.microsoft.com/en-us/windows/win32/com/component-object-model--com--portal

// The "Co"/"CO" prefix will be translated as "com_" or "COM" here instead.

foreign import ole32 "system:ole32.lib"

// From COINIT
Com_Init :: enum dword {
	// From COINIT_APARTMENTTHREADED
	Apartment_Threaded = 0x2,
	// From COINIT_MULTITHREADED
	Multithreaded = 0x0,
	// From COINIT_DISABLE_OLE1DDE
	Disable_OLE1_DDE = 0x4,
	// From COINIT_SPEED_OVER_MEMORY
	Speed_Over_Memory = 0x8,
}

@(default_calling_convention="stdcall")
foreign ole32 {
	// From CoInitialize
	@(link_name="CoInitialize")
	com_initialize :: proc(reserved: rawptr) -> Result ---

	// From CoInitializeEx
	@(link_name="CoInitializeEx")
	com_initialize_ex :: proc(reserved: rawptr, com_init: Com_Init) -> Result ---

	// From CoUninitialize
	@(link_name="CoUninitialize")
	com_uninitialize :: proc() ---

	// From OleInitialize
	@(link_name="OleInitialize")
	ole_initialize :: proc(reserved: rawptr) -> Result ---

	// From OleUninitialize
	@(link_name="OleUninitialize")
	ole_uninitialize :: proc() ---
}
