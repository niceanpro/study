unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.ActnList, Vcl.StdActns, System.Actions;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    Edit1: TMenuItem;
    Color1: TMenuItem;
    N2: TMenuItem;
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
    ActionList1: TActionList;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    red_Action: TAction;
    yellow_Action: TAction;
    ActionFile1: TMenuItem;
    Exit1: TMenuItem;
    SaveAs1: TMenuItem;
    Exit2: TMenuItem;
    Color2: TMenuItem;
    Red2: TMenuItem;
    Yellow2: TMenuItem;
    procedure Open1Click(Sender: TObject);
    procedure Red1Click(Sender: TObject);
    procedure Yellow1Click(Sender: TObject);
    procedure Blue1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Blue1Click(Sender: TObject);
begin
  Blue1.Checked := true;
  Color := clBlue;
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  ShowMessage('open');
end;

procedure TForm1.Red1Click(Sender: TObject);
begin
  Red1.Checked := true;
  Color :=  clRed;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  Open1Click(Sender);
end;

procedure TForm1.Yellow1Click(Sender: TObject);
begin
  Yellow1.Checked := true;
  Color := clYellow;
end;

end.
