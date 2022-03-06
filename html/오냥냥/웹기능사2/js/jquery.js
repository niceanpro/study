$(document).ready(function () {
  // gnb 메뉴
  $(".main_menu").mouseover(function () {
    $(this).find(".sub_menu").stop().slideDown(300);
  });
  $(".main_menu").mouseout(function () {
    $(this).find(".sub_menu").stop().slideUp(300);
  });

  //슬라이드
  $(".slide li").eq(0).siblings().css({ left: "-750px" });
  var slideIndex = 0;
  setInterval(function () {
    if (slideIndex < 2) {
      slideIndex++;
    } else {
      slideIndex = 0;
    }

    $(".slide li").eq(slideIndex).siblings().animate({ left: "-750px" });
    $(".slide li").eq(slideIndex).animate({ left: "0px" });


  }, 3000)

});