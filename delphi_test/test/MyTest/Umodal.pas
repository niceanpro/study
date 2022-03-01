unit Umodal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TModalForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    MonthCalendar1: TMonthCalendar;
    BitBtn2: TBitBtn;
    procedure DateTimePicker1UserInput(Sender: TObject;
      const UserString: string; var DateAndTime: TDateTime;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModalForm: TModalForm;

implementation

{$R *.dfm}

procedure TModalForm.DateTimePicker1UserInput(Sender: TObject;
  const UserString: string; var DateAndTime: TDateTime;
  var AllowChange: Boolean);
begin
  DateAndTime := StrToDateTime(UserString);
  AllowChange := true;
end;

end.
