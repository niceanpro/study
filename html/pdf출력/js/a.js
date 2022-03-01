define(function(){
    var a = 1;
    var b = 2;
    var exports = { 
        getA : function() { 
            return a;
        },
        getB : function() { 
            return b;
        },
     };

     return exports;
});