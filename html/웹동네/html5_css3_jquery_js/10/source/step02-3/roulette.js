//룰렛 아이템 참조 
var rouletteItemList	= $( "#image-panel img" );
var imagePanel			= $( "#image-panel" );
var imagePanelIndex		=[0, 1, 2, 3, 4, 5]; /*이미지 패널 id참조 선언 */
 

var rotateAngle         =0;                  /*  이동 할 angle값 */

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
    
    var nIndex      = parseInt( e.target.getAttributeNS( null, "id" ).substr(-1) );
    var average     = 360/rouletteItemList.length;
     /* ① rotateAngle 값에 이동 할 값을 더해 줌 */
    rotateAngle     += -average * nIndex;
    imagePanel.css( {"-webkit-transform":"rotate(" + rotateAngle +"deg)"});
     
    imagePanelIndex = imagePanelIndex.splice( nIndex ).concat( imagePanelIndex );
    
    /* ② 선택이미지의 opaticy값을 1로 초기화 */
    var image = rouletteItemList[ imagePanelIndex[0] ];
    image.style.opacity = 1;
        
}







