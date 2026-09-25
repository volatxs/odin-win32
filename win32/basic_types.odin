package win32

import "base:builtin"
import "base:runtime"

import "core:c"

// Basic Windows types documented in:
// https://learn.microsoft.com/en-us/windows/win32/winprog/windows-data-types

// The original types are named using screaming snake case, joined uppercase, etc.
// We use small snake case instead for easier typing and to prevent mistaking them for constants.

// This package is directed at modern 64-bit and 32-bit Windows systems from Windows 10 onwards, so
// obsolete distinctions inherited from older versions will be collapsed under a single type. In
// those cases, either the shorter or the "more canonical" of the names will be preferred. For
// instance, "LPVOID" and "PVOID" would both collapse under "pvoid". Additionally, a comment should
// be appended to such type definitions to explicitly state this collapsing of type names.

// Pointer types that are simply "pointer to X" won't be declared. Simple ^X will be used instead.
// Thus, PVOID and LPVOID will not be declared, and simple "rawptr" will be used instead. This
// reduces the amount of total types and gives us space to deliberate about whether something should
// be declared as a multipointer, for instance.

// Declarations that depend on the presence of the UNICODE flag and thus have two distinct
// definitions (for wide or ANSI) will be separately declared, and an alias defaulting to the wide
// version will be added. For instance, there would be MessageBoxA as well as MessageBoxW
// declarations, and MessageBox would alias MessageBoxW.

// Exceptions to the rules above exist because common sense also does.

// Used to distinguish Win32 from Win64 when defining types.
@(private) _Win_64 :: size_of(builtin.rawptr) == 8

// NOTE: POINTER_32, POINTER_64, POINTER_SIGNED, POINTER_UNSIGNED will be applied directly.

// From WORD
word :: c.ushort

// From ATOM
atom :: word

// From BOOL
bool :: c.int

// From BYTE
byte :: c.uchar

// From BOOLEAN
boolean :: builtin.byte

// Collapsed form of "CHAR" and "CCHAR".
char :: c.char

// From DWORD
dword :: c.ulong

// From COLORREF
color_ref :: dword

// From DWORDLONG
dword_long :: builtin.u64

// From ULONG_PTR
ulong_ptr :: builtin.u64 when _Win_64 else c.ulong

// From DWORD_PTR
dword_ptr :: ulong_ptr

// From DWORD32
dword32 :: c.uint

// From DWORD64
dword64 :: builtin.u64

// From FLOAT
float :: c.float

// From HANDLE
handle :: distinct rawptr

// From HACCEL
haccel :: distinct handle

// From HALF_PTR
half_ptr :: c.int when _Win_64 else c.short

// From HBITMAP
hbitmap :: distinct handle

// From HBRUSH
hbrush :: distinct handle

// From HCOLORSPACE
hcolor_space :: distinct handle

// From HCONV
hconv :: distinct handle

// From HCONVLIST
hconv_list :: distinct handle

// From HICON
hicon :: distinct handle

// From HCURSOR
hcursor :: distinct hicon

// From HDC
hdc :: distinct handle

// From HDDEDATA
hdde_data :: distinct handle

// From HDESK
hdesk :: distinct handle

// From HDROP
hdrop :: distinct handle

// From HDWP
hdwp :: distinct handle

// From HENHMETAFILE
henh_metafile :: distinct handle

// From HFILE
hfile :: distinct c.int

// From HFONT
hfont :: distinct handle

// From HGDIOBJ
hgdi_obj :: distinct handle

// From HGLOBAL
hglobal :: distinct handle

// From HHOOK
hhook :: distinct handle

// Collapsed form of "HMODULE" and "HINSTANCE".
hinstance :: distinct handle

// From HKEY
hkey :: distinct handle

// From HKL
hkl :: distinct handle

// From HLOCAL
hlocal :: distinct handle

// From HMENU
hmenu :: distinct handle

// From HMETAFILE
hmetafile :: distinct handle

// From HMONITOR
hmonitor :: distinct handle

// From HPALETTE
hpalette :: distinct handle

// From HPEN
hpen :: distinct handle

// From HRESULT
hresult :: distinct c.long

// From HRGN
hrgn :: distinct handle

// From HRSRC
hrsrc :: distinct handle

// From HSZ
hsz :: distinct handle

// From HWINSTA
hwin_sta :: distinct handle

// From HWND
hwnd :: distinct handle

// From INT
int :: c.int

// From INT_PTR
int_ptr :: builtin.i64 when _Win_64 else c.int

// From INT8
int8 :: c.schar

// From INT16
int16 :: c.short

// From INT32
int32 :: c.int

// From INT64
int64 :: builtin.i64

// From LANGID
lang_id :: distinct word

// From LCID
lc_id :: distinct dword

// From LCTYPE
lc_type :: distinct dword

// From LGRPID
lgrp_id :: distinct dword

// From LONG
long :: c.long

// From LONGLONG
long_long :: builtin.i64 when _Win_64 else c.double

// From LONG_PTR
long_ptr :: builtin.i64 when _Win_64 else c.long

// From LONG32
long32 :: c.int

// From LONG64
long64 :: builtin.i64

// From LPARAM
lparam :: distinct long_ptr

// From LRESULT
lresult :: distinct long_ptr

// From QWORD
qword :: builtin.u64

// From SC_HANDLE
sc_handle :: distinct handle

// From SC_LOCK
sc_lock :: distinct rawptr

// From SERVICE_STATUS_HANDLE
service_status_handle :: distinct handle

// From SHORT
short :: c.short

// From SIZE_T
size_t :: ulong_ptr

// From SSIZE_T
ssize_t :: long_ptr

// From UCHAR
uchar :: c.uchar

// From UHALF_PTR
uhalf_ptr :: c.uint when _Win_64 else c.ushort

// From UINT
uint :: c.uint

// From UINT_PTR
uint_ptr :: builtin.u64 when _Win_64 else c.uint

// From UINT8
uint8 :: c.uchar

// From UINT16
uint16 :: c.ushort

// From UINT32
uint32 :: c.uint

// From UINT64
uint64 :: builtin.u64

// From ULONG
ulong :: c.ulong

// From ULONGLONG
ulong_long :: builtin.u64 when _Win_64 else c.double

// From ULONG32
ulong32 :: c.uint

// From ULONG64
ulong64 :: builtin.u64

// From WCHAR
wchar :: builtin.u16

str :: cstring
wstr :: cstring16

// From UNICODE_STRING
Unicode_String :: struct {
	length: ushort,
	maximum_length: ushort,
	buffer: wstr,
}

// From USHORT
ushort :: c.ushort

// From USN
usn :: long_long

// From WPARAM
wparam :: distinct uint_ptr
