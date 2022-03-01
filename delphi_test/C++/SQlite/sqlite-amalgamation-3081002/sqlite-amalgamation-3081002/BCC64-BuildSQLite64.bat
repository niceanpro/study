set pkgdir=^
 "C:\Program Files (x86)\Embarcadero\Studio\14.0"

bcc64^
 -tWD^
 -L%pkgdir%\lib\win64\debug^
 -I %pkgdir%\include\windows\crtl^
 -I %pkgdir%\include\windows\sdk^
 -D "SQLITE_API=__declspec(dllexport)"^
 -D win64^
 -D NDEBUG^
 -D _WINDOWS^
 -D _USERDLL^
 -D NO_TCL^
 -D _CRT_SECURE_NO_DEPRECATE^
 -D THREADSAFE=1^
 -D TEMP_STORE=1^
 -D SQLITE_MAX_EXPR_DEPTH=0^
 -D SQLITE_ENABLE_COLUMN_METADATA^
 sqlite3.c shell.c

 pause

