$Debug
Option _Explicit

$Console:Only
$Asserts
'$Include:'variant.bi'

'test/sample code

Dim As Long vName, vAge, vGreeting, vSingle, vDouble, vLong

VTInit

vName = VTNewStr("Mark")
vAge = VTNewInt(61)
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
redim bulk(1 to 10000) As Long
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

print "Bulk original"
for i=1 to 10000
    if bulk(i)<>0 then print i,bulk(i)
next i

dim m as _MEM, m2 as _Mem
m = _Mem(bulk)
m2 = _memnew(m.size)
_memcopy m, m.offset, m.size to m2, m2.offset
print "offset size type elementsize image sound = ", m.offset,m.size,m.type,m.elementsize,m.image,m.sound
_mem_free(m)
erase bulk
print "Bulk erased"
for i=1 to 10000
    if bulk(i)<>0 then print i,bulk(i)
next i


redim bulk(1 to 10000) as long
m = _mem(bulk())
_memcopy m2,m2.offset,m2.size to m,m.offset
print "Bulk restored"
for i=1 to 10000
    if bulk(i)<>0 then print i,bulk(i)
next i

VTTerminate
End

'$Include:'variant.bm'
