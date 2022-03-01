object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Edit1
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    635
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 144
    Top = 48
    Width = 145
    Height = 21
    Anchors = [akLeft, akTop, akRight, akBottom]
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
    OnEnter = Edit1Enter
  end
  object Edit2: TEdit
    Left = 144
    Top = 96
    Width = 145
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 136
    Width = 145
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 144
    Top = 176
    Width = 145
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 3
  end
end
