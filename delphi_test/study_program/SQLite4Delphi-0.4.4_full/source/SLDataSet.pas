(***
  @abstract(The @name  - DB components for SQLite)
  @author(Michal Zaborowski <michal.zaborowski@wp.pl>)
  @author(Paul DIAS GONCALVES <padigon@altern.org>)  *)
unit SLDataSet;

interface

{$I SLDefs.inc}

uses
// 2003.10.25 Paul - For compatibility with Kylix 1
  SysUtils,
  {$IFDEF WIN32} Windows, {$ELSE} Libc, {$ENDIF}
  Classes, Contnrs, MATH, DB,

  {$IFDEF D6}
    Variants,
  {$ELSE} {$IFDEF WIN32}
    {for older vers, we need application object for event handling}
    Forms,
    {$ENDIF}
  {$ENDIF}

  SLTypes,
  SLDB,
  SLEngine,
  SLFunAgr;

type
  { TSLDataSet }

  (*** Used for internal buffer in class. *)
  TRecInfo = record
    riBookmark: Integer; // rec no
    riBookmarkFlag: TBookmarkFlag;

    riDataPtr: Pointer;
//
//    riTest: String; // test only
//    riTest1: Integer; // test only
  end; {TRecInfo}
  PRecInfo = ^TRecInfo;

  (*** Cache data for @link(TSLDataSet) *)
  TRecData = record
    (*** in case of deletting or canceling of insert. *)
    rdUpdateStatus: TUpdateStatus;

    (*** Array of new data. If size is zero then no changes done.
    @link(TSLDataSet.GetFieldData) chcek if modiffied data exists -
    in that case the function use them. *)
    rdNewData: array of PChar;

    (*** Array of orginal data.*)
    rdOrgData: array of PChar;

    (*** if bit is 1 then rdNewData contains new data - if 0 'orginal'
         is current. *)
    rdChanged: TBits;
