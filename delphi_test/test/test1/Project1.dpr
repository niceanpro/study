program Project1;

uses
  Vcl.Forms,
  utest1 in 'utest1.pas' {Form1},
  utest2 in 'utest2.pas' {Form2},
  utest3 in 'utest3.pas' {Form3},
  utest4 in 'utest4.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
