package win32

import "core:c"

// Bindings for the Component Object Model (COM) library.
// https://learn.microsoft.com/en-us/windows/win32/com/component-object-model--com--portal

// The "Co"/"CO" prefix will be translated as "com_" or "COM" here instead.

foreign import ole32 "system:ole32.lib"

// From BSTR
bstr :: distinct [^]wchar

// From LCID
Locale_ID :: distinct dword

// From DISPID
Dispatch_ID :: distinct long

// From HREFTYPE
Ref_Type :: distinct dword

// From MEMBERID
Member_ID :: distinct Dispatch_ID

// From STGM_XXX
// NOTE: not implemented as a bit mask, enum, or bit field, because it's too convoluted.
Storage_Mode :: distinct dword

// From STGM_READ (Access)
Storage_Mode_Read :: Storage_Mode(0x00000000)
// From STGM_WRITE (Access)
Storage_Mode_Write :: Storage_Mode(0x00000001)
// From STGM_READWRITE (Access)
Storage_Mode_Read_Write :: Storage_Mode(0x00000002)

// From STGM_SHARE_DENY_NONE (Sharing)
Storage_Mode_Share_Deny_None :: Storage_Mode(0x00000040)
// From STGM_SHARE_DENY_READ (Sharing)
Storage_Mode_Share_Deny_Read :: Storage_Mode(0x00000030)
// From STGM_SHARE_DENY_WRITE (Sharing)
Storage_Mode_Share_Deny_Write :: Storage_Mode(0x00000020)
// From STGM_SHARE_EXCLUSIVE (Sharing)
Storage_Mode_Share_Exclusive :: Storage_Mode(0x00000010)
// From STGM_PRIORITY (Sharing)
Storage_Mode_Priority :: Storage_Mode(0x00040000)

// From STGM_CREATE (Creation)
Storage_Mode_Create :: Storage_Mode(0x00001000)
// From STGM_CONVERT (Creation)
Storage_Mode_Convert :: Storage_Mode(0x00020000)
// From STGM_FAILIFTH (Creation)ERE
Storage_Mode_Fail_If_There :: Storage_Mode(0x00000000)

// From STGM_DIRECT (Transactioning)
Storage_Mode_Direct :: Storage_Mode(0x00000000)
// From STGM_TRANSACTED (Transactioning)
Storage_Mode_Transacted :: Storage_Mode(0x00010000)

// From STGM_NOSCRATCH (Transactioning Performance)
Storage_Mode_No_Scratch :: Storage_Mode(0x00100000)
// From STGM_NOSNAPSHOT (Transactioning Performance)
Storage_Mode_No_Snapshot :: Storage_Mode(0x00200000)

// From STGM_SIMPLE (Direct SWMR and Simple)
Storage_Mode_Simple :: Storage_Mode(0x08000000)
// From STGM_DIRECT_SWMR (Direct SWMR and Simple)
Storage_Mode_Direct_SWMR :: Storage_Mode(0x00400000)

// From STGM_DELETEONRELEASE (Delete On Release)
Storage_Mode_Delete_On_Release :: Storage_Mode(0x04000000)

// From STGMOVE
// NOTE(volt): implemented as an enum despite its uses being "grf" because they're actually not.
Storage_Move_Mode :: enum dword {
	// From STGMOVE_MOVE
	Move,
	// From STGMOVE_COPY
	Copy,
	// From STGMOVE_SHALLOWCOPY
	Shallow_Copy,
}

// From STATFLAG
// NOTE(volt): implemented as an enum despite its uses being "grf" because they're actually not.
Stat_Name_Return :: enum dword {
	// From STATFLAG_DEFAULT
	Default,
	// From STATFLAG_NONAME
	No_Name,
	// from STATFLAG_NOOPEN
	No_Open,
}

// From STGTY
Storage_Type :: enum dword {
	// From STGTY_STORAGE
	Storage = 1,
	// From STGTY_STREAM
	Stream = 2,
	// From STGTY_LOCKBYTES
	Lock_Bytes = 3,
	// From STGTY_PROPERTY
	Property = 4,
}

