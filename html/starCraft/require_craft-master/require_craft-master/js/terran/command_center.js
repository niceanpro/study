define(['terran/scv', 'mineral'],
      function (SCV, MineralModule) {
  var name = '커맨드센터';
  var type = '건물';

  var exports = {
    makeSCV : function () {
      var mineral = MineralModule.getMineral();
      if (mineral >= 50) {
        console.log('SCV 생산중...');
        console.log('남은 미네랄 : ' + mineral);
        console.log('SCV 생산 완료');
        MineralModule.setMineral(mineral - 50);

        return new SCV('SCV', '유닛');
      }
    }
  };

  return exports;
});
