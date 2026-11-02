package win32

// From DEVICE_STATE_XXX
// https://learn.microsoft.com/en-us/windows/win32/coreaudio/device-state-xxx-constants
Device_State :: enum dword {
	// From DEVICE_STATE_ACTIVE
	Active = 1,
	// From DEVICE_STATE_DISABLED
	Disabled = 2,
	// From DEVICE_STATE_NOTPRESENT
	Not_Present = 4,
	// From DEVICE_STATE_UNPLUGGED
	Unplugged = 8,
}

// From DEVICE_STATE_XXX
// https://learn.microsoft.com/en-us/windows/win32/coreaudio/device-state-xxx-constants
Device_State_Mask_Flag :: enum dword {
	// From DEVICE_STATE_ACTIVE
	Active = 0,
	// From DEVICE_STATE_DISABLED
	Disabled = 1,
	// From DEVICE_STATE_NOTPRESENT
	Not_Present = 2,
	// From DEVICE_STATE_UNPLUGGED
	Unplugged = 3,
}

// From DEVICE_STATE_XXX
// https://learn.microsoft.com/en-us/windows/win32/coreaudio/device-state-xxx-constants
Device_State_Mask :: bit_set[Device_State_Mask_Flag; dword]

// From DEVICE_STATEMASK_ALL
Device_State_Mask_All :: ~Device_State_Mask{}

// From IPropertyStore
// https://learn.microsoft.com/en-us/windows/win32/api/propsys/nn-propsys-ipropertystore
IProperty_Store_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From GetCount
	get_count: proc "stdcall" (
		this: ^IProperty_Store,
		// From cProps
		prop_count: ^dword,
	) -> Result,

	// From GetAt
	get_at: proc "stdcall" (
		this: ^IProperty_Store,
		// From iProp
		prop_idx: dword,
		// From pkey
		key: ^Property_Key,
	) -> Result,

	// From GetValue
	get_value: proc "stdcall" (
		this: ^IProperty_Store,
		// From key
		key: ^Property_Key,
		// From pv
		variant: ^Property_Variant,
	) -> Result,

	// From SetValue
	set_value: proc "stdcall" (
		this: ^IProperty_Store,
		// From key
		key: ^Property_Key,
		// From propvar
		variant: ^Property_Variant,
	) -> Result,

	// From Commit
	commit: proc "stdcall" (this: ^IProperty_Store) -> Result,
}

// From IPropertyStore
// https://learn.microsoft.com/en-us/windows/win32/api/propsys/nn-propsys-ipropertystore
IProperty_Store :: struct #raw_union {
	iunknown: IUnknown,
	using iproperty_store_vtable: ^IProperty_Store_VTable,
}

