const http = require('http');

const port = process.env.FRONTEND_PORT || 3000;

const html = `<!doctype html>
<html>
  <head><meta charset="utf-8"><title>NOVA UI</title></head>
  <body style="font-family: sans-serif; padding: 2rem;">
    <h1>NOVA UI running</h1>
    <p>Backend: <a href="http://localhost:8000/health">http://localhost:8000/health</a></p>
  </body>
</html>`;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(html);
});

server.listen(port, () => {
  console.log(`frontend listening on http://localhost:${port}`);
});
