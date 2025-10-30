# Meet BoB (BASIC on BASIC)

BoB is a BASIC interpreter, written in BASIC.
It is mainly from scratch, not using LEX, YACC, ANTLR, or
similar tools to automate or optimize operation.

BoB will start in an infantile Tiny BASIC state, but gradually grow in stature.

BoB will run as a QB64PE compiled BASIC program.  BoB is intended to run
under any QB64PE host (Windows, Linux, Mac), but the focus will be on Windows
during early development.

BoB is under early scoping right now.  Plans are:

Implement essential BASIC: statements and variables and types, subs and functions.
Also a line editor in its REPL loop.
The essentials include:

types: boolean, integer, single, string and array (of scalar).
arrays: up to 2 dimensions (future: more), of any scalar type.
user-defined types: no (future)

variable names: [a-z_][a-z0-9_]*

variable scope: global (multimodule), shared (anywhere in module), local (current sub or function only)

variable modifiers: static (retains value  across calls)

statements:
	DIM
	LET

	FOR var = initexpr TO endexpr [STEP skipval]
	NEXT [var]
	IF x THEN dosomething
	IF x THEN label | linenumber
	IF x THEN
		truebranch
	ELSEIF y THEN
		alternatebranch	
	ELSE
		falsebranch
	END IF
	FOR var = startexpr TO endexpr [STEP skipexpr]
	  EXIT FOR
	NEXT [var]
	FOR var IN arrayvar
	  EXIT FOR
	NEXT [var]
	DO [condition]
	  EXIT DO
	LOOP

	DO
	  EXIT DO
	LOOP [condition]

    WAIT | PAUSE
	

	INPUT [prompt] var [,...]
	PRINT value[:wid[,dec]] [,... | ;...]
	DATA expr [,expr...]
	READ var [,var...]
	RESET [label | linenumber]
	GOTO label | linenumber
	GOSUB label | linenumber
	RETURN
	TYPE (future)
	BREAK
	LOG
	END
	RANDOMIZE [timer?]

	SUB subroutinename [arglist]
	END SUB [subroutinename]

	FUNCTION functionname [arglist] AS type
	END function [functionname]

	more to do, probably

functions:
  string:
    TRIM(s), RTRIM(s), LTRIM(s)
	CHR(n)
	MID(n,start,len)
	STR(n[,wid[,decimals]])
	SPC|SPACE(n)
	UCASE(s), LCASE(s)
	REVERSE(s)
	LEFT(s,n), RIGHT(s,n)
	MODULEFILENAME()
	MODULEFILEPATH()
  single:
    SGN(n)
    ABS(n)
    SIN(n), COS(n), TAN(n)
	RNDS()
	INT(), FLOOR(), CEIL(), ROUND(), LOG, EXP, LOG10, EXP10, LOGN, EXPN (may reconsider names based on prevalent usage)
  integer:
    SGN(n)
    ABS(n)
	LEN(s)
	LINEINDEX() 'nonstandard, =current ordinal line number counted from start of file (not line number label)
  boolean:
    BETWEEN(v, vmin, vmax)
	WITHIN(v, vmin, vmax)
  multi/other:
	MSGBOX()
	ACCEPT()


directives: (will either all require a prefix like $ or #, or mods needed to not conflict with statements)
    #OPTION setting [parameters]
		BASE 0|1
		[_]EXPLICIT
		STRICT | MODERN | (tbd)
		and many more... 
	#IMPORT (or maybe INCLUDE?) [pathto]modulename
	#DEFINE
	#IFDEF #expr | IFNDEF #expr
	[ELSE]
	#ENDIF
	#PRINT
	#INPUT
	#QUERY
	
	

comments: REM comments\n
    -or-  anything... 'comments\n
	-or-  anything... '* comments *' ...anything  (between tokens, not within a literal)

