$Debug
Option _Explicit

$Console:Only
$Asserts
'$Include:'variant.bi'

'test/sample code

Dim As Long vName, vHeight, vGreeting, vSingle, vDouble, vLong

VTInit

vName = VTNewStr("Mark")
vHeight = VTNewInt(69)
vGreeting = VTNewStr("Hello,")
vSingle = VTNewSng(100000.25)
vDouble = VTNewDbl(Sqr(2.0))
vLong = VTNewLng(1000000000)

Print VStr(vGreeting) + " " + VStr(vName)
Print "Long = ", VStr(vLong)
Print "Single = ", VStr(vSingle)
Print "Double = ", VStr(vDouble)
'Print "Long = ", Str$(VTLng(vLong))
'Print "Single = ", Str$(VTSng(vSingle))
'Print "Double = ", Str$(VTDbl(vDouble))
Print
VTDump

'add 10000 random long values
Dim i As Long, j As Long
ReDim bulk(1 To 10000) As Long
For i = 1 To 10000
    bulk(i) = VTNewLng(1 + Int(Rnd * 1000000000))
Next i
'remove 9990

For i = 1 To 9990
    Do
        j = 1 + Int(Rnd * 10000)
    Loop While bulk(j) = 0
    VTRelease (bulk(j))
    bulk(j) = 0
Next i
VTDump
'bulk should contain ten elements
'vtstore should be shrung to 20 or 40

Print "Bulk original ["
For i = 1 To 10000
    If bulk(i) <> 0 Then Print i, bulk(i), VStr(bulk(i))
Next i
Print "]"

For i = 1 To 9990
    If bulk(j) <> 0 Then
        VTRelease (bulk(j))
    End If
    bulk(j) = 0
Next i
Dim bulksave As Long
bulksave = VTNewLongArray(bulk())

For i = 1 To 10000
    bulk(i) = 0
Next i

Print "Bulk emptied ["
For i = 1 To 10000
    If bulk(i) <> 0 Then Print i, bulk(i), VStr(bulk(i))
Next i
Print "]"
Erase bulk

ReDim bulk(1 To 10000) As Long
VTGetLongArray bulksave, bulk()
Print "Bulk restored ["
For i = 1 To 10000
    If bulk(i) <> 0 Then Print i, bulk(i), VStr(bulk(i))
Next i
Print "]"
VTDump
VTTerminate
End

'$Include:'variant.bm'
