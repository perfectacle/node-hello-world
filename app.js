const http = require('http');
const port = 3000;

setTimeout(() => {
  http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World');
  }).listen(port);
}, 30 * 1000);