// From CALLCONV
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-callconv
Call_Convention :: enum c.int {
	// From CC_FASTCALL
	Fast_Call = 0,
	// From CC_CDECL
	C_Decl = 1,
	// From CC_MSCPASCAL
	MSC_Pascal = 2,
	// From CC_PASCAL
	Pascal = MSC_Pascal,
	// From CC_MACPASCAL
	Mac_Pascal = 3,
	// From CC_STDCALL
	Std_Call = 4,
	// From CC_FPFASTCALL
	FP_Fast_Call = 5,
	// From CC_SYSCALL
	Sys_Call = 6,
	// From CC_MPWCDECL
	MPW_C_Decl = 7,
	// From CC_MPWPASCAL
	MPW_Pascal = 8,
}

// From INVOKEKIND
// NOTE(volt): used as ulong in IRecordInfo, and as default enum backing type in Func_Desc.
Invoke_Kind :: enum ulong {
	// From INVOKE_FUNC
	Func = 1,
	// From INVOKE_PROPERTYGET
	Property_Get = 2,
	// From INVOKE_PROPERTYPUT
	Property_Put = 4,
	// From INVOKE_PROPERTYPUTREF
	Property_Put_Ref = 8,
}

// From INVOKEKIND
Invoke_Kind_Flag :: enum word {
	// From INVOKE_FUNC
	Func = 0,
	// From INVOKE_PROPERTYGET
	Property_Get = 1,
	// From INVOKE_PROPERTYPUT
	Property_Put = 2,
	// From INVOKE_PROPERTYPUTREF
	Property_Put_Ref = 3,
}

// From INVOKEKIND
Invoke_Kind_Mask :: bit_set[Invoke_Kind_Flag; word]

// From FUNCKIND
Func_Kind :: enum c.int {
	// From FUNC_VIRTUAL
	Virtual = 0,
	// From FUNC_PUREVIRTUAL
	Pure_Virtual = 1,
	// From FUNC_NONVIRTUAL
	Non_Virtual = 2,
	// From FUNC_STATIC
	Static = 3,
	// From FUNC_DISPATCH
	Dispatch = 4,
}

// From DESCKIND
Desc_Kind :: enum c.int {
	// From DESCKIND_NONE
	None = 0,
	// From DESCKIND_FUNCDESC
	Func_Desc = 1,
	// From DESCKIND_VARDESC
	Var_Desc = 2,
	// From DESCKIND_TYPECOMP
	Type_Comp = 3,
	// From DESCKIND_IMPLICITAPPOBJ
	Implicit_App_Obj = 4,
}

// From BINDPTR
Bind_Ptr :: struct #raw_union {
	// From lpfuncdesc
	func_desc: ^Func_Desc,
	// From lpvardesc
	var_desc: ^Var_Desc,
	// From lptcomp
	type_comp: ^IType_Comp,
}

// From SYSKIND
Sys_Kind :: enum c.int {
	// From SYS_WIN16
	Win16 = 0,
	// From SYS_WIN32
	Win32 = 1,
	// From SYS_MAC
	Mac = 2,
	// From SYS_WIN64
	Win64 = 3,
}

// From LIBFLAGS
Lib_Options_Flag :: enum word {
	// From LIBFLAG_FRESTRICTED
	Restricted = 0,
	// From LIBFLAG_FCONTROL
	Control = 1,
	// From LIBFLAG_FHIDDEN
	Hidden = 2,
	// From LIBFLAG_FHASDISKIMAGE
	Has_Disk_Image = 3,
}

// From LIBFLAGS
Lib_Options_Mask :: bit_set[Lib_Options_Flag; word]

// From TLIBATTR
// https://learn.microsoft.com/hr-hr/windows/win32/api/oaidl/ns-oaidl-tlibattr?view=vs-2019
Type_Lib_Attr :: struct {
	// From guid
	guid: GUID,
	// From lcid
	lcid: Locale_ID,
	// From syskind
	sys_kind: Sys_Kind,
	// From wMajorVerNum
	version_major: word,
	// From wMinorVerNum
	version_minor: word,
	// From wLibFlags
	flags: Lib_Options_Mask,
}

// From VARFLAGS
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-varflags
Var_Options_Flag :: enum word {
	// From VARFLAG_FREADONLY
	Read_Only = 0,
	// From VARFLAG_FSOURCE
	Source = 1,
	// From VARFLAG_FBINDABLE
	Bindable = 2,
	// From VARFLAG_FREQUESTEDIT
	Request_Edit = 3,
	// From VARFLAG_FDISPLAYBIND
	Display_Bind = 4,
	// From VARFLAG_FDEFAULTBIND
	Default_Bind = 5,
	// From VARFLAG_FHIDDEN
	Hidden = 6,
	// From VARFLAG_FRESTRICTED
	Restricted = 7,
	// From VARFLAG_FDEFAULTCOLLELEM
	Default_Collection_Elem = 8,
	// From VARFLAG_FUIDEFAULT
	UI_Default = 9,
	// From VARFLAG_FNONBROWSABLE
	Non_Browsable = 10,
	// From VARFLAG_FREPLACEABLE
	Replaceable = 11,
	// From VARFLAG_FIMMEDIATEBIND
	Immediate_Bind = 12,
}

