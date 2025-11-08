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
LstInsertStr flist, 3, "Apricots"
'LstChangeStr flist, 3, "Big Pumpkins"
LstDump
VTDump
'LstRelease flist
'VTDump
LstTerm
VTDump
VTTerminate
End

'$Include: 'list.bm'

