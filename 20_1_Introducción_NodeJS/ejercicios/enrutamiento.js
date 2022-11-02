const http = require('http');
const fs = require('fs');
const server = http.createServer((req, res) => {
    console.log(req.url)
    res.setHeader('Content-Type', 'text/html');
    let route = './';
    switch (req.url) {
        case '/':
            route += 'home.html';
            break;
        case '/donde-estamos':
            route += 'donde-estamos.html';
            break;
        case '/que-hacemos':
            route += 'que-hacemos.html';
            break;
        case '/quienes-somos':
            route += 'quienes-somos.html';
            break;
        case '/contacto':
            route += 'contacto.html';
            break;
        default:
            route += '404.html'
            break;
    }
    fs.readFile(route, (err, data) => {
        if (err) {
            console.log(err)
            res.end()
        } else {
            res.end(data);
        }
    })
})
server.listen(3001, '127.0.0.1', () => {
    console.log('listening for request on port 3000');
})