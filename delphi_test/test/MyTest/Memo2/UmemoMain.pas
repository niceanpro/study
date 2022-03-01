unit UmemoMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtActns, Vcl.StdActns,
  System.Actions, Vcl.ActnList, Vcl.ImgList, Vcl.ActnMan, Vcl.ToolWin,
  Vcl.ActnCtrls, Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ActnMenus, Vcl.RibbonActnMenus, Vcl.Menus,
  Vcl.Touch.GestureMgr, Vcl.AppEvnts;

type
  TMemoMain = class(TForm)
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonPage2: TRibbonPage;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    Action1: TAction;
    Top_Action: TAction;
    About_Action: TAction;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    RichEdit1: TRichEdit;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    PopupMenu1: TPopupMenu;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    GestureManager1: TGestureManager;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    procedure Top_ActionExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1BeforeExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    procedure ShowHint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileOpen1Hint(var HintStr: string; var CanShow: Boolean);
    procedure Action1Hint(var HintStr: string; var CanShow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemoMain: TMemoMain;

implementation

{$R *.dfm}

procedure TMemoMain.Action1Execute(Sender: TObject);
begin
  RichEdit1.Lines.Clear;
end;

procedure TMemoMain.Action1Hint(var HintStr: string; var CanShow: Boolean);
begin
  ShowMessage('new hint');
end;

procedure TMemoMain.FileOpen1Accept(Sender: TObject);
var
  s:string;
begin
  RichEdit1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
end;

procedure TMemoMain.FileOpen1BeforeExecute(Sender: TObject);
begin
  FileOpen1.Dialog.InitialDir := 'D:\delphi_test\test\MyTest';
  FileOpen1.Dialog.Filter := '유니트화일|*.pas|텍스트화일|*.txt';
end;

procedure TMemoMain.FileOpen1Hint(var HintStr: string; var CanShow: Boolean);
begin
  ShowMessage('open hint');
end;

procedure TMemoMain.FileSaveAs1Accept(Sender: TObject);
var
  s : string;
begin
  RichEdit1.Lines.SaveToFile(FileSaveAs1.Dialog.FileName);
end;

procedure TMemoMain.FileSaveAs1BeforeExecute(Sender: TObject);
begin
  FileSaveAs1.Dialog.InitialDir := 'D:\delphi_test\test\MyTest';
  FileSaveAs1.Dialog.Filter := '유니트화일|*.pas|텍스트화일|*.txt';
end;

procedure TMemoMain.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
end;

procedure TMemoMain.ShowHint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Application.Hint;
end;

procedure TMemoMain.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := DateTimeToStr(now);
end;

procedure TMemoMain.Top_ActionExecute(Sender: TObject);
begin
  Top_Action.Checked := not Top_Action.Checked;
  if Top_Action.Checked then
    MemoMain.FormStyle := fsStayOnTop
  else
    MemoMain.FormStyle := fsNormal;
end;

end.
