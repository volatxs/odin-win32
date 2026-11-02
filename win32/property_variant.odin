package win32

import "core:c"

// Definitions for the PROPVARIANT and its dependent structs.
// https://learn.microsoft.com/en-us/windows/win32/api/propidlbase/ns-propidlbase-propvariant

// From DATE
Date :: distinct double

// From VARIANT_BOOL
Variant_Bool :: distinct short
Variant_Bool_False :: Variant_Bool(0)
Variant_Bool_True  :: Variant_Bool(-1)

// From FADF_XXX
Safe_Array_Feature_Flag :: enum ushort {
	// From FADF_AUTO
	Auto = 0,
	// From FADF_STATIC
	Static = 1,
	// From FADF_EMBEDDED
	Embedded = 2,
	// From FADF_RESERVED
	_Reserved1 = 3,
	// From FADF_FIXEDSIZE
	Fixed_Size = 4,
	// From FADF_RECORD
	Record = 5,
	// From FADF_HAVEIID
	Have_Interface_ID = 6,
	// From FADF_HAVEVARTYPE
	Have_Var_Type = 7,
	// From FADF_BSTR
	BStr = 8,
	// From FADF_UNKNOWN
	Unknown = 9,
	// From FADF_DISPATCH
	Dispatch = 10,
	// From FADF_VARIANT
	Variant = 11,
	// From FADF_RESERVED
	_Reserved2 = 12,
	// From FADF_RESERVED
	_Reserved3 = 13,
	// From FADF_RESERVED
	_Reserved4 = 14,
	// From FADF_RESERVED
	_Reserved5 = 15,
}

// From FADF_XXX
Safe_Array_Feature_Mask :: bit_set[Safe_Array_Feature_Flag; ushort]

// From FADF_RESERVED
Safe_Array_Feature_Mask_Reserved :: Safe_Array_Feature_Mask{
	._Reserved1,
	._Reserved2,
	._Reserved3,
	._Reserved4,
	._Reserved5,
}

// From SAFEARRAYBOUND
Safe_Array_Bound :: struct {
	// From cElements
	element_count: ulong,
	// From lLbound
	lower_bound: long,
}

// From SAFEARRAY
Safe_Array :: struct {
	// From cDims
	dimension_count: ushort,
	// From fFeatures
	features: Safe_Array_Feature_Mask,
	// From cbElements
	element_byte_size: ulong,
	// From cLocks
	lock_count: ulong,
	// From pvData
	data: rawptr,
	// From rgsabound
	bounds: [1]Safe_Array_Bound,
}

// TODO: write helper function for accessing variable-length Safe_Array.bounds.

// From DECIMAL
Decimal :: struct {
	// From wReserved
	_reserved: ushort,
	using _: struct #raw_union {
		using _: struct {
			// From scale
			scale: byte,
			// From sign
			sign: byte,
		},
		// From signscale
		sign_scale: ushort,
	},
	// From Hi32
	high32: ulong,
	using _: struct #raw_union {
		using _: struct {
			// From Lo32
			low32: ulong,
			// From Mid32
			mid32: ulong,
		},
		// From Lo64
		low64: ulong_long,
	},
}

// From CY
Currency :: struct #raw_union {
	using _: struct {
		// From Lo
		low: ulong,
		// From Hi
		high: long,
	},
	// From int64
	int64: long_long,
}

Counted_Array :: struct($T: typeid) {
	elem_count: ulong,
	elems: [^]T,
}

// From CAC
Counted_Array_Char :: Counted_Array(char)
// From CAUB
Counted_Array_Byte :: Counted_Array(uchar)
// From CAI
Counted_Array_Short :: Counted_Array(short)
// From CAUI
Counted_Array_UShort :: Counted_Array(ushort)
// From CAL
Counted_Array_Long :: Counted_Array(long)
// From CAUL
Counted_Array_ULong :: Counted_Array(ulong)
// From CAH
Counted_Array_Large :: Counted_Array(Large_Integer)
// From CAUH
Counted_Array_ULarge :: Counted_Array(ULarge_Integer)
// From CAFLT
Counted_Array_Float :: Counted_Array(float)
// From CADBL
Counted_Array_Double :: Counted_Array(double)
// From CABOOL
Counted_Array_Bool :: Counted_Array(Variant_Bool)
// From CASCODE
Counted_Array_Status_Code :: Counted_Array(Status_Code)
// From CACY
Counted_Array_Currency :: Counted_Array(Currency)
// From CADATE
Counted_Array_Date :: Counted_Array(Date)
// From CAFILETIME
Counted_Array_File_Time :: Counted_Array(File_Time)
// From CACLSID
Counted_Array_Class_ID :: Counted_Array(Class_ID)
// From CACLIPDATA
Counted_Array_Clip_Data :: Counted_Array(Clip_Data)
// From CABSTR
Counted_Array_BStr :: Counted_Array(bstr)
// From CABSTRBLOB
Counted_Array_BStr_Blob :: Counted_Array(BStr_Blob)
// From CALPSTR
Counted_Array_Str :: Counted_Array(str)
// From CALPWSTR
Counted_Array_WStr :: Counted_Array(wstr)

