let userList = [
    { name: "Mike", age: 30 },
    { name: "Jave", age: 20 },
    { name: "Tom", age: 40 },
    { name: "Alice3", age: 60 },
];

console.log("He");
console.log(userList);

let result = userList.filter((user) => {
    if (user.age < 40) {
        return true;
    }
    return false;
});
console.log(result);

console.log("foreach");
let rfor = [];
result.forEach((i) => {
    rfor.push(Object.assign({}, i));
});
console.log(rfor);
console.log("foreach");

let r1 = userList.map((user, index) => {
    if (user.age < 40) {
        return Object.assign({}, user);
    }
})
r1[1].name = "kim";
console.log(r1);

let red = userList.reduce((prev, cur) => {
    if (cur.age < 40) {
        prev.push(cur);
    }
    return prev;
}, []);

red[1].name = "kim";
console.log(red);

console.log("Spread syntax");
let rsp = userList[0];
rsp.name = "ho";
console.log(rsp);
console.log(userList);

var ll = new FormData();
ll.append("aaa", "bbb");
console.log(ll);