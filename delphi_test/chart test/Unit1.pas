unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.Series, VCLTee.TeEngine,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.TeeSpline, VCLTee.TeeDraw3D, VCLTee.TeeGDIPlus, VCLTee.TeeData, Data.DB,
  Vcl.StdCtrls, VCLTee.TeCanvas, VCLTee.TeePenDlg;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series3: TLineSeries;
    Series2: TPointSeries;
    ChartDataSet1: TChartDataSet;
    SeriesDataSet1: TSeriesDataSet;
    ButtonPen1: TButtonPen;
    SeriesDataSet2: TSeriesDataSet;
    SeriesDataSet3: TSeriesDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
