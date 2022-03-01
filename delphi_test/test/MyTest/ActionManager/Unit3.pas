unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdActns, System.Actions,
  Vcl.ActnList, Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ActnPopup;

type
  TForm3 = class(TForm)
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    Action1: TAction;
    test_Action: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    CoolBar1: TCoolBar;
    ActionToolBar1: TActionToolBar;
    ActionToolBar2: TActionToolBar;
    Action2: TAction;
    PopupActionBar1: TPopupActionBar;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    Exit1: TMenuItem;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    procedure test_ActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.test_ActionExecute(Sender: TObject);
begin
  ShowMessage('Test');
end;

end.
