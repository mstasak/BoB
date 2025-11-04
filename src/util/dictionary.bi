'$Debug
Option _Explicit
'dictionary.bi
'create and use key-value dictionaries
'keys may be long or string
'values may be long or string (long can contain a variant, to store other types)

'ReDim strDictStore(1 To 5, 1 To 10) As String 'array(dictnum, key#, val#)
'ReDim intDictStore(1 To 5, 1 To 10) As Integer
'ReDim lngDictStore(1 To 5, 1 To 10) As Long
'ReDim sngDictStore(1 To 5, 1 To 10) As Single


'in dictionary.bm

'procedure names end in two letters indicating the dictionary key and value types
' L=Long, S=String, A=Any(don't care)

'function DictNewLL&
'function DictNewLS&
'function DictNewSL&
'function DictNewSS&
'sub DictFreeLL(d&)
'sub DictFreeLS(d&)
'sub DictFreeSL(d&)
'sub DictFreeSS(d&)
'sub DictDumpLL(d&)
'sub DictDumpLS(d&)
'sub DictDumpSL(d&)
'sub DictDumpSS(d&)
'function DictHasKeyAL%%(d&, k&)
'function DictHasKeyAS%%(d&, k$)
'function DictGetLL&(d&, k&)
'function DictGetLS$(d&, k$)
'function DictGetSL&(d&, k&)
'function DictGetSS$(d&, k$)
'sub DictAddLL(d&, v&)
'sub DictAddLS(d&, v$)
'sub DictAddSL(d&, v&)
'sub DictAddSS(d&, v$)
'sub DictPutLL(d&, v&)
'sub DictPutLS(d&, v$)
'sub DictPutSL(d&, v&)
'sub DictPutSS(d&, v$)
'sub DictRemoveLL(d&, k&)
'sub DictRemoveLS(d&, k$)
'sub DictChangeKeyLA(d&, kOld&, kNew&)
'sub DictChangeKeySA(d&, kOld$, kNew$)
'function DictCountAA&(d&)

'<>s TO BE EXPANDED
'sub DictGetKeys<k>A(d, dynarr())
'sub DictGetKeys<k>A(d, dynarr())
'sub DictGetValuesA<v>(d, dynarr())
'sub DictGetValuesA<v>(d, dynarr())
'function DictCountOfValueA&<v>(d, v)
'function DictCountOfValueA&<v>(d, v)
'sub DictKeysForValue<k><v>(d, v, dynarr())
'sub DictKeysForValue<k><v>(d, v, dynarr())
'sub DictKeysForValue<k><v>(d, v, dynarr())
'sub DictKeysForValue<k><v>(d, v, dynarr())
'sub DictToArray<k><v>
'sub DictToArray<k><v>
'sub DictToArray<k><v>
'sub DictToArray<k><v>



