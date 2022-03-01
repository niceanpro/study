unit Ucompo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCompo_Form = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    GroupBox1: TGroupBox;
    LinkLabel1: TLinkLabel;
    LinkLabel2: TLinkLabel;
    LinkLabel3: TLinkLabel;
    LinkLabel4: TLinkLabel;
    LinkLabel5: TLinkLabel;
    LinkLabel6: TLinkLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure ShowMedalLessClick(Sender: TObject);
    procedure ShowModalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Compo_Form: TCompo_Form;

implementation

{$R *.dfm}

uses Udata, UmodalLess, Umodal;

var
  h : THour;
  myButton: TButton;
  modalLess: TModalLessForm;
  modal: TModalForm;

procedure TCompo_Form.Button10Click(Sender: TObject);
begin
  myButton := TButton.Create(Compo_Form);
  Compo_Form.Caption := IntToStr(ComponentCount);
  myButton.Parent := Compo_Form;
  myButton.Caption := '생성버튼';
  myButton.Top := Button9.Top + Button9.Height + 72;
  myButton.Left := Button9.left;
  myButton.SetFocus;
  myButton.OnClick := Button4Click;
end;

procedure TCompo_Form.Button11Click(Sender: TObject);
begin
  if myButton <> nil then
    myButton.Free;
  Compo_Form.Caption := IntToStr(ComponentCount);
end;

procedure TCompo_Form.ShowMedalLessClick(Sender: TObject);
var
  i : byte;
begin
  for i := 0 to Application.ComponentCount-1 do
    if Application.Components[i] is TModalLessForm then
    begin
      (Application.Components[i] as TModalLessForm).Show;
      exit;
    end;

  modalLess := TModalLessForm.Create(Application);
  modalLess.Show;
end;

procedure TCompo_Form.ShowModalClick(Sender: TObject);
begin
  modal := TModalForm.Create(Application);
  if modal.ShowModal = mrOK then
    ShowMessage(DateTimeToStr(modal.DateTimePicker1.DateTime));

  modal.Free;
end;

procedure TCompo_Form.Button1Click(Sender: TObject);
begin
  Compo_Form.Close;
end;

procedure TCompo_Form.Button2Click(Sender: TObject);
begin
  Button1.Caption := '닫기';
end;

procedure TCompo_Form.Button4Click(Sender: TObject);
begin
  ShowMessage('핸들러호출');
  Button1Click(Sender);
end;

procedure TCompo_Form.Button5Click(Sender: TObject);
begin
  Button5.Caption := IntToStr(Udata.i);
end;

procedure TCompo_Form.Button6Click(Sender: TObject);
begin
  Udata.Test;
end;

procedure TCompo_Form.Button7Click(Sender: TObject);
begin
  Button7.Caption := IntToStr(Udata.Add(2, 3));
end;

procedure TCompo_Form.Button8Click(Sender: TObject);
begin
  Button8.Caption := IntToStr(Udata.Divide(10, 2));
end;

procedure TCompo_Form.Button9Click(Sender: TObject);
begin
  h := THour.Create;
  Edit1.Text := h.GetName;
  Edit2.Text := IntToStr(h.Age);
  Edit3.Text := h.Address;
  Edit4.Text := h.office;
  Edit5.Text := IntToStr(h.Salary);
  Edit6.Text := IntToStr(h.hour);
  h.Free;
end;

procedure TCompo_Form.FormActivate(Sender: TObject);
begin
  Compo_Form.Caption := IntToStr(ComponentCount);
end;

procedure TCompo_Form.FormPaint(Sender: TObject);
begin
  Compo_Form.Caption := IntToStr(ComponentCount);
end;

end.
