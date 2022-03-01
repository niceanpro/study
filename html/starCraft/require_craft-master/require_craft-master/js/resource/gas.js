define(function () {
  var name = '가스';
  var type = '자원';
  var remain = 100;

  var exports = {
    getGas : function () {
      return remain;
    },
    setGas : function (gas) {
      remain = gas;
    }
  }

  return exports;
});
