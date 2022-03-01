import http = require('http');
var port = process.env.port || 1337
http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hello World\n');
}).listen(port);

let myName = 'Jupeter';
myName = 35;

let a = 33;
a = 'anpro';

let classB = ["students", 20];
classB = ["anpro"];

enum Color {
    Blue,
    Red = 10,
    Green
}

let color1 = Color.Green;