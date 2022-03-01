unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdActns, System.Actions,
  Vcl.ActnList, Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.Menus, Vcl.ActnPopup, Vcl.ActnCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ActnMenus;

type
  TForm1 = class(TForm)
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    test_Action: TAction;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    Action2: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    CoolBar1: TCoolBar;
    ActionToolBar1: TActionToolBar;
    ActionToolBar2: TActionToolBar;
    PopupActionBar1: TPopupActionBar;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    Exit1: TMenuItem;
    procedure test_ActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.test_ActionExecute(Sender: TObject);
begin
  ShowMessage('Test');
end;

end.
