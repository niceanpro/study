?
 TMAKEREDITOR1 0j  TPF0?TMakerEditor1MakerEditor1Left?Top/CaptionMakerEditor1ClientWidth?PixelsPerInch`
TextHeight ?TTeeCommanderTeeCommander1Width? ?TPanelPanel1Left9   ?TPanelPanelBigWidth! ?	TSplitterSplitterAnimWidth   ?TPageControl
PageEditor ?	TTabSheet	TabBlocks ?TPanel	PanelTree ?TPanelPanelEditorDockSite	    ?	TTabSheet	TabExtras ?TPageControl
PageExtras ?	TTabSheetTabOther ?TPageControlPageControl2
ActivePageTabGLExtensionsOnChangePageControl2Change ?	TTabSheetTabAdvanced ?TPanelPanel4 ?TLabelLabel27LeftTopWidthCHeightCaptionTotal Memory:  ?TLabelLTotalMemoryLeftXTopWidthHeightCaption0  TButtonButton4LeftTopHWidthyHeightCaptionShow depth buffer...TabOrderOnClickButton4Click  	TCheckBox
CBMouseXYZLeftToppWidth? HeightCaptionShow Mouse to Model XYZTabOrder	    	TTabSheetTabGLExtensionsCaptionOpenGL TPageControlPageControl1Left Top WidthQHeight?
ActivePage
TabProgramAlignalClientTabOrder OnChangePageControl1Change 	TTabSheetTabExtensionsCaption
Extensions TMemoMemoExtensionsLeft Top WidthIHeight?AlignalClientReadOnly	
ScrollBars
ssVerticalTabOrder    	TTabSheet	TabSheet3CaptionInfo
ImageIndex TMemo
MemoGLInfoLeft Top WidthIHeight?AlignalClientReadOnly	TabOrder    	TTabSheet	TabSheet4CaptionPixel Formats
ImageIndex TPanelPanel2Left Top WidthIHeight)AlignalTopTabOrder  TLabelLabel23LeftTopWidth<HeightCaptionPixel &Format:FocusControlEdit1  TLabelLPixelFormatCountLeft? TopWidthHeight  TEditEdit1LeftHTopWidth!HeightTabOrder Text0OnChangeEdit1Change  TUpDownUDPixelFormatLeftiTopWidthHeight	AssociateEdit1TabOrder  TButtonButton3Left? TopWidthKHeightCaptionTry SetTabOrderOnClickButton3Click   TMemoMemoPixelFormatLeft Top)WidthIHeight?AlignalClientReadOnly	
ScrollBars
ssVerticalTabOrder   	TTabSheet
TabProgramCaptionGLSL Shaders
ImageIndex TPageControlPageControl3Left Top WidthIHeight?
ActivePage
TabShadersAlignalClientTabOrder  	TTabSheet
TabShadersCaptionShaders 	TSplitter	Splitter2Left Top? WidthAHeightCursorcrVSplitAlignalTop  TPanelPanel13Left Top WidthAHeight)AlignalTopTabOrder  TButtonBCompileShaderLeftTopWidthKHeightCaption&CompileTabOrder OnClickBCompileShaderClick  	TCheckBoxCBShaderActiveLefthTopWidthaHeightCaption&ActiveEnabledTabOrderOnClickCBShaderActiveClick  
TComboFlatComboShadersLeft? Top
Widthy	ItemIndex TabOrderText	(default)OnChangeComboShadersChangeItems.Strings	(default)    TMemoMemoVertexShaderLeft Top)WidthAHeight? AlignalTop
ScrollBarsssBothTabOrderOnChangeMemoVertexShaderChange  TMemoMemoFragmentShaderLeft Top? WidthAHeight? AlignalClient
ScrollBarsssBothTabOrderOnChangeMemoVertexShaderChange  TPageControlPageShadersLeftTop@Width!HeightI
ActivePage	TabSheet9TabOrderVisible 	TTabSheet	TabSheet7CaptionVertex TMemoMemoDefaultVertexLeft Top WidthHeight-AlignalClientLines.Strings&varying vec3 normal, lightDir, eyeVec;varying float att; void main(){'  normal = gl_NormalMatrix * gl_Normal; 6  vec3 vVertex = vec3(gl_ModelViewMatrix * gl_Vertex); <  lightDir = vec3(gl_LightSource[0].position.xyz - vVertex);  eyeVec = -vVertex;   gl_FrontColor = gl_Color;   att=1; ;  gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;  gl_Position = ftransform();}  
ScrollBarsssBothTabOrder WordWrap   	TTabSheet	TabSheet9CaptionFragment
ImageIndex TMemoMemoDefaultFragmentLeft Top WidthHeight-AlignalClientLines.Stringsuniform sampler2D MakerTexture;uniform bool MakerTextured; &varying vec3 normal, lightDir, eyeVec;varying float att; void main (void){  vec4 diffuse;   if (MakerTextured)D     diffuse = gl_Color * texture2D(MakerTexture,gl_TexCoord[0].st);  else     diffuse = gl_Color; S  vec4 final_color = (diffuse * (gl_LightModel.ambient+gl_LightSource[0].ambient));   vec3 N = normalize(normal);  vec3 L = normalize(lightDir);   float lambertTerm = dot(N,L);   if(lambertTerm > 0.0)  {E    final_color += gl_LightSource[0].diffuse * diffuse * lambertTerm;     vec3 E = normalize(eyeVec);    vec3 R = reflect(-L, N); L    float specular = pow( max(dot(R, E), 0.0), gl_FrontMaterial.shininess ); /    final_color += gl_LightSource[0].specular *>                   gl_FrontMaterial.specular * specular * att;  }   gl_FragColor = final_color;}  
ScrollBarsssBothTabOrder WordWrap     	TTabSheetTabShaderDebugCaption	Debug Log
ImageIndex TMemoMemoShaderLogLeft Top WidthAHeight?AlignalClientTabOrder             ?
TStatusBar
StatusBar1Width?  ?
TPopupMenu
PopupMenu1 ?	TMenuItemOpen2Caption&Open in new tab   ?	TMainMenu	MainMenu1 ?	TMenuItemFile1 ?	TMenuItemReopen1Visible	   ?	TMenuItemTools1 ?	TMenuItemN3Caption-  ?	TMenuItemGenerateTypes1Caption&Generate Types 	TMenuItemNormal1Caption&NormalOnClickNormal1Click  	TMenuItemWithTextures1CaptionWith &TexturesOnClickWithtextures1Click   ?	TMenuItemMemoryTracker1Caption&Memory TrackerVisibleOnClickMemoryTracker1Click  ?	TMenuItem	Language1Caption	&Language 	TMenuItemEnglish1Caption&EnglishChecked		RadioItem	OnClickEnglish1Click  	TMenuItemSpanish1Caption&Spanish	RadioItem	OnClickSpanish1Click    	TMenuItemHelp1Caption&Help 	TMenuItemAbout1Caption	&About...OnClickAbout1Click     