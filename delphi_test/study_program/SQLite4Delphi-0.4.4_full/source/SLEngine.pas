(***
  @abstract(The @name - lowest level of SQLite components)
  @author(Michal Zaborowski <michal.zaborowski@wp.pl>)
*)

unit SLEngine;

interface

{$I SLDefs.inc}

uses
// 2003.10.25 Paul - For compatibility with Kylix 1
  SysUtils,
  {$IFDEF WIN32} Windows, {$ELSE} Libc, {$ENDIF}
  Classes, Contnrs, DB,

  SLTypes;

type
  (*** @abstract(Exception class)
  All exceptions of SQLite are called with this class.
  *)
  TSLEngine = class;

  (*** @abstract(event for logging API calls). *)
  TLogEvent = procedure(anEngine: TSLEngine; const aText: String) of object;

  (*** event for on busy calling.*)
  TOnBusy = procedure (Sender: TObject;
                       ObjectName: String;
                       BusyCount: Integer;
                   var Cancel: Boolean) of object;

  (*** @abstract(engine representation).
       SQLite API + databeses management. It is possible to have more then one
       engine at a time. Application can for example use databases with different
       page sizes. *)
  TSLEngine = class
  private
    FLibName:   PChar;
    FLibHandle: THandle;

    FDBList: TObjectList;

    FOnLog: TLogEvent;

    { DLL funs. }
    FSQLite_Open: function (DBName: PChar;
                            Mode: Integer;
                            var ErrMsg: PChar): Pointer; cdecl;
    FSQLite_Close: procedure (DB: Pointer); cdecl;
    FSQLite_Exec: function (DB: Pointer;
                            SQLStatement: PChar;
                            CallbackPtr: Pointer;
                            Sender: TObject;
                            var ErrMsg: PChar): Integer; cdecl;
    FSQLite_Version: function (): PChar; cdecl;
    FSQLite_Encoding: function (): PChar; cdecl;
    FSQLite_ErrorString: function (ErrNo: Integer): PChar; cdecl;
    FSQLite_GetTable: function (DB: Pointer;
                                SQLStatement: PChar;
                                var ResultPtr: Pointer;
                                var RowCount: Cardinal;
                                var ColCount: Cardinal;
                                var ErrMsg: PChar): Integer; cdecl;
    FSQLite_FreeTable: procedure (Table: PPChar); cdecl;
    FSQLite_FreeMem: procedure (P: PChar); cdecl;
    FSQLite_Complete: function (P: PChar): Boolean; cdecl;
    FSQLite_LastInsertRow: function (DB: Pointer): Integer; cdecl;
    FSQLite_Cancel: procedure (DB: Pointer); cdecl;
    FSQLite_BusyHandler: procedure (DB: Pointer;
                                    CallbackPtr: Pointer;
                                    Sender: TObject); cdecl;
    FSQLite_BusyTimeOut: procedure (DB: Pointer;
                                    TimeOut: Integer); cdecl;
    FSQLite_Changes: function (DB: Pointer): Integer; cdecl;

    FSQLite_Compile: function (DB: Pointer;
                               SQLStatement: PChar;
                               var Tail: PChar;
                               var SQLite_VM: Integer;
                               var ErrMsg: PChar): Integer; cdecl;
    FSQLite_Step: function (SQLite_VM: Integer;
                            var ColCount: Cardinal;
                            var ValuePtr: Pointer;
                            var ColsPtr: Pointer): Integer; cdecl;
    FSQLite_Finalize: function (SQLite_VM: Integer;
                                var ErrMsg: PChar): Integer; cdecl;

    FSQLite_CreateFunction: function (DB: Pointer;
                                      const Name: PChar;
                                      nArg: Integer;
                                      xFunc: Pointer;
                                      pUserData: Pointer): Integer; cdecl;
    FSQLite_CreateAggregate: function (DB: Pointer;
                                       const Name: PChar;
                                       nArg: Integer;
                                       xStep: Pointer;
                                       xFinalize: Pointer;
                                       pUserData: Pointer): Integer; cdecl;

    FSQLite_SetResultString: function (Func: Pointer;
                                       const pRes: PChar;
                                       Len: Integer): PChar; cdecl; ///???
    FSQLite_SetResultInt: procedure (Func: Pointer;
                                     Res: Integer); cdecl; ///???
    FSQLite_SetResultDouble: procedure (Func: Pointer;
                                        Res: Double); cdecl;
    FSQLite_SetResultError: procedure (Func: Pointer;
                                       const pRes: PChar;
                                       Len: Integer); cdecl; ///???
    FSQLite_UserData: function (Func: Pointer): Pointer; cdecl;
    FSQLite_AggregateContext: function (Func: Pointer;
                                        nBytes: Integer): Pointer; cdecl;
    FSQLite_AggregateCount: function (Func: Pointer): Pointer; cdecl;

    FSQLite_FunctionType: function  (DB: Pointer; const Name: PChar;
                                     DataType: Integer): Integer; cdecl;

