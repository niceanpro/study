"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var http = require("http");
var port = process.env.port || 1337;
http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hello World\n');
}).listen(port);
var myName = 'Jupeter';
myName = 35;
var a = 33;
a = 'anpro';
var classB = ["students", 20];
classB = ["anpro"];
var Color;
(function (Color) {
    Color[Color["Blue"] = 0] = "Blue";
    Color[Color["Red"] = 10] = "Red";
    Color[Color["Green"] = 11] = "Green";
})(Color || (Color = {}));
var color1 = Color.Green;
//# sourceMappingURL=server.js.map