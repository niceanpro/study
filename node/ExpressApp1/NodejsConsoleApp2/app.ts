import { watch } from "fs";

interface SquareConfig {
    color?: string;
    width?: number;
}

function createSquare(config: SquareConfig): { color: string; area: number } {
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

var emptyObject = {}
var personObject = {
    firstName: "John",
    lastName: "Smith"
}
personObject["salary"] = 14000;
console.dir(personObject);

for (var member in personObject) {
    if (personObject.hasOwnProperty(member)) {
        console.log("the member " + member + " of personObject is " + personObject[member]);
    }
}





// 인터페이스
interface Person {
    name: string;
    age?: number  // optional

    move(): void;
}

// 인터페이스 implements
var person1: Person = {
    name: "john",
    move: () => { }
}

var person2: Person = {
    name: "john",
    age: 42,
    move: () => { }
}

// 에러! 사용할수 없음, move 함수가 없고, age가 잘못된 변수형임                                                      
var person3: Person = {
    name: "john",
    age: 30,
    move: () => { }
}


interface SearchFunc {
    (source: string, substring: string): boolean;
}

var mySearch: SearchFunc;
mySearch = function (src: string, sub: string) {
    return src.search(sub) != -1;
}


class Point {
    x: number;

    constructor(x: number, public y: number = 0) {
        this.x = x;
    }

    dist() {
        return Math.sqrt(this.x * this.x + this.y * this.y);
    }

    static origin = new Point(0, 0);
}

var point1 = new Point(10, 20);
var point2 = new Point(25);



var test = "123";
{
    var test: string = "456";
    console.log("In value : " + test);
}
console.log("Out value : " + test);

var test = "123";
{
    let test: string = "456";
    console.log("In value : " + test);
}
console.log("Out value : " + test);

// 유니언 타입
let unionX: string | number = 1;
unionX = 'anpro';
// unionX = true;

function typeCheck(p: string | number): string | number {
    return p;
}

typeCheck(1);
// typeCheck(true);

let fruits: string[] = ["banana", "apple", "mango"];
let fruits2: string[] = [];
fruits2.push("banana")
fruits2.push("apple")
fruits2.push("mango")


let num: Array<number> = [1, 2, 3];
let num2: Array<number> = new Array<number>();
num2.push(1);
num2.push(2);
num2.push(3);


let tutu: [boolean, number] = [true, 0];
console.dir(tutu);
tutu.concat([false, 1]);
console.dir(tutu);
tutu.push(false, 4);
console.dir(tutu);
tutu[5] = true;
tutu[6] = false;

// tutu.push('string'); // Error: Argument of type 'string' is not assignable to parameter of type 'number | boolean'.


class Rect {
    width: number;
    height: number;
    constructor(width, height) {
//        this.width = width;
 //       this.height = height;
    }
    getArea(): number {
        return this.width * this.height;
    }
}
const rect = new Rect(10, 10);
rect.width;      // 에러

class RectA {
  constructor(private width: number, private height: number) { }
  getArea(): number {
    return this.width * this.height;
  }
}
const recta = new RectA(10, 10);
recta.getArea(); // 100



// interface없이 사용
class Duck {
  quack() {
    console.log('꽥!');
  }
}
class Persons {
  quack() {
    console.log('나도 꽥!');
  }
}
function makeSomeNoiseWith(duck) {
  duck.quack();
}
makeSomeNoiseWith(new Duck()); // OK
makeSomeNoiseWith(new Persons()); // OK


// interface사용
interface Quackable {
  quack(): void;
}
class Duck1 implements Quackable {
  quack() {
    console.log('꽥!');
  }
}
class Person1 {
  quack() {
    console.log('나도 꽥!');
  }
}
function makeSomeNoiseWith1(duck: Quackable): void {
  duck.quack();
}
makeSomeNoiseWith1(new Duck1()); // OK
makeSomeNoiseWith1(new Person1()); // OK


interface Shape {
  width? : number;
  height?: number;
  radius?: number;
  getArea(): number;
}
class Rect2 implements Shape {
  width : number;
  height: number;
  constructor(width, height) {
    this.width  = width;
    this.height = height;
  }
  getArea(): number {
    return this.width * this.height;
  }
}
class Circle implements Shape {
  radius: number;
  constructor(radius) {
    this.radius = radius;
  }
  getArea(): number {
    return Math.PI * this.radius * this.radius;
  }
}


// 자바 스크립트에서 문제없는 코드
const dict = {
  foo: 1,
  bar: 2
};
Object.keys(dict)
.forEach(k => console.log(dict[k]));

// typescript에서 해결하기 위해 indexable
interface Indexable {
  [key: string]: any;
}
const dict1: Indexable = {
  foo: 1,
  bar: 2
};
Object.keys(dict1)
.forEach(k => console.log(dict1[k])); // OK


// 함수 인터페이스
interface numberOperation {
  (arg1: number, arg2: number): number;
}
const sum: numberOperation = (arg1: number, arg2: number): number => {
  return arg1 + arg2;
};
const multiply: numberOperation = (arg1, arg2) => {
  return arg1 * arg2;
};
// const toArray: numberOperation = (arg1: any, arg2: any): any[] => { // error: Type '(arg1: any, arg2: any) => any[]' is not assignable to type 'numberOperation'. Type 'any[]' is not assignable to type 'number'.
//   return [arg1, arg2];
// };



// 생성자 인터페이스
class Dog {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age  = age;
  }
}
class Cat {
    name: string;
    age: number;
    constructor(name: string, age: number) {
        this.name = name;
        this.age = age;
    }
}
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

function logArray(this: string[]) {
  for (const item of this) {
    console.log(item);
  }
}
logArray.call(['팔랑이', '쭈쭈']); // OK



class Stack<T> {
  private data: T[] = [];
  constructor() {}
  push(item: T): void {
    this.data.push(item);
  }
  pop(): T {
    return this.data.pop();
  }
}


const numberStack = new Stack<number>();
const stringStack = new Stack<string>();
numberStack.push(1);
stringStack.push('a');



// 상속된 타입
function getFirst<T extends Stack<U>, U>(container: T): U {
  const item = container.pop();
  container.push(item);
  return item;
}
let k : number = getFirst<Stack<number>, number>(numberStack);
// getFirst<number, number>(1); // Type 'number' does not satisfy the constraint 'Stack<number>'.


enum Color { Red, Green = 1, Blue }
let cn: string = Color[2];

let cn2 = Color[1];
let kt = 1;

