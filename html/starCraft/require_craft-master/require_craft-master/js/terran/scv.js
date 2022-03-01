define(['mineral', 'gas'],
      function (MineralModule, GasModule) {

  function SCV(name, type) {
    this.name = name;
    this.type = type;
  };

  SCV.prototype.getMineral = function () {
    var mineral = MineralModule.getMineral();
    console.log('미네랄 캐는중...');
    MineralModule.setMineral(mineral + 8);
    console.log('남은 미네랄 : ' + mineral);
  };

  SCV.prototype.getGas = function () {
    var gas = GasModule.getGas();
    console.log('가스 캐는중...');
    GasModule.setGas(gas + 8);
    console.log('남은 가스 : ' + gas);
  };

  SCV.prototype.makeGasStation = function () {
    var mineral = MineralModule.getMineral();
      console.log('가스 스테이션 건설중...');
      MineralModule.setMineral(mineral - 50);
      console.log('남은 미네랄 : ' + mineral);
      console.log('가스 스테이션 건설완료');
  };

  return SCV;
});
