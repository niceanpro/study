unit Uinsa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtDlgs;

type
  TInsaForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabControl1: TTabControl;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBImage1: TDBImage;
    업무능력: TDBRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsaForm: TInsaForm;

implementation

{$R *.dfm}

uses UDM, data.DB;

procedure TInsaForm.Button1Click(Sender: TObject);
begin
  Dm.Insa.Insert;
end;

procedure TInsaForm.Button2Click(Sender: TObject);
begin
  if MessageDlg('정말 삭제하시겠습니까?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    try
      Dm.Insa.Delete;
      Dm.Insa.ApplyUpdates(-1); // 실제 적용, -1은 조건처리 없이 진행 함
    except
      ShowMessage('삭제 오류');
    end;
  end;
end;

procedure TInsaForm.Button3Click(Sender: TObject);
begin
  Dm.Insa.Cancel;
  Dm.Insa.CancelUpdates;
end;

procedure TInsaForm.Button4Click(Sender: TObject);
begin
  try
    Dm.Insa.Post;                // local memory에 적용 함
    Dm.Insa.ApplyUpdates(-1);    // 실제 DB에 update함
  except
    ShowMessage('등록/편집 오류');
  end;
end;

procedure TInsaForm.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: Dm.Insa.IndexName := 'i_id';
    1: Dm.Insa.IndexName := 'i_name';
    2: Dm.Insa.IndexName := 'i_dept';
  end;
end;

procedure TInsaForm.Edit1Change(Sender: TObject);
begin
  Dm.Insa.IndexFieldNames := 'name';
  Dm.Insa.FindNearest([Edit1.Text]);

  // if dm.insa.FindKey([edit1.text]) then
  // if dm.Insa.locate('name', edit1.text, [loCaseInsesitive, loPartialKey]) then
end;

procedure TInsaForm.FormActivate(Sender: TObject);
var
  InsaID: TIntegerField;
begin
  Dm.InsaSourceStateChange(dm.InsaSource);
// 아직미완
//  Dm.InsaSourceDataChange(Dm.InsaSource, Dm.Insa);
  Dm.InsaSourceDataChange(Dm.InsaSource, InsaID);
end;

procedure TInsaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.InsaSource.OnStateChange := nil;
  Dm.InsaSource.OnDataChange := nil;
  Action := caFree;
end;

procedure TInsaForm.FormCreate(Sender: TObject);
begin
  Dm.InsaSource.OnStateChange := Dm.InsaSourceStateChange;
  Dm.InsaSource.OnDataChange := Dm.InsaSourceDataChange;
end;

procedure TInsaForm.Label12Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    DBImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TInsaForm.SpeedButton1Click(Sender: TObject);
begin
  DM.Insa.First;
end;

procedure TInsaForm.SpeedButton2Click(Sender: TObject);
begin
  if not DM.Insa.Bof then
    DM.Insa.Prior;
end;

procedure TInsaForm.SpeedButton3Click(Sender: TObject);
begin
  if not DM.Insa.Eof then
    Dm.Insa.Next;
end;

procedure TInsaForm.SpeedButton4Click(Sender: TObject);
begin
  Dm.Insa.Last;
end;

procedure TInsaForm.TabControl1Change(Sender: TObject);
begin
  if TabControl1.TabIndex = 0 then
    Dm.Insa.Filtered := false
  else
  begin
      Dm.Insa.Filtered := true;
      Dm.Insa.Filter := 'CLASS = ' + '''' + TabControl1.Tabs[TabControl1.TabIndex] + '''';
  end;
end;

end.




