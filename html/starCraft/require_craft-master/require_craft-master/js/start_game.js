require.config({
  baseUrl : 'js',
  paths : {
    'mineral' : 'resource/mineral',
    'gas' : 'resource/gas'
  }
});

require(['terran/command_center'] , function (CommandCenter) {
  var scvs = [];

  for (var i = 0 ; i < 5 ; i++) {
    var scv = CommandCenter.makeSCV();
    scvs.push(scv);
  }

  for (var j = 0 ; j < 4 ; j++) {
    scvs[j].getMineral();
  }
  scvs[4].makeGasStation();
});
