define(function () {
  var name = '미네랄';
  var type = '자원';
  var remain = 500;

  var exports = {
    getMineral : function () {
      return remain;
    },
    setMineral : function (mineral) {
      remain = mineral;
    }
  }

  return exports;
});