// From VARFLAGS
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-varflags
Var_Options_Mask :: bit_set[Var_Options_Flag; word]

// From PARAMFLAG_XXX
// https://learn.microsoft.com/en-us/previous-versions/windows/desktop/automat/paramflags
Param_Options_Flag :: enum ushort {
	// From PARAMFLAG_FIN
	In = 0,
	// From PARAMFLAG_FOUT
	Out = 1,
	// From PARAMFLAG_FLCID
	LCID = 2,
	// From PARAMFLAG_FRETVAL
	Return_Val = 3,
	// From PARAMFLAG_FOPT
	Optional = 4,
	// From PARAMFLAG_FHASDEFAULT
	Has_Default = 5,
	// From PARAMFLAG_FHASCUSTDATA
	Has_Custom_Data = 6,
}

// From PARAMFLAG_XXX
// https://learn.microsoft.com/en-us/previous-versions/windows/desktop/automat/paramflags
Param_Options_Mask :: bit_set[Param_Options_Flag; ushort]

// From PARAMFLAG_NONE
Param_Options_Mask_None :: Param_Options_Mask{}

// From PARAMDESCEX
Param_Desc_Ex :: struct {
	// From cBytes
	byte_count: ulong,
	// From varDefaultValue
	default_value: Variant_Arg,
}

// From PARAMDESC
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ns-oaidl-paramdesc
Param_Desc :: struct {
	// From pparamdescex
	default_value: ^Param_Desc_Ex,
	// From wParamFlags
	flags: Param_Options_Mask,
}

// From ELEMDESC
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ns-oaidl-elemdesc-r1
Elem_Desc :: struct {
	// From tdesc
	type_desc: Type_Desc,
	// From paramdesc
	param_desc: Param_Desc,
}

// From FUNCFLAGS
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-funcflags
Func_Options_Flag :: enum word {
	// From FUNCFLAG_FRESTRICTED
	Restricted = 0,
	// From FUNCFLAG_FSOURCE
	Source = 1,
	// From FUNCFLAG_FBINDABLE
	Bindable = 2,
	// From FUNCFLAG_FREQUESTEDIT
	Request_Edit = 3,
	// From FUNCFLAG_FDISPLAYBIND
	Display_Bind = 4,
	// From FUNCFLAG_FDEFAULTBIND
	Default_Bind = 5,
	// From FUNCFLAG_FHIDDEN
	Hidden = 6,
	// From FUNCFLAG_FUSESGETLASTERROR
	Uses_Get_Last_Error = 7,
	// From FUNCFLAG_FDEFAULTCOLLELEM
	Default_Collection_Elem = 8,
	// From FUNCFLAG_FUIDEFAULT
	UI_Default = 9,
	// From FUNCFLAG_FNONBROWSABLE
	Non_browsable = 10,
	// From FUNCFLAG_FREPLACEABLE
	Replaceable = 11,
	// From FUNCFLAG_FIMMEDIATEBIND
	Immediate_Bind = 12,
}

// From FUNCFLAGS
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-funcflags
Func_Options_Mask :: bit_set[Func_Options_Flag; word]

// From FUNCDESC
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ns-oaidl-funcdesc
Func_Desc :: struct {
	// From memid
	member_id: Member_ID,
	// From lprgscode
	status_codes: [^]Status_Code,
	// From lprgelemdescParam
	elem_descs: [^]Elem_Desc,
	// From funckind
	func_kind: Func_Kind,
	// From invkind
	// NOTE(volt): this is backed by Invoke_Kind, but it's used in IRecord_Info as ulong.
	invoke_kind: c.int,
	// From callconv
	call_convention: Call_Convention,
	// From cParams
	param_count: short,
	// From cParamsOpt
	optional_param_count: short,
	// From oVft
	vtable_offset: short,
	// From cScodes
	status_code_count: short,
	// From elemdescFunc
	func_elem_desc: Elem_Desc,
	// From wFuncFlags
	options: Func_Options_Mask,
}

