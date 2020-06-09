const
    express = require('express');
    app = express();
    cors = require('cors')
    bodyParser = require('body-parser')
    port = process.env.PORT || 3000;
    http = require('http');
    server = http.createServer(app);

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(cors())

app.use('/', require('./routes/routes'));
app.use(express.static('public'));

server.listen(port);
console.log('Server running on port: ' + port);