// From IRecordInfo
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/nn-oaidl-irecordinfo
IRecord_Info_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From RecordInit
	record_init: proc "stdcall" (
		this: ^IRecord_Info,
		// From pvNew
		instance: rawptr,
	) -> Result,

	// From RecordClear
	record_clear: proc "stdcall" (
		this: ^IRecord_Info,
		// From pvExisting
		instance: rawptr,
	) -> Result,

	// From RecordCopy
	record_copy: proc "stdcall" (
		this: ^IRecord_Info,
		// From pvExisting
		src: rawptr,
		// From pvNew
		dest: rawptr,
	) -> Result,

	// From GetGuid
	get_guid: proc "stdcall" (
		this: ^IRecord_Info,
		// From pguid
		guid: ^GUID,
	) -> Result,

	// From GetName
	get_name: proc "stdcall" (
		this: ^IRecord_Info,
		// From pbstrName
		name: ^bstr,
	) -> Result,

	// From GetSize
	get_size: proc "stdcall" (
		this: ^IRecord_Info,
		// From pcbSize
		size: ^ulong,
	) -> Result,

	// From GetTypeInfo
	get_type_info: proc "stdcall" (
		this: ^IRecord_Info,
		// From ppTypeInfo
		type_info: ^^IType_Info,
	) -> Result,

	// From GetField
	get_field: proc "stdcall" (
		this: ^IRecord_Info,
		// From pvData
		record: rawptr,
		// From szFieldName
		field_name: wstr,
		// From pvarField
		value: ^Variant,
	) -> Result,

	// From GetFieldNoCopy
	get_field_no_copy: proc "stdcall" (
		this: ^IRecord_Info,
		// From pvData
		instance: rawptr,
		// From szFieldName
		field_name: wstr,
		// From pvarField
		udt_value: ^Variant,
		// From ppvDataCArray
		data_value: ^rawptr,
	) -> Result,

	// From PutField
	put_field: proc "stdcall" (
		this: ^IRecord_Info,
		// From wFlags
		kind: Invoke_Kind,
		// From pvData
		record: rawptr,
		// From szFieldName
		field_name: wstr,
		// From pvarField
		var: ^Variant,
	) -> Result,

	// From PutFieldNoCopy
	put_field_no_copy: proc "stdcall" (
		this: ^IRecord_Info,
		// From wFlags
		kind: Invoke_Kind,
		// From pvData
		record: rawptr,
		// From szFieldName
		field_name: wstr,
		// From pvarField
		var: ^Variant,
	) -> Result,

	// From GetFieldNames
	get_field_names: proc "stdcall" (
		this: ^IRecord_Info,
		// From pcNames
		name_count: ^ulong,
		// From rgBstrNames
		names: [^]bstr,
	) -> Result,

	// From IsMatchingType
	is_matching_type: proc "stdcall" (
		this: ^IRecord_Info,
		// From pRecordInfo
		record_info: ^IRecord_Info,
	) -> bool,

	// From RecordCreate
	record_create: proc "stdcall" (this: ^IRecord_Info) -> rawptr,

	// From RecordCreateCopy
	record_create_copy: proc "stdcall" (
		this: ^IRecord_Info,
		// From pvSource
		source: rawptr,
		// From ppvDest
		dest: ^rawptr,
	) -> Result,

	// From RecordDestroy
	record_destroy: proc "stdcall" (
		this: ^IRecord_Info,
		// From pvRecord
		record: rawptr,
	) -> Result,
}

// From IRecordInfo
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/nn-oaidl-irecordinfo
IRecord_Info :: struct #raw_union {
	iunknown: IUnknown,
	using irecord_info_vtable: ^IRecord_Info_VTable,
}

// From ITypeComp
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/nn-oaidl-itypecomp
IType_Comp_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From Bind
	bind: proc "stdcall" (
		this: ^IType_Comp,
		// From szName
		name: wstr,
		// From lHashVal
		hash: ulong,
		// From wFlags
		flags: Invoke_Kind_Mask,
		// From ppTInfo
		type_info: ^^IType_Info,
		// From pDescKind
		desc_kind: ^Desc_Kind,
		// From pBindPtr
		bind_ptr: ^Bind_Ptr,
	) -> Result,

	// From BindType
	bind_type: proc "stdcall" (
		this: ^IType_Comp,
		// From szName
		name: wstr,
		// From lHashVal
		hash: ulong,
		// From ppTInfo
		type_info: ^^IType_Info,
		// From ppTComp
		type_comp: ^^IType_Comp,
	) -> Result,
}