// From TYPEKIND
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-typekind
Type_Kind :: enum c.int {
	// From TKIND_ENUM
	Enum = 0,
	// From TKIND_RECORD
	Record = 1,
	// From TKIND_MODULE
	Module = 2,
	// From TKIND_INTERFACE
	Interface = 3,
	// From TKIND_DISPATCH
	Dispatch = 4,
	// From TKIND_COCLASS
	COM_Class = 5,
	// From TKIND_ALIAS
	Alias = 6,
	// From TKIND_UNION
	Union = 7,
}

// From VARKIND
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-varkind
Var_Kind :: enum c.int {
	// From VAR_PERINSTANCE
	Per_Instance = 0,
	// From VAR_STATIC
	Static = 1,
	// From VAR_CONST
	Const = 2,
	// From VAR_DISPATCH
	Dispatch = 3,
}

// From TYPEDESC
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ns-oaidl-typedesc
Type_Desc :: struct {
	using _: struct #raw_union {
		// From lptdesc
		type_desc: ^Type_Desc,
		// From lpadesc
		array_desc: ^Array_Desc,
		// From hreftype
		ref_type: Ref_Type,
	},
	// From vt
	var_type: Var_Type,
}

// From ARRAYDESC
// https://learn.microsoft.com/en-gb/windows/win32/api/oaidl/ns-oaidl-arraydesc
Array_Desc :: struct {
	// From tdescElem
	elem_desc: Type_Desc,
	// From cDims
	dimension_count: ushort,
	// From rgbounds
	bounds: [1]Safe_Array_Bound,
}

// TODO: write helper function for accessing variable-length Safe_Array.bounds.

// From TYPEFLAGS
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-typeflags
Type_Flag :: enum word {
        // From TYPEFLAG_FAPPOBJECT
	App_Object = 0,
        // From TYPEFLAG_FCANCREATE
	Can_Create = 1,
        // From TYPEFLAG_FLICENSED
	Licensed = 2,
        // From TYPEFLAG_FPREDECLID
	Predeclared_ID = 3,
        // From TYPEFLAG_FHIDDEN
	Hidden = 4,
        // From TYPEFLAG_FCONTROL
	Control = 5,
        // From TYPEFLAG_FDUAL
	Dual = 6,
        // From TYPEFLAG_FNONEXTENSIBLE
	Non_Extensible = 7,
        // From TYPEFLAG_FOLEAUTOMATION
	Ole_Automation = 8,
        // From TYPEFLAG_FRESTRICTED
	Restricted = 9,
        // From TYPEFLAG_FAGGREGATABLE
	Aggregatable = 10,
        // From TYPEFLAG_FREPLACEABLE
	Replaceable = 11,
        // From TYPEFLAG_FDISPATCHABLE
	Dispatchable = 12,
        // From TYPEFLAG_FREVERSEBIND
	Reverse_Bind = 13,
        // From TYPEFLAG_FPROXY
	Proxy = 14,
}

// From TYPEFLAGS
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ne-oaidl-typeflags
Type_Mask :: bit_set[Type_Flag; word]

IDL_Flags :: enum ushort {
	None = 0,
	In = 0x1,
	Out = 0x2,
	LC_ID = 0x4,
	Ret_Val = 0x8,
}

// From IDLDESC
// https://learn.microsoft.com/en-gb/previous-versions/windows/embedded/aa515591(v=msdn.10)
IDL_Desc :: struct {
	// From dwReserved
	_reserved: ulong_ptr,
	// From wIDLFlags
	idl_flags: IDL_Flags,
}

// From TYPEATTR
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ns-oaidl-typeattr
Type_Attributes :: struct {
	// From guid
	guid: GUID,
	// From lcid
	locale_id: Locale_ID,
	// From dwReserved
	_reserved: dword,
	// From memidConstructor
	constructor_id: Member_ID,
	// From memidDestructor
	destructor_id: Member_ID,
	// From lpstrSchema
	_reserved2: wstr,
	// From cbSizeInstance
	instance_size: ulong,
	// From typekind
	type_kind: Type_Kind,
	// From cFuncs
	func_count: word,
	// From cVars
	var_count: word,
	// From cImplTypes
	implemented_type_count: word,
	// From cbSizeVft
	vtable_size: word,
	// From cbAlignment
	alignment: word,
	// From wTypeFlags
	type_flags: Type_Mask,
	// From wMajorVerNum
	version_major: word,
	// From wMinorVerNum
	version_minor: word,
	// From tdescAlias
	alias_desc: Type_Desc,
	// From idldescType
	idl_attributes: IDL_Desc,
}

