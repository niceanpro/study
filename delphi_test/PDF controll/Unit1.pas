unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DebenuPDFLibrary64Lite1012_TLB, AcroPDFLib_TLB,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  QP: TPDFLibrary;
  ret: Integer;
  m_strContent : AnsiString;
begin
             QP := TPDFLibrary.Create(Form1);

  ret := QP.LoadFromFile('C:\Users\changjun\Downloads\GettingStarted.pdf', '');
                         m_strContent := QP.SaveToString;

 // QP.DrawText(100, 100, 'Hello World');
 // QP.SaveToFile('C:\Users\changjun\Downloads\GettingStarted2.pdf');

  QP.Destroy;
end;

end.
