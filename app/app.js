const http = require('http');
const serverListenHandler = () => http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World@');
}).listen(3000);

// 무중단 배포를 확인하기 위해 서버가 뜨는 시간을 딜레이를 줌.
const delay = 5;
setTimeout(serverListenHandler, delay * 1000);
