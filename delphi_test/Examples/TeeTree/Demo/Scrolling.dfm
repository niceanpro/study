�
 TSCROLLINGFORM 0l  TPF0�TScrollingFormScrollingFormOnCreate
FormCreatePixelsPerInch`
TextHeight � TMemoMemo1Lines.Strings7A Tree can be scrolled (panned) when dragging it with aselected mouse button.BBy default scroll is enabled when dragging the right mouse button. 2Tree1.AllowPanning = pmNone    <-- disables scroll TabOrder   �TPanelPanel1TabOrder TLabelLabel1Left� TopWidthDHeightCaption&Mouse button:  	TCheckBox	CheckBox1LeftTopWidthPHeightCaption&Allow scroll :Checked	State	cbCheckedTabOrder OnClickCheckBox1Click  	TComboBox	ComboBox1Left[TopWidth^HeightStylecsDropDownList
ItemHeightTabOrderOnChangeComboBox1ChangeItems.Strings
HorizontalVerticalBoth   	TComboBox	ComboBox2LeftTopWidthQHeightStylecsDropDownList
ItemHeightTabOrderOnChangeComboBox2ChangeItems.StringsLeftMiddleRight    �TTreeTree1Zoom.Pen.ModepmNotXorOnScrollTree1ScrollTabOrder TTreeNodeShapeTreeNodeShape1X0� Y0<Expanded	
ImageIndextiNoneText.StringsScroll me !   TTreeNodeShapeTreeNodeShape2AutoSizeBrush.Color��  Color��  X0FX1[Y0Y1-Expanded	
ImageIndextiNoneText.Strings    TTreeNodeShapeTreeNodeShape3AutoSizeBrush.ColorclBlueColorclBlueX0FX1[Y0dY1}Expanded	
ImageIndextiNoneText.Strings    TTreeNodeShapeTreeNodeShape4AutoSizeBrush.Color �@ Color �@ X0X1-Y0Y1-Expanded	
ImageIndextiNoneText.Strings    TTreeNodeShapeTreeNodeShape5AutoSizeBrush.ColorclYellowColorclYellowX0X1-Y0dY1}Expanded	
ImageIndextiNoneText.Strings      