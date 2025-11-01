'$Debug
'variant.bi
$IncludeOnce
Option _Explicit

Const VT_NONE = 0
Const VT_STR = 1
Const VT_INT = 2
Const VT_LNG = 3
Const VT_SNG = 4
Const VT_DBL = 5
'Const VT_WORDARRAY = 6 'TBD
'Const VT_STRINGARRAY = 7 'extra difficult - cannot make _MEM block containing array of variable length string - could use string variants? hmm... or 1 mem block per string - high overhead

Type VTHolderStruct
    vHandle As Long
    vType As _Byte
    'arrayBase As Long
    'arrayMemCopy as _MEM
    strValue As String
    lngValue As Long 'for long or int
    sngValue As Single
    dblValue As Double
End Type

ReDim Shared VTStore(1 To 10) As VTHolderStruct
Dim Shared As Long VTMaxUsed, VTReleased, VTLastHandle