//    rdTimeStamp: TDateTime; // time of creation, later for stats
  end; {TRecData}
  PRecData = ^TRecData;

  (*** Information about columns - used in @link(TSLDataSet) *)
  TColData = record
    (*** full name - as in the result. *)
    cdSrcName: String;
    (*** field name - for SQL building. *)
    cdFieldName: String;
    (*** type name - as in the result. *)
    cdType: String;
  end; {TColData}
  PColData = ^TColData;

  (*** @abstract(determine how dataset retrives data from the engine.)*)
  TGettingMethod = (
    gmCallback,
    gmGetTable,
    gmVMachine);

  (*** @abstract(callback flag used in @link(TSLDataSet).)
  Callback is a function called by the engine - this flag
  determines what operation is pendning: *)
  TCBDtSetFlag = (
    (*** default, just to allow "empty" value. *)
    cdfUnknown,
    (*** getting data, most common.*)
    cdfNormal,
    (*** insert,update,delete - or other "internal" operations.*)
    cdfInternal,
    (*** requering for updated record.*)
    cdfRequery);

  (*** @abstract(represents single option)
  Used by @link(TSLDataSet). *)
  TSLOption = (
    (*** rowid column is used to create updates/inserts/deletes,
         as well as in re-query. *)
    soUseROWIDs,
    (*** columns with rowid has visible = false. *)
    soHideROWIDs,
    soHideTableName,
    (*** SQLite text fields are treated as TMemoFields, in other case they
         are TStringFields. *)
    soTextAsMemo,
    soRangedNumericsAsBCD,
    soRangedFloatsAsBCD);

  (*** @abstract(represents option set)
  Used by @link(TSLDataSet). *)
  TSLOptions = set of TSLOption;

  (*** @abstract(TDataSet descendant) *)
  TSLDataSet = class(TDataSet)
  private
    FActive:   Boolean;
    FSQL:      TStrings;
    FReadOnly: Boolean;
    FDB:       TSLDatabase;

    FVM:       Integer;
    // if sql contains more than one query field contains ommited part of sql.
    FTail:     String;

    FGettingMethod: TGettingMethod;
    FSLOptions: TSLOptions;

    FUppTblNameUser: Boolean;
    FUpdTblName: String;
    FUpdFieldNames: String;

    // flag 4 callback
    FCBFlag: TCBDtSetFlag;

    // cols
    FColCount: Integer;
    FCols: array of TColData;
    FColRowId: Integer; // Index of rowid column, used for requery.
                        // By default := -1, when >=0 chnages are possible.

    FCache: array of PRecData;

    // number of rows = number of records - nuber of deleted
    FRecCount: Integer;
    FDelCount: Integer;

    FCurrRec:  Integer; // local info about current record

    FRecSize:  Integer; // now record has contant length so....

    (*** @abstract (Record's number counter)
    Every dataset can use this field to determine record number. Note that
    locate, lookup, filter should store orginal data to prevent changing it
    while locateing row(s).*)
    FActualRecNo: Integer;

    // set methods for properties

    procedure SetDB (const aValue: TSLDatabase);
    procedure SetSQL (const aValue: TStrings);
    procedure SetSLOptions (const aValue: TSLOptions);
    procedure SetUpdatingTableName (const aValue: String);

    // setting data

    function  FieldNameToIdx (const aFieldName: String): Integer;

    procedure QueryDefaults (aRec: PRecData);

    procedure RequeryRecord (aRec: PRecData);

    procedure PostUpdate (aRec: PRecInfo);
    procedure PostInsert (aRec: PRecInfo);

    // fields

    function  IsFieldType (aType: String;
                           const aTypeName: PChar;
                           var aLen: Integer;
                           var aPrec: Integer): Boolean;
    function  AddFieldDef (const aName: String; const aType: String): Integer;

    procedure CheckUpdatingTableName;

    // getting methods

    function  UpdateColumns (aCount:  Integer;
                             aValues: PPCharArray;
                             aNames:  PPCharArray): Boolean;
    function  UpdateRecord (aRec:    PRecData;
                            aCount:  Integer;
                            aValues: PPCharArray;
                            aNames:  PPCharArray): Boolean;

    function  OpenWithGetTable (var anErr: String): Integer;

    function  OpenVM: Integer;
    function  CloseVM: Integer;
    function  VMGetNext: Integer;

    (*** Not used *)
    function  BuildLocateQuery (const KeyFields: string;
                                const KeyValues: Variant;
                                Options: TLocateOptions): String;
    (*** Not used *)
    function  LocateRecData (const KeyFields: string;
                             const KeyValues: Variant;
                             Options: TLocateOptions;
                             var aPos: Integer): PRecData;
    function  InternalLocate (const KeyFields: string;
                             const KeyValues: Variant;
                             Options: TLocateOptions;
                             var aPos: Integer): PRecData;
  protected
    procedure Loaded; override;

    { TDataSet }
    function  AllocRecordBuffer: PChar; override;
    procedure FreeRecordBuffer (var Buffer: PChar); override;
    function  GetRecord (Buffer: PChar;
                         GetMode: TGetMode;
                         DoCheck: Boolean): TGetResult; override;

    procedure InternalHandleException; override;

    procedure InternalOpen; override;
    procedure InternalClose; override;
    function  IsCursorOpen: Boolean; override;

    procedure InternalInitFieldDefs; override;

    procedure InternalFirst; override;
    procedure InternalLast; override;

    procedure InternalInitRecord (Buffer: PChar); override;
    procedure InternalAddRecord (Buffer: Pointer; Append: Boolean); override;
    procedure InternalDelete; override;
    procedure InternalPost; override;
    procedure InternalCancel; override;

    procedure GetBookmarkData (Buffer: PChar; Data: Pointer); override;
    procedure SetBookmarkData (Buffer: PChar; Data: Pointer); override;
    function  GetBookmarkFlag (Buffer: PChar): TBookmarkFlag; override;
    procedure SetBookmarkFlag (Buffer: PChar; Value: TBookmarkFlag); override;
    procedure InternalGotoBookmark (Bookmark: Pointer); override;
    procedure InternalSetToRecord (Buffer: PChar); override;

    function  GetCanModify: Boolean; override;
    function  GetRecordCount: Integer; override;
    function  GetRecNo: Integer; override;
    procedure SetRecNo (Value: Integer); override;
    function  GetRecordSize: Word; override;

    procedure SetFieldData(Field: TField; Buffer: Pointer); overload; override;

    procedure SetFieldData (Field: TField; Buffer: Pointer;
                            NativeFormat: Boolean); overload; override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor  Destroy; override;

    { TDataSet }
    function  BookmarkValid(Bookmark: TBookmark): Boolean; override;
    function  CompareBookmarks(Bookmark1,
                               Bookmark2: TBookmark): Integer; override;

    function  GetFieldData (Field: TField; Buffer: Pointer;
                            NativeFormat: Boolean): Boolean; override;

    function  UpdateStatus: TUpdateStatus; override;

    function Locate(const KeyFields: string; const KeyValues: Variant;
      Options: TLocateOptions): Boolean; override;
    function Lookup(const KeyFields: string; const KeyValues: Variant;
      const ResultFields: string): Variant; override;

    procedure ExecSQL;

    property BufferCount;
    property Buffers;
    property Fields;
    property FieldValues;

    (*** Used when GettingMethod = gmVMachine. When SQLite compiles SQL to virtual
         machine only first statement is taken. Rest of query can be found here. <br>
         With ohter getting methods Tail property has no meaning. *)
    property Tail: String
      read FTail;


    property RecNo;
    property RecordCount;
    property RecordSize;
    property State;
  published
    property DataBase: TSLDatabase
      read FDB write SetDB;

    property SQL: TStrings
      read FSQL write SetSQL;

    (*** Options - see @link(TSLOptions). *)
    property SLOptions: TSLOptions
      read FSLOptions write SetSLOptions;
    (*** Determine how data are retrived from engine.
         See also @link(TGettingMethod). *)
    property GettingMethod: TGettingMethod
      read FGettingMethod write FGettingMethod;

    (*** Name of updating table. If no name set, by default name of first
         table will be taken *)
    property UpdatingTableName: String
      read FUpdTblName write SetUpdatingTableName;
    (*** Define fields that will be taken for update/insert. Not done yet. *)
    property UpdatingFieldNames: String
      read FUpdFieldNames write FUpdFieldNames;

    property ReadOnly: Boolean
      read FReadOnly write FReadOnly;
    { TDataSet }
    property Active;
    property AfterCancel;
    property AfterClose;
    property AfterDelete;
    property AfterEdit;
    property AfterInsert;
    property AfterOpen;
    property AfterPost;
    property AfterRefresh;
    property AfterScroll;
    property BeforeCancel;
    property BeforeClose;
    property BeforeDelete;
    property BeforeEdit;
    property BeforeInsert;
    property BeforeOpen;
    property BeforePost;
    property BeforeRefresh;
    property BeforeScroll;
    property CanModify;
    property FieldDefs;
// no filtering
//    property Filter;
//    property FilterOptions;
    property ObjectView default False;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnNewRecord;
    property OnPostError;
  end; { TSLDataSet }

  ESLRecNoError = Exception;

  (*** @abstract(Build-in function that enumerates row number) *)
  TSLFun_RecNo = class (TSLFunction)
  protected
    FObjList: TObjectList;

    procedure DoFunction (const aParamCount: Integer;
                          const aParams: PPCharArray); override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor  Destroy; override;

    (*** *)
    procedure AddAcitve (aDtSet: TSLDataSet);
    (*** *)
    procedure Release (aDtSet: TSLDataSet);
  end; { TSLFun_RecNo }

var
  (*** @abstract(Internal function for getting row number).
  You should not change it.*)
  __FunRecNo: TSLFun_RecNo;

function TSLDataSet_ExecCallback (Sender: TSLDataSet;
                                  Columns: Integer;
                                  ColumnValues: Pointer;
                                  ColumnNames: Pointer): integer; cdecl;

procedure Register;

implementation

{$R SLDataSet.dcr}

procedure Register;
begin
  RegisterComponents (COMPONENT_TAB_NAME, [TSLDataSet]);
end;

{$IFDEF LINUX}
// 2003.10.25 Paul - For compatibility with Kylix 1
procedure CopyMemory (Destination: Pointer; Source: Pointer; Length: Integer);
begin
  Move(Source^, Destination^, Length);
end;
{$ENDIF}

(*******************************************************************************
            TSLFun_RecNo
 ******************************************************************************)

constructor TSLFun_RecNo.Create (AOwner: TComponent);
begin
  inherited;

  FObjList := TObjectList.Create (False);

  Name    := '__fun_RecNo';
  FunName := 'recno';
  
  ParamCount := 0;

  Active := True;

end; (**)

destructor TSLFun_RecNo.Destroy;
begin
  FObjList.Free;

  inherited;
end; (**)

procedure TSLFun_RecNo.AddAcitve (aDtSet: TSLDataSet);
begin
  FObjList.Add (aDtSet);
end; (**)

procedure TSLFun_RecNo.Release (aDtSet: TSLDataSet);
//var
//  i: Integer;
begin
  if FObjList.Count <= 0 then
    raise ESLRecNoError.Create ('Trying to release dataset from empty list.');

  with FObjList do
    if Items [Count -1] = aDtSet then
      Delete (Count -1);
end; (**)

procedure TSLFun_RecNo.DoFunction (const aParamCount: Integer;
                                   const aParams: PPCharArray);
var
  pDtSet: TSLDataSet;
begin
  if FObjList.Count <= 0 then
    raise ESLRecNoError.Create ('Trying to get RecNo for unknown dataset.');

  with FObjList do
    pDtSet := Items [Count -1] as TSLDataSet;
  inc (pDtSet.FActualRecNo);

  SetResultInt (Self, pDtSet.FActualRecNo);
end; (**)

(*******************************************************************************
            TSLDataSet
 ******************************************************************************)

constructor TSLDataSet.Create(AOwner: TComponent);
begin
  inherited Create (AOwner);

  BookmarkSize := 4;
//  SetUniDirectional (True);

  FSQL := TStringList.Create;

  FGettingMethod   := gmCallback;
  FSLOptions := [soHideROWIDs, soHideTableName, soRangedNumericsAsBCD];

(* done by default
  FUpdTblName := '';
  FVM := 0;
  FTAil := '';
*)
end; (**)

destructor TSLDataSet.Destroy;
begin
  FSQL.Free;

  FCols := nil;

  inherited;
end; (**)

procedure TSLDataSet.Loaded;
begin
  inherited;

  // so now design time settings would not be treated as 'user changes'
  FUppTblNameUser := False;
end; (**)

procedure TSLDataSet.SetDB (const aValue: TSLDatabase);
begin
  if assigned (FCache) then begin
    if not assigned (FDB) then
      raise ESQLiteError.Create ('Uneble to free data - DB not assigned.')
  end; {if}

  if Active then
    Close;

  FDB := aValue;

  if assigned (FDB) then
    FDB.RegisterDataSet (Self);
end; (**)

procedure TSLDataSet.SetSQL (const aValue: TStrings);
begin
  FSQL.Assign (aValue);
end; (**)

procedure TSLDataSet.SetSLOptions (const aValue: TSLOptions);
var
  pSame: Boolean;
begin
  pSame := True;

  if not pSame then
    exit;

  if Active then
    Close;

  FSLOptions := aValue;
end; (**)

procedure TSLDataSet.SetUpdatingTableName (const aValue: String);
begin
  if FUpdTblName = aValue then
    exit;

  FUpdTblName := aValue;
  FUppTblNameUser := True;
end; (**)

procedure TSLDataSet.CheckUpdatingTableName;
const
  Terminators: array [0.. 12] of PChar =
    ('where ', 'group ', 'having ', 'order ', 'limit ', 'natural ', 'left ',
     'right ', 'full ', 'outer ', 'inner ', 'cross ', 'join ');
var
  pSQL: String;
  i: Integer;
begin
  if FUppTblNameUser then
    exit;

  pSQL := FSQL.Text;
  pSQL := Trim (pSQL);
  pSQL := LowerCase (pSQL);
  pSQL := StringReplace (pSQL, CRLF, ' ', [rfReplaceAll]);

  i := Pos ('from', pSQL);
  if i <= 0 then begin
    FUpdTblName := '';
    // maybe readonly??
    exit;
  end; {if}

  system.delete (pSQL, 1, i + 4);

  i := Pos (';', pSQL);
  if (i > 0) then
    system.delete (pSQL, i, 1);

  i := Pos (' ', pSql);
  if i <= 0 then begin
    FUpdTblName := pSQL;
    exit;
  end; {if}

  FUpdTblName := system.copy (pSQL, 1, i);
  FUpdTblName := Trim (FUpdTblName);

  system.delete (pSQL, 1, i);
  pSQL := Trim (pSQL);


  if StrLIComp (PChar (pSQL), 'as ', 3) = 0 then
    system.delete (pSQL, 1, 3)
  else begin
    for i := 0 to 12 do
      if StrLIComp (PChar (pSQL),
                    Terminators [i],
                    Length (Terminators [i])) = 0 then
        exit;
  end; {else}

  pSQL := Trim (pSQL);

  i := Pos (' ', pSql);
  if i <= 0 then
    FUpdTblName := FUpdTblName + ' ' + pSQL
  else begin
    system.delete (pSQL, i, Length (pSQL) - i + 1);

    FUpdTblName := FUpdTblName + ' ' + pSQL;
  end; {else}
end; (*TSLDataSet.CheckUpdatingTableName*)

// FieldNo can be used...
function TSLDataSet.FieldNameToIdx (const aFieldName: String): Integer;
var
  i: Integer;
begin
  Result := -1;

  if not assigned (FCache) then
    exit;

  for i := 0 to (FColCount - 1) do
    if soHideTableName in FSLOptions then begin
      if (FCols [i].cdFieldName = aFieldName) then begin
        Result := i;

        exit;
      end; {if}
    end
    else
      if (FCols [i].cdSrcName = aFieldName) then begin
        Result := i;

        exit;
      end; {if}

end; (**)

{ buffers }

function TSLDataSet.AllocRecordBuffer: PChar;
begin
  Result := AllocMem (SizeOf (TRecInfo));
end; (**)

procedure TSLDataSet.FreeRecordBuffer (var Buffer: PChar);
begin
  FreeMem (Buffer, SizeOf (TRecInfo));
end; (**)

function TSLDataSet.GetRecord (Buffer: PChar;
                               GetMode: TGetMode;
                               DoCheck: Boolean): TGetResult;
var
  pDataIdx: Integer;

//  pInfoBuf: PRecInfo;
  pDataBuf: PRecData;

  i: Integer;
begin
  if not (FActive and assigned (FCache)) then begin
    Result := grEOF;
    exit;
  end; {if}

  Result := grOK;

  case GetMode of
    gmCurrent: begin
      if (FCurrRec > (GetRecordCount - 1)) then
        Result := grEOF
      else
        if (FCurrRec < 0) then
          Result := grBOF;
    end; {gmCurrent}
    gmNext: begin
      if (FCurrRec >= (GetRecordCount - 1)) then begin
        if FVM <> 0 then begin
          if VMGetNext = SQLITE_DONE then
            Result := grEOF
          else
            inc (FCurrRec);
        end {if}
        else
          Result := grEOF
      end {if}
      else begin
        inc (FCurrRec);
      end; {else}
    end; {gmNext}
    gmPrior: begin
      if (FCurrRec <= 0) then
        Result := grBOF
      else begin
        dec (FCurrRec);
      end; {else}
    end; {gmPrior}
  end; {case}

  if not (Result in [grOK]) then
    exit;

  i := 0;
  pDataIdx := 0;

  while (i <= FCurrRec) do begin
    pDataBuf := PRecData (FCache [i]);

    if (pDataBuf^.rdUpdateStatus = usDeleted) then
      inc (pDataIdx);

    inc (i);
  end; {while}

  pDataIdx := i + pDataIdx - 1;

  with PRecInfo (Buffer)^ do begin
    riBookmarkFlag := bfCurrent;
    riBookmark := FCurrRec;

    riDataPtr := FCache [pDataIdx];

//    riTest := FCache [pDataIdx]^.rdOrgData [0];
//    riTest1 := pDataIdx;
  end; {with/if}
end; (**)

procedure TSLDataSet.InternalHandleException;
begin
  {$IFDEF D6}
    ApplicationHandleException (Self);
  {$ELSE}
    Application.HandleException (Self); //Also Work on Kylix 1
  {$ENDIF}
end; (**)

procedure TSLDataSet.InternalClose;
var
  i,k: Integer;
  j,n: Integer;
  pRes: Integer;
  pErrMsg: String;
begin
  // first check if VM working.
  if FVM <> 0 then begin
    pRes := FDB.CloseVM (FVM, pErrMsg);

    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('Unable to close VM.' + CRLF +
                                 pErrMsg);

    FVM   := 0;
    FTail := '';
  end; {if}

  FActive := False;

  BindFields (False);

  if DefaultFields then
    DestroyFields;

  // free the memory
  if assigned (FCache) then begin
    k := Length (FCache) - 1;

    for i := 0 to k do begin
      n := Length (FCache [i].rdNewData) - 1;
      for j := 0 to n do
        if assigned (FCache [i].rdNewData [j]) then begin
{$IFDEF COUNT_DATA_ALLOC}
          dec(__Alloc_count);
{$ENDIF}
          FreeMem (FCache [i].rdNewData [j]);
        end; {if/for}
      FCache [i].rdNewData := nil;

      n := Length (FCache [i].rdOrgData) - 1;
      for j := 0 to n do
        if assigned (FCache [i].rdOrgData [j]) then begin
{$IFDEF COUNT_DATA_ALLOC}
          dec(__Alloc_count);
{$ENDIF}
          FreeMem (FCache [i].rdOrgData [j]);
        end; {if/for}
      FCache [i].rdOrgData := nil;

      FreeMem (FCache [i], sizeof (TRecData));
    end; {for}

    SetLength (FCache, 0);
  end;
end; (*TSLDataSet.InternalClose*)

function TSLDataSet.OpenVM: Integer;
var
  pTail: String;
  pErr:  String;
  pVM:   Integer;
  pErrMsg: String;
begin
  if not assigned (FDB) then
    raise ESQLiteError.Create ('Not connected to DB.');

  if FVM <> 0 then begin // free old VM first.
    Result := FDB.CloseVM (FVM, pErrMsg);

    if Result <> SQLITE_OK then
      exit; // Unable to close opened VM.
  end; {if}

  Result := FDB.OpenVM (FSQL.Text, pTail, pVM, pErr);

  if Result <> SQLITE_OK then
    exit // Unable to open VM.
  else begin
    FVM   := pVM;
    FTail := pTail;
  end; {else}

  // Getting first row and columns info.
  Result := VMGetNext;
end; (**)

function TSLDataSet.CloseVM: Integer;
var
  pErrMsg: String;
begin
  Result := SQLITE_OK;

  if FVM = 0 then
    exit;

  if not assigned (FDB) then
    raise ESQLiteError.Create ('Not connected to DB.');

  if FVM <> 0 then begin // free old VM first.
    Result := FDB.CloseVM (FVM, pErrMsg);

    if Result <> SQLITE_OK then
      exit; // Unable to close opened VM.

    FVM := 0; 
  end; {if}
end; (**)

function TSLDataSet.VMGetNext: Integer;
var
  pBuf: PRecData;
  pLen: Integer;

  pCount: Cardinal;
  pValues: PPCharArray;
  pNames: PPCharArray;
begin
  Result := SQLITE_OK;

  if FVM = 0 then
    exit; // no VM.

  Result := FDB.VMStep (FVM, pCount, Pointer (pValues), Pointer (pNames));

  if not (Result in [SQLITE_OK, SQLITE_ROW, SQLITE_DONE]) then
    exit
  else begin
// here - if done then free vm
    if (Result = SQLITE_DONE) then
      CloseVM;

    // instead system should test it anyware...
    if (Result in [SQLITE_ROW]) then
      Result := SQLITE_OK;
  end; {else}

  UpdateColumns (pCount, pValues, pNames);

  if not assigned (pValues) then
    exit;

  pLen := Length (FCache);
  SetLength (FCache, pLen + 1);

  pBuf := AllocMem (SizeOf (TRecData));
  FCache [pLen] := pBuf;

  with pBuf^ do begin
    rdChanged := TBits.Create;
    rdChanged.Size := FColCount;
  end; {with}

  UpdateRecord (pBuf, pCount, pValues, pNames);
end; (**)

function TSLDataSet_ExecCallback (Sender: TSLDataSet;
                                  Columns: Integer;
                                  ColumnValues: Pointer;
                                  ColumnNames: Pointer): integer; cdecl;
var
  pBuf: PRecData;
  pLen: Integer;
begin
  Result := 0;

  if not assigned (Sender) then
    exit;

// sender can be only dataset or database - db only sets pragma...
  if not (Sender is TSLDataSet) then
    exit;

  with Sender do
    if FCBFlag = cdfNormal then begin
      UpdateColumns (Columns,
                    PPCharArray (ColumnValues),
                    PPCharArray (ColumnNames));

      if not assigned (ColumnValues) then
        exit;

      pLen := Length (FCache);
      SetLength (FCache, pLen + 1);

      pBuf := AllocMem (SizeOf (TRecData));
      FCache [pLen] := pBuf;

      with pBuf^ do begin
        rdChanged := TBits.Create;
        rdChanged.Size := FColCount;
      end; {with}

      UpdateRecord (pBuf, Columns,
                    PPCharArray (ColumnValues),
                    PPCharArray (ColumnNames));
    end {if cbfNormal}
    else if FCBFlag = cdfRequery then begin
      pBuf := FCache [FCurrRec];

      UpdateRecord (pBuf, Columns,
                    PPCharArray (ColumnValues),
                    PPCharArray (ColumnNames));
    end; {if cbfRequery}
end; (*TSLDataSet_ExecCallback*)

function TSLDataSet.UpdateColumns (aCount:  Integer;
                                   aValues: PPCharArray;
                                   aNames:  PPCharArray): Boolean;
var
  i: Integer;
begin
  Result := False;

  if Length (FCache) <> 0 then
    exit; // wrong operation, maybe exception?

  FColCount := aCount;

  SetLength (FCols, aCount);

  for i := 0 to (aCount -1) do
    FCols [i].cdSrcName := aNames [i];


  if aNames [aCount] <> nil then // great types defined ;)))
//    for i := aCount to (2*aCount -1) do
// PDG 2003-11-07
    for i := aCount to (2*(aCount -1)) do
      FCols [i - aCount].cdType := aNames [i]
  else // in other case columns will be treated as text.
//    for i := aCount to (2*aCount -1) do
// PDG 2003-11-07
    for i := aCount to (2*(aCount -1)) do
      FCols [i - aCount].cdType := 'TEXT';

  Result := True;
end; (*TSLDataSet.UpdateColumns*)

function TSLDataSet.UpdateRecord (aRec:    PRecData;
                                  aCount:  Integer;
                                  aValues: PPCharArray;
                                  aNames:  PPCharArray): Boolean;
var
  i: Integer;
  pChrBuf: PChar;
begin
// right now it is almost procedure, but note that it is low level, so
// maybe allocation, numbers, names of columns or other errors should be
// detected...
//  Result := False;

  with aRec^ do begin
///     rdTimeStamp := now;

    if Length (rdNewData) > 0 then begin
      for i := 0 to length (rdNewData) - 1 do
        if assigned (rdNewData [i]) then begin
{$IFDEF COUNT_DATA_ALLOC}
          dec (__Alloc_count);
{$ENDIF}
          FreeMem (rdNewData [i]);
        end; {if / for}

      SetLength (rdNewData, 0);
    end; {if}

    if Length (rdOrgData) <> FColCount then
      SetLength (rdOrgData,  FColCount);

    for i := 0 to FColCount - 1 do begin
      if assigned (rdOrgData [i]) then begin
{$IFDEF COUNT_DATA_ALLOC}
        dec (__Alloc_count);
{$ENDIF}
        FreeMem (rdOrgData [i]);
      end; {if}

      if not assigned (PPCharArray (aValues) [i]) then
        rdOrgData [i] := nil
      else begin
        pChrBuf := PPCharArray (aValues) [i];
{$IFDEF COUNT_DATA_ALLOC}
        inc (__Alloc_count);
{$ENDIF}
        GetMem (rdOrgData [i], StrLen (pChrBuf) + 1);

        StrCopy (rdOrgData [i], pChrBuf);
      end; {else}
    end; {for}
  end; {with}

  Result := True;
end; (*TSLDataSet.UpdateRecord*)

function TSLDataSet.OpenWithGetTable (var anErr: String): Integer;
var
  pSLData:   PPChar;
//  pRes: Integer;
  pRecCount, pColCount: Cardinal;

  pBuf: PRecData;

  pIter: PPChar;
  pChrBuf: PChar;
  i,j: Integer;
begin
  Result := FDB.GetTable (FSQL.Text, Pointer (pSLData),
                          pRecCount, pColCount, anErr);

  if (Result <> SQLITE_OK) then
    exit;

  pIter := pSLData;

  // header
  FColCount := pColCount;

  SetLength (FCols, pColCount);
  for i := 0 to (pColCount -1) do begin
    FCols [i].cdSrcName := PChar (pIter^);
    FCols [i].cdType := 'TEXT';

    inc (pIter);
  end; {for}

  // data

  if pRecCount = 0 then
    exit;

  SetLength (FCache, pRecCount);

  for i := 0 to pRecCount - 1 do begin
    new (pBuf);
//    ZeroMemory (pBuf, sizeof (TRecData));
    FCache [i] := pBuf;

    with pBuf^ do begin
      rdUpdateStatus := usUnmodified;
///      rdTimeStamp := now;

      rdChanged := TBits.Create;
      rdChanged.Size := FColCount;

      SetLength (rdNewData, 0);
      SetLength (rdOrgData,  FColCount);

      for j := 0 to FColCount - 1 do begin

        if not assigned (PChar (pIter^)) then
          rdOrgData [j] := nil
        else begin
          pChrBuf := PChar (pIter^);
{$IFDEF COUNT_DATA_ALLOC}
          inc (__Alloc_count);
{$ENDIF}
          GetMem (rdOrgData [j], StrLen (pChrBuf) + 1);

          StrCopy (rdOrgData [j], pChrBuf);
        end; {else / for}

        inc (pIter);
      end; {for}
    end; {with}
  end; {for}

  FDB.FreeTable (pSLData);
end; (**)

procedure TSLDataSet.InternalOpen;
var
  pErr: String;
  pRes: Integer;
  i:    Integer;
begin
  if not assigned (FDB) then
    raise ESQLiteError.Create ('DataSet not connected to Database');
{ 2003.10.13 MZa - Let's say that it is job of DB - to be connected.
  if not assigned (FDB.FEngine) then
    raise ESQLiteError.Create ('Database no connected to Engine');
}
  if not FDB.Active then
    raise ESQLiteError.Create ('Database should be opened.');

  FActive   := False;
  FRecSize  := -1;
  FRecCount := 0;
  FDelCount := 0;
  FColCount := 0;

  FVM       := 0;
  FTAil     := '';

  FCBFlag := cdfNormal;

  pRes := SQLITE_ERROR;

  case FGettingMethod of
    gmCallback:
      try
        pRes := FDB.ExecSQL (Self, FSQL.Text, False, pErr);
      except
        on E:Exception do
          raise ESQLiteError.Create ('Failed calling SQLite_Exec.' + CRLF +
                                     E.Message);
      end;
    gmGetTable:
      pRes := OpenWithGetTable (pErr);
    gmVMachine:
      pRes := OpenVM;
  end; {case}

  if pRes <> SQLITE_OK then
    raise ESQLiteError.Create ('SQLite_Exec error.' + CRLF +
                               IntToStr (pRes)  + CRLF + pErr);
// if we are here every thing went ok...

// init of internal data.
  FActive := True;

  FRecCount := Length (FCache);
  FDelCount := 0;

  CheckUpdatingTableName; // get propper table name first
  ///???/// check out the info

  InitFieldDefs;
  if DefaultFields then begin
    CreateFields;

    for i := 0 to FieldCount - 1 do
      if (Fields [i].DataType = ftString) and
         (Fields [i].Size = 255) then
        Fields [i].DisplayWidth := 30;
  end; {if}

  BindFields (True);

  // BOF
  FCurrRec := -1;
end; (**)

procedure TSLDataSet.ExecSQL;
var
  pErr: String;
  pRes: Integer;
begin
  if not assigned (FDB) then
    raise ESQLiteError.Create ('DataSet not connected to Database');
{ 2003.10.13 MZa - Let's say that it is job of DB - to be connected.
  if not assigned (FDB.FEngine) then
    raise ESQLiteError.Create ('Database no connected to Engine');}
  if Active then
    Close;

  FCBFlag   := cdfInternal;
  FActive   := False;
  FRecSize  := -1;
  FRecCount :=  0;
  FDelCount :=  0;
  FCurrRec  := -1;

//  pRes := SQLITE_ERROR;

  try
    pRes := FDB.ExecSQL (Self, FSQL.Text, True, pErr);
  except
    on E:Exception do
      raise ESQLiteError.Create ('Failed calling SQLite_Exec.' + CRLF +
                                 E.Message);
  end;

  if pRes <> SQLITE_OK then
    raise ESQLiteError.Create ('SQLite_Exec error.' + CRLF +
                               IntToStr (pRes)  + CRLF + pErr);
end; (**)

function TSLDataSet.IsCursorOpen: Boolean;
begin
// if table is empty - there are no data, but cursor is open...
  Result := FActive;
end; (**)

function ToPartOfWhere (const aKeyField: String;
                        const aKeyValue: Variant;
                        Options: TLocateOptions): String;
begin
  if loPartialKey in Options then
    Result := '"%' + aKeyValue + '%"'
  else
    Result := '"' + aKeyValue + '"';

  if loCaseInsensitive in Options then
    Result := aKeyField + ' like ' + Result
  else
    Result := aKeyField + ' glob ' + Result;
end;

function TSLDataSet.BuildLocateQuery (const KeyFields: string;
                                      const KeyValues: Variant;
                                      Options: TLocateOptions): String;
var
  pStrs: TStringList;
  pRes: String;
  pBuf: String;
  i, pIdx: Integer;
begin
  pRes  := '';
  pStrs := TStringList.Create;
  Result := '';

  try
    pStrs.CommaText := KeyFields;
    if pStrs.Count = 0 then
      exit;

    if pStrs.Count > 1 then begin
      if VarType(KeyValues) <> varArray then begin
        pRes := 'Array of values expected';
        exit;
      end; {if}

      if (VarArrayHighBound (KeyValues, 1) - VarArrayLowBound (KeyValues, 1)) <>
         pStrs.Count then begin
        pRes := 'Number of key-fields and values in array difers';
        exit;
      end; {if}

      i := 0;
      for pIdx := VarArrayLowBound (KeyValues, 1) to
                  VarArrayHighBound (KeyValues, 1) do begin
        pBuf := ToPartOfWhere (pStrs.Strings [i], KeyValues [pIdx], Options);

        if Result = '' then
          Result := pBuf
        else
          Result := Result + ' and ' + pBuf;

        inc (i);
      end; {for}

      Result := 'select * from (' + 
                   StringReplace (FSQL.Text, CRLF, ' ', [rfReplaceAll, rfIgnoreCase])
              + ') where ' + Result;
    end {if}
    else begin
      pBuf := ToPartOfWhere (pStrs.Strings [0], KeyValues, Options);

      Result := 'select * from (' +
                   StringReplace (FSQL.Text, CRLF, ' ', [rfReplaceAll, rfIgnoreCase])
              + ') where ' + pBuf;
    end; {else}
  finally
    pStrs.Free;
  end; {try/finally}

  if pRes <> '' then begin// information about problems.
    Result := '';
    raise ESQLiteError.Create (pRes);
  end; {if}
end; (**)

function TSLDataSet.LocateRecData (const KeyFields: string;
                                   const KeyValues: Variant;
                                   Options: TLocateOptions;
                                   var aPos: Integer): PRecData;
var
  i, pIdx: Integer;
  pQry: String;
  pRows, pCols: Cardinal;

  pErr: String;
  pRes: Integer;

  pDBList: Pointer;
  pIter: PPChar;
  pId: String;

  pBuf: PChar;
begin
  Result  := nil;
  pDBList := nil;
  pIdx    := -1;
  aPos    := -1;

  for i := 0 to (FColCount - 1) do
    if Pos ('_ROWID_', FCols [i].cdFieldName) > 0 then begin
      pIdx := i;
      break;
    end; {if/for}

  if pIdx < 0 then
    exit;

  pQry := BuildLocateQuery (KeyFields, KeyValues, Options);
  if pQry = '' then
    exit;

  pRes := FDB.GetTable (pQry, pDBList, pRows, pCols, pErr);
  if pRows = 0 then
    exit;

  try
    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('error');

    pIter := pDBList;

    for i := 0 to pCols - 1 do
      inc (pIter);

    for i := 0 to pCols - 1 do begin
      if i = pIdx then begin
        pId := pIter^;

        break;
      end; {if}

      inc (pIter);
    end; {for}
    // VM !!!
  except
  end; {try/except}

  if assigned (pDBList) then
    FDB.FreeTable (pDBList);

  if pId = '' then
    exit;

  pBuf := nil;

  for i := 0 to FRecCount - 1 do begin
    with FCache [i]^ do
      case rdUpdateStatus of
        usUnmodified:
          pBuf := rdOrgData [pIdx];
        usModified, usInserted:
          pBuf := rdNewData [pIdx];
        usDeleted:
          continue;
      end; {case}

    if (pBuf = pId) then begin
      Result := FCache [i];
      aPos   := i;
      break;
    end; {if}
  end; {for}
end;

function TSLDataSet.InternalLocate (const KeyFields: string;
                             const KeyValues: Variant;
                             Options: TLocateOptions;
                             var aPos: Integer): PRecData;
var
  pStrs: TStringList;
  i,k, pBuf: Integer;
  pIdxs: array of Integer;
begin
  aPos := -1;
  Result := nil;

  // mapping
  pStrs := TStringList.Create;
  try
    try
      pStrs.CommaText := KeyFields;
      k := pStrs.Count;
      if k = 0 then
        exit;

      SetLength (pIdxs, k);
      for i := 0 to k - 1 do begin
        pBuf := FieldNameToIdx (pStrs.Strings [i]);
        if pBuf < 0 then
          exit;

        pIdxs [i] := pBuf;
      end; {for}

      if (VarArrayHighBound(KeyValues, 1) - VarArrayLowBound(KeyValues, 1)) <> (k - 1) then
        exit; // wrong number of key vals
    except
      exit;
    end; {try/except}
  finally
    pStrs.Free;
  end; {try/finally}

  // testing
  i := 0;
  while True do begin
//   for i := 0 to FRecCount - 1
{
  if VarIsArray(KeyValues) then
    TField(Fields.First).Value := KeyValues[0]
  else
    TField(Fields.First).Value := KeyValues;

}
    inc (i);
  end;
end; (*TSLDataSet.InternalLocate*)

function TSLDataSet.Locate (const KeyFields: string; const KeyValues: Variant; Options: TLocateOptions): Boolean;
var
  pIdx: Integer;
begin
  DoBeforeScroll;

  Result := False;

  pIdx := -1;

  { 2003.10.12 MZa - in the future SQLite engine can be used for
    locateing...
  LocateRecData (KeyFields, KeyValues, Options, pIdx);
  }

  if pIdx < 0 then
    exit;

  DisableControls;
  try
    First;
    MoveBy (pIdx);
  finally
    EnableControls;
  end; {try/finally}

//  DoAfterScroll;

  Result := True;
end; (*TSLDataSet.Locate*)

function TSLDataSet.Lookup (const KeyFields: string; const KeyValues: Variant; const ResultFields: string): Variant;
var
  pIdx:     Integer;
  pDataBuf: PRecData;
  pStrs: TStringList;
begin
  Result := Null;
  pStrs := TStringList.Create;
  try
    pStrs.CommaText := ResultFields;
    if pStrs.Count = 0 then
      exit;

    pDataBuf := LocateRecData (KeyFields, KeyValues, LOOKUP_OPTIONS, pIdx);

    if not assigned (pDataBuf) then
      exit;

    if pStrs.Count = 1 then begin // single value

    end  {if}
    else begin // 

    end; {else}
  finally
    pStrs.Free;
  end; {try/finally}

  /// create result from pDataBuf
end; (*TSLDataSet.Lookup*)

{ fields }

function TSLDataSet.IsFieldType (aType: String;
                                 const aTypeName: PChar;
                                 var aLen: Integer;
                                 var aPrec: Integer): Boolean;
var
  pTypeLen: Integer;
  pBuf: Double;
begin
  Result := False;

  pTypeLen := Length (aTypeName);
  if StrLIComp (PChar (aType), aTypeName, pTypeLen) <> 0 then
    exit;

  system.delete (aType, 1, pTypeLen + 1);
  system.delete (aType, Length (aType), 1);

  if aPrec = -1 then begin
    Result := True;
    aLen := 255;

    if Length (aType) = 0 then // some exceptions are avoided in debug mode
      exit;

    try
      aLen := StrToInt (aType);
    except
      aLen := 255;
    end; {try/except}

    exit;
  end {}
  else begin
    if Length (aType) = 0 then  // some exceptions are avoided in debug mode
      exit;

    try
      pBuf := StrToFloat (aType);
    except
      exit;
    end; {try/except}

    aLen := Trunc (Int (pBuf));

    pBuf := Frac (pBuf);
    while Frac (pBuf) <> 0 do
      pBuf := pBuf * 10;
    aPrec := Trunc (Int (pBuf));

    Result := True;
  end; {else}
end; (**)

function TSLDataSet.AddFieldDef (const aName: String;
                                 const aType: String): Integer;
var
  pLen: Integer;
  pPrec: Integer;
  pName: PChar;
  pBuf: String;
  pIdx: Integer;

  pFDef: TFieldDef;
begin
  pLen  := 255; // default field length
  pPrec :=  -1; // for IsFieldType

  if soHideTableName in FSLOptions then begin
    pName := AnsiStrPos (PChar (aName), '.');

    if assigned (pName) then
      inc (pName)
    else
      pName := PChar (aName);
  end
  else
    pName := PChar (aName);

  //2003.10.11 MZa - avoid name duplication.
  pBuf := pName;

  pIdx := 1;
  while (FieldDefs.IndexOf (pBuf) >= 0) do begin
    pBuf := pName + '_' + IntToStr (pIdx);
  end; {if}

  pName := PChar (pBuf);

  if (Pos ('char', aType) > 0) then begin
    if IsFieldType (aType, 'varchar', pLen, pPrec) then
      FieldDefs.Add (pName, ftString, pLen)
    else if IsFieldType (aType, 'nvarchar', pLen, pPrec) then
      FieldDefs.Add (pName, ftString, pLen)
    else if IsFieldType (aType, 'varyingcharacter', pLen, pPrec) then
      FieldDefs.Add (pName, ftString, pLen)
    else if IsFieldType (aType, 'nationalvaryingcharacter', pLen, pPrec) then
      FieldDefs.Add (pName, ftString, pLen);
  end {char}
  else if StrIComp (PChar (aType), 'text') = 0 then begin
    if soTextAsMemo in FSLOptions then
      FieldDefs.Add (pName, ftMemo)
    else
      FieldDefs.Add (pName, ftString, 255);
  end {text}
  else if (StrLIComp (PChar (aType), 'float', Length ('float')) = 0) then begin
    pLen  := 0;
    pPrec := 0;

    if IsFieldType (aType, 'float', pLen, pPrec) and
       (soRangedFloatsAsBCD in FSLOptions) then begin

      with FieldDefs do begin
        Add (pName, ftBCD, pLen);
        pFDef := Items [Count - 1];
      end; {with}

      pFDef.Precision := pPrec;
    end
    else
      FieldDefs.Add (pName, ftFloat);
  end {float/numeric}
  else if (StrLIComp (PChar (aType),
                      'numeric',
                      Length ('numeric')) = 0) then begin
    pLen  := 0;
    pPrec := 0;

    if IsFieldType (aType, 'numeric', pLen, pPrec) and
       (soRangedNumericsAsBCD in FSLOptions) then begin

      with FieldDefs do begin
        Add (pName, ftBCD, pLen);
        pFDef := Items [Count - 1];
      end; {with}

      pFDef.Precision := pPrec;
    end {if}
    else
      FieldDefs.Add (pName, ftFloat);
  end {float/numeric}
  else if StrIComp (PChar (aType), 'clob') = 0 then
    FieldDefs.Add (pName, ftMemo)
  else if StrIComp (PChar (aType), 'blob') = 0 then
    FieldDefs.Add (pName, ftBLOB)
  else if StrIComp (PChar (aType), 'boolean') = 0 then
    FieldDefs.Add (pName, ftBoolean)
  else if (StrIComp (PChar (aType), 'integer') = 0) or
     (StrIComp (PChar (aType), 'int') = 0) then
    FieldDefs.Add (pName, ftInteger)
  else if StrIComp (PChar (aType), 'timestamp') = 0 then
    FieldDefs.Add (pName, ftDateTime)
  else
    // by default all fields are string of 255 chars length
    FieldDefs.Add (pName, ftString, 255);

  Result := FieldDefs.Count - 1;
end; (*AddFieldDef*)

procedure TSLDataSet.InternalInitFieldDefs;
var
  pName: String;
  pType: String;
  i:     Integer;
  pIdx:  Integer;

  pFDef: TFieldDef;
  pBuf:  PChar;
begin
  FieldDefs.Clear;

  if FColCount = 0 then
    exit;

// MZa 2003.09.08 - storing information about column that contains rowid index.
  FColRowId := -1;

  try
    for i := 0 to (FColCount - 1) do begin
      pName := FCols [i].cdSrcName;
      pType := FCols [i].cdType;
      pType := LowerCase (pType);

      pIdx  := AddFieldDef (pName, pType);
      pFDef := FieldDefs.Items [pIdx];

      // if field is rowid
      if Pos ('_ROWID_', pName) > 0 then begin
//        FieldDefs.Add (pName, ftInteger);
//        pFDef := FieldDefs.Items [i];

        pFDef.Attributes := pFDef.Attributes + [Db.faReadonly];

        if (soHideROWIDs in FSLOptions) then
          pFDef.Attributes := pFDef.Attributes + [Db.faHiddenCol];

        FCols [i].cdFieldName := pName;

        FColRowId := i;

        continue;
      end; {if}

      if (Pos ('.', pName) <= 0) or
         (LastDelimiter ('|*/-+^&!@#$%()', pName) > 0) then begin
                                              // computed so readonly
        pFDef.Attributes := pFDef.Attributes + [Db.faReadonly];

        FCols [i].cdFieldName := pName;
      end {if}
      else begin
        pBuf := AnsiStrPos (PChar (pName), '.');

        if assigned (pBuf) then
          inc (pBuf)
        else
          pBuf := PChar (pName);

        FCols [i].cdFieldName := pBuf;
      end;
    end; {for}
  finally
  end; {try/finally}
end; (**)

{ navigation }

procedure TSLDataSet.InternalFirst;
begin
  FCurrRec := -1;
end; (**)

procedure TSLDataSet.InternalLast;
begin
  FCurrRec := GetRecordCount;
end; (**)

{ edit }

procedure TSLDataSet.InternalInitRecord (Buffer: PChar);
var
  i:   Integer;
  pBuf: PRecData;
begin
  pBuf := AllocMem (SizeOf (TRecData));
  with pBuf^ do begin
    rdUpdateStatus := usInserted;

    SetLength (rdOrgData, 0);
    SetLength (rdNewData, FColCount);

    rdChanged := TBits.Create;
    rdChanged.Size := FColCount;

    for i := 0 to (FColCount -1) do begin
      rdChanged [i] := True;
      rdNewData [i] := nil;
    end; {for}

///    rdTimeStamp := now;
  end; {with}

  i := Length (FCache);
  SetLength (FCache, i + 1);
  FCache [i] := pBuf;

  with PRecInfo (Buffer)^ do begin
    riBookmark := -1;

    riDataPtr  := pBuf;

    QueryDefaults (riDataPtr);
  end; {with}

  SetModified (True);
end; (**)

procedure TSLDataSet.QueryDefaults (aRec: PRecData);
var
  pFields: TStringList;
  i:       Integer;
  pQry:    String;
  pTblInfo: TTblInfo;

  pErr: String;
  pRes: Integer;

  pDBList: Pointer;
  pIter: PPChar;

  pRows, pCols: Cardinal;
begin
  pFields := TStringList.Create;
  pDBList := nil;

  if not assigned (aRec) then
    exit; // maybe error here?

  try
    for i := 0 to Length (FCols) - 1 do
      pFields.Add (FCols [i].cdFieldName);

    pTblInfo := FDB.GetTblInfo (FUpdTblName);

    if assigned (pTblInfo) then
      pQry := pTblInfo.GetDefaultsSQL (pFields);

    pRes := FDB.GetTable (pQry, pDBList, pRows, pCols, pErr);
    if pRes <> SQLITE_OK then
      exit; // error here!
    if (pRows = 0) or (pCols = 0) then
      exit;

    pIter := pDBList;

    for i := 0 to pCols - 1 do
      inc (pIter);

    for i := 0 to (pCols - 1) do begin
// 2003.10.16 MZa - rowid can be somewere else then at the first column...
      if (Pos ('_ROWID_',pFields.Strings [i]) > 0) or
         (not assigned (pIter^)) then begin
        inc (pIter);

        continue;
      end; {if}
{$IFDEF COUNT_DATA_ALLOC}
      inc (__Alloc_count);
{$ENDIF}
      GetMem (aRec^.rdNewData [i], StrLen (pIter^) + 1);
      StrCopy (aRec^.rdNewData [i], pIter^);

      inc (pIter);
    end; {for}
  finally
    pFields.Free;
    
    if assigned (pDBList) then
      FDB.FreeTable (pDBList);
  end; {try/finally}
end; (*TSLDataSet.QueryDefaults*)

procedure TSLDataSet.InternalAddRecord (Buffer: Pointer; Append: Boolean);
begin
  with PRecInfo (Buffer)^ do begin

//    rdUpdateStatus := usInserted;

  end; {with}

///  PostInsert (Buffer);

///  Inc (FRecCount);
///  InternalSetToRecord (Buffer);
end; (**)

procedure TSLDataSet.InternalDelete;
var
  pErr: String;
  pRes: Integer;

  pVal:    String;
  pDel:    String;
  pWhere:  String;

  i:    Integer;

  pAB: PRecInfo;
  pDataBuf: PRecData;
begin
  pAB := PRecInfo (ActiveBuffer);

  if not assigned (pAB) then
    exit; // nothing to delete

  FCBFlag := cdfInternal;
  try
    pWhere := '';

    pDataBuf := PRecData (pAB^.riDataPtr);

    if assigned (pDataBuf) then begin
      if soUseROWIDs in FSLOptions then begin // rowid based where
        if FColRowId < 0 then
          exit; // do not know how to accesses row to delete...

        if Length (pDataBuf^.rdOrgData) = 0 then begin
          pDataBuf^.rdUpdateStatus := usDeleted;

          exit; // unable to delete if no data specified
        end; {if}

        pVal := pDataBuf^.rdOrgData [FColRowId];
        pWhere := ' where rowid = "' + pVal + '"';
      end
      else begin // full where
        if Length (pDataBuf^.rdOrgData) = 0 then begin
          pDataBuf^.rdUpdateStatus := usDeleted;

          exit; // unable to delete if no data specified
        end; {if}

        for i := 0 to FColCount - 1 do begin
          pVal := pDataBuf^.rdOrgData [i];
          if pWhere = '' then
            pWhere := ' where ' + FCols [i].cdFieldName + '="' + pVal + '"'
          else
            pWhere := pWhere + ' and ' +
                      FCols [i].cdFieldName + '="' + pVal + '"';
        end; {for}
      end; {else}
    end
    else
      exit; // don't know what to delete

    i := Pos (' ', FUpdTblName);
    if i > 0 then
      pDel := system.copy (FUpdTblName, 1, i)
    else
      pDel := FUpdTblName;

    pDel := 'delete from ' + pDel + pWhere;

    pRes := FDB.ExecSQL (Self, pDel, True, pErr);

    if pRes <> SQLITE_OK then
      exit;

    pDataBuf^.rdUpdateStatus := usDeleted;

    inc (FDelCount);
  finally
    FCBFlag := cdfNormal;
  end; {try/finally}

  if pRes <> SQLITE_OK then
    raise ESQLiteError.Create ('Unable to delete. ' + CRLF +
                               IntToStr (pRes)  + CRLF + pErr);
end; (**)

procedure TSLDataSet.RequeryRecord (aRec: PRecData);
var
  pReqSQL: String;
  pRes:    Integer;
  pErr:    String;
  pCFFlag: TCBDtSetFlag;
begin
  if FColRowId < 0 then
    exit;

  // requering record - based on rowid
  pReqSQL := 'select t.* from ( ' + FSQL.Text + ' ) t where rowid = ' +
             aRec.rdOrgData [FColRowId];

  pCFFlag := FCBFlag;
  FCBFlag := cdfRequery;
  pRes := SQLITE_OK;

  try
    pRes := FDB.ExecSQL (Self, 'PRAGMA SHOW_DATATYPES=OFF', False, pErr);

    if pRes = SQLITE_OK then
      pRes := FDB.ExecSQL (Self, pReqSQL, False, pErr);
  finally
{ 2003.10.13 MZa - it is better not to hide error. }  
    if pRes = SQLITE_OK then
      pRes := FDB.ExecSQL (Self, 'PRAGMA SHOW_DATATYPES=ON', False, pErr)
    else
      FDB.ExecSQL (Self, 'PRAGMA SHOW_DATATYPES=ON', False, pErr);

    FCBFlag := pCFFlag;
  end; {try/except}

  if pRes <> SQLITE_OK then begin
    // problems here!!! check pErr
  end; {if}
end;

procedure TSLDataSet.PostUpdate (aRec: PRecInfo);
var
  pRes: Integer;
  pErr: String;

  pVal: String;

  pUpd:   String;
  pSets:  String;
  pWhere: String;

  i:    Integer;
  pOK:  Boolean;

  pDataBuf: PRecData;
begin
  pOK  := False;

  pSets := '';
  pWhere := '';

  pDataBuf := PRecData (aRec^.riDataPtr);

  for i := 0 to FColCount - 1 do begin
    if soUseROWIDs in FSLOptions then begin // rowid based where
      pVal := pDataBuf^.rdOrgData [i];

      if Pos ('_ROWID_', FCols [i].cdFieldName) > 0 then
        pWhere := ' where rowid = "' + pVal + '"';
    end  {if}
    else begin // full where
      if pWhere = '' then
        pWhere := ' where ' + FCols [i].cdFieldName + '="' + pVal + '"'
      else
        pWhere := pWhere + ' and ' + FCols [i].cdFieldName + '="' + pVal + '"';
    end; {else}

    if pDataBuf^.rdChanged [i] then begin
      pOK := True;

      if not assigned (pDataBuf^.rdNewData [i]) then
        pVal := 'NULL'
      else
        pVal := QuotedStr (pDataBuf^.rdNewData [i]);
//        pVal := '"' + pDataBuf^.rdNewData [i] + '"';

      if pSets = '' then
        pSets := ' set ' + FCols [i].cdFieldName + '=' + pVal
      else
        pSets := pSets + ', ' + FCols [i].cdFieldName + '=' + pVal;
    end; {if}
  end; {for}

  if pOK and (pWhere <> '') then begin
    i := Pos (' ', FUpdTblName);
    if i > 0 then
      pUpd := system.copy (FUpdTblName, 1, i)
    else
      pUpd := FUpdTblName;

    pUpd := 'update ' + pUpd + ' ' +
            pSets + pWhere;

    pRes := FDB.ExecSQL (Self, pUpd, True, pErr);
  end {if}
  else
    pRes := SQLITE_ERROR;

//  if pRes = SQLITE_CONSTRAINT constraint violation
  if pRes <> SQLITE_OK then
    raise ESQLiteError.Create ('Unable to call update.' + CRLF + pUpd  + CRLF +
                               IntToStr (pRes)  + CRLF + pErr);


  for i := 0 to FColCount - 1 do
    if pDataBuf^.rdChanged [i] then begin
      if not assigned (pDataBuf^.rdNewData [i]) then begin
{$IFDEF COUNT_DATA_ALLOC}
        dec (__Alloc_count);
{$ENDIF}
        FreeMem (pDataBuf^.rdOrgData [i]);
        pDataBuf^.rdOrgData [i] := nil;
      end {if}
      else begin
{$IFDEF COUNT_DATA_ALLOC}
        inc (__Realloc_count);
{$ENDIF}
        FreeMem (pDataBuf^.rdOrgData [i]);
        GetMem (pDataBuf^.rdOrgData [i], StrLen (pDataBuf^.rdNewData [i]) + 1);
        StrCopy (pDataBuf^.rdOrgData [i], pDataBuf^.rdNewData [i]);
      end; {else}

      pDataBuf^.rdChanged [i] := False;
    end; {if/for}

  SetLength (pDataBuf^.rdNewData, 0);

  RequeryRecord (pDataBuf);
end; (**)

procedure TSLDataSet.PostInsert (aRec: PRecInfo);
var
  pErr: String;

  pVal: String;

  pIns:    String;
  pFNames: String;
  pFVals:  String;

  i:  Integer;
  pOK:  Boolean;

  pDataBuf: PRecData;
  pRes: Integer;
begin
  pOK := False;

  pFNames := '';
  pFVals := '';

  pDataBuf := PRecData (aRec^.riDataPtr);

  for i := 0 to FColCount - 1 do begin
    pVal := FCols [i].cdFieldName;

    if Pos ('_ROWID_', pVal) > 0 then
      continue;

    if pDataBuf^.rdChanged [i] then begin
      pOK := True;

      pVal := FCols [i].cdFieldName;
      if pFNames = '' then
        pFNames := ' (' + pVal
      else
        pFNames := pFNames + ',' + pVal;

      if not assigned (pDataBuf^.rdNewData [i]) then
        pVal := 'NULL'
      else
        pVal := QuotedStr (pDataBuf^.rdNewData [i]);

      if pFVals = '' then
        pFVals := ' values (' + pVal
      else
        pFVals := pFVals + ',' + pVal;
    end; {if}
  end; // for  

  if pOK then begin
    i := Pos (' ', FUpdTblName);
    if i > 0 then
      pIns := system.copy (FUpdTblName, 1, i)
    else
      pIns := FUpdTblName;

    pIns := 'insert into ' + pIns +
               pFNames + ')' +
               pFVals + ')';

    pRes := FDB.ExecSQL (Self, pIns, True, pErr);

    if pRes <> SQLITE_OK then
      raise ESQLiteError.Create ('Can''t call insert. ' + CRLF + pIns);

    inc (FRecCount);

    SetLength (pDataBuf^.rdOrgData, FColCount);

    for i := 0 to FColCount - 1 do begin
      if not assigned (pDataBuf^.rdNewData [i]) then begin
        pDataBuf^.rdOrgData [i] := nil;
      end  {if}
      else begin
{.$IFDEF COUNT_DATA_ALLOC
        2003.10.27 MZa - tu nie, bo jest allokacja + zwolnienie
        inc (__Alloc_count);
 .$ENDIF}
        GetMem (pDataBuf^.rdOrgData [i], StrLen (pDataBuf^.rdNewData [i]) + 1);
        StrCopy (pDataBuf^.rdOrgData [i], pDataBuf^.rdNewData [i]);
        FreeMem (pDataBuf^.rdNewData [i]);
      end; {else}

      pDataBuf^.rdChanged [i] := False;
    end; {for}

    SetLength (pDataBuf^.rdNewData, 0);

    aRec^.riBookmark := CurrentRecord;

// move to currect position...
    for i := Length (FCache) - 2 downto CurrentRecord do
      FCache [i + 1] := FCache [i];

    FCache [CurrentRecord] := pDataBuf;
  end; {if}

// retrive rowid
{$IFDEF COUNT_DATA_ALLOC}
  inc (__Alloc_count);
{$ENDIF}

  pVal := IntToStr (FDB.LastInsertRow);
  GetMem (pDataBuf^.rdOrgData [FColRowId], Length (pVal) + 1);
  StrCopy (pDataBuf^.rdOrgData [FColRowId], PChar (pVal));
  pDataBuf^.rdOrgData [FColRowId][Length (pVal)] := #0;

  RequeryRecord (pDataBuf);
end; (**)

procedure TSLDataSet.InternalPost;
var
  pAB: PRecInfo;
begin
// for D5 compatibility
//  inherited InternalPost;

  FCBFlag := cdfInternal;
  try
    pAB := PRecInfo (ActiveBuffer);

    if assigned (pAB) then
      if (State = dsEdit) then
        PostUpdate (pAB)
      else
        PostInsert (pAB);

    with (PRecData (pAB^.riDataPtr))^ do
      rdUpdateStatus := usUnmodified;
  finally
    FCBFlag := cdfNormal;
  end; {try/finally}
end; (**)

procedure TSLDataSet.InternalCancel;
var
  pAB: PRecInfo;
  pDataBuf: PRecData;
  i,k: Integer;
begin
// for D5 compatibility
//  inherited InternalCancel;

  pAB := PRecInfo (ActiveBuffer);

  pDataBuf := PRecData (pAB^.riDataPtr);

  case pDataBuf^.rdUpdateStatus of
    usInserted: begin
      pDataBuf^.rdUpdateStatus := usDeleted;

      inc (FRecCount);
      inc (FDelCount);

      UpdateCursorPos;
    end; {usInserted}
    usModified: begin
      k := Length (pDataBuf^.rdNewData) - 1;
      for i := 0 to k do
        if assigned (pDataBuf^.rdNewData [i]) then begin
{$IFDEF COUNT_DATA_ALLOC}
          dec(__Alloc_count);
{$ENDIF}
          FreeMem (pDataBuf^.rdNewData [i]);
        end; {if/for}

      SetLength (pDataBuf^.rdNewData, 0);
    end; {usModified}
  end; {case}

  with (PRecData (pAB^.riDataPtr))^ do
    if rdUpdateStatus <> usDeleted then
      rdUpdateStatus := usUnmodified;
end; (**)

{ bookmarks }

procedure TSLDataSet.GetBookmarkData (Buffer: PChar; Data: Pointer);
begin
  if (Data <> nil) then
    PInteger (Data)^ := FCurrRec;
end; (**)

procedure TSLDataSet.SetBookmarkData (Buffer: PChar; Data: Pointer);
begin
  if assigned (Data) then
    PRecInfo (Buffer)^.riBookmark := PInteger (Data)^;
end; (**)

function TSLDataSet.GetBookmarkFlag (Buffer: PChar): TBookmarkFlag;
begin
  Result := PRecInfo (Buffer)^.riBookmarkFlag;
end; (**)

procedure TSLDataSet.SetBookmarkFlag (Buffer: PChar; Value: TBookmarkFlag);
begin
  PRecInfo (Buffer)^.riBookmarkFlag := Value;
end; (**)

procedure TSLDataSet.InternalGotoBookmark (Bookmark: Pointer);
begin
  FCurrRec := PInteger (Bookmark)^;
end; (**)

procedure TSLDataSet.InternalSetToRecord (Buffer: PChar);
begin
  FCurrRec := PRecInfo (Buffer)^.riBookmark;
end; (**)

function TSLDataSet.BookmarkValid (Bookmark: TBookmark): Boolean;
//var
//  TempCurrent: long;
//  Buff: PChar;
begin
  Result := False;

  if not assigned (Bookmark) then
    exit;

  Result := PInteger (Bookmark)^ < FRecCount;

{
  // check that this is not a fully deleted record slot
  if Result then begin
    TempCurrent := FCurrentRecord;
    FCurrentRecord := PInteger(Bookmark)^;
    Buff := ActiveBuffer;
    if (PRecordData(Buff)^.rdUpdateStatus = usDeleted) and
       (PRecordData(Buff)^.rdCachedUpdateStatus = cusUnmodified) then
      Result := false;
    FCurrentRecord := TempCurrent;
  end;
}
end; (**)

function TSLDataSet.CompareBookmarks (Bookmark1,
                                      Bookmark2: TBookmark): Integer;
begin
  Result := 0;
end; (**)

{ info }

function TSLDataSet.GetCanModify: Boolean;
begin
  // MZa - 2003.09.02 check if column with rowid is available.
  Result := (not FReadOnly) and assigned (FindField ('_ROWID_'));
end; (**)

function TSLDataSet.GetRecordCount: Integer;
begin
  if not IsCursorOpen then
    Result := 0
  else
    Result := FRecCount - FDelCount;
end; (**)

function TSLDataSet.GetRecNo: Integer;
var
  pBuf: PRecInfo;
begin
  pBuf := PRecInfo (ActiveBuffer);

  if (not FActive) or (not assigned (pBuf)) then
    Result := -1
  else begin
    Result := pBuf^.riBookmark + 1;
  end; {else}
end; (**)

procedure TSLDataSet.SetRecNo(Value: Integer);
begin
  CheckBrowseMode;

  if (Value < 1) then
    Value := 1
  else
    if Value > FRecCount then begin
      InternalLast;

      Value := Min (FRecCount, Value);
    end; {if/else}

  if (Value <> RecNo) then begin
    DoBeforeScroll;

    FCurrRec := Value - 1;

    Resync([]);
    DoAfterScroll;
  end; {if}
end; (**)

function TSLDataSet.GetRecordSize: Word;
begin
  if FRecSize <> -1 then begin
    Result := FRecSize;

    exit;
  end; {if}

  Result := SizeOf (PPChar);

  FRecSize := Result;
end; (**)

function TSLDataSet.UpdateStatus: TUpdateStatus;
var
  pDataBuf: PRecData;
begin
  if Active then
    if ActiveBuffer <> nil then begin
      pDataBuf := PRecData (PRecInfo(ActiveBuffer)^.riDataPtr);
      result := pDataBuf^.rdUpdateStatus;
    end
    else
      result := usUnmodified
  else
    result := usUnmodified;
end;

{ fields }

procedure TSLDataSet.SetFieldData (Field : TField; Buffer : Pointer;
                                   NativeFormat : Boolean);
var
  pAB: PRecInfo;
  pIdx: Integer;
  pBuf: String;
  pDataBuf: PRecData;

begin
  pAB := PRecInfo (ActiveBuffer);

  if (pAB = nil) then
    exit; // maybe exception??

  pDataBuf := PRecData (pAB^.riDataPtr);

  pIdx := Field.FieldNo - 1;

  with pDataBuf^ do begin
    if rdUpdateStatus <> usInserted then
      rdUpdateStatus := usModified;
    
    if Length (rdNewData) = 0 then
      SetLength (rdNewData, FColCount);
  end; {with}    

  if assigned (Buffer) then begin
    if Field.DataType in [ftDate, ftTime, ftDateTime] then begin
      try
        pBuf := FloatToStr (PDouble (Buffer)^);
      except
        pBuf := '';
      end; {try/except}
    end {if ftDate, ftTime, ftDateTime}
    else if Field.DataType in [ftFloat] then begin
      DecimalSeparator := '.';

      try
        pBuf := FloatToStr (PDouble (Buffer)^);
      except
        pBuf := '';
      end; {try/except}

      DecimalSeparator := ',';
    end {if ftFloat}
    else if Field.DataType in [ftInteger] then begin
      try
        pBuf := IntToStr (PInteger (Buffer)^);
      except
        pBuf := '';
      end; {try/except}
    end {if ftInteger}
    else if Field.DataType in [ftBCD] then begin
      try
        pBuf := FloatToStr (PDouble (pBuf)^);
      except
        pBuf := '';
      end; {try/except}
    end {if ftBCD}
    else
      pBuf := PChar (Buffer);
  end {if}
  else begin
    // buffer is nil, so NULL should be set.
    if assigned (pDataBuf^.rdNewData [pIdx]) then begin
      // there is allocated object.
{$IFDEF COUNT_DATA_ALLOC}
      inc (__Alloc_count);
{$ENDIF}
      FreeMem (pDataBuf^.rdNewData [pIdx]);

      pDataBuf^.rdNewData [pIdx] := nil;
    end; {if}
  end; {else}

  if not assigned (pDataBuf^.rdNewData [pIdx]) then begin
{$IFDEF COUNT_DATA_ALLOC}
    inc (__Alloc_count);
{$ENDIF}
    GetMem (pDataBuf^.rdNewData [pIdx], Length (pBuf) + 1);
    StrCopy (pDataBuf^.rdNewData [pIdx], PChar (pBuf));
  end  {if}
  else begin
{$IFDEF COUNT_DATA_ALLOC}
    inc (__Realloc_count);
{$ENDIF}
    FreeMem (pDataBuf^.rdNewData [pIdx]);
    GetMem (pDataBuf^.rdNewData [pIdx], Length (pBuf) + 1);
    StrCopy (pDataBuf^.rdNewData [pIdx], PChar (pBuf));
  end; {else}

  pDataBuf^.rdChanged [pIdx] := True;

  SetModified (True);
end; (**)

procedure TSLDataSet.SetFieldData (Field: TField; Buffer: Pointer);
begin
  SetFieldData (Field, Buffer, False);
end; (**)

function TSLDataSet.GetFieldData (Field: TField; Buffer: Pointer;
                                  NativeFormat: Boolean): Boolean;
var
  pBuf: PChar;
  pAB:  PRecInfo;
  pDataBuf: PRecData;

  pIdx: Integer;
  pDbl: Double;
  pDtTm: TDateTime;
  pInt: Integer;
  pCurr: Currency;
begin
  pAB := PRecInfo (ActiveBuffer);

  Result := False;
  if not assigned (pAB) then
    exit;
  if not assigned (Buffer) then
    exit;

//
//  if pAB^.riUpdateStatus = usDeleted then
//    exit;
  pDataBuf := PRecData (pAB^.riDataPtr);
  if not assigned (pDataBuf) then
    exit;

  pIdx := Field.FieldNo - 1;

  if pDataBuf^.rdChanged [pIdx] then begin
    if length (pDataBuf^.rdNewData) < (pIdx + 1) then
      pBuf := nil
    else
      pBuf := pDataBuf^.rdNewData [pIdx]
  end {if}
  else
    if length (pDataBuf^.rdOrgData) < (pIdx + 1) then
      pBuf := nil
    else
      pBuf := pDataBuf^.rdOrgData [pIdx];

  Result := assigned (pBuf);

  if Result then begin
    if (Field.DataType in [ftDate, ftTime, ftDateTime,
                           ftInteger, ftFloat, ftBCD]) and
       ((pBuf = '') or (not assigned (pBuf)))
        then begin

      Result := False;

      exit;
    end; {if}

    if Field.DataType in [ftDate, ftTime, ftDateTime] then begin
      try
        pDtTm := StrToFloat (pBuf);
      except
        try
          pDtTm := StrToDateTime (pBuf);
        except
          Result := False;
        end; {try/except}
      end; {try/except}

      if Result then
        CopyMemory (Buffer, @pDtTm, SizeOf (pDtTm));
    end {if ftDate, ftTime, ftDateTime}
    else if Field.DataType in [ftFloat] then begin
      DecimalSeparator := '.';

      if pBuf = '' then
        pDbl := 0
      else
        try
          pDbl := StrToFloat (pBuf);
        except
          Result := False;
        end; {try/except}

      if Result then begin
        DecimalSeparator := ',';

        CopyMemory (Buffer, @pDbl, SizeOf (pDbl));
      end; {if}  
    end {if ftFloat}
    else if Field.DataType in [ftInteger] then begin
      if pBuf = '' then
        pInt := 0
      else
        try
          pInt := StrToInt (pBuf);
        except
          Result := False;
        end; {try/except}

      if Result then
        CopyMemory (Buffer, @pInt, SizeOf (pInt));
    end {if ftInteger}
    else if Field.DataType in [ftBCD] then begin
      try
        pCurr := StrToFloat (pBuf);
      except
        Result := False;
      end; {try/except}

      if Result then
        CopyMemory (Buffer, @pCurr, SizeOf (pCurr));
    end {if ftBCD}
    else
      CopyMemory (Buffer, pBuf, StrLen (pBuf) + 1);
  end; {if}
end; (**)

end { SLDataSet }.