// From ITypeLib
IType_Lib_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From GetTypeInfoCount
	get_type_info_count: proc "stdcall" (this: ^IType_Lib) -> uint,

	// From GetTypeInfo
	get_type_info: proc "stdcall" (
		this: ^IType_Lib,
		// From index
		index: uint,
		// From ppTInfo
		type_info: ^^IType_Info,
	) -> Result,

	// From GetTypeInfoType
	get_type_info_type: proc "stdcall" (
		this: ^IType_Lib,
		// From index
		index: uint,
		// From pTKind
		type_kind: ^Type_Kind,
	) -> Result,

	// From GetTypeInfoOfGuid
	get_type_info_of_guid: proc "stdcall" (
		this: ^IType_Lib,
		// From guid
		guid: ^GUID,
		// From ppTinfo
		type_info: ^^IType_Info,
	) -> Result,

	// From GetLibAttr
	get_lib_attr: proc "stdcall" (
		this: ^IType_Lib,
		// From ppTLibAttr
		attributes: ^^Type_Lib_Attr,
	) -> Result,

	// From GetTypeComp
	get_type_comp: proc "stdcall" (
		this: ^IType_Lib,
		// From ppTComp
		type_comp: ^^IType_Comp,
	) -> Result,

	// From GetDocumentation
	get_documentation: proc "stdcall" (
		this: ^IType_Lib,
		// From index
		index: int,
		// From pBstrName
		name: ^bstr,
		// From pBstrDocString
		doc_string: ^bstr,
		// From pdwHelpContext
		help_context: ^dword,
		// From pBstrHelpFile
		help_file_path: ^bstr,
	) -> Result,

	// From IsName
	is_name: proc "stdcall" (
		this: ^IType_Lib,
		// From szNameBuf
		name_buf: wstr,
		// From lHashVal
		hash: ulong,
		// From pfName
		name_found: ^bool,
	) -> Result,

	// From FindName
	find_name: proc "stdcall" (
		this: ^IType_Lib,
		// From szNameBuf
		name_buf: wstr,
		// From lHashVal
		hash: ulong,
		// From ppTInfo
		type_info: ^^IType_Info,
		// From rgMemId
		found_items: [^]Member_ID,
		// From pcFound
		find_count: ^ushort,
	) -> Result,

	// From ReleaseTLibAttr
	release_lib_attr: proc "stdcall" (
		this: ^IType_Lib,
		// From pTLibAttr
		lib_attr: ^^Type_Lib_Attr,
	)
}

// From ITypeLib
IType_Lib :: struct #raw_union {
	iunknown: IUnknown,
	using itype_lib_vtable: ^IType_Lib_VTable,
}

// From IType_Comp
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/nn-oaidl-itypecomp
IType_Comp :: struct #raw_union {
	iunknown: IUnknown,
	using itype_comp_vtable: ^IType_Comp_VTable,
}