// From CAPROPVARIANT
// NOTE(volt): Counted_Array(Property_Variant) does not work
Counted_Array_Property_Variant :: struct {
	elem_count: ulong,
	elems: [^]Property_Variant,
}

// From VERSIONEDSTREAM
Versioned_Stream :: struct {
	// From guidVersion
	version: GUID,
	// From pStream
	stream: ^IStream,
}

// From FILETIME
File_Time :: struct {
	// From dwLowDateTime
	dwLowDateTime: dword,
	// From dwHighDateTime
	dwHighDateTime: dword,
}

// From CLIPDATA
Clip_Data :: struct {
	// cbSize
	size: ulong,
	// ulClipFmt
	format: dword,
	// pClipData
	data: [^]byte,
}

// From BLOB
Blob :: struct {
	// From cbSize
	size: ulong,
	// From pBlobData
	data: [^]byte,
}

// From BSTRBLOB
BStr_Blob :: struct {
	// From cbSize
	size: ulong,
	// From pData
	data: [^]byte,
}

// From VARTYPE
Var_Type :: enum ushort {
	// From VT_EMPTY
	Empty = 0,
	// From VT_NULL
	Null = 1,
	// From VT_I2
	Int16 = 2,
	// From VT_I4
	Int32 = 3,
	// From VT_R4
	Real32 = 4,
	// From VT_R8
	Real64 = 5,
	// From VT_CY
	Currency = 6,
	// From VT_DATE
	Date = 7,
	// From VT_BSTR
	BStr = 8,
	// From VT_DISPATCH
	IDispatch = 9,
	// From VT_ERROR
	Status_Code = 10,
	// From VT_BOOL
	Variant_Bool = 11,
	// From VT_VARIANT
	Variant = 12,
	// From VT_UNKNOWN
	IUnknown = 13,
	// From VT_DECIMAL
	Decimal = 14,
	// From VT_I1
	Int8 = 16,
	// From VT_UI1
	UInt8 = 17,
	// From VT_UI2
	UInt16 = 18,
	// From VT_UI4
	UInt32 = 19,
	// From VT_I8
	Int64 = 20,
	// From VT_UI8
	UInt64 = 21,
	// From VT_INT
	Int = 22,
	// From VT_UINT
	UInt = 23,
	// From VT_VOID
	Void = 24,
	// From VT_HRESULT
	Result = 25,
	// From VT_PTR
	Ptr = 26,
	// From VT_SAFEARRAY
	Safe_Array = 27,
	// From VT_CARRAY
	C_Array = 28,
	// From VT_USERDEFINED
	User_Defined = 29,
	// From VT_LPSTR
	Str = 30,
	// From VT_LPWSTR
	WStr = 31,
	// From VT_RECORD
	Record = 36,
	// From VT_INT_PTR
	Int_Ptr = 37,
	// From VT_UINT_PTR
	UInt_Ptr = 38,
	// From VT_FILETIME
	File_Time = 64,
	// From VT_BLOB
	Blob = 65,
	// From VT_STREAM
	Stream = 66,
	// From VT_STORAGE
	Storage = 67,
	// From VT_STREAMED_OBJECT
	Streamed_Object = 68,
	// From VT_STORED_OBJECT
	Stored_Object = 69,
	// From VT_BLOB_OBJECT
	Blob_Object = 70,
	// From VT_CF
	Clipboard_Format = 71,
	// From VT_CLSID
	Class_ID = 72,
	// From VT_VERSIONED_STREAM
	Versioned_Stream = 73,
	// From VT_BSTR_BLOB
	BStr_Blob = 0xfff,
	// From VT_VECTOR
	Counted_Array = 0x1000,
	// From VT_ARRAY
	Safe_Array_Ptr = 0x2000,
	// From VT_BYREF
	By_Ref = 0x4000,
	// From VT_RESERVED
	Reserved = 0x8000,
	// From VT_ILLEGAL
	Illegal = 0xffff,
	// From VT_ILLEGALMASKED
	Illegal_Masked = 0xfff,
	// From VT_TYPEMASK
	Type_Mask = 0xfff,
}

