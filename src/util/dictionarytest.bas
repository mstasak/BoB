'$Debug
'dictionarytest.bas
Option _Explicit

'create and use key-ordered dictionaries
'keys may be long or string
'values may be long, string, or double

'Sample/Test Code

dim d as Long
d = DictNewSL()
DicSLAdd d, "", 5
dim k as String
dim v as Long
k=DicSLHasKeyFind(d, "Name")
v=DictLookupLForS(d, k)
DicSLSetForSKeyLval(d, k, v+1)
d = ${1:value}
d = ${1:value}


DicFree d

'd = DictStrIntNew
'If Not dictHasStrKey() Then
'End If

'dictNew
'dictRelease
'allDictsRelease

'dictAdd
'dictGet
'dictPut
'dictHasKey
'dictLen
'dictKeys
'dictValues
'dictCountOfValue
'dictKeysForValue
'dim array

Option _Explicit

Dim arr%(10)
arr%(0) = 55
arr%(1) = 5
arr%(2) = 7
arr%(3) = 0
arr%(4) = 6
arr%(5) = 1
arr%(6) = 4
arr%(7) = 9
arr%(8) = 2
arr%(9) = 8
arr%(10) = -99

printarr arr%()
sortarr arr%()
printarr arr%()

End

Sub printarr (a%())
    Print "Array = [";
    Dim As Integer i
    Dim sep As String
    sep = ""
    For i = LBound(a%) To UBound(a%)
        Print sep; LTrim$(Str$(a%(i)));
        sep = ", "
    Next i
    Print "]"
End Sub

Sub sortarr (b%())
    Dim i, j As Integer
    For i = LBound(b%) To UBound(b%) - 1
        For j = i + i To UBound(b%)
            If b%(i) > b%(j) Then
                Swap b%(i), b%(j)
            End If
            'If a(i) = 6 Or a(j) = 6 Then
            '    Print i, j, b(i), b(j)
            'End If
        Next j
        printarr (b%())
    Next i
End Sub

