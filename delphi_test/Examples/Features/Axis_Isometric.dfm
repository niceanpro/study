�
 TISOMETRICAXIS 0�  TPF0�TIsometricAxisIsometricAxisOnCreate
FormCreatePixelsPerInch`
TextHeight �	TSplitterBaseSplitter1Topi  �TMemoMemo1HeightiLines.Strings4A small function lets you make two axis "isometric".NThat is, for same number of pixels, same scales according to your screen size,:so grid lines form perfect "squares" instead of rectangle. MakeIsoAxis(Series1); ONote: Must be called after axes have recalculated min and max values. See code.   �TChartChart1Top� Height� Legend.VisibleTitle.Text.StringsIsometic axes 
OnUndoZoomChart1UndoZoomOnZoom
Chart1ZoomView3D TFastLineSeriesSeries1Marks.Callout.Brush.ColorclBlackMarks.VisibleLinePen.ColorclRedXValues.NameXXValues.OrderloAscendingYValues.NameYYValues.OrderloNone   �TPanelPanel1Topk TButtonButton1LeftTopWidth� HeightCaption&Make axis IsometricTabOrder OnClickButton1Click    