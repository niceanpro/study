program Project2;

uses
  Forms,
  Unit1 in 'C:\Users\changjun\Downloads\Demo_ShowPdfFiles\Unit1.pas' {Form1},
  AcroPDFLib_TLB in 'C:\Users\changjun\Documents\RAD Studio\10.0\Imports\AcroPDFLib_TLB.pas',
  AcrobatAccessLib_TLB in 'C:\Users\changjun\Documents\RAD Studio\10.0\Imports\Win64\Debug\AcrobatAccessLib_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
