//룰렛 아이템 참조 
var rouletteItemList	= $( "#image-panel img" );
var imagePanel			= $( "#image-panel" );
var imagePanelIndex		=[0, 1, 2, 3, 4, 5]; // 이미지 패널 id참조 선언
var rotateAngle			=0;					 // 이동 할 angle값 

var angle				= 360/rouletteItemList.length; // 평균 angle값 참조
var selectPanel			= $( "#select-image-panel" );

function getTargetID( element ){
	return parseInt( element.getAttributeNS( null, "id" ).substr(-1) );
}

function changeItemOpacityAtIndex( nIndex, nValue ){ 
	var image = rouletteItemList[ imagePanelIndex[nIndex] ];
	image.style.opacity		= nValue;
	return image;
}

/* svg영역 마우스 이벤트  */
function onMouseOverPath( e ){
	console.log( "마우스 오버" );
	var nIndex = getTargetID( e.target );
	changeItemOpacityAtIndex( nIndex, .5 );
}

function onMouseOutPath( e ){
	console.log( "마우스 아웃" );
	var nIndex = getTargetID( e.target );
	changeItemOpacityAtIndex( nIndex, 1 );
}

function onMouseDownPath( e ){
	var nIndex		= parseInt( e.target.getAttributeNS( null, "id" ).substr(-1) );
	
	rotateAngle		+= -angle * nIndex;
	console.log( "angle", rotateAngle );
	imagePanel.css( {"-webkit-transform":"rotate(" + rotateAngle +"deg)"});
	// 클릭 시 선택한 id값을 기준으로 배열 인덱스 조작 
	imagePanelIndex = imagePanelIndex.splice( nIndex ).concat( imagePanelIndex );
	var image = changeItemOpacityAtIndex( 0, 1 );
	selectPanel.css({background:"url("+ image.getAttribute( "src" ) +" )"});
	
}