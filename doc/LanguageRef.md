BoB should be a configurable interpreter via profile files to turn on and off various features.

## Barebones compatibility mode

Typical small program:

```basic
name = "World"
print "Hello, "; name
end 'optional
```

## Maximum mode

```basic
Namespace nsMain
Module modMain

Sub Main(args() as String
    Dim name As String = "BoBiverse"
    Dim i As Integer
    Print $"Hello, {name}."
End Main

End Module modMain
End Namespace nsMain
```

## Directives

```basic
Option Explicit [ON|OFF]
```

```basic
Option Base [0|1|NONE]
```

```basic
Include {filepath | (stringexpr)}
```

## Statements

## Runtime Library (built-in consts, subs and functions)

## Multi-module programming

## Interfacing external code
