unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.StdActns,
  System.Actions, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin;

type
  TForm2 = class(TForm)
    ActionList1: TActionList;
    ImageList1: TImageList;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    Red: TAction;
    Yellow: TAction;
    Blue: TAction;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    SaveAs1: TMenuItem;
    Exit1: TMenuItem;
    Color1: TMenuItem;
    Color2: TMenuItem;
    Red1: TMenuItem;
    Yellow1: TMenuItem;
    Blue1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Open1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Open2: TMenuItem;
    SaveAs2: TMenuItem;
    Exit2: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
