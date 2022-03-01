
/* ① 룰렛 아이템 참조 */ 
var rouletteItemList = $( "#image-panel img" );

/* ② 룰렛 아이템 마우스 이벤트 등록 */
rouletteItemList.hover( function(){
	console.log( "마우스 오버" );
}, function(){
	console.log( "마우스 아웃" );
} );
