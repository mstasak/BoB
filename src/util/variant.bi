'$Debug
'variant.bi
$IncludeOnce
Option _Explicit

Const VT_NONE = 0
Const VT_STR = 1
'Const VT_BYTE = 2 'no demand?
Const VT_INT = 3
Const VT_LNG = 4
'CONST VT_INT64 = 5 'no demand?
Const VT_SNG = 6
Const VT_DBL = 7
Const VT_FLT = 8
'Const VT_STRINGARRAY = 9 'extra difficult - cannot make _MEM block containing array of variable length string - could use string variants? hmm... or 1 mem block per string - high overhead
'Const VT_BYTEARRAY = 10 'no demand?
'Const VT_INTARRAY = 11 'no demand?
Const VT_LONGARRAY = 12 'In Work
'Const VT_INT64ARRAY = 13 'no demand?

Type VTHolderStruct
    vHandle As Long
    vType As _Byte
    lbound As Long
    uBound As Long
    arrayMemCopy as _MEM
    strValue As String
    lngValue As Long 'for long or int
    sngValue As Single
    dblValue As Double
End Type

ReDim Shared VTStore(1 To 10) As VTHolderStruct
Dim Shared As Long VTMaxUsed, VTReleased, VTLastHandle

