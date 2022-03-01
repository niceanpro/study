unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  ShowMessage('enter');
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return then
    SelectNext((Sender as TwinControl), true, true);  //
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if edit1.text <> '' then
  begin
    ShowMessage('에디터 지우고 종료');
    CanClose := False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edit1.Text := '100';
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return  then
    SelectNext(ActiveControl, true, true);            // form에서 Keypreview를 해놓고 form에서 onKeyDown하나만 하면 나중에 다른 control들이 추가 되어도 소스 수정이 없다.
end;

end.
