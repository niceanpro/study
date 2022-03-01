

var rouletteItemList	= $( "#image-panel img" ); /*룰렛 아이템 참조*/ 
var imagePanel			= $( "#image-panel" ); /*이미지 패널 참조*/ 

/* svg영역 마우스 이벤트  */
function onMouseOverPath( e ){
	console.log( "마우스 오버" );
	/* ① */
	var nIndex = parseInt( e.target.getAttributeNS( null, "id" ).substr(-1) );
	var image = rouletteItemList[ nIndex ];
	image.style.opacity = 0.5;
}

function onMouseOutPath( e ){
	console.log( "마우스 아웃" );
	/* ② */
	var nIndex = parseInt( e.target.getAttributeNS( null, "id" ).substr(-1) );
	var image = rouletteItemList[ nIndex ];
	image.style.opacity = 1;
}


function onMouseDownPath( e ){
	console.log( "마우스 다운" );
	var nIndex		= parseInt( e.target.getAttributeNS( null, "id" ).substr(-1) );
	var average 	= 360/rouletteItemList.length;
	var rotateAngle =-average * nIndex;
	imagePanel.css( {"-webkit-transform":"rotate(" + rotateAngle +"deg)"});
}

