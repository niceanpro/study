program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  SLTypes in '..\source\SLTypes.pas',
  SLDB in '..\source\SLDB.pas',
  SLEngine in '..\source\SLEngine.pas',
  SLDataSet in '..\source\SLDataSet.pas',
  SLFunAgr in '..\source\SLFunAgr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
