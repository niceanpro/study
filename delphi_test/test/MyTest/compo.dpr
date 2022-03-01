program compo;

uses
  Vcl.Forms,
  Ucompo in 'Ucompo.pas' {Compo_Form},
  Umodal in 'Umodal.pas' {ModalForm},
  UmodalLess in 'UmodalLess.pas' {ModalLessForm},
  Udata in 'Udata.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCompo_Form, Compo_Form);
  Application.Run;
end.
