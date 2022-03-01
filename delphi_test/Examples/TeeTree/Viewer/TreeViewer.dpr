program TreeViewer;
{$I TeeDefs.inc}

uses
  {$IFNDEF CLX}
  Forms,
  {$ELSE}
  {$IFDEF UCL}
  UForms,
  {$ELSE}
  QForms,
  {$ENDIF}
  {$ENDIF}
  
  UTreeViewer in 'UTreeViewer.pas' {Viewer},
  TreeNavigator in '..\TreeNavigator.pas';

{$IFNDEF CLR}
{$R *.RES}
{$ENDIF}

{$IFDEF CLR}
[STAThread]
{$ENDIF}
begin
  Application.Title := 'TeeTree v2 Viewer';
  Application.CreateForm(TViewer, Viewer);
  Application.Run;
end.