// From DISPATCH_XXX
Invoke_Options_Flag :: enum word {
	// From DISPATCH_METHOD
	Method = 0,
	// From DISPATCH_PROPERTYGET
	Property_Get = 1,
	// From DISPATCH_PROPERTYPUT
	Property_Put = 2,
	// From DISPATCH_PROPERTYPUTREF
	Property_Put_Ref = 3,
}

// From IMPLTYPEFLAG_XXX
// https://learn.microsoft.com/en-us/previous-versions/windows/desktop/automat/impltypeflags
Impl_Type_Flag :: enum int {
	// From IMPLTYPEFLAG_FDEFAULT
	Default = 0,
	// From IMPLTYPEFLAG_FSOURCE
	Source = 1,
	// From IMPLTYPEFLAG_FRESTRICTED
	Restricted = 2,
	// From IMPLTYPEFLAG_FDEFAULTVTABLE
	Default_VTable = 3,
}

// From DISPATCH_XXX
Invoke_Options_Mask :: bit_set[Invoke_Options_Flag; word]

// From IMPLTYPEFLAG_XXX
// https://learn.microsoft.com/en-us/previous-versions/windows/desktop/automat/impltypeflags
Impl_Type_Mask :: bit_set[Impl_Type_Flag; int]

// From VARDESC
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/ns-oaidl-vardesc
Var_Desc :: struct {
	// From memid
	member_id: Member_ID,
	// From lpstrSchema
	_reserved: wstr,
	using _: struct #raw_union {
		// From oInst
		instance_offset: ulong,
		// From lpvarValue
		const_value: Variant,
	},
	// From elemdescVar
	desc: Elem_Desc,
	// From wVarFlags
	flags: Var_Options_Mask,
	// From varkind
	kind: Var_Kind,
}

// From DISPPARAMS
Dispatch_Params :: struct {
	// From rgvarg
	args: [^]Variant,
	// From rgdispidNamedArgs
	named_arg_ids: [^]Dispatch_ID,
	// From cArgs
	arg_count: uint,
	// From cNamedArgs
	named_arg_count: uint,
}

// From EXCEPINFO
Exception_Info :: struct {
	// From wCode
	error_code: word,
	// From wReserved
	_reserved: word,
	// From bstrSource
	source_name: bstr,
	// From bstrDescription
	description: bstr,
	// From bstrHelpFile
	help_file_path: bstr,
	// From dwHelpContext
	help_context_id: dword,
	// From pvReserved
	_reserved_ptr: ulong_ptr,
	// From pfnDeferredFillIn
	deferred_fill_in_func_ptr: ulong_ptr,
	// From scode
	status_code: Status_Code,
}

// From LOCKTYPE
Lock_Type :: enum dword {
	// From LOCK_WRITE
	Write = 1,
	// From LOCK_EXCLUSIVE
	Exclusive = 2,
	// From LOCK_ONLYONCE
	Only_Once = 4,
}

// From LOCKTYPE
Lock_Type_Flag :: enum dword {
	// From LOCK_WRITE
	Write = 0,
	// From LOCK_EXCLUSIVE
	Exclusive = 1,
	// From LOCK_ONLYONCE
	Only_Once = 2,
}

// From LOCKTYPE
Lock_Type_Mask :: bit_set[Lock_Type_Flag; dword]

// From COINIT
COM_Init_Flag :: enum dword {
	// From COINIT_APARTMENTTHREADED
	Apartment_Threaded = 1,
	// From COINIT_DISABLE_OLE1DDE
	Disable_OLE1_DDE = 2,
	// From COINIT_SPEED_OVER_MEMORY
	Speed_Over_Memory = 3,
}

COM_Init_Mask :: bit_set[COM_Init_Flag; dword]

// From COINIT_MULTITHREADED
COM_Init_Mask_Multithreaded :: COM_Init_Mask{}

// From STREAM_SEEK
Stream_Seek_Origin :: enum dword {
	// From STREAM_SEEK_SET
	Beginning = 0,
	// From STREAM_SEEK_CUR
	Current = 1,
	// From STREAM_SEEK_END
	End = 2,
}

