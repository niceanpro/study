unit utest1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button12: TButton;
    Button13: TButton;
    a: TEdit;
    b: TEdit;
    c: TEdit;
    d: TEdit;
    e: TEdit;
    f: TEdit;
    procedure Button13Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure TestHandler(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

uses utest3, utest4, utest2;

var
  h:Thour;
  Test_Btn:TButton;

{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
begin
  Test_Btn := TButton.Create(self);       // self는 소유주 대신 nil을 주면 메모리 해제는 알아서 해야 함
  caption := inttostr(componentcount);
  Test_Btn.Parent  := self;
  Test_Btn.Height := Button10.Height;
  Test_Btn.Width := Button10.Width;
  Test_Btn.Left := Button10.Left;
  Test_Btn.Top := Button10.Top + Button10.Height + 24;
  Test_Btn.Caption := 'test';
  Test_Btn.SetFocus;

  Test_Btn.OnClick := TestHandler;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  if Test_Btn <> nil then
  begin
    Test_Btn.Free;
    caption := inttostr(ComponentCount);
  end;

end;

procedure TForm1.Button12Click(Sender: TObject);
var
  i:byte;
begin
  for i := 0 to Application.ComponentCount -1 do
    if Application.Components[i] is TForm2 then
    begin
      (Application.Components[i] as TForm).Show; // ==      form2.Show;
      exit;
    end;

  Form2 := TForm2.Create(Application);
  caption := inttostr(application.ComponentCount);
  Form2.Show;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Form3 := TForm3.Create(Application);
  caption := inttostr(application.ComponentCount);
  if Form3.ShowModal = mrok then
    Showmessage(DateTimeToStr(Form3.DateTimePicker1.Date));

  Form3.Free;
  caption := inttostr(application.ComponentCount);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Button1.Caption := '닫기';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  showMessage('핸들러 호출');
  Button1Click(Sender);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  button5.Caption := IntToStr(i);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  utest4.Test;  // Test;    함수가 중복 될 때는 가장 나중에 포함된 것이 호출 됨
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Button7.Caption := IntToStr(utest4.Add(5, 3));
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
//  Button8.Caption := IntToStr(utest4.Divide(8, 2));
  Button8.Caption := FloatToStr(utest4.Divide(8.0, 2.5));

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  h := THour.Create;
  a.Text := h.GetName;
  b.Text := IntToStr(h.Age);
  c.Text := h.Address;
  d.Text := h.office;
  e.Text := IntToStr(h.salary);
  f.Text := IntToStr(h.rate);
  h.Free;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  caption := inttostr(componentcount);
end;

procedure TForm1.TestHandler(Sender: TObject);
begin
  ShowMessage('my procedure');
end;

end.
