program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  DebenuPDFLibrary64Lite1012_TLB in 'C:\Users\changjun\Documents\RAD Studio\10.0\Imports\DebenuPDFLibrary64Lite1012_TLB.pas',
  AcroPDFLib_TLB in 'C:\Users\changjun\Documents\RAD Studio\10.0\Imports\AcroPDFLib_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
