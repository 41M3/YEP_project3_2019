var express = require('express');
var router = express.Router();

router.get('/', function (req, res) {
    res.render('home');
});

router.get('/signin', function (req, res) {
    res.render('inscription');
});

router.get('/login', function (req, res) {
    res.render('connexion');
});

module.exports = router;
