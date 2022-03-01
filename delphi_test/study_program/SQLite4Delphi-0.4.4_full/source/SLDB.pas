(***
  @abstract(The @name  - DB components for SQLite)
  @author(Michal Zaborowski <michal.zaborowski@wp.pl>)
  @author(Paul DIAS GONCALVES <padigon@altern.org>)  *)

unit SLDB;

interface

{$I SLDefs.inc}

uses
// 2003.10.25 Paul - For compatibility with Kylix 1
  SysUtils,
  {$IFDEF WIN32} Windows, {$ELSE} Libc, {$ENDIF}
  Classes, Contnrs, DB,

  SLTypes,
  SLEngine;

type
  (*** @abstract(options for @link(TSLDatabase).) *)
  TSLDBOptions = record
    (*** if not in tranaction then start it any way. *)
    ForceTransaction: Boolean;
    (*** on closeing database commit is called. *)
    CommitOnExit: Boolean;
    (*** OpenMode for fileOpen function. *)
    Mode:   Integer;
    (*** Busy is not implemented yet.*)
    BusyTimeOut: Integer;
  end; {TSLDBOptions}

{ Yes, it can be quered every time - but it's nice to cache some info.
  Idea:
  There are 3 lists of pointers - tables', indices', dbs' infos. On request
the method is checking propper list for data - if not found then query SQLite
engine. Every list is freeing only it's own pointers. If table has named index
only one representation is cept - table's info keeps only reference. }

// sqlite_master
// sqlite_temp_master

  (*** @abstract(information about every field of table -  @link(TTblInfo).) *)
  TTblField = class
  private
    FCId:       Integer;
    FFieldName: String;
    FTyp:       String;
    FNotNull:   Boolean;
    FDfltValue: String;
  public
    (*** Column id *)
    property CId: Integer
      read FCId;
    (*** Field's name *)
    property FieldName: String
      read FFieldName;
    (*** Field's type *)
    property Typ: String
      read FTyp;
    (*** Not null information. *)
    property NotNull: Boolean
      read FNotNull;
    (*** Default value for field. *)
    property DfltValue: String
      read FDfltValue;
  end; { TTblField }

  (*** @abstract(information about every field of index -  @link(TIdxInfo).)
  *)
  TIdxField = class
  private
    FSeqNo:     Integer;
    FCId:       Integer;
    FFieldName: String;
  public
    (*** Unique value. *)
    property SeqNo: Integer
      read FSeqNo;
    (*** Column id. *)
    property CId: Integer
      read FCId;
    (*** Field name. *)
    property FieldName: String
      read FFieldName;
  end; { TIdxField }

  (*** @abstract(index information - see @link(TSLDatabase).)
  *)
  TIdxInfo = class
  private
    FSeq:     Integer;
    FIdxName: String;
    FUnique:  Boolean;

    FFldList: TObjectList;

    function GetFieldCount: Integer;
    function GetField (const Idx: Integer): TIdxField;
  public
    constructor Create;
    destructor  Destroy; override;

    (*** Index name. *)
    property IdxName: String
      read FIdxName;
    (*** Determine if the index is temporoary. *)
    property Unique: Boolean
      read FUnique;
    (*** Number of fields in index. *)
    property FieldCount: Integer
      read GetFieldCount;
    (*** Fields property, access to selected @link(TIdxField) information. *)
    property Field [const Idx: Integer]: TIdxField
      read GetField;
  end; { TIdxInfo }

  (*** @abstract(table information.)
    Use: <br>
     @link(TSLDatabase.TableCount) to get number of tables. <br>
     @link(TSLDatabase.Table) to get a table from defined by index.
  *)
  TTblInfo = class
  private
    FTblName: String;
    FIdName:  String; // org. name
    FTyp:     String; // org. type
    FRootPage: Integer;
    FSQL:     String;

    FFldList: TObjectList;
    FIdxList: TObjectList;

    function GetFieldCount: Integer;
    function GetField (const Idx: Integer): TTblField;

    function GetIndexCount: Integer;
    function GetIndex (const Idx: Integer): TIdxInfo;
  public
    constructor Create;
    destructor  Destroy; override;

    (** Preparing select to retrive default values from db*)
    function  GetDefaultsSQL (aStrs: TStringList): String;
    function  GetIndexInfo (const anIdxName: String): TIdxInfo;

    (*** Type, can be table or view. *)
    property Typ: String
      read FTyp;
    (*** Table identifier, mostly the same as TblName. *)
    property IdName: String
      read FIdName;
    (*** Table name. *)
    property TblName: String
      read FTblName;
    (*** First page in file with data of the table. *)
    property RootPage: Integer
      read FRootPage;
    (*** SQL string (DDL) that was used to create table. *)
    property SQL: String
      read FSQL;

    (*** Number of fields. *)
    property FieldCount: Integer
      read GetFieldCount;
    (*** Access to field defined by it's position.
         See also @link(TTblField). *)
    property Field [const Idx: Integer]: TTblField
      read GetField;

    (*** Number of indices. *)
    property IndexCount: Integer
      read GetIndexCount;
    (*** Access to index defined by it's position.
         See also @link(TIdxInfo). *)
    property Index [const Idx: Integer]: TIdxInfo
      read GetIndex;
  end; { TTblInfo }

  (*** @abstract(information about attached databases.)*)
  TDBInfo = class
  private
    FSeq:  Integer;
    FDBName: String;
    FFileName: String;
  public
    (*** Unique index. *)
    property Seq:  Integer
      read FSeq;
    (*** Database name. *)
    property DBName: String
      read FDBName;
    (*** File name. *)
    property FileName: String
      read FFileName;
  end; { TDBInfo }

  (*** @abstract(callback flag.)
  Callback is a function called by the engine - this flag
  determines what operation is pendning:
  *)
  TCBDBFlag = (
    (*** default, just to allow "empty" value. *)
    cbfUnknown,
    (*** list of databases. *)
    cbfDBList,
    (*** table list. *)
    cbfTblList,
    (*** list of indices.*)
    cbfIdxList,
    (*** internal data - not used. *)
    cbfInternal );

  (*** @abstract(database component.)
  *)
  TSLDatabase = class (TComponent)
  private
    FEngine: TSLEngine;

    FLoadedActivate: Boolean;

    FDBName: TFileName;
    FSLDBOptions: TSLDBOptions;

    FHandle:  Pointer;
    FInTrans: Boolean;

    FDtSetList: TObjectList;

    // cache...
    FDBList:  TObjectList;
    FTblList: TObjectList;
    FIxdList: TObjectList;
    FFunList: TObjectList;

    { events' data }
//    FOnBusy: TOnBusy;

    function ReciveTblList: Integer;
    function ReciveTblFields (const aTblNo: Integer): Integer;
    function ReciveIdxList   (const aTblNo: Integer): Integer;
    function ReciveIdxFields (const aTblNo: Integer;
                              const anIdxNo: Integer): Integer;

{$IFNDEF SINGLE_ENGINE}
    procedure SetEngine (const aValue: TSLEngine);
{$ENDIF}
    procedure SetSLDBOptions (const aValue: TSLDBOptions);
    procedure SetDBName (const aValue: TFileName);
    function  GetActive: Boolean;
    procedure SetActive (const aValue: Boolean);
  protected
    procedure Loaded; override;

    procedure InitializeDB;
    procedure InitializeFun (aFun: TObject = nil);

    function  DoGetDBList (aStrs: TStrings): Boolean;
    function  GetDBListCount: Integer;
    function  GetDBListItem (const anIdx: Integer): TDBInfo;

    function  DoGetTable (aStrs: TStrings): Boolean;
    function  GetTableCount: Integer;
    function  GetTableItem (const anIdx: Integer): TTblInfo;

    function  GetFunCount: Integer;
    function  GetFunItem (const anIdx: Integer): TObject;
  public
    constructor Create (AOwner: TComponent); override;
    destructor  Destroy; override;

    (*** opening database connection. *)
    procedure Open;
    (*** closing database connection. *)
    procedure Close;

    (*** closing all datasets connected to the database *)
    procedure CloseDataSets;

    (*** refreshing cached information about attached databases (SQLite files).*)
    procedure RefreshDBList;
    (*** info of a database (SQLite file) defined by name. See also
         @link(TDBInfo). *)
    function  GetDBInfo (const aDbName: String): TDBInfo;

    (*** refreshing cached information about tables/views structure. *)
    procedure RefreshTblList;
    (*** info of a table defined by name. See also @link(TTblInfo). *)
    function  GetTblInfo (const aTblName: String): TTblInfo;

    (*** list of indices for table specified by name. *)
    function GetIndexList (const aTblName: String; aStrs: TStrings): Boolean;
    (*** info of index specified by name. See also @link(TIdxInfo). *)
    function GetIndexInfo (const aTblName: String;
                           const anIdxName: String): TIdxInfo;

    (*** query engine with Exec function (callback)*)
    function  ExecSQL  (anObj: TObject; const aSQL: String;
                        aForceTrans: Boolean; var anErrMsg: String): Integer;
    (*** query engine with GetTable API function (all data at once)*)
    function  GetTable (const aSQL: String;
                        var aResult: Pointer;
                        var aRecCount: Cardinal; var aColCount: Cardinal;
                        var anErrMsg: String): Integer;
    procedure FreeTable (aPtr: Pointer);

    function  OpenVM (const aSQL: String;
                      var aTail: String;
                      var aSQLite_VM: Integer;
                      var anErrMsg: String): Integer;

    function  CloseVM (var aSQLite_VM: Integer;
                       var anErrMsg: String): Integer;

    function  VMStep  (const aSQLite_VM: Integer;
                       var aColCount: Cardinal;
                       var aValuePtr: Pointer;
                       var aColsPtr: Pointer): Integer;

    function  LastInsertRow: Integer;

    procedure RegisterDataSet (aDtSet: TObject);
    procedure RegisterFunction (aFun: TObject);
    procedure RegisterAggregate (aFunObject: TObject);

    (*** Starting transaction. *)
    procedure BeginTransaction;
    (*** Commiting transaction. *)
    procedure Commit;
    (*** Cancelling (rooling back) transaction. *)
    procedure Rollback;

    (*** Handle to SQLite object *)
    property Handle: Pointer
      read FHandle;

    (*** Determinig if database is in transaction. *)
    property InTransaction: Boolean
      read FInTrans;

    (*** Number of databases (SQLite files) being attached. *)
    property DBListCount: Integer
      read GetDBListCount;
    (*** Information about attached database (SQLite file). See also
         @link(TDBInfo). *)
    property DBList [const Idx: Integer]: TDBInfo
      read GetDBListItem;

    (*** Number of tables/views. *)
    property TableCount: Integer
      read GetTableCount;
    (*** Table or view selected by it's numver. See also @link(TTblInfo). *)
    property Table [const Idx: Integer]: TTblInfo
      read GetTableItem;

    property FunCount: Integer
      read GetFunCount;
    property Fun [const Idx: Integer]: TObject
      read GetFunItem;

{$IFDEF SINGLE_ENGINE}
    (*** Engine object. *)
    property Engine: TSLEngine
      read FEngine;
{$ENDIF}
  published
{$IFNDEF SINGLE_ENGINE}
    (*** Engine object. *)
    property Engine: TSLEngine
      read FEngine write SetEngine;
{$ENDIF}
    (*** Determine if database is connected. *)
    property Active: Boolean
      read GetActive write SetActive;
    (*** Name of file with main database. *)
    property DBName: TFileName
      read FDBName write SetDBName;
    (*** Options speciffied for database. See also @link(TSLDBOptions). *)
    property SLDBOptions: TSLDBOptions
      read FSLDBOptions write SetSLDBOptions;
  end; {TSLDatabase}

procedure Register;

implementation

{$R SLDB.dcr}

uses
  SLDataSet,
  SLFunAgr;

procedure Register;
begin
  RegisterComponents (COMPONENT_TAB_NAME, [TSLDatabase]);
end;

(*******************************************************************************
            TSLDatabase
 ******************************************************************************)
///TTblField

///TIdxField

///TIdxInfo

constructor TIdxInfo.Create;
begin
  FFldList := TObjectList.Create;
end; (*TIdxInfo.Create*)

destructor TIdxInfo.Destroy;
begin
  FFldList.Free;

  inherited;
end; (*TIdxInfo.Destroy*)

function TIdxInfo.GetFieldCount: Integer;
begin
  Result := FFldList.Count;
end; (*TIdxInfo.GetFieldCount*)

function TIdxInfo.GetField (const Idx: Integer): TIdxField;
begin
  try
    Result := TIdxField (FFldList.Items [Idx]);
  except
    Result := nil;
  end; {try/except}
end; (*TIdxInfo.GetField*)

///TTblInfo

constructor TTblInfo.Create;
begin
  FFldList := TObjectList.Create;
  FIdxList := TObjectList.Create;
end; (*TTblInfo.Create*)

destructor TTblInfo.Destroy;
begin
  FIdxList.Free;
  FFldList.Free;

  inherited;
end; (*TTblInfo.Destroy*)

function TTblInfo.GetFieldCount: Integer;
begin
  Result := FFldList.Count;
end; (*TTblInfo.GetFieldCount*)

function TTblInfo.GetField (const Idx: Integer): TTblField;
begin
  try
    Result := TTblField (FFldList.Items [Idx]);
  except
    Result := nil;
  end; {try/except}
end; (*TTblInfo.GetField*)

function TTblInfo.GetIndexCount: Integer;
begin
  Result := FIdxList.Count;
end; (*TTblInfo.GetIndexCount*)

function TTblInfo.GetIndex (const Idx: Integer): TIdxInfo;
begin
  try
    Result := TIdxInfo (FIdxList.Items [Idx]);
  except
    Result := nil;
  end; {try/except}
end; (*TTblInfo.GetIndex*)

function TTblInfo.GetIndexInfo (const anIdxName: String): TIdxInfo;
var
  i: Integer;
begin
  for i := 0 to FIdxList.Count - 1 do
    if TIdxInfo (FIdxList.Items [i]).FIdxName = anIdxName then begin
      Result := TIdxInfo (FIdxList.Items [i]);

      exit;
    end; {if / for}

  Result := nil;
end; (*TTblInfo.GetIndexInfo*)

function TTblInfo.GetDefaultsSQL (aStrs: TStringList): String;
var
  i,j: Integer;
  pFld: TTblField;
  pFldName: PChar;
  pStrName: PChar;
  pDflt: String;
begin
  Result := 'select ';

  for i := 0 to (aStrs.Count - 1) do begin
    pStrName := PChar (aStrs.Strings [i]);

    if Pos ('_ROWID_', pStrName) > 0 then
      continue;

    pFld := nil;

    for j := 0 to FFldList.Count - 1 do begin
      pFldName := PChar ((FFldList[j] as TTblField).FieldName);

      if StrIComp (pStrName, pFldName) = 0  then begin
        pFld := (FFldList[j] as TTblField);

        break; // leave inner for
      end; {if}
    end; {for}

    if not assigned (pFld) then
      exit; ///!!!error here, no defaults for field, also no field.

    pDflt := pFld.FDfltValue;
    if pDflt = '' then
      pDflt := 'NULL'
    else
      pDflt := '"' + pDflt + '"';

    if Result = 'select ' then
      Result := Result + pDflt + ' as ' + pFld.FieldName
    else
      Result := Result + ',' + pDflt + ' as ' + pFld.FieldName
  end; {for}
end; (*TTblInfo.GetDefaultsSQL*)

///TDBInfo

///TSLDatabase

constructor TSLDatabase.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);

{$IFDEF SINGLE_ENGINE}
  FEngine := __Engine;
{$ENDIF}

  FDtSetList := TObjectList.Create (False);

  with FSLDBOptions do begin
    ForceTransaction := True;
    Mode             := fmOpenReadWrite;
    BusyTimeOut      := 0;
    CommitOnExit     := False;
  end; {with}

  FDBList  := TObjectList.Create;
  FTblList := TObjectList.Create;
  FIxdList := TObjectList.Create;
  FFunList := TObjectList.Create (False);
end; (**)

destructor TSLDatabase.Destroy;
var
  i: Integer;
begin
  for i := 0 to FDtSetList.Count - 1 do
    (TSLDataSet(FDtSetList.Items [i])).Database := nil;
  FDtSetList.Free; // here DataSets can be informed about deleting...

  for i := 0 to FFunList.Count - 1 do
    (TSLCustomFun (FFunList.Items [i])).Database  := nil;
  FFunList.Free;

  FDBList.Free;
  FTblList.Free;
  FIxdList.Free;

  if assigned (FEngine) and assigned (FHandle) then
    Close;

  inherited;
end; (**)

procedure TSLDatabase.Loaded;
begin
  inherited;

  if FLoadedActivate then
    Open;
end; (**)

{$IFNDEF SINGLE_ENGINE}
procedure TSLDatabase.SetEngine (const aValue: TSLEngine);
begin
  if assigned (FEngine) and assigned (FHandle) then
    FEngine.SQLite_Close (Self);

  FEngine := aValue;
end; (**)
{$ENDIF}

procedure TSLDatabase.SetDBName (const aValue: TFileName);
begin
  if FDBName = aValue then
    exit;

  if assigned (FEngine) and assigned (FHandle) then
    Active := False;
//    FEngine.SQLite_Close (Self);

  FDBName := aValue;
end; (**)

procedure TSLDatabase.SetSLDBOptions (const aValue: TSLDBOptions);
var
  pSame: Boolean;
begin
  pSame := True;

  if FSLDBOptions.ForceTransaction <> aValue.ForceTransaction then begin
    pSame := False;
  end; {if}

  if FSLDBOptions.CommitOnExit <> aValue.CommitOnExit then begin
    FSLDBOptions.CommitOnExit := aValue.CommitOnExit;

    pSame := False;
  end; {if}

  if FSLDBOptions.Mode <> aValue.Mode then begin
    pSame := False;

    if Active then
      Close;
  end; {if}
  if FSLDBOptions.BusyTimeOut <> aValue.BusyTimeOut then begin
    pSame := False;

    FEngine.SQLite_BusyTimeout (Self, aValue.BusyTimeOut);
    FEngine.SQLite_BusyHandler (Self);
  end; {if}

  if not pSame then
    exit;

  FSLDBOptions := aValue;
end; (**)

function TSLDatabase.GetActive: Boolean;
begin
  Result := assigned (FHandle);
end; (**)

procedure TSLDatabase.SetActive (const aValue: Boolean);
begin
  if aValue = assigned (FHandle) then
    exit;
  if not assigned (FEngine) then
    exit;

  if aValue then begin
    if csLoading in ComponentState then begin
      FLoadedActivate := True;

      exit;
    end; {if}

    Open;

    // aktywacja zarejestrowanych datasetów.
  end {if}
  else begin
    CloseDataSets;
    
    Close;
  end; {else}  
end; (**)

function TSLDatabase_ExecCallback (Sender: TSLDatabase;
                                   Columns: Integer;
                                   ColumnValues: Pointer;
                                   ColumnNames: Pointer): integer; cdecl;
begin
//2003.10.16 MZa - right now nothing to do here.
  Result := 0;

  if not assigned (Sender) then
    exit;
end;

procedure TSLDatabase.InitializeDB; // pragma
var
  pErr: String;
  pRes: Integer;
  pPragmas: String;
begin
  pPragmas :=
    'PRAGMA SHOW_DATATYPES=ON;' + CRLF +
    'PRAGMA EMPTY_RESULT_CALLBACKS=ON;' + CRLF +
    'PRAGMA FULL_COLUMN_NAMES=ON;' + CRLF +
    '';

  pRes := FEngine.SQLite_Exec (Self, pPragmas, pErr, @TSLDatabase_ExecCallback);
  if pRes <> SQLITE_OK then
    raise ESQLiteError.Create ('Unable to initDB ' + CRLF +
                               IntToStr (pRes) + CRLF + pErr);

  RefreshDBList;
  RefreshTblList;

  if FSLDBOptions.ForceTransaction then
    BeginTransaction; // it can be done later...
                      // but DataSet now calling engine directly...
end; (**)

procedure TSLDatabase.InitializeFun (aFun: TObject = nil);
var
  i: Integer;
  pRes: Integer;
begin
  if not (assigned (FEngine) and GetActive) then
    exit; // nothing to init.

  if not assigned (aFun) then
    for i := 0 to FFunList.Count - 1 do
      InitializeFun (FFunList.Items [i])
  else
    with aFun as TSLFunction do begin
      pRes := FEngine.SQLite_CreateFunction (FHandle, PChar (FunName),
                                             ParamCount,
                                             GetCallBackPtr,
                                             aFun);

      if pRes <> SQLITE_OK then
        raise ESQLiteError.Create ('Unable to register function ' +
                                   '"'+ FunName + '"'#13#10 +
                                   IntToStr (pRes));

      pRes := FEngine.SQLite_FunctionType (FHandle,
                                           PChar (FunName),
                                           GetResTypeAsInt);

      if pRes <> SQLITE_OK then
        raise ESQLiteError.Create ('Unable to setup result type for function ' +
                                   '"'+ FunName + '"'#13#10 +
                                   IntToStr (pRes));
    end; {with}
end; (**)

procedure TSLDatabase.Open;
var
  pErr: String;
begin
  if assigned (FHandle) then
    raise ESQLiteError.Create ('Something goes wrong - ' +
                               'PTR should be cleared here.');

  if not assigned (FEngine) then
    raise ESQLiteError.Create ('Not connected');

  FHandle := FEngine.SQLite_Open (PChar (FDBName), FSLDBOptions.Mode, pErr);
  if not assigned (FHandle) then
    raise ESQLiteError.Create ('Error opening DB ' + CRLF + pErr);

  InitializeDB;
  InitializeFun;
end; (**)

procedure TSLDatabase.CloseDataSets;
var
  i: Integer;
  pDtSet: TSLDataSet;
begin
  for i := 0 to FDtSetList.Count - 1 do begin
    pDtSet := TSLDataSet (FDtSetList.Items [i]);

    if pDtSet.Active then
      pDtSet.Close;
  end; {for}
end; (**)

procedure TSLDatabase.Close;
begin
  if not assigned (FHandle) then
    exit; // it IS closed.

  CloseDataSets;

  if FInTrans then begin
    if FSLDBOptions.CommitOnExit then
      Commit
    else
      Rollback;
  end; {if}

  FEngine.SQLite_Close (Self);

  FHandle := nil;
end; (**)

// DBList

procedure TSLDatabase.RefreshDBList;
var
  pErr: String;
  pRes: Integer;

  pResList: Pointer;
  pIter: PPChar;

  pRows, pCols: Cardinal;
  i: Integer;

  pObj: TDBInfo;
begin
  FDBList.Clear;
  pResList := nil;

  try
    pRes := FEngine.SQLite_Exec (Self, 'PRAGMA SHOW_DATATYPES=OFF',
                                 pErr, @TSLDatabase_ExecCallback);
    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('error');

    pRes := FEngine.SQLite_GetTable (Self, 'PRAGMA database_list',
                                     pResList, pRows, pCols, pErr);
    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('error');
    if pCols <> 3 then
      raise ESQLiteError.Create ('error');
    if pRows = 0 then
      raise ESQLiteError.Create ('error');

    pIter := pResList;

    for i := 0 to pCols - 1 do
      inc (pIter);

    for i := 0 to pRows - 1 do begin
      pObj := TDBInfo.Create;

      with pObj as TDBInfo do begin
        FSeq      := StrToInt (PChar (pIter^));
        inc (pIter);
        FDBName   := PChar (pIter^);
        inc (pIter);
        FFileName := PChar (pIter^);
        inc (pIter);
      end; {with}

      FDBList.Add (pObj);
    end; {for}
  finally
    if assigned (pResList) then
      FEngine.SQLite_FreeTable (pResList);

    pRes := FEngine.SQLite_Exec (Self, 'PRAGMA SHOW_DATATYPES=ON',
                                 pErr, @TSLDatabase_ExecCallback);
  end; {try/except}

  if pRes <> SQLITE_OK then begin
    // problems here!!! check pErr
    FDBList.Clear; // any way list will be clear.
  end; {if}
end; (*TSLDatabase.RefreshDBList*)

function TSLDatabase.DoGetDBList (aStrs: TStrings): Boolean;
var
  i: Integer;
begin
  Result := False;

  if not assigned (aStrs) then
    exit;

  aStrs.Clear;

  for i := 0 to (FDBList.Count - 1) do
    with FDBList [i] as TDBInfo do
      aStrs.Add (FDBName);

  Result := True;
end; (*TSLDatabase.DoGetDBList*)

function TSLDatabase.GetDBListCount: Integer;
begin
  Result := FDBList.Count;
end; (*TSLDatabase.GetDBListCount*)

function TSLDatabase.GetDBListItem (const anIdx: Integer): TDBInfo;
begin
  Result := TDBInfo (FDBList [anIdx]);
end; (*TSLDatabase.GetDBListItem*)

function TSLDatabase.GetDBInfo (const aDbName: String): TDBInfo;
var
  i: Integer;
begin
  for i := 0 to FDBList.Count - 1 do
    if (FDBList [i] as TDBInfo).FDBName = aDBName then begin
      Result := FDBList [i] as TDBInfo;

      exit;
    end; {if/with/for}

  Result := nil;
end; (*TSLDatabase.GetDBInfo*)

// TableInfo

function TSLDatabase.ReciveTblList: Integer;
var
  pErr: String;
  pRes: Integer;

  pResList: Pointer;
  pIter: PPChar;

  pRows, pCols: Cardinal;
  i: Integer;

  pTblInfo:  TTblInfo;
begin
  FTblList.Clear;
  Result := 0;
  pResList := nil;

  try
    pRes := FEngine.SQLite_GetTable (Self,
                                     'select * from sqlite_master ' +
                                     'where type ="table" or type = "view"',
                                     pResList, pRows, pCols, pErr);
    if (pRows = 0) then
      exit;

    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('error');
    if (pCols <> 5) or (pRows = 0) then
      raise ESQLiteError.Create ('error');

    pIter := pResList;

    for i := 0 to pCols - 1 do
      inc (pIter);

    for i := 0 to pRows - 1 do begin
      pTblInfo := TTblInfo.Create;

//  type,name,tbl_name,rootpage,sql
      with pTblInfo do begin
        FTyp      := PChar (pIter^);
        inc (pIter);
        FIdName   := PChar (pIter^);
        inc (pIter);
        FTblName  := PChar (pIter^);
        inc (pIter);
        FRootPage := StrToInt (PChar (pIter^));
        inc (pIter);
        FSQL      := PChar (pIter^);
        inc (pIter);
      end; {with}

      FTblList.Add (pTblInfo);
    end; {for}
  except
    Result := -1;

    FTblList.Clear; // any way list will be clear.
  end; {try/except}

  if assigned (pResList) then
    FEngine.SQLite_FreeTable (pResList);
end; (**)

function TSLDatabase.ReciveTblFields (const aTblNo: Integer): Integer;
var
  pErr: String;
  pRes: Integer;

  pResList: Pointer;
  pIter: PPChar;

  pRows, pCols: Cardinal;
  i: Integer;

  pTblInfo: TTblInfo;
  pTblField: TTblField;
begin
  try
    pTblInfo := TTblInfo (FTblList.Items [aTblNo]);
    if not assigned (pTblInfo) then
      raise ESQLiteError.Create ('error');
  except
    Result := -1;

    exit;
  end; {try/except}

  pTblInfo.FFldList.Clear;

  pResList := nil;

  try
    pRes := FEngine.SQLite_GetTable (Self, 'PRAGMA table_info (' + pTblInfo.FTblName + ')',
                                     pResList, pRows, pCols, pErr);
    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('error');
    if (pCols <> 5) or (pRows = 0) then
      raise ESQLiteError.Create ('error');

    pIter := pResList;

    for i := 0 to pCols - 1 do
      inc (pIter);

    for i := 0 to pRows - 1 do begin
      pTblField := TTblField.Create;

//cid, name, type, notnull (0,1), dflt_value
      with pTblField do begin
        FCId       := StrToInt (PChar (pIter^));
        inc (pIter);
        FFieldName := PChar (pIter^);
        inc (pIter);
        FTyp       := PChar (pIter^);
        inc (pIter);
        FNotNull   := Boolean (StrToInt (PChar (pIter^)));
        inc (pIter);
        FDfltValue := PChar (pIter^);
        inc (pIter);
      end; {with}

      pTblInfo.FFldList.Add (pTblField);
    end; {for}

    Result := 0;
  except
    Result := -1;
  end; {try/except}

  if assigned (pResList) then
    FEngine.SQLite_FreeTable (pResList);
end;

function TSLDatabase.ReciveIdxList (const aTblNo: Integer): Integer;
var
  pErr: String;
  pRes: Integer;

  pResList: Pointer;
  pIter: PPChar;

  pRows, pCols: Cardinal;
  i: Integer;

  pTblInfo: TTblInfo;
  pIdxInfo: TIdxInfo;
begin
  try
    pTblInfo := TTblInfo (FTblList.Items [aTblNo]);

    if not assigned (pTblInfo) then
      raise ESQLiteError.Create ('error');
  except
    Result := -1;

    exit;
  end; {try/except}

  pResList := nil;
  Result := 0;

  try
    pRes := FEngine.SQLite_GetTable (Self,
                                     'PRAGMA index_list (' + pTblInfo.FTblName + ')',
                                     pResList, pRows, pCols, pErr);
    if pRows = 0 then // if no rows there is nothing to free...
      exit;

    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('error');

    pIter := pResList;

    for i := 0 to pCols - 1 do
      inc (pIter);

    for i := 0 to pRows - 1 do begin
      pIdxInfo := TIdxInfo.Create;

// seq,name,unique
      with pIdxInfo do begin
        FSeq      := StrToInt (PChar (pIter^));
        inc (pIter);
        FIdxName   := PChar (pIter^);
        inc (pIter);
        FUnique  := Boolean (StrToInt (PChar (pIter^)));
        inc (pIter);
      end; {with}

      pTblInfo.FIdxList.Add (pIdxInfo);

      Result := ReciveIdxFields (aTblNo, i);
      if Result < 0 then
        raise ESQLiteError.Create ('error');
    end; {for}
  except
    Result := -1;

    pTblInfo.FIdxList.Clear; // any way list will be clear.
  end; {try/except}

  if assigned (pResList) then
    FEngine.SQLite_FreeTable (pResList);
end;

function TSLDatabase.ReciveIdxFields (const aTblNo: Integer;
                                      const anIdxNo: Integer): Integer;
var
  pErr: String;
  pRes: Integer;

  pResList: Pointer;
  pIter: PPChar;

  pRows, pCols: Cardinal;
  i: Integer;

  pTblInfo:  TTblInfo;
  pIdxInfo:  TIdxInfo;
  pIdxField: TIdxField;
begin
  try
    pTblInfo := TTblInfo (FTblList.Items [aTblNo]);

    if not assigned (pTblInfo) then
      raise ESQLiteError.Create ('error');
  except
    Result := -1;

    exit;
  end; {try/except}

  try
    // 2003.10.31 PDG - Typo Fix
    // Old Code :  pIdxInfo := TIdxInfo (pTblInfo.FIdxList.Items [aTblNo]);
    pIdxInfo := TIdxInfo (pTblInfo.FIdxList.Items [anIdxNo]);

    // 2003.10.31 PDG - Typo Fix
    // Old Code :  if not assigned (pTblInfo) then
    if not assigned (pIdxInfo) then
      raise ESQLiteError.Create ('error');
  except
    Result := -1;

    exit;
  end; {try/except}

  pResList := nil;

  try
    // 2003.10.31 PDG - Quote Index Name in calling PRAGMA Index_info
    // Old Code :
    // pRes := FEngine.SQLite_GetTable (Self,
    //                                  'PRAGMA index_info (' + pIdxInfo.FIdxName + ')',
    //                                   pResList, pRows, pCols, pErr);
    pRes := FEngine.SQLite_GetTable (Self,
                                     'PRAGMA index_info (''' + pIdxInfo.FIdxName + ''')',
                                     pResList, pRows, pCols, pErr);

    if pRes <> SQLITE_OK then
      // 2003.10.31 PDG - Need more information on Error
      // Old Code : raise ESQLiteError.Create ('error');
      raise ESQLiteError.Create ('error ' + pErr);
    if pCols <> 3 then
      raise ESQLiteError.Create ('error');
    if pRows = 0 then
      raise ESQLiteError.Create ('error');

    pIter := pResList;

    for i := 0 to pCols - 1 do
      inc (pIter);

    for i := 0 to pRows - 1 do begin
      pIdxField := TIdxField.Create;

//seqno,cid,name
      with pIdxField do begin
        FSeqNo      := StrToInt (PChar (pIter^));
        inc (pIter);
        FCId        := StrToInt (PChar (pIter^));
        inc (pIter);
        FFieldName  := PChar (pIter^);
        inc (pIter);
      end; {with}

      pIdxInfo.FFldList.Add (pIdxField);
    end; {for}

    Result := 0;
  except
    Result := -1;

    FTblList.Clear; // any way list will be clear.
  end; {try/except}

  if assigned (pResList) then
    FEngine.SQLite_FreeTable (pResList);
end; (**)

procedure TSLDatabase.RefreshTblList;
var
  pErr: String;
  pRes: Integer;

  i: Integer;
begin
  FDBList.Clear;

  try
    pRes := FEngine.SQLite_Exec (Self, 'PRAGMA SHOW_DATATYPES=OFF',
                                 pErr, @TSLDatabase_ExecCallback);
    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('error');

    pRes := ReciveTblList;

    if pRes < 0 then
      raise ESQLiteError.Create ('error');

    // 2003.10.16 MZa - for every get table fields
    for i := 0 to FTblList.Count - 1 do begin
      pRes := ReciveTblFields (i);

      if pRes < 0 then
        raise ESQLiteError.Create ('error');
    end; {for}

    // and indices information
    for i := 0 to FTblList.Count - 1 do begin
      pRes := ReciveIdxList (i);

      if pRes < 0 then
        raise ESQLiteError.Create ('error');
    end; {for}
  except
    FTblList.Clear; // any way list will be clear.
  end; {try/except}

  FEngine.SQLite_Exec (Self, 'PRAGMA SHOW_DATATYPES=ON',
                       pErr, @TSLDatabase_ExecCallback);
end; (*TSLDatabase.RefreshTblList*)

function TSLDatabase.DoGetTable (aStrs: TStrings): Boolean;
var
  i: Integer;
begin
  Result := False;

  if not assigned (aStrs) then
    exit;

  aStrs.Clear;

  for i := 0 to (FTblList.Count - 1) do
    with FTblList [i] as TTblInfo do
      aStrs.Add (FTblName);

  Result := True;
end; (**)

function TSLDatabase.GetTableCount: Integer;
begin
  Result := FTblList.Count;
end; (**)

function TSLDatabase.GetTableItem (const anIdx: Integer): TTblInfo;
begin
  Result := TTblInfo (FTblList [anIdx]);
end; (**)

function TSLDatabase.GetTblInfo (const aTblName: String): TTblInfo;
var
  i: Integer;
  pTblName: PChar;
begin
  for i := 0 to FTblList.Count - 1 do begin
    pTblName := PChar ((FTblList [i] as TTblInfo).FTblName);

    if StrIComp (pTblName, PChar (aTblName)) = 0 then begin
      Result := FTblList [i] as TTblInfo;

      exit;
    end; {if/with}
  end; {for}

  Result := nil;
end; (**)

// IndexInfo

function TSLDatabase.GetIndexList (const aTblName: String;
                                   aStrs: TStrings): Boolean;
var
  i: Integer;
  pTblInfo: TTblInfo;
begin
  Result := False;

  if not assigned (aStrs) then
    exit;

  pTblInfo := GetTblInfo (aTblName);

  if not assigned (pTblInfo) then
    exit;

  aStrs.Clear;

  for i := 0 to pTblInfo.IndexCount - 1 do
    aStrs.Add (pTblInfo.Index [i].IdxName);

  Result := True;
end; (*TSLDatabase.GetIndexList*)

function TSLDatabase.GetIndexInfo (const aTblName: String;
                                   const anIdxName: String): TIdxInfo;
var
  pTblInfo: TTblInfo;
begin
  Result := nil;

  pTblInfo := GetTblInfo (aTblName);

  if not assigned (pTblInfo) then
    exit;

  Result := pTblInfo.GetIndexInfo (anIdxName);
end; (*TSLDatabase.GetIndexInfo*)

function TSLDatabase.ExecSQL (anObj: TObject;
                              const aSQL: String;
                              aForceTrans: Boolean;
                              var anErrMsg: String): Integer;
begin
  if (not FInTrans) and aForceTrans then
    BeginTransaction;

  if anObj is TSLDataSet then
    Result := FEngine.SQLite_Exec (anObj, aSQL, anErrMsg,
                                   @TSLDataSet_ExecCallback)
  else
    Result := FEngine.SQLite_Exec (anObj, aSQL, anErrMsg,
                                   @TSLDatabase_ExecCallback);
end; (*TSLDatabase.ExecSQL*)

function TSLDatabase.GetTable (const aSQL: String;
                               var aResult: Pointer;
                               var aRecCount: Cardinal;
                               var aColCount: Cardinal;
                               var anErrMsg: String): Integer;
begin
  Result := FEngine.SQLite_GetTable (Self, aSQL, aResult,
                                     aRecCount, aColCount, anErrMsg);
end; (**)

procedure TSLDatabase.FreeTable (aPtr: Pointer);
begin
  FEngine.SQLite_FreeTable (aPtr);
end; (**)

function TSLDatabase.OpenVM (const aSQL: String;
                             var aTail: String;
                             var aSQLite_VM: Integer;
                             var anErrMsg: String): Integer;
begin
  Result := FEngine.SQLite_Compile (Self, aSQL, aTail, aSQLite_VM, anErrMsg);
end; (**)

function TSLDatabase.CloseVM (var aSQLite_VM: Integer;
                              var anErrMsg: String): Integer;
begin
  Result := FEngine.SQLite_Finalize (aSQLite_VM, anErrMsg);
end; (**)

function TSLDatabase.VMStep (const aSQLite_VM: Integer;
                             var aColCount: Cardinal;
                             var aValuePtr: Pointer;
                             var aColsPtr: Pointer): Integer;
begin
  Result := FEngine.SQLite_Step (aSQLite_VM, aColCount, aValuePtr, aColsPtr);
end; (**)

function TSLDatabase.LastInsertRow: Integer;
begin
  Result := FEngine.SQLite_LastInsertRow (self);
end; (**)

procedure TSLDatabase.RegisterDataSet (aDtSet: TObject);
begin
  with FDtSetList do begin
    if IndexOf (aDtSet) >= 0 then
      exit;

    Add (aDtSet);
  end; {with}
end; (**)

procedure TSLDatabase.RegisterFunction (aFun: TObject);
begin
  // the function always should be added to this list.
  FFunList.Add (aFun);

  if assigned (FEngine) and GetActive then
    InitializeFun (aFun);
end; (**)

function TSLDatabase.GetFunCount: Integer;
begin
  Result := FFunList.Count;
end; (**)

function TSLDatabase.GetFunItem (const anIdx: Integer): TObject;
begin
  Result := FFunList.Items [anIdx];
end; (**)

procedure TSLDatabase.RegisterAggregate (aFunObject: TObject);
begin
end; (**)

procedure TSLDatabase.BeginTransaction;
var
  pErr: String;
  pRes: Integer;
begin
  if FInTrans then
    exit;

  pRes := FEngine.SQLite_Exec (Self, 'begin transaction',
                               pErr, @TSLDatabase_ExecCallback);

  if pRes <> SQLITE_OK then
    raise ESQLiteError.Create ('Unable to start transaction. ' + CRLF +
                               IntToStr (pRes) + CRLF + pErr)
  else
    FInTrans := True;
end; (**)

procedure TSLDatabase.Commit;
var
  pErr: String;
  pRes: Integer;
begin
  if not FInTrans then
    exit;

  pRes := FEngine.SQLite_Exec (Self, 'commit',
                               pErr, @TSLDatabase_ExecCallback);

  if pRes <> SQLITE_OK then
    raise ESQLiteError.Create ('Unable to commit transaction. ' + CRLF +
                               IntToStr (pRes) + CRLF + pErr)
  else
    FInTrans := False;
end; (**)

procedure TSLDatabase.Rollback;
var
  pErr: String;
  pRes: Integer;
begin
  if not FInTrans then
    exit;

  pRes := FEngine.SQLite_Exec (Self, 'rollback',
                               pErr, @TSLDatabase_ExecCallback);

  if pRes <> SQLITE_OK then
    raise ESQLiteError.Create ('Unable to rollback transaction. ' + CRLF +
                               IntToStr (pRes) + CRLF + pErr)
  else
    FInTrans := False;
end; (**)

end { SLDB }.