// From ITypeInfo
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/nn-oaidl-itypeinfo
IType_Info_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,

	// From GetTypeAttr
	get_type_attr: proc "stdcall" (
		this: ^IType_Info,
		// From ppTypeAttr
		attributes: ^^Type_Attributes,
	) -> Result,

	// From GetTypeComp
	get_type_comp: proc "stdcall" (
		this: ^IType_Info,
		// From ppTComp
		itype_comp: ^^IType_Comp,
	) -> Result,

	// From GetFuncDesc
	get_func_desc: proc "stdcall" (
		this: ^IType_Info,
		// From index
		index: uint,
		// From ppFuncDesc
		func_desc: ^^Func_Desc,
	) -> Result,

	// From GetVarDesc
	get_var_desc: proc "stdcall" (
		this: ^IType_Info,
		// From index
		index: uint,
		// From ppVarDesc
		desc: ^^Var_Desc,
	) -> Result,

	// From GetNames
	get_names: proc "stdcall" (
		this: ^IType_Info,
		// From memid
		member_id: Member_ID,
		// From rgBstrNames
		names: [^]bstr,
		// From cMaxNames
		name_count_in: uint,
		// From pcNames
		name_count_out: ^uint,
	) -> Result,

	// From GetRefTypeOfImplType
	get_ref_type_of_impl_type: proc "stdcall" (
		this: ^IType_Info,
		// From index
		index: uint,
		// From pRefType
		ref_type: ^Ref_Type,
	) -> Result,

	// From GetImplTypeFlags
	get_impl_type_flags: proc "stdcall" (
		this: ^IType_Info,
		// From index
		index: uint,
		// From pImplTypeFlags
		flags: ^Impl_Type_Mask,
	) -> Result,

	// From GetIDsOfNames
	get_ids_of_names: proc "stdcall" (
		this: ^IType_Info,
		// From rgszNames
		names: [^]wstr,
		// From cNames
		name_count: uint,
		// From pMemId
		name_mappings: [^]Member_ID,
	) -> Result,

	// From Invoke
	invoke: proc "stdcall" (
		this: ^IType_Info,
		// From pvInstance
		instance: rawptr,
		// From memid
		member_id: Member_ID,
		// From wFlags
		flags: Invoke_Options_Mask,
		// From pDispParams
		dispatch_params: ^Dispatch_Params,
		// From pVarResult
		result: ^Variant,
		// From pExcepInfo
		exception_info: ^Exception_Info,
		// From puArgErr
		error_arg_index: ^uint,
	) -> Result,

	// From GetDocumentation
	get_documentation: proc "stdcall" (
		this: ^IType_Info,
		// From memid
		member_id: Member_ID,
		// From pBstrName
		name: ^bstr,
		// From pBstrDocString
		doc_string: ^bstr,
		// From pdwHelpContext
		help_context: ^dword,
		// From pBstrHelpFile
		help_file_path: ^bstr,
	) -> Result,

	// From GetDllEntry
	get_dll_entry: proc "stdcall" (
		this: ^IType_Info,
		// From memid
		member_id: Member_ID,
		// From invKind
		invoke_kind: Invoke_Kind,
		// From pBstrDllName
		dll_name: ^bstr,
		// From pBstrName
		entry_point_name: ^bstr,
		// From pwOrdinal
		ordinal: ^word,
	) -> Result,

	// From GetRefTypeInfo
	get_ref_type_info: proc "stdcall" (
		this: ^IType_Info,
		// From hRefType
		ref_type: Ref_Type,
		// From ppTInfo
		type_info: ^^IType_Info,
	) -> Result,

	// From AddressOfMember
	address_of_member: proc "stdcall" (
		this: ^IType_Info,
		// From memid
		member_id: Member_ID,
		// From invKind
		invoke_kind: Invoke_Kind,
		// From ppv
		member: ^rawptr,
	) -> Result,

	// From CreateInstance
	create_instance: proc "stdcall" (
		this: ^IType_Info,
		// From pUnkOuter
		controlling_obj: ^IUnknown,
		// From riid
		riid: ^Interface_ID,
		// From ppvObj
		obj: ^rawptr,
	) -> Result,

	// From GetMops
	get_marshalling_options: proc "stdcall" (
		this: ^IType_Info,
		// From memid
		member_id: Member_ID,
		// From pBstrMops
		opcode_str: ^bstr,
	) -> Result,

	// From GetContainingTypeLib
	get_containing_type_lib: proc "stdcall" (
		this: ^IType_Info,
		// From ppTLib
		type_lib: ^^IType_Lib,
		// From pIndex
		type_desc_index: ^uint,
	) -> Result,

	// From ReleaseTypeAttr
	release_type_attr: proc "stdcall" (
		this: ^IType_Info,
		// From pTypeAttr
		attributes: ^Type_Attributes,
	),

	// From ReleaseFuncDesc
	release_func_desc: proc "stdcall" (
		this: ^IType_Info,
		// From pFuncDesc
		func_desc: ^Func_Desc,
	),

	// From ReleaseVarDesc
	release_var_desc: proc "stdcall" (
		this: ^IType_Info,
		// From pVarDesc
		var_desc: ^Var_Desc,
	),
}

// From ITypeInfo
// https://learn.microsoft.com/en-us/windows/win32/api/oaidl/nn-oaidl-itypeinfo
IType_Info :: struct #raw_union {
	iunknown: IUnknown,
	using itype_info_vtable: ^IType_Info_VTable,
}