// From STGC
Storage_Commit_Options_Flag :: enum dword {
	// From STGC_OVERWRITE
	Overwrite = 0,
	// From STGC_ONLYIFCURRENT
	Only_If_Current = 1,
	// From STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE
	Dangerously_Commit_Merely_To_Disk_Cache = 2,
	// From STGC_CONSOLIDATE
	Consolidate = 3,
}

// From STGC
Storage_Commit_Options_Mask :: bit_set[Storage_Commit_Options_Flag; dword]

// From STGC_DEFAULT
Storage_Commit_Options_Mask_Default :: Storage_Commit_Options_Mask{}

// From GUID
GUID :: struct {
	// From Data1
	data1: c.ulong,
	// From Data2
	data2: c.ushort,
	// From Data3
	data3: c.ushort,
	// From Data4
	data4: [8]c.uchar,
}

// From PROPERTYKEY
Property_Key :: struct {
	// From fmtid
	fmt_id: GUID,
	// From pid
	pid: dword,
}

// From CLSID
Class_ID :: distinct GUID
// From IID
Interface_ID :: distinct GUID

// From STGC_DEFAULT
Storage_Commit_Default :: dword(0)

// From STATSTG
Storage_Info :: struct {
	// From pwcsName
	name: wstr,
	// From type
	type: Storage_Type,
	// From cbSize
	size: ULarge_Integer,
	// From mtime
	modification_time: File_Time,
	// From ctime
	creation_time: File_Time,
	// From atime
	access_time: File_Time,
	// From grfMode
	mode: Storage_Mode,
	// From grfLocksSupported
	supported_locks: Lock_Type_Mask,
	// From clsid
	class_id: Class_ID,
	// From grfStateBits
	state_flags: dword,
	// From reserved
	_reserved: dword,
}

@(default_calling_convention="stdcall")
foreign ole32 {
	// From CoInitializeEx
	// https://learn.microsoft.com/en-us/windows/win32/api/combaseapi/nf-combaseapi-coinitializeex
	com_initialize_ex :: proc(
		// From pvReserved
		_reserved: rawptr,
		// From dwCoInit
		options: COM_Init_Mask,
	) -> Result ---

	// From CoUninitialize
	// https://learn.microsoft.com/en-us/windows/win32/api/combaseapi/nf-combaseapi-couninitialize
	com_uninitialize :: proc() ---

	// From CoCreateInstance
	// https://learn.microsoft.com/en-us/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstance
	@(link_name="CoCreateInstance")
	com_create_instance :: proc(
		// From rclsid
		class_id: ^Class_ID,
		// From pUnkOuter
		controlling_obj: ^IUnknown,
		// From dwClsContext
		ctx: Class_Execution_Context_Mask,
		// From riid
		riid: ^Interface_ID,
		// From ppv
		out_interface: ^rawptr,
	) -> Result ---
}

// From IUnknown
IUnknown_VTable :: struct {
	// From QueryInterface
	query_interface: proc "stdcall" (
		this: ^IUnknown,
		// From riid
		riid: ^Interface_ID,
		// From ppvObject
		object: ^rawptr,
	) -> Result,

	// From AddRef
	add_ref: proc "stdcall" (this: ^IUnknown) -> ulong,

	// From Release
	release: proc "stdcall" (this: ^IUnknown) -> ulong,
}

// From IUnknown
IUnknown :: struct {
	using iunknown_vtable: ^IUnknown_VTable,
}

// From ISequentialStream
ISequential_Stream_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From Read
	read: proc "stdcall" (
		this: ^ISequential_Stream,
		// From pv
		buffer: rawptr,
		// From cb
		amount_to_copy: ulong,
		// From pcbRead
		amount_read: ^ulong,
	) -> Result,

	// From Write
	write: proc "stdcall" (
		this: ^ISequential_Stream,
		// From pv
		buffer: rawptr,
		// From cb
		amount_to_copy: ulong,
		// From pcbWritten
		amount_written: ^ulong,
	) -> Result,
}

ISequential_Stream :: struct #raw_union {
	iunknown: IUnknown,
	using isequential_stream_vtable: ^ISequential_Stream_VTable,
}

