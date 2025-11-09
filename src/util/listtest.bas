'listtest.bas
'Demo and test program for list.bi/.bm
'library to manage lists of strings, words, or doubles

$Debug
Option _Explicit
$Console:Only
'$Include: 'list.bi'
VTInit
LstInit

Dim flist As Long
flist = LstNewStr

LstSetName flist, "Fruits"
LstAddStr flist, "Apples"
LstAddStr flist, "Oranges"
LstAddStr flist, "Plums"
LstAddStr flist, "Watermelons"
LstAddStr flist, "Pumpkins"
VTDump

'Print LstToStr(flist)
LstDump
LstSort flist, _FALSE
LstDump
LstSort flist, _TRUE
LstDump

LstDeleteStr flist, 5
LstDeleteStr flist, 3
LstDeleteStr flist, 1
LstInsertStr flist, 2, "Apricots"
LstDump
LstChangeStr flist, 3, "Big Pumpkins"
LstDump
'LstRelease flist
'VTDump

dim primeList as Long
primeList = LstNewLng
LstSetName(PrimeList, "Prime Numbers")
LstAddLng(primeList, 2)
LstAddLng(primeList, 3)
LstAddLng(primeList, 5)
LstAddLng(primeList, 7)
LstAddLng(primeList, 11)
LstAddLng(primeList, 13)
LstAddLng(primeList, 15)
LstAddLng(primeList, 17)
LstAddLng(primeList, 19)
LstAddLng(primeList, 22)
LstAddLng(primeList, 29)
LstDump
LstDeleteLng(primeList, 7)
LstChangeLng(primeList, 9,23)
LstInsertLng(primeList, 1, 1)
LstDump

VTDump
LstTerm
Print "Variant store after LstTerm"
VTDump
VTTerminate
End

'$Include: 'list.bm'

