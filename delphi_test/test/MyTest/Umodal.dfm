object ModalForm: TModalForm
  Left = 0
  Top = 0
  Caption = 'ModalForm'
  ClientHeight = 300
  ClientWidth = 635
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
    Left = 360
    Top = 248
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 448
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 151
    Top = 248
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 88
    Top = 56
    Width = 138
    Height = 21
    Date = 42177.891671412040000000
    Time = 42177.891671412040000000
    ImeName = 'Microsoft Office IME 2007'
    ParseInput = True
    TabOrder = 3
    OnUserInput = DateTimePicker1UserInput
  end
  object MonthCalendar1: TMonthCalendar
    Left = 288
    Top = 32
    Width = 191
    Height = 154
    Date = 42177.891754837960000000
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 248
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
end