IStream_VTable :: struct {
	using isequential_stream_vtable: ISequential_Stream_VTable,

	// From Seek
	seek: proc "stdcall" (
		this: ^IStream,
		// From dlibMove
		offset: Large_Integer,
		// From dwOrigin
		origin: Stream_Seek_Origin,
		// From plibNewPosition
		new_position: ^ULarge_Integer,
	) -> Result,

	// From SetSize
	set_size: proc "stdcall" (
		this: ^IStream,
		// From libNewSize
		size: ULarge_Integer,
	) -> Result,

	// From CopyTo
	copy_to: proc "stdcall" (
		this: ^IStream,
		// From pstm
		stream: ^IStream,
		// From cb
		amount_to_copy: ULarge_Integer,
		// From pcbRead
		amount_read: ^ULarge_Integer,
		// From pcbWritten
		amount_written: ^ULarge_Integer,
	) -> Result,

	// From Commit
	commit: proc "stdcall" (
		this: ^IStream,
		// From grfCommitFlags
		commit_options: Storage_Commit_Options_Mask,
	) -> Result,

	// From Revert
	revert: proc "stdcall" (this: ^IStream) -> Result,

	// From LockRegion
	lock_region: proc "stdcall" (
		this: ^IStream,
		// From libOffset
		offset: ULarge_Integer,
		// From cb
		length: ULarge_Integer,
		// From dwLockType
		lock_type: Lock_Type_Mask,
	) -> Result,

	// From UnlockRegion
	unlock_region: proc "stdcall" (
		this: ^IStream,
		// From libOffset
		offset: ULarge_Integer,
		// From cb
		length: ULarge_Integer,
		// From dwLockType
		lock_type: Lock_Type_Mask,
	) -> Result,

	// From Stat
	stat: proc "stdcall" (
		this: ^IStream,
		// pstatstg
		info: ^Storage_Info,
		// grfStatFlag
		state_flags: dword,
	) -> Result,

	// From Clone
	clone: proc "stdcall" (
		this: ^IStream,
		// From ppstm
		stream: ^^IStream,
	) -> Result,
}

IStream :: struct #raw_union {
	isequential_stream: ISequential_Stream,
	using istream_vtable: ^IStream_VTable,
}

IStorage_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From CreateStream
	create_stream: proc "stdcall" (
		this: ^IStorage,
		// From pwcsName
		name: wstr,
		// From grfMode
		mode: Storage_Mode,
		// From reserved1
		_reserved1: dword,
		// From reserved2
		_reserved2: dword,
		// From ppstm
		stream: ^^IStream,
	) -> Result,

	// From OpenStream
	open_stream: proc "stdcall" (
		this: ^IStorage,
		// From pwcsName
		name: wstr,
		// From reserved1
		_reserved1: rawptr,
		// From grfMode
		mode: Storage_Mode,
		// From reserved2
		_reserved2: dword,
		// From ppstm
		stream: ^^IStream,
	) -> Result,

	// From CreateStorage
	create_storage: proc "stdcall" (
		this: ^IStorage,
		// From pwcsName
		name: wstr,
		// From grfMode
		mode: Storage_Mode,
		// From reserved1
		_reserved1: dword,
		// From reserved2
		_reserved2: dword,
		// From ppstg
		storage: ^^IStorage,
	) -> Result,

	// From OpenStorage
	open_storage: proc "stdcall" (
		this: ^IStorage,
		// From pwcsName
		name: wstr,
		// From pstgPriority
		priority: ^IStorage,
		// From grfMode
		mode: Storage_Mode,
		// From snbExclude
		excludeSNB: ^wstr,
		// From reserved
		_reserved: dword,
		// From ppstg
		storage: ^^IStorage,
	) -> Result,

	// From CopyTo
	copy_to: proc "stdcall" (
		this: ^IStorage,
		// From ciidExclude
		exclude_iid_count: dword,
		// From rgiidExclude
		exclude_iids: [^]Interface_ID,
		// From snbExclude
		excludeSNB: ^wstr,
		// From pstgDest
		dest: ^IStorage,
	) -> Result,

	// From MoveElementTo
	move_element_to: proc "stdcall" (
		this: ^IStorage,
		// From pwcsName
		name: wstr,
		// From pstgDest
		dest: ^IStorage,
		// From pwcsNewName
		new_name: wstr,
		// From grfFlags
		flags: Storage_Move_Mode,
	) -> Result,

	// From Commit
	commit: proc "stdcall" (
		this: ^IStorage,
		// From grfCommitFlags
		commit_flags: Storage_Commit_Options_Mask,
	) -> Result,

	// From Revert
	revert: proc "stdcall" (this: ^IStorage) -> Result,

	// From EnumElements
	enum_elements: proc "stdcall" (
		this: ^IStorage,
		// From reserved1
		_reserved1: dword,
		// From reserved2
		_reserved2: rawptr,
		// From reserved3
		_reserved3: dword,
		// From ppenum
		ienum: ^^IEnum_Storage_Info,
	) -> Result,

	// From DestroyElement
	destroy_element: proc "stdcall" (
		this: ^IStorage,
		// From pwcsName
		name: wstr,
	) -> Result,

	// From RenameElement
	rename_element: proc "stdcall" (
		this: ^IStorage,
		// From pwcsOldName
		old_name: wstr,
		// From pwcsNewName
		new_name: wstr,
	) -> Result,

	// From SetElementTimes
	set_element_times: proc "stdcall" (
		this: ^IStorage,
		// From pwcsName
		name: wstr,
		// From pctime
		current_time: ^File_Time,
		// From patime
		access_time: ^File_Time,
		// From pmtime
		modification_time: ^File_Time,
	) -> Result,

	// From SetClass
	set_class: proc "stdcall" (
		this: ^IStorage,
		// From clsid
		class_id: ^Class_ID,
	) -> Result,

	// From SetStateBits
	set_state_bits: proc "stdcall" (
		this: ^IStorage,
		// From grfStateBits
		state_flags: dword,
		// From grfMask
		state_mask: dword,
	) -> Result,

	// From Stat
	stat: proc "stdcall" (
		this: ^IStorage,
		// From pstatstg
		storage_info: ^Storage_Info,
		// From grfStatFlag
		name_return: Stat_Name_Return,
	) -> Result,
}

