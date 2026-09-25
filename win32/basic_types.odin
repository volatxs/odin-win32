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

// TODO: add original name of everything above it.

// Used to distinguish Win32 from Win64 when defining types.
@(private) _Win_64 :: size_of(builtin.rawptr) == 8

// NOTE: POINTER_32, POINTER_64, POINTER_SIGNED, POINTER_UNSIGNED will be applied directly.

word :: c.ushort

atom :: word

bool :: c.int

byte :: c.uchar

boolean :: builtin.byte

// Collapsed form of "CHAR" and "CCHAR".
char :: c.char

dword :: c.ulong

color_ref :: dword

dword_long :: builtin.u64

ulong_ptr :: builtin.u64 when _Win_64 else c.ulong

dword_ptr :: ulong_ptr

dword32 :: c.uint

dword64 :: builtin.u64

float :: c.float

handle :: distinct rawptr

haccel :: distinct handle

half_ptr :: c.int when _Win_64 else c.short

hbitmap :: distinct handle

hbrush :: distinct handle

hcolor_space :: distinct handle

hconv :: distinct handle

hconv_list :: distinct handle

hicon :: distinct handle

hcursor :: distinct hicon

hdc :: distinct handle

hdde_data :: distinct handle

hdesk :: distinct handle

hdrop :: distinct handle

hdwp :: distinct handle

henh_metafile :: distinct handle

hfile :: distinct c.int

hfont :: distinct handle

hgdi_obj :: distinct handle

hglobal :: distinct handle

hhook :: distinct handle

// Collapsed form of "HMODULE" and "HINSTANCE".
hinstance :: distinct handle

hkey :: distinct handle

hkl :: distinct handle

hlocal :: distinct handle

hmenu :: distinct handle

hmetafile :: distinct handle

hmonitor :: distinct handle

hpalette :: distinct handle

hpen :: distinct handle

hresult :: distinct c.long

hrgn :: distinct handle

hrsrc :: distinct handle

hsz :: distinct handle

hwin_sta :: distinct handle

hwnd :: distinct handle

int :: c.int

int_ptr :: builtin.i64 when _Win_64 else c.int

int8 :: c.schar

int16 :: c.short

int32 :: c.int

int64 :: builtin.i64

lang_id :: distinct word

lc_id :: distinct dword

lc_type :: distinct dword

lgrp_id :: distinct dword

long :: c.long

long_long :: builtin.i64 when _Win_64 else c.double

long_ptr :: builtin.i64 when _Win_64 else c.long

long32 :: c.int

long64 :: builtin.i64

lparam :: distinct long_ptr

lresult :: distinct long_ptr

qword :: builtin.u64

sc_handle :: distinct handle

sc_lock :: distinct rawptr

service_status_handle :: distinct handle

short :: c.short

size_t :: ulong_ptr

ssize_t :: long_ptr

uchar :: c.uchar

uhalf_ptr :: c.uint when _Win_64 else c.ushort

uint :: c.uint

uint_ptr :: builtin.u64 when _Win_64 else c.uint

uint8 :: c.uchar

uint16 :: c.ushort

uint32 :: c.uint

uint64 :: builtin.u64

ulong :: c.ulong

ulong_long :: builtin.u64 when _Win_64 else c.double

ulong32 :: c.uint

ulong64 :: builtin.u64

wchar :: builtin.u16

str :: [^]char
wstr :: [^]wchar

Unicode_String :: struct {
	length: ushort,
	maximum_length: ushort,
	buffer: wstr,
}

ushort :: c.ushort

usn :: long_long

wparam :: distinct uint_ptr
