$(document).ready(function () {
  // gnb메뉴 (개별로 하나씩 보일 때)
  // $(".main__menu").mouseover(function () {
  //   $(this).find(".sub__menu").stop().slideDown(300);
  // });

  // $(".main__menu").mouseout(function () {
  //   $(this).find(".sub__menu").stop().slideUp(300);
  // });

  // gnb메뉴 (백그라운드 화면과 해당 선택만 같이 내려옴)
  // $(".main__menu").mouseover(function () {
  //   $(".gnb_bg").stop().slideDown(300);
  //   $(this).find(".sub__menu").stop().slideDown(300);
  // });

  // $(".main__menu").mouseout(function () {
  //   $(".gnb_bg").stop().slideUp(300);
  //   $(this).find(".sub__menu").stop().slideUp(300);
  // });

  // gnb메뉴 (백그라운드 화면과 해당 선택만 같이 내려옴)
  $(".main__menu").mouseover(function () {
    $(".gnb_bg").stop().slideDown(300);
    $(".sub__menu").stop().slideDown(300);
  });

  $(".main__menu").mouseout(function () {
    $(".gnb_bg").stop().slideUp(300);
    $(".sub__menu").stop().slideUp(300);
  });



  // 슬라이드 (위아래)
  // $(".slide li").eq(0).siblings().css({ top: "-300" });

  // var sliderIndex = 0;
  // setInterval(function () {
  //   if (sliderIndex < 2) {
  //     sliderIndex++;
  //   } else {
  //     sliderIndex = 0;
  //   }
  //   $(".slide li").eq(sliderIndex).siblings().animate({ top: "-300" }, 600);
  //   $(".slide li").eq(sliderIndex).animate({ top: "0" }, 600);
  // }, 3000);

  //   슬라이드(좌우);
  //   $(".slide li").eq(0).siblings().css({ left: "-1000" });

  //   var sliderIndex = 0;
  //   setInterval(function () {
  //     if (sliderIndex < 2) {
  //       sliderIndex++;
  //     } else {
  //       sliderIndex = 0;
  //     }
  //     $(".slide li").eq(sliderIndex).siblings().animate({ left: "-1000" }, 600);
  //     $(".slide li").eq(sliderIndex).animate({ left: "0" }, 600);
  //   }, 3000);

  //   슬라이드 (페이드인아웃)
      $(".slide li").eq(0).siblings().hide();

    var sliderIndex = 0;
    setInterval(function () {
      if (sliderIndex < 2) {
        sliderIndex++;
      } else {
        sliderIndex = 0;
      }
        $(".slide li").eq(sliderIndex).siblings().fadeOut(800);
        $(".slide li").eq(sliderIndex).fadeIn(800);
    }, 3000);

  // 탭메뉴
  $(".tab__1").click(function () {
    $(".notice").css("display", "block");
    $(".gallery").css("display", "none");
  });
  $(".tab__2").click(function () {
    $(".notice").css("display", "none");
    $(".gallery").css("display", "block");
  });

  // 모달
  $(".notice li:first").click(function () {
    $("#modal").addClass("active");
  });

  $(".modal_btn").click(function () {
    $("#modal").removeClass("active");
  });


});
