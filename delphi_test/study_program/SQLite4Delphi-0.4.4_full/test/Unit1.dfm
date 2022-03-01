object Form1: TForm1
  Left = 116
  Top = 88
  Width = 865
  Height = 610
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 21
    Height = 13
    Caption = 'SQL'
  end
  object Label2: TLabel
    Left = 272
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Record set'
  end
  object DBGrid1: TDBGrid
    Left = 272
    Top = 24
    Width = 505
    Height = 229
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 4
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 24
    Width = 265
    Height = 229
    Lines.Strings = (
      'select * from simpsons')
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 272
    Top = 256
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 3
  end
  object Button3: TButton
    Left = 12
    Top = 292
    Width = 75
    Height = 25
    Caption = 'commit'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 96
    Top = 292
    Width = 75
    Height = 25
    Caption = 'write log'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 84
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Exec'
    TabOrder = 6
    OnClick = Button2Click
  end
  object MemoLog: TMemo
    Left = 272
    Top = 288
    Width = 505
    Height = 281
    TabOrder = 7
  end
  object Button5: TButton
    Left = 112
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Edit1: TEdit
    Left = 120
    Top = 384
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object DataSource1: TDataSource
    Left = 232
    Top = 20
  end
end
