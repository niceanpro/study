object Form1: TForm1
  Left = 0
  Top = 0
  ClientHeight = 814
  ClientWidth = 1130
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 11
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 990
    Height = 750
    TabOrder = 0
    object MediaPlayer1: TMediaPlayer
      Left = 1
      Top = 1
      Width = 982
      Height = 748
      Align = alClient
      ColoredButtons = []
      AutoOpen = True
      DoubleBuffered = True
      Display = MediaPlayer1
      FileName = 
        'C:\Users\changjun\Documents\Daum\PotEncoder\[mix]'#45433#54868'_2014_02_28_1' +
        '0_04_40_447.wmv'
      ParentDoubleBuffered = False
      TabOrder = 0
      OnNotify = MediaPlayer1Notify
    end
  end
  object Button1: TButton
    Left = 1024
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
