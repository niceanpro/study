(***
  @abstract(The @name  - fuction's and aggregation's components for SQLite)
  @author(Michal Zaborowski <michal.zaborowski@wp.pl>) *)
unit SLFunAgr;

interface

{$I SLDefs.inc}

uses
// 2003.10.25 Paul - For compatibility with Kylix 1
  SysUtils,
  {$IFDEF WIN32} Windows, {$ELSE} Libc, {$ENDIF}
  Classes, Contnrs, DB,

  SLTypes,
  SLDB,
  SLEngine;

type
  (*** @abstract(Type of function's result)*)
  TSLFunResType = (frText, frNumeric);

  (*** @abstract(Base class for functions and aggregations)
  This class is registered in @link (TFunArgManager), so both functions and
  aggregations can be stored in one manager. When @link(TSLCustomFun.Active)
  is true function's object is registered in. *)
  TSLCustomFun = class (TComponent)
  protected
    FActive:  Boolean;
    FDB:      TSLDatabase;
    FFunName: String;
    FHandle:  Pointer;
    FResType: TSLFunResType;

    procedure SetActive (const aValue: Boolean); virtual; abstract;
    procedure SetDB (const aValue: TSLDatabase);

    procedure Loaded; override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure SetResultString (aFunObject: TObject; const aRes: String);
    procedure SetResultInt (aFunObject: TObject; const aRes: Integer);
    procedure SetResultDouble (aFunObject: TObject; const aRes: Double);
    procedure SetResultError (aFunObject: TObject; const aRes: String);

    function  UserData (aFunObject: TObject): Pointer;

    function  AggregateContext (aFunObject: TObject; nBytes: Integer): Pointer;
    function  AggregateCount (aFunObject: TObject): Pointer;

    (*** @abstract(Pointer used by SQLite to recognise function)*)
    property Handle: Pointer
      read FHandle;
  published
    (*** @abstract(function/aggregation is registered in SQLite engine / DB
      There is no deactivation API function so once activated function will
      be active until dabtabase deactivation.
    *)
    property Active: Boolean
      read FActive write SetActive;
    (*** @abstract(Database in which function is registered (created))*)
    property Database: TSLDatabase
      read FDB write SetDB;
    (*** @abstract(Name of function / aggregation used in query)*)
    property FunName: String
      read FFunName write FFunName;

    property ResultType: TSLFunResType
      read FResType write FResType default frNumeric;
  end;

  { TSLFunction }
  TOnFunction = procedure (Sender: TObject;
                           aParams: TStrings) of object;

  (*** @abstract(Function class component)
  Duering query execution SQLite calls callback to determine result of function
  or aggregation. From the manager callback can get pointer to function's object
  and call @link(TSLFunction.DoFunction) protected method. Here number of params
  is checked - in case of problems an error is reported. The Method converts
  array of PChar to TStringList so the engine is separated from your code but
  one convertion more is done. At the end event @link(TSLFunction.OnFunction)
  is called.
  <p> Parameters are passed as TStrings. Do not change list object - it is
  common for all calls. You can change values, but I have no idea why.*)
  TSLFunction = class (TSLCustomFun)
  private
    FOnFun:  TOnFunction;
  protected
    FParamCount: Integer;
    FParams: TStringList;

    (*** Writter of property ParamCount. It allocates space for
    param list.*)
    procedure SetParamCount (const aValue: Integer);

    (*** @abstract (Main process of encounting function result)
    First number of params is checked - in case of problems an error is
    reported. The Method converts array of PChar to TStringList so the
    engine is separated from your code but one convertion more is done.
    At the end event @link(TSLFunction.OnFunction) is called. *)
    procedure SetActive (const aValue: Boolean); override;

    procedure DoFunction (const aParamCount: Integer;
                          const aParams: PPCharArray); virtual;
  public
    constructor Create (AOwner: TComponent); override;
    destructor  Destroy; override;

    function  GetCallBackPtr: Pointer; virtual;
    function  GetResTypeAsInt: Integer;
  published
    (*** @abstract(Number of parameters used by function) *)
    property ParamCount: Integer
      read FParamCount write SetParamCount default 0;

    (*** @abstract(Event for function encounting)
    You can be sure that number of params is propper. Results should be returned
    with one of methods @link(TSLDatabase.SetResultString),
    @link(TSLDatabase.SetResultInt), @link(TSLDatabase.SetResultDouble) - depends
    on the result's type. In case of problems @link(TSLDatabase.SetResultError)
    method should be called *)
    property OnFunction: TOnFunction
      read FOnFun write FOnFun;
  end; { TSLFunction }

procedure Register;

implementation

{$R SLFunAgr.dcr}

procedure Register;
begin
  RegisterComponents (COMPONENT_TAB_NAME, [TSLFunction]);
end;

(*******************************************************************************
            TSLCustomFun
 ******************************************************************************)

constructor TSLCustomFun.Create (AOwner: TComponent);
begin
  inherited;
  
  FResType := frNumeric;
end; (**)

destructor TSLCustomFun.Destroy;
begin
  if Active then
    Active := False;

  inherited;
end; (**)

procedure TSLCustomFun.Loaded;
begin
  inherited;
end; (**)

procedure TSLCustomFun.SetDB (const aValue: TSLDatabase);
begin
  if FDB = aValue then
    exit;

  if not assigned (FDB) then
    Active := False; // 2003.10.22 MZa - deactivation

  FDB := aValue;
end; (**)

procedure TSLCustomFun.SetResultString (aFunObject: TObject; const aRes: String);
begin
  FDB.Engine.SQLite_SetResultString (Handle,
                                     PChar(aRes), Length (aRes));
end; (**)

procedure TSLCustomFun.SetResultInt (aFunObject: TObject; const aRes: Integer);
begin
  FDB.Engine.SQLite_SetResultInt (Handle, aRes);
end; (**)

procedure TSLCustomFun.SetResultDouble (aFunObject: TObject; const aRes: Double);
begin
  FDB.Engine.SQLite_SetResultDouble (Handle, aRes);
end; (**)

procedure TSLCustomFun.SetResultError (aFunObject: TObject; const aRes: String);
begin
  FDB.Engine.SQLite_SetResultError (Handle,
                                    PChar(aRes), Length (aRes));
end; (**)

function TSLCustomFun.UserData (aFunObject: TObject): Pointer;
begin
  Result := FDB.Engine.SQLite_UserData (Handle);
end; (**)

function TSLCustomFun.AggregateContext (aFunObject: TObject; nBytes: Integer): Pointer;
begin
  ///???///
end; (**)

function TSLCustomFun.AggregateCount (aFunObject: TObject): Pointer;
begin
  ///???///
end; (**)

(*******************************************************************************
            TSLFunction
 ******************************************************************************)
procedure TSLFunction_ExecCallback (aFunPtr: Pointer;
                                   aParamCount: Integer;
                                   aParams: PPChar); cdecl;
var
  pFun: TSLCustomFun;
begin
  if not assigned (aFunPtr) then
    exit;

  pFun := TSLCustomFun (__Engine.SQLite_UserData (aFunPtr));

  if not assigned (pFun) then
    // in teory error should be returned, but it is not clear which DB use.
    exit;
  if not assigned (pFun.FHandle) then
    pFun.FHandle := aFunPtr;

  (pFun as TSLFunction).DoFunction (aParamCount, PPCharArray (aParams));
end; (*TSLFunction_ExecCallback*)

constructor TSLFunction.Create(AOwner: TComponent);
begin
  inherited Create (AOwner);

  FParamCount := 0;
  FParams := TStringList.Create;
end; (**)

destructor TSLFunction.Destroy;
var
  pReactivate: Boolean;
begin
  if assigned (FDB) then
    with FDB do begin
      pReactivate := Active;
      Close;                
      Active := pReactivate;
    end; {if}

  FParams.Free;

  inherited;
end; (**)

procedure TSLFunction.SetParamCount (const aValue: Integer);
var
  i: Integer;
begin
  if FParamCount = aValue then
    exit;

  FParamCount := aValue;

  // allocate propper space for params
  with FParams do
    if FParamCount > 0 then begin
      for i := 0 to FParamCount - 1 do
        Add ('');

      Capacity := FParamCount;
    end {if}
    else begin
      Clear;
      Capacity := 0;
    end; {else}
end; (**)

procedure TSLFunction.SetActive (const aValue: Boolean);
begin
  if FActive = aValue then
    exit;

  if (not assigned (FDB)) and aValue then
    exit;

  FActive := aValue;

  if FActive then // activate
    FDB.RegisterFunction (Self);
end; (**)

procedure TSLFunction.DoFunction (const aParamCount: Integer;
                                  const aParams: PPCharArray);
var
  i: Integer;                                  
begin
  if (FParamCount >= 0) and
     (aParamCount <> FParamCount) then begin
    SetResultError (Self, 'Wrong number of parameters.');

    exit;
  end; {if}

  if not FActive then begin
    SetResultError (Self, 'Function not active.');

    exit;
  end; {if}

  if assigned (FOnFun) then begin
    for i := 0 to (aParamCount - 1) do
      FParams.Strings [i] := aParams [i];

    FOnFun (Self, FParams);
  end; {if}
end; (**)

function TSLFunction.GetCallBackPtr: Pointer;
begin
  Result := @TSLFunction_ExecCallback;
end;

function TSLFunction.GetResTypeAsInt: Integer;
begin
  case FResType of
    frText:
      Result := SQLITE_TEXT;
    frNumeric:
      Result := SQLITE_TEXT;
    else
      raise ESQLiteError.Create ('Unknown result type');
  end; {case}
end; (*TSLFunction.GetFunType*)

end { SLFunAgr }.
