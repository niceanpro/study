(***
  @abstract(The @name - base constatns, types)
  @author(Michal Zaborowski <michal.zaborowski@wp.pl>)
*)

unit SLTypes;

interface
                        
{$I SLDefs.inc}

uses
// 2003.10.25 Paul - For compatibility with Kylix 1
  SysUtils, DB;

const
  { Results of calling SQLite API functions }

  (*** Successful result. *)
  SQLITE_OK         =  0;
  (*** SQL error or missing database. *)
  SQLITE_ERROR      =  1;
  (*** An internal logic error in SQLite. *)
  SQLITE_INTERNAL   =  2;
  (*** Access permission denied. *)
  SQLITE_PERM       =  3;
  (*** Callback routine requested an abort. *)
  SQLITE_ABORT      =  4;
  (*** The database file is locked. *)
  SQLITE_BUSY       =  5;
  (*** A table in the database is locked. *)
  SQLITE_LOCKED     =  6;
  (*** A malloc() failed. *)
  SQLITE_NOMEM      =  7;
  (*** Attempt to write a readonly database. *)
  SQLITE_READONLY   =  8;
  (*** Operation terminated by sqlite_interrupt(). *)
  SQLITE_INTERRUPT  =  9;
  (*** Some kind of disk I/O error occurred. *)
  SQLITE_IOERR      = 10;
  (*** The database disk image is malformed. *)
  SQLITE_CORRUPT    = 11;
  (*** (Internal Only) Table or record not found. *)
  SQLITE_NOTFOUND   = 12;
  (*** Insertion failed because database is full. *)
  SQLITE_FULL       = 13;
  (*** Unable to open the database file. *)
  SQLITE_CANTOPEN   = 14;
  (*** Database lock protocol error. *)
  SQLITE_PROTOCOL   = 15;
  (*** (Internal Only) Database table is empty. *)
  SQLITE_EMPTY      = 16;
  (*** The database schema changed. *)
  SQLITE_SCHEMA     = 17;
  (*** Too much data for one row of a table. *)
  SQLITE_TOOBIG     = 18;
  (*** Abort due to contraint violation. *)
  SQLITE_CONSTRAINT = 19;
  (*** Data type mismatch. *)
  SQLITE_MISMATCH   = 20;

  (*** sqlite_step() has another row ready *)
  SQLITE_ROW        = 100;
  (*** sqlite_step() has finished executing *)
  SQLITE_DONE       = 101;


  (*** @abstract(Name of DLL with engine)
   You have to put it in the search path.*)
  {$IFDEF WIN32}
     SQLITEDLL: PChar  = 'sqlite.dll';
  {$ELSE}
     SQLITEDLL: PChar  = 'libsqlite.so';
  {$ENDIF}

  (*** used for registration components in IDE. *)
  COMPONENT_TAB_NAME = 'Data Access';   

  { types of functions and aggregations }
  (*** Numeric result of user function *)
  SQLITE_NUMERIC     = -1;
  (*** Text result of user function *)
  SQLITE_TEXT        = -2;

type
  (*** @abstract(Exception class)
  All exceptions of SQLite are called with this class.
  *)
  ESQLiteError = Exception;

  (*** for D5 copatibility *)
  PPChar = ^PChar;
  (*** for D5 copatibility *)
  TPCharArray = array [0 .. MaxInt div 16 - 1] of PChar;
  (*** for D5 copatibility *)
  PPCharArray = ^TPCharArray;

  {string contants}
const
  CRLF = #13 + #10;
  CR   = #13;
  LF   = #10;
  TAB  = #9;
  NULL_TERMINATOR = #0;

const
  LOOKUP_OPTIONS: TLocateOptions = [loCaseInsensitive];
  
{$IFDEF COUNT_DATA_ALLOC}
var
  __Alloc_count: Integer;
  __Realloc_count: Integer;
{$ENDIF}

implementation

initialization

{$IFDEF COUNT_DATA_ALLOC}
  __Alloc_count := 0;
  __Realloc_count := 0;
{$ENDIF}

finalization

{$IFDEF COUNT_DATA_ALLOC}
  if __Alloc_count <> 0 then
    raise ESQLiteError.Create ('Memory allocation error :' + IntToStr (__Alloc_count));
// here - realloc count can be used.
//  __Realloc_count := 0;
{$ENDIF}

end { SLTypes }.
