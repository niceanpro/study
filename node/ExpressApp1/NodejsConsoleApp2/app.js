"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function createSquare(config) {
    var newSquare = { color: "white", area: 100 };
    if (config.color) {
        newSquare.color = config.color;
    }
    if (config.width) {
        newSquare.area = config.width * config.width;
    }
    return newSquare;
}
var mySquare = createSquare({ color: "black" });
var emptyObject = {};
var personObject = {
    firstName: "John",
    lastName: "Smith"
};
personObject["salary"] = 14000;
console.dir(personObject);
for (var member in personObject) {
    if (personObject.hasOwnProperty(member)) {
        console.log("the member " + member + " of personObject is " + personObject[member]);
    }
}
// 인터페이스 implements
var person1 = {
    name: "john",
    move: function () { }
};
var person2 = {
    name: "john",
    age: 42,
    move: function () { }
};
// 에러! 사용할수 없음, move 함수가 없고, age가 잘못된 변수형임                                                      
var person3 = {
    name: "john",
    age: 30,
    move: function () { }
};
var mySearch;
mySearch = function (src, sub) {
    return src.search(sub) != -1;
};
var Point = /** @class */ (function () {
    function Point(x, y) {
        if (y === void 0) { y = 0; }
        this.y = y;
        this.x = x;
    }
    Point.prototype.dist = function () {
        return Math.sqrt(this.x * this.x + this.y * this.y);
    };
    Point.origin = new Point(0, 0);
    return Point;
}());
var point1 = new Point(10, 20);
var point2 = new Point(25);
var test = "123";
{
    var test = "456";
    console.log("In value : " + test);
}
console.log("Out value : " + test);
var test = "123";
{
    var test_1 = "456";
    console.log("In value : " + test_1);
}
console.log("Out value : " + test);
// 유니언 타입
var unionX = 1;
unionX = 'anpro';
// unionX = true;
function typeCheck(p) {
    return p;
}
typeCheck(1);
// typeCheck(true);
var fruits = ["banana", "apple", "mango"];
var fruits2 = [];
fruits2.push("banana");
fruits2.push("apple");
fruits2.push("mango");
var num = [1, 2, 3];
var num2 = new Array();
num2.push(1);
num2.push(2);
num2.push(3);
var tutu = [true, 0];
console.dir(tutu);
tutu.concat([false, 1]);
console.dir(tutu);
tutu.push(false, 4);
console.dir(tutu);
tutu[5] = true;
tutu[6] = false;
// tutu.push('string'); // Error: Argument of type 'string' is not assignable to parameter of type 'number | boolean'.
var Rect = /** @class */ (function () {
    function Rect(width, height) {
        //        this.width = width;
        //       this.height = height;
    }
    Rect.prototype.getArea = function () {
        return this.width * this.height;
    };
    return Rect;
}());
var rect = new Rect(10, 10);
rect.width; // 에러
var RectA = /** @class */ (function () {
    function RectA(width, height) {
        this.width = width;
        this.height = height;
    }
    RectA.prototype.getArea = function () {
        return this.width * this.height;
    };
    return RectA;
}());
var recta = new RectA(10, 10);
recta.getArea(); // 100
// interface없이 사용
var Duck = /** @class */ (function () {
    function Duck() {
    }
    Duck.prototype.quack = function () {
        console.log('꽥!');
    };
    return Duck;
}());
var Persons = /** @class */ (function () {
    function Persons() {
    }
    Persons.prototype.quack = function () {
        console.log('나도 꽥!');
    };
    return Persons;
}());
function makeSomeNoiseWith(duck) {
    duck.quack();
}
makeSomeNoiseWith(new Duck()); // OK
makeSomeNoiseWith(new Persons()); // OK
var Duck1 = /** @class */ (function () {
    function Duck1() {
    }
    Duck1.prototype.quack = function () {
        console.log('꽥!');
    };
    return Duck1;
}());
var Person1 = /** @class */ (function () {
    function Person1() {
    }
    Person1.prototype.quack = function () {
        console.log('나도 꽥!');
    };
    return Person1;
}());
function makeSomeNoiseWith1(duck) {
    duck.quack();
}
makeSomeNoiseWith1(new Duck1()); // OK
makeSomeNoiseWith1(new Person1()); // OK
var Rect2 = /** @class */ (function () {
    function Rect2(width, height) {
        this.width = width;
        this.height = height;
    }
    Rect2.prototype.getArea = function () {
        return this.width * this.height;
    };
    return Rect2;
}());
var Circle = /** @class */ (function () {
    function Circle(radius) {
        this.radius = radius;
    }
    Circle.prototype.getArea = function () {
        return Math.PI * this.radius * this.radius;
    };
    return Circle;
}());
// 자바 스크립트에서 문제없는 코드
var dict = {
    foo: 1,
    bar: 2
};
Object.keys(dict)
    .forEach(function (k) { return console.log(dict[k]); });
var dict1 = {
    foo: 1,
    bar: 2
};
Object.keys(dict1)
    .forEach(function (k) { return console.log(dict1[k]); }); // OK
var sum = function (arg1, arg2) {
    return arg1 + arg2;
};
var multiply = function (arg1, arg2) {
    return arg1 * arg2;
};
// const toArray: numberOperation = (arg1: any, arg2: any): any[] => { // error: Type '(arg1: any, arg2: any) => any[]' is not assignable to type 'numberOperation'. Type 'any[]' is not assignable to type 'number'.
//   return [arg1, arg2];
// };
// 생성자 인터페이스
var Dog = /** @class */ (function () {
    function Dog(name, age) {
        this.name = name;
        this.age = age;
    }
    return Dog;
}());
var Cat = /** @class */ (function () {
    function Cat(name, age) {
        this.name = name;
        this.age = age;
    }
    return Cat;
}());
function createAnimal(cstr, name, age) {
    return new cstr(name, age);
}
console.log(createAnimal(Dog, '팔랑', 15));
console.log(createAnimal(Cat, '쭈쭈', 10));
// noImplicitThis : true
/*
function logArray() {
  for (const item of this) {
    console.log(item);
  }
}
logArray.call(['팔랑이', '쭈쭈']);
*/
function logArray() {
    for (var _i = 0, _a = this; _i < _a.length; _i++) {
        var item = _a[_i];
        console.log(item);
    }
}
logArray.call(['팔랑이', '쭈쭈']); // OK
var Stack = /** @class */ (function () {
    function Stack() {
        this.data = [];
    }
    Stack.prototype.push = function (item) {
        this.data.push(item);
    };
    Stack.prototype.pop = function () {
        return this.data.pop();
    };
    return Stack;
}());
var numberStack = new Stack();
var stringStack = new Stack();
numberStack.push(1);
stringStack.push('a');
// 상속된 타입
function getFirst(container) {
    var item = container.pop();
    container.push(item);
    return item;
}
var k = getFirst(numberStack);
// getFirst<number, number>(1); // Type 'number' does not satisfy the constraint 'Stack<number>'.
var Color;
(function (Color) {
    Color[Color["Red"] = 0] = "Red";
    Color[Color["Green"] = 1] = "Green";
    Color[Color["Blue"] = 2] = "Blue";
})(Color || (Color = {}));
var cn = Color[2];
var cn2 = Color[1];
var kt = 1;
//# sourceMappingURL=app.js.map