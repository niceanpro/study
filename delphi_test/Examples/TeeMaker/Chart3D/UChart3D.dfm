object Form1: TForm1
  Left = 192
  Top = 107
  Width = 870
  Height = 640
  Caption = 'c'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 670
    Top = 33
    Width = 192
    Height = 580
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 77
      Top = 61
      Width = 61
      Height = 13
      Caption = 'Series Types'
    end
    object ComboBox1: TComboBox
      Left = 32
      Top = 80
      Width = 106
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Bar'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Area'
        'Bar'
        'Donut'
        'Line'
        'Pie')
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 402
      Width = 190
      Height = 177
      Align = alBottom
      Caption = 'Custom content'
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 32
        Top = 96
        Width = 106
        Height = 25
        Caption = 'Add Extruded Block'
        TabOrder = 0
      end
      object CBAfterDraw: TCheckBox
        Left = 32
        Top = 40
        Width = 97
        Height = 25
        Caption = 'Mark Second  Area Point zone'
        TabOrder = 1
        WordWrap = True
      end
    end
    object Button1: TButton
      Left = 32
      Top = 120
      Width = 105
      Height = 25
      Caption = 'Refill Series'
      TabOrder = 2
    end
    object Memo1: TMemo
      Left = 21
      Top = 168
      Width = 156
      Height = 137
      BevelInner = bvNone
      BevelOuter = bvSpace
      Ctl3D = False
      Lines.Strings = (
        'TeeChart is used here in block '
        'format, being added internally '
        'to a TChart TBlockCanvas as '
        'individual, complete elements '
        '(Chart base, Axes, Series '
        'elements). The approach is '
        'likely to be used as a '
        'rendering technique for '
        'Canvases other than OpenGL '
        'in the future.')
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 670
    Height = 580
    Align = alClient
    TabOrder = 1
    object Chart3D1: TChart3D
      Left = 1
      Top = 1
      Width = 668
      Height = 578
      Gradient.EndColor = clNavy
      Gradient.MidColor = 14739177
      Gradient.StartColor = 16774122
      Gradient.Visible = True
      OnAfterDraw = Chart3D1AfterDraw
      View3DOptions.Orthogonal = False
      View3DOptions.VertOffset = 120
      Align = alClient
      TabOrder = 0
      Options.Floor.Format.Border.Color = 5460819
      Options.Floor.Format.Border.Visible = True
      Options.Floor.Format.Texture.PictureLink = '$(TEEMaker)\Basic\parket.bmp'
      Options.Floor.Rotation.Y = 90.000000000000000000
      Options.Floor.Size.X = 1300.000000000000000000
      Options.Floor.Size.Y = 1300.000000000000000000
      Options.Floor.Size.Z = 1300.000000000000000000
      Options.Floor.Tile.X = 10.000000000000000000
      Options.Floor.Tile.Y = 10.000000000000000000
      object ChartBlock1: TChartBlock
        Location.X = -200.000000000000000000
        Size.X = 400.000000000000000000
        Size.Y = 65.000000000000000000
        Size.Z = 249.000000000000000000
        Format.Border.Visible = True
        Title = 'Chart'
        object TCustomBlockChart
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Brush.Gradient.Direction = gdBottomTop
          BackWall.Brush.Gradient.EndColor = clWhite
          BackWall.Brush.Gradient.StartColor = 15395562
          BackWall.Brush.Gradient.Visible = True
          BackWall.Gradient.Direction = gdBottomTop
          BackWall.Gradient.EndColor = clWhite
          BackWall.Gradient.StartColor = 15395562
          BackWall.Gradient.Visible = True
          BackWall.Size = 5
          BackWall.Transparent = False
          BottomWall.Size = 5
          Foot.Font.Name = 'Verdana'
          Gradient.Direction = gdBottomTop
          Gradient.EndColor = clWhite
          Gradient.MidColor = 15395562
          Gradient.StartColor = 15395562
          Gradient.Visible = True
          LeftWall.Color = 14745599
          LeftWall.Size = 5
          Legend.Font.Name = 'Verdana'
          Legend.MaxNumRows = 0
          RightWall.Color = 14745599
          RightWall.Size = 5
          SubFoot.Font.Name = 'Verdana'
          SubTitle.Font.Name = 'Verdana'
          Title.Font.Name = 'Verdana'
          Title.Text.Strings = (
            'TeeChart')
          BottomAxis.Axis.Color = 4210752
          BottomAxis.Grid.Color = 11119017
          BottomAxis.LabelsFont.Name = 'Verdana'
          BottomAxis.TicksInner.Color = 11119017
          BottomAxis.Title.Font.Name = 'Verdana'
          Chart3DPercent = 100
          DepthAxis.Axis.Color = 4210752
          DepthAxis.Grid.Color = 11119017
          DepthAxis.LabelsFont.Name = 'Verdana'
          DepthAxis.TicksInner.Color = 11119017
          DepthAxis.Title.Font.Name = 'Verdana'
          DepthTopAxis.Axis.Color = 4210752
          DepthTopAxis.Grid.Color = 11119017
          DepthTopAxis.LabelsFont.Name = 'Verdana'
          DepthTopAxis.TicksInner.Color = 11119017
          DepthTopAxis.Title.Font.Name = 'Verdana'
          LeftAxis.Axis.Color = 4210752
          LeftAxis.Grid.Color = 11119017
          LeftAxis.LabelsFont.Name = 'Verdana'
          LeftAxis.TicksInner.Color = 11119017
          LeftAxis.Title.Font.Name = 'Verdana'
          RightAxis.Axis.Color = 4210752
          RightAxis.Grid.Color = 11119017
          RightAxis.LabelsFont.Name = 'Verdana'
          RightAxis.TicksInner.Color = 11119017
          RightAxis.Title.Font.Name = 'Verdana'
          TopAxis.Axis.Color = 4210752
          TopAxis.Grid.Color = 11119017
          TopAxis.LabelsFont.Name = 'Verdana'
          TopAxis.TicksInner.Color = 11119017
          TopAxis.Title.Font.Name = 'Verdana'
          View3DOptions.Orthogonal = False
          View3DOptions.VertOffset = 100
          ColorPaletteIndex = 13
          object Series1: TAreaSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.Length = 20
            Marks.Visible = False
            DrawArea = True
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
    end
  end
  object TeeCommander1: TTeeCommander
    Left = 0
    Top = 0
    Width = 862
    Height = 33
    Panel = Chart3D1
    Align = alTop
    ParentShowHint = False
    TabOrder = 2
  end
end
