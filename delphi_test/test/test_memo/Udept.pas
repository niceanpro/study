unit Udept;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.StdCtrls;

type
  TDeptForm = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    TotQuery: TSQLQuery;
    StringGrid1: TStringGrid;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    SQLStoredProc1: TSQLStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeptForm: TDeptForm;

implementation

{$R *.dfm}

uses UDM;

procedure TDeptForm.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    raise Exception.Create('부서 코드는 반드시 입력');
  if Dm.Dept.Locate('CODE', Edit1.Text, []) then
    raise Exception.Create('이미 등록된 부서 코드입니다');

  with SQLStoredProc1 do
  begin
    Close;
    ParamByName('pcode').AsString := Edit1.Text;
    ParamByName('pdept').AsString := Edit2.Text;
    ParamByName('psection').AsString := Edit3.Text;
    ExecProc;  // Insert, Update, Delete에서 사용      // Record가 넘어올때는 Open을 사용

  end;
  Dm.Dept.Refresh;
end;

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TDeptForm.FormCreate(Sender: TObject);
var
  i:byte;
begin
  with StringGrid1 do
  begin
    RowCount := Dm.Dept.RecordCount + 2;
    Cells[0,0] := '부서명';
    Cells[1,0] := '과  명';
    Cells[2,0] := '인원수';
    for I := 1 to Dm.Dept.RecordCount do
    begin
      Cells[0,i] := '';
      Cells[1,i] := '';
      Cells[2,i] := '';
    end;
    Dm.Dept.First;
    for I := 1 to Dm.Dept.RecordCount do
    begin
      Cells[0,i] := Dm.Dept.FieldByName('DEPT').AsString;
      Cells[1,i] := Dm.Dept.FieldByName('Section').AsString;
      TotQuery.Close;
      TotQuery.Params[0].AsString := Dm.Dept.FieldByName('DEPT').AsString + '%';
      TotQuery.Open;
      Cells[2,i] := TotQuery.FieldByName('total').AsString;
      Dm.Dept.Next;
    end;
    Cells[0,i] := '총인원수';
    TotQuery.Close;
    TotQuery.Params[0].AsString := '%';
    TotQuery.Open;
    Cells[2,i] := TotQuery.FieldByName('total').AsString;
  end;
end;

procedure TDeptForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  pos : integer;
  OldAlign: word;
  s : String;
begin
  s := StringGrid1.Cells[ACol, ARow];
  with StringGrid1.Canvas do
  begin
    FillRect(Rect);
    if ARow = 0 then
    begin
      Font.Color := clBlue;
      Font.Size := Font.Size + 4;
    end;
    if (ARow <> 0) and (ACol = 2) then
    begin
      Font.Color := clRed;
      Font.Size := Font.Size + 4;
      s := s + '명';
      OldAlign := SetTextAlign(Handle, ta_Right);
      TextRect(Rect, Rect.Right, Rect.Top + 3, s);
      SetTextAlign(Handle, OldAlign);
    end
    else
    begin
      Pos := ((Rect.Right - Rect.Left) - TextWidth(s)) div 2;
      TextRect(Rect, Rect.Left + pos, Rect.Top + 3, s);
    end;

  end;
end;

end.
