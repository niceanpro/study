object Compo_Form: TCompo_Form
  Left = 0
  Top = 0
  Caption = 'Compo_Form'
  ClientHeight = 441
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 64
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 32
    Width = 75
    Height = 25
    Caption = #49549#49457#48320#44221
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 272
    Top = 32
    Width = 75
    Height = 25
    Caption = 'close'#54648#46308#47084#44277#50976
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 368
    Top = 32
    Width = 75
    Height = 25
    Caption = #54648#46308#47084#54840#52636
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 64
    Top = 80
    Width = 75
    Height = 25
    Caption = 'var'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 168
    Top = 80
    Width = 75
    Height = 25
    Caption = #54532#47196#49884#51200#54840#52636
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 272
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 6
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 368
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Divide'
    TabOrder = 7
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 64
    Top = 128
    Width = 75
    Height = 25
    Caption = 'THour '#48372#44592
    TabOrder = 8
    OnClick = Button9Click
  end
  object GroupBox1: TGroupBox
    Left = 168
    Top = 128
    Width = 275
    Height = 257
    Caption = 'THour'#51221#48372
    TabOrder = 9
    object Edit1: TEdit
      Left = 112
      Top = 36
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 112
      Top = 68
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 112
      Top = 108
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 112
      Top = 140
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 112
      Top = 180
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 4
    end
    object Edit6: TEdit
      Left = 112
      Top = 212
      Width = 121
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 5
    end
    object LinkLabel1: TLinkLabel
      Left = 43
      Top = 36
      Width = 28
      Height = 200
      Caption = #51060#47492
      TabOrder = 6
    end
    object LinkLabel2: TLinkLabel
      Left = 43
      Top = 182
      Width = 28
      Height = 17
      Caption = #51076#44552
      TabOrder = 7
    end
    object LinkLabel3: TLinkLabel
      Left = 43
      Top = 219
      Width = 28
      Height = 17
      Caption = #49884#44036
      TabOrder = 8
    end
    object LinkLabel4: TLinkLabel
      Left = 43
      Top = 145
      Width = 28
      Height = 17
      Caption = #54924#49324
      TabOrder = 9
    end
    object LinkLabel5: TLinkLabel
      Left = 43
      Top = 72
      Width = 28
      Height = 17
      Caption = #45208#51060
      TabOrder = 10
    end
    object LinkLabel6: TLinkLabel
      Left = 43
      Top = 109
      Width = 28
      Height = 17
      Caption = #51452#49548
      TabOrder = 11
    end
  end
  object Button10: TButton
    Left = 64
    Top = 176
    Width = 75
    Height = 25
    Caption = #48260#53948#49373#49457
    TabOrder = 10
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 64
    Top = 281
    Width = 75
    Height = 25
    Caption = #48260#53948#54644#51228
    TabOrder = 11
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 64
    Top = 329
    Width = 75
    Height = 25
    Caption = 'Show'
    TabOrder = 12
    OnClick = ShowMedalLessClick
  end
  object Button13: TButton
    Left = 64
    Top = 377
    Width = 75
    Height = 25
    Caption = 'Show Modal'
    TabOrder = 13
    OnClick = ShowModalClick
  end
end
