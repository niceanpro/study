unit UMenuTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Open1: TMenuItem;
    ImageList1: TImageList;
    Save1: TMenuItem;
    N2: TMenuItem;
    Close1: TMenuItem;
    Color1: TMenuItem;
    Red1: TMenuItem;
    Yellow1: TMenuItem;
    Blue1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Open2: TMenuItem;
    Save2: TMenuItem;
    N3: TMenuItem;
    Close2: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Open1Click(Sender: TObject);
    procedure Red1Click(Sender: TObject);
    procedure Yellow1Click(Sender: TObject);
    procedure Blue1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    SelectNext((Sender as TWinControl), True, True);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Edit1.Text = '00' then
  begin
    ShowMessage('0 이외의 값을 넣으시오');
    CanClose := false;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := '100';
//  Red1Click(Sender);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl, true, true);
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  ShowMessage('Open');
end;

procedure TForm1.Red1Click(Sender: TObject);
begin
  Red1.Checked := true;
  Form1.Color := clRed;
  Form1.Refresh;
end;


procedure TForm1.Yellow1Click(Sender: TObject);
begin
  Yellow1.Checked := true;
  Form1.Color := clYellow;
  Form1.Refresh;
end;


procedure TForm1.Blue1Click(Sender: TObject);
begin
  Blue1.Checked := true;
  Form1.Color := clBlue;
  Form1.Refresh;
end;

end.
