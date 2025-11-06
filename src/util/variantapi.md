# Variant support library API

## Purpose
variant.bi and variant.bm implement a Variant system in QB64 PE 4.2.0

A variant is a Long handle which holds a key to an array of value holder records.

A variant may "hold" any of these value types:

- String
- _Byte
- Integer
- Long
- Integer64
- Single
- Double
- _Float
- String(lbound to ubound)
- _Byte(lbound to ubound)
- Integer(lbound to ubound)
- Long(lbound to ubound)
- Integer64(lbound to ubound)
- Single(lbound to ubound)
- Double(lbound to ubound)
- _Float(lbound to ubound)

Only one-dimension arrays are supported.

## Usage

### Session

- `Sub VTInit` initializes the variant system. Call before creating or using variants.
- `Sub VTTERM` shut down variant system.  Call when finished using variants, to release memory.
- `Sub VTDUMP` print the contents of the variant storage for each variant, list (handle, type, and value).
### Creation

- `Function VTNewStr& (s As String)` returns long variant handle, identifying a variant containing the string s.
- `Function VTNewByte& (n As _Byte)`
- `Function VTNewInt& (n As Integer)`
- `Function VTNewLng& (n As Long)`
- `Function VTNewInt64& (n As _Integer64)`
- `Function VTNewSng& (n As Single)`
- `Function VTNewDbl& (n As Double)`
- `Function VTNewFlt& (n As _Float)`
- `Function VTNewStringArray& (arr() As String)`
- `Function VTNewByteArray& (arr() As _Byte)`
- `Function VTNewIntArray& (arr() As Integer)`
- `Function VTNewLongArray& (arr() As Long)`
- `Function VTNewInt64Array& (arr() As _Integer64)`
- `Function VTNewSingleArray& (arr() As Single)`
- `Function VTNewDoubleArray& (arr() As Double)`
- `Function VTNewFloatArray& (arr() As _Float)`

### Access

- `Function VTStr$ (vHandle As Long)` Get the value of a String variant.
- `Function VTByt% (vHandle As Long)`
- `Function VTInt% (vHandle As Long)`
- `Function VTLng& (vHandle As Long)`
- `Function VTInt64&& (vHandle As Long)`
- `Function VTSng! (vHandle As Long)`
- `Function VTDbl# (vHandle As Long)`
- `Function VTFlt## (vHandle As Long)`
- `Sub VTGetStringArray (vHandle As Long, arr() As String)`
- `Sub VTGetByteArray (vHandle As Long, arr() As _Byte)`
- `Sub VTGetIntArray (vHandle As Long, arr() As Integer)`
- `Sub VTGetLongArray (vHandle As Long, arr() As Long)`
- `Sub VTGetInt64Array (vHandle As Long, arr() As _Integer64)`
- `Sub VTGetSingleArray (vHandle As Long, arr() As Single)`
- `Sub VTGetDoubleArray (vHandle As Long, arr() As Double)`
- `Sub VTGetFloatArray (vHandle As Long, arr() As _Float)`

- `Function VTType$ (vHandle As Long)` Return the type of a variant:  "(NULL)" (probably a VTRelease'd variant) / "STRING" / "BYTE" / "INTEGER" / "LONG" / "INTEGER64" / "SINGLE" / "DOUBLE" / "FLOAT" / "STRING ARRAY" / "BYTE ARRAY" / "INTEGER ARRAY" / "LONG ARRAY" / "INTEGER64 ARRAY" / "SINGLE ARRAY" / "DOUBLE ARRAY" / "FLOAT ARRAY"
- `Function VTToStr$ (vHandle As Long)` - convert value of variant of any typeto a string, i.e. for printing

### Disposal

- `Sub VTRelease (vHandle As Long)` Release the variant identified by vHandle.  vHandle becomes invalid (erased).
- `Sub VTReleaseAll` Release all variants.  All vHandles become invalid and VTStore is shrunk to its initial size.
- `Sub VTCompact (newUB As Long)` If VTStore (the main array containing variant type and value info) will then be <80% full, shrink it to the new upper bound in newUB.

### Internal

- `Function VariantNew&` create a new raw variant handle, with no type or value assigned
- `Function VTStoreIndexOf& (vHandle As Long)` find the VTStore index of a variant handle
- `Sub VTGetStringArrayAt (vsIndex As Long, arr() As String)`
- `Sub VTGetByteArrayAt (vsIndex As Long, arr() As _Byte)`
- `Sub VTGetIntArrayAt (vsIndex As Long, arr() As Integer)`
- `Sub VTGetLongArrayAt (vsIndex As Long, arr() As Long)`
- `Sub VTGetInt64ArrayAt (vsIndex As Long, arr() As _Integer64)`
- `Sub VTGetSingleArrayAt (vsIndex As Long, arr() As Single)`
- `Sub VTGetDoubleArrayAt (vsIndex As Long, arr() As Double)`
- `Sub VTGetFloatArrayAt (vsIndex As Long, arr() As _Float)`
- `Function VTTypeAt$ (nIndex As Long)` return the type name of the variant at VTStore slot nIndex.
- `Function VTToStrAt$ (nIndex As Long)` convert value of any type at VTStore slot to a string, i.e. for printing
- `Function CInt64ToByte%% (n As _Integer64)` extract low order byte from an _Integer64 value
- `Function CInt64ToInteger% (n As _Integer64)` extract low order word from an _Integer64 value
- `Function CInt64ToLong& (n As _Integer64)` extract low order dword from an _Integer64 value
- `Sub VTReleaseAt (vsIndex As Long, autoCompact As _Byte)` release variant at a given slot in VTStore.  Autocompact may be disabled to speed up bulk releasing.
= `Function VTNextVStoreIndex&` return the next available (empty, vHandle=0) VTStore index.

## Potential enhancements

- Cache recent vHandle lookups for performance.
- Use binary search and/or some end-relative search to speed up vHandle lookup (currently a linear search).
- Allow user to turn on and off auto-compaction to prevent slowdown at cost of memory use.
- Save and recreate multi-dimension arrays (_MEM stores them the same, but does not preserve index count and bounds).
- Support _Bit values and arrays.
- Add error handling and debugging support.
- Add logging support.
- Add VTAssign*Type*>(vHandle, value) Sub family. (an alternative to `VTRelease vHandle : vHandle = VTNew*Type*(value)`)