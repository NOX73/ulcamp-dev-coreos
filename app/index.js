var http = require('http');

var id = Math.random();

var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("My id: " + id);
});

server.listen(3000);

console.log("Server running at http://127.0.0.1:3000/");
