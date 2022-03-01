//룰렛 아이템 참조 
var rouletteItemList	= $( "#image-panel img" );
var imagePanel			= $( "#image-panel" );
var imagePanelIndex		=[0, 1, 2, 3, 4, 5]; // 이미지 패널 id참조 선언
var rotateAngle			=0;					 // 이동 할 angle값 

var selectPanel			= $( "#select-image-panel" );

/* svg영역 마우스 이벤트  */
function onMouseOverPath( e ){
	var nIndex = parseInt( e.target.getAttributeNS( null, "id" ).substr(-1) );
	var image = rouletteItemList[ imagePanelIndex[nIndex] ];
	image.style.opacity = 0.5;
}

function onMouseOutPath( e ){
	var nIndex = parseInt( e.target.getAttributeNS( null, "id" ).substr(-1) );
	var image = rouletteItemList[ imagePanelIndex[nIndex] ];
	image.style.opacity = 1;
}



function onMouseDownPath( e ){
	
	var nIndex		= parseInt( e.target.getAttributeNS( null, "id" ).substr(-1) );
	var average 	= 360/rouletteItemList.length;
	rotateAngle		+= -average * nIndex;
	imagePanel.css( {"-webkit-transform":"rotate(" + rotateAngle +"deg)"});
	
	/* 클릭 시 선택한 id값을 기준으로 배열 인덱스 조작 */ 
	imagePanelIndex = imagePanelIndex.splice( nIndex ).concat( imagePanelIndex );
	
	var image = rouletteItemList[ imagePanelIndex[0] ];
	image.style.opacity = 1;
	console.log( image, selectPanel );
	/* ① 선택 이미지 패널의 배경 이미지 속성을 변경 */
	selectPanel.css({background:"url("+ image.getAttribute( "src" ) +" )"});
	
}