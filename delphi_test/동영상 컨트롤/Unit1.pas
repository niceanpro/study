unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    MediaPlayer1: TMediaPlayer;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
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
begin
MediaPlayer1.Stop;
      MediaPlayer1.FileName := 'C:\Users\changjun\Documents\oCam\finland.wmv';
      MediaPlayer1.Open;
              MediaPlayer1.Play;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
      // MediaPlayer1.Hide;
      //  MediaPlayer1.Play;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
       // MediaPlayer1.Hide;
        MediaPlayer1.Play;
        MediaPlayer1.Notify := true;

end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
       if(MediaPlayer1.NotifyValue = nvSuccessful)
      then
      MediaPlayer1.Play;


end;

end.
