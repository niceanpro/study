object DeptForm: TDeptForm
  Left = 0
  Top = 0
  Caption = 'DeptForm'
  ClientHeight = 777
  ClientWidth = 931
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 48
    Top = 24
    Width = 828
    Height = 41
    DataSource = DM.DeptSource
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 48
    Top = 88
    Width = 840
    Height = 289
    DataSource = DM.DeptSource
    ImeName = 'Microsoft Office IME 2007'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PageControl1: TPageControl
    Left = 56
    Top = 424
    Width = 832
    Height = 329
    ActivePage = TabSheet2
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #49345#49464#51312#54924
      object DBGrid2: TDBGrid
        Left = 16
        Top = 24
        Width = 793
        Height = 257
        DataSource = DM.InsaQuerySource
        ImeName = 'Microsoft Office IME 2007'
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = #51064#50896#49688
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 24
        Top = 16
        Width = 777
        Height = 273
        ColCount = 3
        DrawingStyle = gdsClassic
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
      end
    end
    object TabSheet3: TTabSheet
      Caption = #46321#47197
      ImageIndex = 2
      object Label1: TLabel
        Left = 48
        Top = 40
        Width = 48
        Height = 13
        Caption = #48512#49436#53076#46300
      end
      object Label2: TLabel
        Left = 48
        Top = 80
        Width = 36
        Height = 13
        Caption = #48512#49436#47749
      end
      object Label3: TLabel
        Left = 48
        Top = 128
        Width = 42
        Height = 13
        Caption = #54016'      '#47749
      end
      object Edit1: TEdit
        Left = 152
        Top = 40
        Width = 121
        Height = 21
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 152
        Top = 80
        Width = 121
        Height = 21
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 152
        Top = 128
        Width = 121
        Height = 21
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 2
      end
      object Button1: TButton
        Left = 376
        Top = 128
        Width = 75
        Height = 25
        Caption = #46321#47197
        TabOrder = 3
        OnClick = Button1Click
      end
    end
  end
  object TotQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select count(id) as total'
      'from insa'
      'where dept_code like :code')
    SQLConnection = DM.SQLConnection1
    Left = 816
    Top = 392
  end
  object SQLStoredProc1: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.SQLConnection1
    Left = 656
    Top = 400
  end
end