(* not implemented part of DLL interface
sqlite_interrupt
sqlite_mprintf
sqlite_vmprintf
sqlite_exec_printf
sqlite_exec_vprintf
sqlite_get_table_printf
sqlite_get_table_vprintf

sqliteMalloc -- allocation
sqliteFree
sqliteRealloc

sqlite_set_authorizer
sqlite_trace
*)

    (*** Claers function pointers. *)
    procedure ClearPtrs;
    (*** Loads library from file defined by FLibName property. *)
    function  LoadLib: Boolean;

  public
    { API interface - now public, becouse classes are splitted }
    function  SQLite_Open (aDBName: String;
                           aMode: Integer;
                           var anErrMsg: String): Pointer;
    procedure SQLite_Close (aDB: TObject);
    function  SQLite_Exec (anObj: TObject;
                           aSQLStatement: String;
                           var anErrMsg: String;
                           aCallbackPtr: Pointer): Integer;
    function  SQLite_GetTable (aDB: TObject;
                               aSQLStatement: String;
                               var aResultPtr: Pointer;
                               var aRowCount: Cardinal;
                               var aColCount: Cardinal;
                               var anErrMsg: String): Integer;
    procedure SQLite_FreeTable (Table: Pointer);
    procedure SQLite_FreeMem (P: PChar);
    (*** http://www.sqlite.org/c_interface.html 3.5 - testing if SQL is
         complite query string. *)
    function  SQLite_Complete (P: PChar): boolean;
    function  SQLite_LastInsertRow (aDB: TObject): integer;
    procedure SQLite_Cancel (aDB: TObject);
    procedure SQLite_BusyHandler (aDB: TObject);
    procedure SQLite_BusyTimeout (aDB: TObject; const aTimeOut: Integer);
    function  SQLite_Changes (aDB: TObject): Integer;

    function  SQLite_Compile (aDB: TObject;
                              const aSQLStatement: String;
                              var aTail: String;
                              var aSQLite_VM: Integer;
                              var anErrMsg: String): Integer; cdecl;
    function  SQLite_Step (aSQLite_VM: Integer;
                           var aColCount: Cardinal;
                           var aValuePtr: Pointer;
                           var aColsPtr: Pointer): Integer; cdecl;
    function  SQLite_Finalize (aSQLite_VM: Integer;
                               var anErrMsg: String): Integer; cdecl;

    function  SQLite_CreateFunction (DB: Pointer;
                                     const Name: PChar;
                                     nArg: Integer;
                                     xFunc: Pointer;
                                     pUserData: Pointer): Integer;
    function  SQLite_CreateAggregate (DB: Pointer;
                                      const Name: PChar;
                                      nArg: Integer;
                                      xStep: Pointer;
                                      xFinalize: Pointer;
                                      pUserData: Pointer): Integer;

    function  SQLite_SetResultString (Func: Pointer;
                                      const pRes: PChar;
                                      Len: Integer): PChar; ///???
    procedure SQLite_SetResultInt (Func: Pointer; Res: Integer); ///???
    procedure SQLite_SetResultDouble (Func: Pointer; Res: Double);
    procedure SQLite_SetResultError (Func: Pointer;
                                     const pRes: PChar;
                                     Len: Integer); ///???
    function  SQLite_UserData (Func: Pointer): Pointer;
    function  SQLite_AggregateContext (Func: Pointer; nBytes: Integer): Pointer;
    function  SQLite_AggregateCount (Func: Pointer): Pointer;
    function  SQLite_FunctionType  (DB: Pointer; const Name: PChar;
                                    DataType: Integer): Integer;

    (*** Adding database to FDBList. *)
    function  RegisterDB (aDB: TObject): Boolean;
  protected
    (*** Calling log event for the text. *)
    procedure DoLog (const aText: String);
  public
    constructor Create (aConnect: Boolean = True; const aLibName: String = '');
    destructor  Destroy; override;

    { API interface }
    (*** http://www.sqlite.org/c_interface.html 3.6 library version. *)
    function  Version: String;
    (*** http://www.sqlite.org/c_interface.html 3.7 encoding used by engine. *)
    function  Encoding: String;
    (*** Converts error number to string*)
    function  ErrorString (const anErrNo: Integer): String;

    (*** Number of databases. *)
    function  GetDBCount: Integer;
    (*** Database defined by specified index. *)
    function  GetDB (const anIndex: Integer): TObject;

    (*** For every call of engine application can log. *)
    property OnLog: TLogEvent
      read FOnLog write FOnLog;
  end; { TSLEngine }

var
(*** Default engine. Created and started in <i>initialization</i> section
     (terminated in <i>finalization</i>).*)
  __Engine: TSLEngine;

implementation

uses
  SLDB,
  SLDataSet;

(*******************************************************************************
            TSLEngine
 ******************************************************************************)

constructor TSLEngine.Create (aConnect: Boolean = True;
                              const aLibName: String = '');
begin
  if aLibName = '' then
    FLibName := SQLITEDLL
  else
    FLibName := PChar (aLibName);

  FDBList := TObjectList.Create (False);

  if aConnect then
    if not LoadLib then begin
      ClearPtrs;

      raise ESQLiteError.Create ('Unable to locate library: ' + FLibName);
    end; {if}
end; (**)

destructor TSLEngine.Destroy;
begin
  if (FLibHandle <> 0) then begin
    ClearPtrs;

    FreeLibrary (FLibHandle);
  end; {if}

  FDBList.Free;

  inherited;
end; (**)

{ DBs }

function TSLEngine.RegisterDB (aDB: TObject): Boolean;
var
  pIdx: Integer;
begin
  pIdx := FDBList.IndexOf (aDB);
  if (pIdx >= 0) then
    raise ESQLiteError.Create ('DB registered.');

  FDBList.Add (aDB);

  Result := True;
end; (**)

function TSLEngine.GetDBCount: Integer;
begin
  REsult := FDBList.Count;
end; (**)

function TSLEngine.GetDB (const anIndex: Integer): TObject;
begin
  Result := FDBList.Items [anIndex] as TObject;
end; (**)

{Log}

procedure TSLEngine.DoLog (const aText: String);
begin
  if assigned (FOnLog) then
    FOnLog (Self, aText);
end; (**)

{DLL}

procedure TSLEngine.ClearPtrs;
begin
  try
    FSQLite_Open          := nil;
    FSQLite_Close         := nil;
    FSQLite_Exec          := nil;
    FSQLite_Version       := nil;
    FSQLite_Encoding      := nil;
    FSQLite_ErrorString   := nil;
    FSQLite_GetTable      := nil;
    FSQLite_FreeTable     := nil;
    FSQLite_FreeMem       := nil;
    FSQLite_Complete      := nil;
    FSQLite_LastInsertRow := nil;
    FSQLite_Cancel        := nil;
    FSQLite_BusyTimeout   := nil;
    FSQLite_BusyHandler   := nil;
    FSQLite_Changes       := nil;

    FSQLite_CreateFunction   := nil;
    FSQLite_CreateAggregate  := nil;
    FSQLite_SetResultString  := nil;
    FSQLite_SetResultInt     := nil;
    FSQLite_SetResultDouble  := nil;
    FSQLite_SetResultError   := nil;
    FSQLite_UserData         := nil;
    FSQLite_AggregateContext := nil;
    FSQLite_AggregateCount   := nil;
    FSQLite_FunctionType     := nil;
  except
  end; {try/except}
end; (**)

function TSLEngine.LoadLib: Boolean;
begin
  FLibHandle := LoadLibrary (FLibName);
  if FLibHandle = 0 then begin
    Result := False;

    exit;
  end; {if}

  try
    FSQLite_Open          := GetProcAddress (FLibHandle, 'sqlite_open');
    FSQLite_Close         := GetProcAddress (FLibHandle, 'sqlite_close');
    FSQLite_Exec          := GetProcAddress (FLibHandle, 'sqlite_exec');
    FSQLite_Version       := GetProcAddress (FLibHandle, 'sqlite_libversion');
    FSQLite_Encoding      := GetProcAddress (FLibHandle, 'sqlite_libencoding');
    FSQLite_ErrorString   := GetProcAddress (FLibHandle, 'sqlite_error_string');
    FSQLite_GetTable      := GetProcAddress (FLibHandle, 'sqlite_get_table');
    FSQLite_FreeTable     := GetProcAddress (FLibHandle, 'sqlite_free_table');
    FSQLite_FreeMem       := GetProcAddress (FLibHandle, 'sqlite_freemem');
    FSQLite_Complete      := GetProcAddress (FLibHandle, 'sqlite_complete');
    FSQLite_LastInsertRow := GetProcAddress (FLibHandle, 'sqlite_last_insert_rowid');
    FSQLite_Cancel        := GetProcAddress (FLibHandle, 'sqlite_interrupt');
    FSQLite_BusyTimeout   := GetProcAddress (FLibHandle, 'sqlite_busy_timeout');
    FSQLite_BusyHandler   := GetProcAddress (FLibHandle, 'sqlite_busy_handler');
    FSQLite_Changes       := GetProcAddress (FLibHandle, 'sqlite_changes');

    FSQLite_Compile       := GetProcAddress (FLibHandle, 'sqlite_compile');
    FSQLite_Step          := GetProcAddress (FLibHandle, 'sqlite_step');
    FSQLite_Finalize      := GetProcAddress (FLibHandle, 'sqlite_finalize');

    FSQLite_CreateFunction   := GetProcAddress (FLibHandle, 'sqlite_create_function');
    FSQLite_CreateAggregate  := GetProcAddress (FLibHandle, 'sqlite_create_aggregate');
    FSQLite_SetResultString  := GetProcAddress (FLibHandle, 'sqlite_set_result_string');
    FSQLite_SetResultInt     := GetProcAddress (FLibHandle, 'sqlite_set_result_int');
    FSQLite_SetResultDouble  := GetProcAddress (FLibHandle, 'sqlite_set_result_double');
    FSQLite_SetResultError   := GetProcAddress (FLibHandle, 'sqlite_set_result_error');
    FSQLite_UserData         := GetProcAddress (FLibHandle, 'sqlite_user_data');
    FSQLite_AggregateContext := GetProcAddress (FLibHandle, 'sqlite_aggregate_context');
    FSQLite_AggregateCount   := GetProcAddress (FLibHandle, 'sqlite_aggregate_count');
    FSQLite_AggregateCount   := GetProcAddress (FLibHandle, 'sqlite_aggregate_count');
    FSQLite_FunctionType     := GetProcAddress (FLibHandle, 'sqlite_function_type');

    Result := True;
  except
    ClearPtrs;

    Result := False;
  end; {try/except}
end;

function  TSLEngine.Version: String;
begin
  if not assigned (FSQLite_Version) then
    raise ESQLiteError.Create ('Not Connected');

  Result := PChar (FSQLite_Version);
end; (**)

function  TSLEngine.Encoding: String;
begin
  if not assigned (FSQLite_Encoding) then
    raise ESQLiteError.Create ('Not Connected');

  Result := PChar (FSQLite_Encoding);
end; (**)

function TSLEngine.ErrorString (const anErrNo: Integer): String;
begin
  if not assigned (FSQLite_ErrorString) then
    raise ESQLiteError.Create ('Not Connected');

  Result := PChar (FSQLite_ErrorString (anErrNO));
end; (**)

function  TSLEngine.SQLite_Open (aDBName: String;
                                 aMode: Integer;
                                 var anErrMsg: String): Pointer;
var
  pErrMsg: PChar;
begin
  if not assigned (FSQLite_Open) then
    raise ESQLiteError.Create ('Not Connected');

  Result   := FSQLite_Open (PChar (aDBName), aMode, pErrMsg);

  anErrMsg := pErrMsg;
  FSQLite_FreeMem (pErrMsg);
end; (**)

procedure TSLEngine.SQLite_Close (aDB: TObject);
begin
  if not assigned (aDB) then
    exit;

  if not assigned (FSQLite_Close) then
    raise ESQLiteError.Create ('Not Connected');

  FSQLite_Close ((aDB as TSLDatabase).Handle);
end; (**)

function  TSLEngine.SQLite_Exec (anObj: TObject;
                                 aSQLStatement: String;
                                 var anErrMsg: String;
                                 aCallbackPtr: Pointer): Integer;
var
  pErrMsg: PChar;

  pDB:    TSLDatabase;
  pDtSet: TSLDataSet;
begin
  if not assigned (anObj) then
    raise ESQLiteError.Create ('Unknown object');

  if not assigned (FSQLite_Exec) then
    raise ESQLiteError.Create ('Not connected');

  if not assigned (aCallbackPtr) then
    raise ESQLiteError.Create ('Callback not defined');

  if anObj is TSLDataSet then begin
    pDtSet := anObj as TSLDataSet;

    if not assigned (pDtSet.Database) then
      raise ESQLiteError.Create ('Not connected');

    DoLog ('! SQLite_Exec'#9 + pDtSet.Database.Name +
           '<' + pDtSet.Database.DBName + '>'#9 +
           pDtSet.Name  + CRLF + aSQLStatement);

    Result := FSQLite_Exec (pDtSet.Database.Handle, PChar (aSQLStatement),
                            aCallbackPtr, pDtSet, pErrMsg);

    DoLog ('  res:'#9 + IntToStr (Result));
  end {if}
  else if anObj is TSLDatabase then begin
    pDB := anObj as TSLDatabase;

    DoLog ('! SQLite_Exec'#9 + pDB.Name +
           '<' + pDB.DBName + '>'#9 +
           'internal' + CRLF + aSQLStatement);

    Result := FSQLite_Exec (pDB.Handle, PChar (aSQLStatement),
                            aCallbackPtr, pDB, pErrMsg);

    DoLog ('  res:'#9 + IntToStr (Result));
  end
  else
    raise ESQLiteError.Create ('Unknown object type');

  anErrMsg := pErrMsg;
  FSQLite_FreeMem (pErrMsg);
end; (**)

function  TSLEngine.SQLite_GetTable (aDB: TObject;
                                     aSQLStatement: String;
                                     var aResultPtr: Pointer;
                                     var aRowCount: Cardinal;
                                     var aColCount: Cardinal;
                                     var anErrMsg: String): Integer;
var
  pErrMsg: PChar;
begin
  Result := 0;

  if not assigned (aDB) then
    exit;

  if not assigned (FSQLite_GetTable) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_GetTable ((aDB as TSLDatabase).Handle,
                              PChar (aSQLStatement), Pointer (aResultPtr),
                              aRowCount, aColCount, pErrMsg);

  anErrMsg := pErrMsg;
  FSQLite_FreeMem (pErrMsg);
end; (**)

procedure TSLEngine.SQLite_FreeTable (Table: Pointer);
begin
  if not assigned (FSQLite_FreeTable) then
    raise ESQLiteError.Create ('Not Connected');

  FSQLite_FreeTable (Table);
end; (**)

procedure TSLEngine.SQLite_FreeMem (P: PChar);
begin
  if not assigned (FSQLite_FreeMem) then
    raise ESQLiteError.Create ('Not Connected');

  FSQLite_FreeMem (P);
end; (**)

function  TSLEngine.SQLite_Complete (P: PChar): Boolean;
begin
  if not assigned (FSQLite_Complete) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_Complete (P);
end; (**)

function  TSLEngine.SQLite_LastInsertRow (aDB: TObject): Integer;
begin
  if not assigned (FSQLite_LastInsertRow) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_LastInsertRow ((aDB as TSLDatabase).Handle);
end; (**)

procedure TSLEngine.SQLite_Cancel (aDB: TObject);
begin
  if not assigned (FSQLite_Cancel) then
    raise ESQLiteError.Create ('Not Connected');

  FSQLite_Cancel ((aDB as TSLDatabase).Handle);
end; (**)

function BusyCallback (Sender: TObject;
                       anObjectName: PChar;
                       aBusyCount: integer): integer; cdecl;
{var
  pObjName: String;
  pCancel:  Boolean; }
begin
  Result := -1;
  // 2003.10.13 MZa - something shoud be done here ;) OnBusy is defined for DB,
  // maybe BusyCallback shoud be moved to SLDB unit?
{  with (Sender as TSLDatabase) do
    if assigned (OnBusy) then begin
      pObjName := anObjectName;

      FOnBusy (Sender, pObjName, aBusyCount, pCancel);
      Result := Integer (pCancel);
    end; {if}
end;

procedure TSLEngine.SQLite_BusyHandler (aDB: TObject);
begin
  if not assigned (FSQLite_BusyHandler) then
    raise ESQLiteError.Create ('Not Connected');

  if (aDB as TSLDatabase).SLDBOptions.BusyTimeOut > 0 then
    FSQLite_BusyHandler ((aDB as TSLDatabase).Handle, @BusyCallback, aDB)
  else
    FSQLite_BusyHandler ((aDB as TSLDatabase).Handle, nil, nil);
end; (**)

procedure TSLEngine.SQLite_BusyTimeout (aDB: TObject;
                                        const aTimeOut: Integer);
begin
  if not assigned (FSQLite_BusyTimeout) then
    raise ESQLiteError.Create ('Not Connected');

  FSQLite_BusyTimeout ((aDB as TSLDatabase).Handle, aTimeOut);
end; (**)

function  TSLEngine.SQLite_Changes (aDB: TObject): Integer;
begin
  if not assigned (FSQLite_Changes) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_Changes ((aDB as TSLDatabase).Handle);
end; (**)

function TSLEngine.SQLite_Compile (aDB: TObject;
                                   const aSQLStatement: String;
                                   var aTail: String;
                                   var aSQLite_VM: Integer;
                                   var anErrMsg: String): Integer;
var
  pTail: PChar;
  pErrMsg: PChar;
begin
  if not assigned (FSQLite_Compile) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_Compile ((aDB as TSLDatabase).Handle,
                             PChar (aSQLStatement),
                             pTail, aSQLite_VM, pErrMsg);

  aTail := pTail;
  anErrMsg := pErrMsg;
  FSQLite_FreeMem (pErrMsg);
end; (**)

function TSLEngine.SQLite_Step (aSQLite_VM: Integer;
                                var aColCount: Cardinal;
                                var aValuePtr: Pointer;
                                var aColsPtr: Pointer): Integer; cdecl;
begin
  if not assigned (FSQLite_Step) then
    raise ESQLiteError.Create ('Not Connected');

 Result := FSQLite_Step (aSQLite_VM, aColCount, aValuePtr, aColsPtr);
end; (**)

function TSLEngine.SQLite_Finalize (aSQLite_VM: Integer;
                                    var anErrMsg: String): Integer; cdecl;
var
  pErrMsg: PChar;
begin
  if not assigned (FSQLite_Finalize) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_Finalize (aSQLite_VM, pErrMsg);

  anErrMsg := pErrMsg;
  FSQLite_FreeMem (pErrMsg);
end; (**)

function TSLEngine.SQLite_CreateFunction (DB: Pointer; const Name: PChar;
                                 nArg: Integer;
                                 xFunc: Pointer; pUserData: Pointer): Integer;
begin
  if not assigned (FSQLite_CreateFunction) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_CreateFunction (DB, Name, nArg, xFunc, pUserData);
end; (**)

function TSLEngine.SQLite_CreateAggregate (DB: Pointer; const Name: PChar;
                                  nArg: Integer;
                                  xStep: Pointer; xFinalize: Pointer;
                                  pUserData: Pointer): Integer;
begin
  if not assigned (FSQLite_CreateAggregate) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_CreateAggregate (DB, Name, nArg, xStep, xFinalize, pUserData);
end; (**)

function TSLEngine.SQLite_SetResultString (Func: Pointer;
                              const pRes: PChar; Len: Integer): PChar; ///???
begin
  if not assigned (FSQLite_SetResultString) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_SetResultString (Func, pRes, Len);
end; (**)

procedure TSLEngine.SQLite_SetResultInt (Func: Pointer; Res: Integer); ///???
begin
  if not assigned (FSQLite_SetResultInt) then
    raise ESQLiteError.Create ('Not Connected');

  FSQLite_SetResultInt (Func, Res);
end; (**)

procedure TSLEngine.SQLite_SetResultDouble (Func: Pointer; Res: Double);
begin
  if not assigned (FSQLite_SetResultDouble) then
    raise ESQLiteError.Create ('Not Connected');

  FSQLite_SetResultDouble (Func, Res);
end; (**)

procedure TSLEngine.SQLite_SetResultError (Func: Pointer;
                              const pRes: PChar; Len: Integer); ///???
begin
  if not assigned (FSQLite_SetResultError) then
    raise ESQLiteError.Create ('Not Connected');

  FSQLite_SetResultError (Func, pRes, Len);
end; (**)

function TSLEngine.SQLite_UserData (Func: Pointer): Pointer;
begin
  if not assigned (FSQLite_UserData) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_UserData (Func);
end; (**)

function TSLEngine.SQLite_AggregateContext (Func: Pointer; nBytes: Integer): Pointer;
begin
  if not assigned (FSQLite_AggregateContext) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_AggregateContext (Func, nBytes);
end; (**)

function TSLEngine.SQLite_AggregateCount (Func: Pointer): Pointer;
begin
  if not assigned (FSQLite_AggregateCount) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_AggregateCount (Func);
end; (**)

function TSLEngine.SQLite_FunctionType  (DB: Pointer; const Name: PChar;
                                          DataType: Integer): Integer;
begin
  if not assigned (FSQLite_FunctionType) then
    raise ESQLiteError.Create ('Not Connected');

  Result := FSQLite_FunctionType (DB, Name, DataType);
end; (**)

initialization
  __Engine := TSLEngine.Create;

finalization
  __Engine.Free;

end { SLEngine }.
