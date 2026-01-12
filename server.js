const http = require('http');
const port = process.env.PORT || 3000;
const host = '0.0.0.0';
const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, {'Content-Type': 'application/json'});
    res.end(JSON.stringify({status: 'ok'}));
    return;
  }
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello from Repo\n');
});
server.listen(port, host, () => console.log(`Listening on ${host}:${port}`));