IStorage :: struct #raw_union {
	iunknown: IUnknown,
	using istorage_vtable: ^IStorage_VTable,
}

IDispatch_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From GetTypeInfoCount
	get_type_info_count: proc "stdcall" (
		this: ^IDispatch,
		// From pctinfo
		type_info_count: ^uint,
	) -> Result,

	// From GetTypeInfo
	get_type_info: proc "stdcall" (
		this: ^IDispatch,
		// From iTInfo
		type_info_idx: uint,
		// From lcid
		locale_id: Locale_ID,
		// From ppTInfo
		type_info: ^^IType_Info,
	) -> Result,

	// From GetIDsOfNames
	get_ids_of_names: proc "stdcall" (
		this: ^IDispatch,
		// From riid
		_riid: ^Interface_ID,
		// From rgszNames
		names: [^]wstr,
		// From cNames
		name_count: uint,
		// From lcid
		locale_id: Locale_ID,
		// From rgDispId
		dispatch_ids: [^]Dispatch_ID,
	) -> Result,

	// From Invoke
	invoke: proc "stdcall" (
		this: ^IDispatch,
		// From dispIdMember
		dispatch_id: Dispatch_ID,
		// From riid
		_riid: ^Interface_ID,
		// From lcid
		locale_id: Locale_ID,
		// From wFlags
		options: Invoke_Options_Mask,
		// From pDispParams
		dispatch_params: ^Dispatch_Params,
		// From pVarResult
		result: ^Variant,
		// From pExcepInfo
		exception_info: ^Exception_Info,
		// From puArgErr
		first_error_arg_idx: ^uint,
	) -> Result,
}

IDispatch :: struct #raw_union {
	iunknown: IUnknown,
	using idispatch_vtable: ^IDispatch_VTable,
}

// From IEnumSTATSTG
// https://learn.microsoft.com/en-us/windows/win32/api/objidl/nn-objidl-ienumstatstg
IEnum_Storage_Info_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From Next
	next: proc "stdcall" (
		this: ^IEnum_Storage_Info,
		// From celt
		amount_to_retrieve: ulong,
		// From rgelt
		info: [^]Storage_Info,
		// From pceltFetched
		amount_retrieved: ^ulong,
	) -> Result,

	// From Skip
	skip: proc "stdcall" (
		this: ^IEnum_Storage_Info,
		// From celt
		amount: ulong,
	) -> Result,

	// From Reset
	reset: proc "stdcall" (this: ^IEnum_Storage_Info) -> Result,

	// From Clone
	clone: proc "stdcall" (
		this: ^IEnum_Storage_Info,
		// From ppenum
		new_instance: ^^IEnum_Storage_Info,
	) -> Result,
}

// From IEnumSTATSTG
// https://learn.microsoft.com/en-us/windows/win32/api/objidl/nn-objidl-ienumstatstg
IEnum_Storage_Info :: struct #raw_union {
	iunknown: IUnknown,
	using ienum_storage_info_vtable: ^IEnum_Storage_Info_VTable,
}
