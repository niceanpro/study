object TransForm: TTransForm
  Left = 0
  Top = 0
  Caption = 'TransForm'
  ClientHeight = 670
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 48
    Top = 104
    Width = 680
    Height = 281
    DataSource = DM.DeptSource
    ImeName = 'Microsoft Office IME 2007'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 48
    Top = 40
    Width = 530
    Height = 33
    TabOrder = 1
  end
  object Button1: TButton
    Left = 653
    Top = 45
    Width = 75
    Height = 25
    Caption = #49325#51228
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid2: TDBGrid
    Left = 48
    Top = 408
    Width = 680
    Height = 209
    DataSource = DM.InsaSource
    ImeName = 'Microsoft Office IME 2007'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Delete_Query: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.SQLConnection1
    Left = 616
    Top = 312
  end
end
