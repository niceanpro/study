object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 311
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 120
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object AdvMultiButtonEdit1: TAdvMultiButtonEdit
    Left = 40
    Top = 264
    Width = 200
    Height = 22
    EmptyTextFocused = False
    TabOrder = 1
    Text = ''
    Buttons = <>
  end
  object DBGrid1: TDBGrid
    Left = 248
    Top = 72
    Width = 320
    Height = 120
    DataSource = DataSource1
    ImeName = 'Microsoft IME 2010'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Connected = True
    HostName = '192.168.0.6'
    Port = 5432
    Database = ''
    User = 'postgres'
    Password = '1234'
    Protocol = 'postgresql-9'
    LibraryLocation = 'C:\Windows\libpq.dll'
    Left = 48
    Top = 48
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from test')
    Params = <>
    Left = 48
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 48
    Top = 184
  end
end
