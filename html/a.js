function resolveAfter2Seconds() { 
	return new Promise(resolve => { 
		setTimeout(() => { 
			resolve('resolved'); 
		}, 2000); 
	}); 
} 

async function asyncCall() { 
	console.log('calling'); 
	var result = await resolveAfter2Seconds(); 
	console.log(result);
}

function reg() {
	var a = /abc/.exec("this is abc");
	console.log(a);
}

asyncCall();
reg();

var data = 10; // 1 
function outer() { 
	function inner(){
		this.data = 20; // 2 
		var data = 35; // 3 
		console.log("1. data = " + data); 
		console.log("2. inner function this.data = " + this.data); 
		console.log("3. window.data = " + window.data); 
	}
	inner();
} 

outer();


var data = 10;              // 1
function MyClass () {
    this.data = 0;
}
MyClass.prototype.method1 = function () {
    this.data = 20;         // 2
    data = 30;              // 3

    console.log("1. data = " + data);
    console.log("2. method this.data = " + this.data);
    console.log("3. window.data = " + window.data);
}

var my1 = new MyClass();
my1.method1();