// From PROPVARIANT
// NOTE: Static values of basic types are suffixed with "_val", and pointer values with "_ptr".
// NOTE: An exception to this are the COM interface and SAFEARRAY values: since they are always used
// as pointers and never as static values, they do not get "_val", and their pointer-to-pointer
// versions get "_ptr" instead. Additionally, "compound" types do not get "_val".
Property_Variant :: struct #raw_union {
	// From tag_inner_PROPVARIANT
	using _: struct {
		// From vt
		var_type: Var_Type,
		// From wReserved1
		_reserved1: word,
		// From wReserved2
		_reserved2: word,
		// From wReserved3
		_reserved3: word,
		using _: struct #raw_union {
			// From cVal
			char_val: char,
			// From bVal
			byte_val: uchar,
			// From iVal
			short_val: short,
			// From uiVal
			ushort_val: ushort,
			// From lVal
			long_val: long,
			// From ulVal
			ulong_val: ulong,
			// From intVal
			int_val: int,
			// From uintVal
			uint_val: uint,
			// From hVal
			large_val: Large_Integer,
			// From uhVal
			ularge_val: ULarge_Integer,
			// From fltVal
			float_val: float,
			// From dblVal
			double_val: double,
			// From boolVal
			bool_val: Variant_Bool,
			// From __OBSOLETE__VARIANT_BOOL
			__obsolete__variant_bool: Variant_Bool,
			// From scode
			status_code_val: Status_Code,
			// From cyVal
			currency_val: Currency,
			// From date
			date_val: Date,
			// From filetime
			file_time_val: File_Time,
			// From puuid
			uuid_ptr: ^Class_ID,
			// From pclipdata
			clip_data_ptr: ^Clip_Data,
			// From bstrVal
			bstr_val: bstr,
			// From bstrblobVal
			bstr_blob_val: BStr_Blob,
			// From blob
			blob_val: Blob,
			// From pszVal
			str_val: str,
			// From pwszVal
			wstr_val: wstr,
			// From punkVal
			iunknown: ^IUnknown,
			// From pdispVal
			idispatch: ^IDispatch,
			// From pStream
			istream: ^IStream,
			// From pStorage
			istorage: ^IStorage,
			// From pVersionedStream
			versioned_stream_ptr: ^Versioned_Stream,
			// From parray
			array: ^Safe_Array,
			// From cac
			ca_char: Counted_Array_Char,
			// From caub
			ca_byte: Counted_Array_Byte,
			// From cai
			ca_short: Counted_Array_Short,
			// From caui
			ca_ushort: Counted_Array_UShort,
			// From cal
			ca_long: Counted_Array_Long,
			// From caul
			ca_ulong: Counted_Array_ULong,
			// From cah
			ca_large: Counted_Array_Large,
			// From cauh
			ca_ularge: Counted_Array_ULarge,
			// From caflt
			ca_float: Counted_Array_Float,
			// From cadbl
			ca_double: Counted_Array_Double,
			// From cabool
			ca_bool: Counted_Array_Bool,
			// From cascode
			ca_status_code: Counted_Array_Status_Code,
			// From cacy
			ca_currency: Counted_Array_Currency,
			// From cadate
			ca_date: Counted_Array_Date,
			// From cafiletime
			ca_file_time: Counted_Array_File_Time,
			// From cauuid
			ca_uuid: Counted_Array_Class_ID,
			// From caclipdata
			ca_clip_data: Counted_Array_Clip_Data,
			// From cabstr
			ca_bstr: Counted_Array_BStr,
			// From cabstrblob
			ca_bstr_blob: Counted_Array_BStr_Blob,
			// From calpstr
			ca_str: Counted_Array_Str,
			// From calpwstr
			ca_wstr: Counted_Array_WStr,
			// From capropvar
			ca_variant: Counted_Array_Property_Variant,
			// From pcVal
			char_ptr: ^char,
			// From pbVal
			uchar_ptr: ^uchar,
			// From piVal
			short_ptr: ^short,
			// From puiVal
			ushort_ptr: ^ushort,
			// From *plVal
			long_ptr: ^ulong,
			// From pulVal
			ulong_ptr: ^ulong,
			// From pintVal
			int_ptr: ^int,
			// From puintVal
			uint_ptr: ^uint,
			// From pfltVal
			float_ptr: ^float,
			// From pdblVal
			double_ptr: ^double,
			// From pboolVal
			bool_ptr: ^Variant_Bool,
			// From pdecVal
			decimal_ptr: ^Decimal,
			// From pscode
			status_code_ptr: ^Status_Code,
			// From pcyVal
			currency_ptr: ^Currency,
			// From pdate
			date_ptr: ^Date,
			// From pbstrVal
			bstr_ptr: ^bstr,
			// From ppunkVal
			iunknown_ptr: ^^IUnknown,
			// From ppdispVal
			idispatch_ptr: ^^IDispatch,
			// From pparray
			array_ptr: ^^Safe_Array,
			// From pvarVal
			variant_ptr: ^Property_Variant,
		},
	},
	// From decVal,
	decimal_val: Decimal,
}

