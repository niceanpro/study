unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, Mask, DBCtrls, ExtCtrls,

  SLEngine,
  SLDB,
  SLDataSet,
  SLFunAgr;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Memo1: TMemo;
    DBNavigator1: TDBNavigator;
    Button3: TButton;
    Button4: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    MemoLog: TMemo;
    Button5: TButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Log (anEngine: TSLEngine; const aText: String);
    procedure Button5Click(Sender: TObject);
    procedure TestFunction (Sender: TObject; aParams: TStrings);
  private
    { Private declarations }
    FSLDB: TSLDataBase;
    FSLDataSet: TSLDataSet;
    FSLFun: TSLFunction;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TestFunction (Sender: TObject; aParams: TStrings);
var
  pRes: Integer;
begin
  with (Sender as TSLFunction) do 
    try
      pRes := StrToInt (aParams.Strings [0]);

      SetResultInt (Sender, pRes);
    except
      SetResultError (Sender, 'Convert error');
    end; {try/except}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  __Engine.OnLog := Log;

  FSLDB := TSLDataBase.Create (Self);
  with FSLDB do begin
    Name := 'DB';
    DBName := '.\test.db';

    with SLDBOptions do begin
      ForceTransaction := True;
      Mode             := fmOpenReadWrite;
      BusyTimeOut      := 0;
    end; {with}

    Open;
  end; {with}

  FSLFun := TSLFunction.Create (Self);
  with FSLFun do begin
    Name := 'Function';
    FunName := 'fun';
    ParamCount := 1;
    ResultType := frNumeric;

    DataBase := FSLDB;

    OnFunction := TestFunction;

    Active := True;
  end; {with}

  FSLDataSet := TSLDataSet.Create (Self);
  with FSLDataSet do begin
    Name := 'DataSet';
    SLOptions := [soUseROWIDs, soHideTableName];

    DataBase := FSLDB;

//    GettingMethod := gmGetTable;
    GettingMethod := gmCallback;

    SQL.Text := 'select rowid,*,fun(rowid) + 1 from raw;';
//    SQL.Text := 'select rowid,* from simpsons;';
    Memo1.Lines.Text := SQL.Text;

//    UpdatingTableName := 'ex2';

    Open;
  end; {with}

  DataSource1.DataSet := FSLDataSet;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
// for test
  FSLDB.Free;
//  FSLDB.Close;

  __Engine.OnLog := nil;

  FSLFun.Free;

  FSLDataSet.Free;

//  FSLDB.Free;
end;

procedure TForm1.Log (anEngine: TSLEngine; const aText: String);
begin
  MemoLog.Lines.Add (aText);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FSLDB.Commit;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  MemoLog.Lines.SaveToFile ('.\log.txt');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with FSLDataSet do begin
    if Active then
      Close;
    SQL.Clear;
    SQL.AddStrings (Memo1.Lines);

    Open;
  end; {with}
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with FSLDataSet do begin
    if Active then
      Close;
    SQL.Clear;
    SQL.AddStrings (Memo1.Lines);

    ExecSQL;
  end; {with}
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  FSLDataSet.Locate ('firstname', Edit1.Text, [loCaseInsensitive, loPartialKey]);
end;

end.
 