program Memo2;

uses
  Vcl.Forms,
  UmemoMain in 'UmemoMain.pas' {MemoMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMemoMain, MemoMain);
  Application.Run;
end.
