program pMemo;

uses
  Vcl.Forms,
  winapi.Windows,
  uMain in 'uMain.pas' {MainForm},
  ABOUT in 'ABOUT.pas' {AboutBox},
  uSplash1 in 'uSplash1.pas' {SplashForm1},
  UDM in 'UDM.pas' {DM: TDataModule},
  Uinsa in 'Uinsa.pas' {InsaForm},
  Udept in 'Udept.pas' {DeptForm},
  Utrans in 'Utrans.pas' {TransForm};

{$R *.res}

begin
  Application.Initialize;
  SplashForm1 := TSplashForm1.Create(Application);
  SplashForm1.Show;
  SplashForm1.Refresh;
  Sleep(1000);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.CreateForm(TTransForm, TransForm);
  SplashForm1.Hide;
  SplashForm1.Free;
  Application.Run;
end.