// From VARIANT
// NOTE: the naming standards for members of this struct follow the PROPVARIANT ones above.
Variant :: struct #raw_union {
	using _: struct {
		// From vt
		var_type: Var_Type,
		// From wReserved1
		_reserved1: word,
		// From wReserved2
		_reserved2: word,
		// From wReserved3
		_reserved3: word,
		using _: struct #raw_union {
			// From llVal
			long_long_val: long_long,
			// From lVal
			long_val: long,
			// From bVal
			byte_val: byte,
			// From iVal
			short_val: short,
			// From fltVal
			float_val: float,
			// From dblVal
			double_val: double,
			// From boolVal
			bool_val: Variant_Bool,
			// From __OBSOLETE__VARIANT_BOOL
			__obsolete__variant_bool: Variant_Bool,
			// From scode
			status_code: Status_Code,
			// From cyVal
			currency_val: Currency,
			// From date
			date: Date,
			// From bstrVal
			bstr_val: bstr,
			// From punkVal
			iunknown: ^IUnknown,
			// From pdispVal
			idispatch: ^IDispatch,
			// From parray
			array: ^Safe_Array,
			// From pbVal
			byte_ptr: ^byte,
			// From piVal
			short_ptr: ^short,
			// From plVal
			long_ptr: ^long,
			// From pllVal
			long_long_ptr: ^long_long,
			// From pfltVal
			float_ptr: ^float,
			// From pdblVal
			double_ptr: ^double,
			// From pboolVal
			bool_ptr: ^Variant_Bool,
			// From __OBSOLETE__VARIANT_PBOOL
			__obsolete__variant_pbool: ^Variant_Bool,
			// From pscode
			status_code_ptr: ^Status_Code,
			// From pcyVal
			currency_ptr: ^Currency,
			// From pdate
			date_ptr: ^Date,
			// From pbstrVal
			bstr_ptr: ^bstr,
			// From ppunkVal
			iunknown_ptr: ^^IUnknown,
			// From ppdispVal
			idispatch_ptr: ^^IDispatch,
			// From pparray
			array_ptr: ^^Safe_Array,
			// From pvarVal
			variant_ptr: ^Variant,
			// From byref
			ref_val: rawptr,
			// From cVal
			char_val: char,
			// From uiVal
			ushort_val: ushort,
			// From ulVal
			ulong_val: ulong,
			// From ullVal
			ulong_long_val: ulong_long,
			// From intVal
			int_val: int,
			// From uintVal
			uint_val: uint,
			// From pdecVal
			decimal_ptr: ^Decimal,
			// From pcVal
			char_ptr: ^char,
			// From puiVal
			ushort_ptr: ^ushort,
			// From pulVal
			ulong_ptr: ^ulong,
			// From pullVal
			ulong_long_ptr: ^ulong_long,
			// From pintVal
			int_ptr: ^int,
			// From puintVal
			uint_ptr: ^uint,
			using _: struct {
				// From pvRecord
				record_ptr: rawptr,
				// From pRecInfo
				irecord_info: ^IRecord_Info,
			},
		},
	},
	// From decVal
	decimal_val: Decimal,
}

// From VARIANTARG
Variant_Arg :: distinct Variant
