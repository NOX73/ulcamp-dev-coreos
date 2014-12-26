var http = require('http');
var redis = require("redis");

var redisHost = process.env.REDIS_HOST_PORT.split(":");
var c = redis.createClient(redisHost[1], redisHost[0])

var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  c.incr("requests", function(err, total) {
    response.end("My ip: " + process.env.COREOS_PRIVATE_IPV4 + ".\n Total requests: " + total);
  })
});

server.listen(3000);

console.log("Server running at http://127.0.0.1:3000/");
