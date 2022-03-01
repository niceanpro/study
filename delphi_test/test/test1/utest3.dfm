object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 326
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePicker1: TDateTimePicker
    Left = 40
    Top = 32
    Width = 186
    Height = 21
    Date = 42169.958764490740000000
    Time = 42169.958764490740000000
    ImeName = 'Microsoft Office IME 2007'
    ParseInput = True
    TabOrder = 0
    OnUserInput = DateTimePicker1UserInput
  end
  object MonthCalendar1: TMonthCalendar
    Left = 264
    Top = 32
    Width = 218
    Height = 160
    MultiSelect = True
    Date = 42169.958858692130000000
    EndDate = 42169.958858692130000000
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 264
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 264
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object Button1: TButton
    Left = 320
    Top = 264
    Width = 75
    Height = 25
    Caption = #54869#51064
    ModalResult = 1
    TabOrder = 4
  end
end
