unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.Ribbon, Vcl.StdActns,
  Vcl.ExtActns, System.Actions, Vcl.ActnList, Vcl.ImgList,
  Vcl.RibbonLunaStyleActnCtrls, Vcl.ExtCtrls, Vcl.Touch.GestureMgr, Vcl.AppEvnts;

type
  TMainForm = class(TForm)
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    Insa_Action: TAction;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    Dept_Action: TAction;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    New_Action: TAction;
    About_Action: TAction;
    Top_Action: TAction;
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonPage2: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    PopupMenu1: TPopupMenu;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    RichEdit1: TRichEdit;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    GestureManager1: TGestureManager;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    RibbonPage3: TRibbonPage;
    RibbonGroup6: TRibbonGroup;
    Trans_Action: TAction;
    RibbonGroup7: TRibbonGroup;
    procedure New_ActionExecute(Sender: TObject);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1BeforeExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Top_ActionExecute(Sender: TObject);
    procedure RichEdit1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure About_ActionExecute(Sender: TObject);
    procedure Insa_ActionExecute(Sender: TObject);
    procedure Dept_ActionExecute(Sender: TObject);
    procedure ExceptionHandler(Sender:TObject; e:exception);
    procedure Trans_ActionExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses ABOUT, uSplash1, Uinsa, Udept, Utrans;

procedure TMainForm.About_ActionExecute(Sender: TObject);
begin
  AboutBox := TAboutBox.Create(Application);
  AboutBox.ShowModal;
  AboutBox.Free;
end;

procedure TMainForm.Dept_ActionExecute(Sender: TObject);
begin
  DeptForm := TDeptForm.Create(Application);
  DeptForm.Show;
end;

procedure TMainForm.ExceptionHandler(Sender: TObject; e: exception);
begin
  if e is EInvalidCast then
    ShowMessage('AS 연산자 오류')
  else if e is EintError then
    ShowMessage('정수형 오류')
  else if e is EConvertError then
    ShowMessage('자료형 변환 오류')
  else if e is EAccessViolation then
    ShowMessage('억세스 오류')
  else Application.ShowException(E);

end;

procedure TMainForm.FileOpen1Accept(Sender: TObject);
begin
  RichEdit1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
end;

procedure TMainForm.FileOpen1BeforeExecute(Sender: TObject);
begin
  FileOpen1.Dialog.InitialDir := 'C:\Users\changjun\Documents';
  FileOpen1.Dialog.Filter := '유니트파일|*.pas|텍스트파일|*.txt';
end;

procedure TMainForm.FileSaveAs1Accept(Sender: TObject);
begin
  RichEdit1.Lines.SaveToFile(FileSaveAs1.Dialog.FileName);
end;

procedure TMainForm.FileSaveAs1BeforeExecute(Sender: TObject);
begin
  FileSaveAs1.Dialog.InitialDir := 'C:\Users\changjun\Documents';
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
  Application.OnException := ExceptionHandler;
end;

procedure TMainForm.Insa_ActionExecute(Sender: TObject);
begin
//  try
    InsaForm := TInsaForm.Create(Application);
    InsaForm.Show;
//  except
//    ShowMessage('form create error');
//  end;
end;

procedure TMainForm.New_ActionExecute(Sender: TObject);
begin
  RichEdit1.Lines.Clear;
end;

procedure TMainForm.RichEdit1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    -1 : ShowMessage('MyS');
    -2 : ShowMessage('MyQ');
  end;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Application.Hint;
  // application.hintPause, hintColor
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := FormatDateTime('yyyy-mmmm-dd dddd hh:nn:ss am/pm', now);
end;

procedure TMainForm.Top_ActionExecute(Sender: TObject);
begin
  Top_Action.Checked := not Top_Action.Checked;
  if Top_Action.Checked then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;

procedure TMainForm.Trans_ActionExecute(Sender: TObject);
begin
  TransForm := TTransForm.Create(Application);
  TransForm.Show;
end;

end.
