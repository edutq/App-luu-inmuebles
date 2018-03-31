var express = require('express');
var router = express.Router();
// middleware that is specific to this router

// define the home page route
router.get('/', function (req, res) {
  res.render('cliente/index_cliente');
})
// define the about route
router.get('/about', function (req, res) {
  res.render('cliente/busqueda')
})

module.exports = router