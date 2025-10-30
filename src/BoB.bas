'BoB - BASIC on BASIC
' An interpreter mixing old and modern syntax, statements, datatypes, and directives
' Runs on QBPE64 Phoenix Edition 4.2 (or later)
' Runs on Windows x64, MacOs, Linux x64, or Linux aarch64 (wherever QB64 PE runs)

'$Include:'BoBGlobals.bi'
''$Include:'.bi'
''$Include:'.bi'
''$Include:'.bi'
''$Include:'.bi'
''$Include:'.bi'
''$Include:'.bi'
''$Include:'.bi'
''$Include:'.bi'

InitIDE
InitRuntime
InitInterpreter
LoadOptions
RestoreSession

Do

    RunIDE

    If SaveSession <> SAVESESSIONCANCEL Then
        Exit Do
    End If
Loop


TerminateInterpreter
TerminateRuntime
TerminateIDE





'$Include:'IDE.bm'
'$Include:'Runtime.bm'
'$Include:'Interpreter.bm'
'$Include:'Options.bm'
'$Include:'Session.bm'
''$Include:'.bm'
''$Include:'.bm'
''$Include:'.bm'
''$Include:'.bm'

