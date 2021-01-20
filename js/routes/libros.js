var clienteController=require('../controllers/clienteController');
var router = require('express').Router()
router.get('/search', function(req, res) {
  res.json({ message: 'Vas a buscar un libro '})
})
router.get('/', function(req, res) {
  //res.json({ message: 'Estás conectado a la API. Recurso: libros' })
  clienteController.list(req,res);
})
router.get('/:idlibro', function(req, res) {
  res.json({ message: 'Vas a obtener los libros con id ' + req.params.id })
})
router.post('/', function(req, res) {
  //res.json({ message: 'Vas a añadir un libro' })
  clienteController.create(req,res);
})
router.put('/:id', function(req, res) {
  res.json({ message: 'Vas a actualizar los libros con id ' + req.params.id })
})
router.delete('/:id', function(req, res) {
  res.json({ message: 'Vas a borrar el libro con id ' + req.params.id})
})
//url:puerto/api/clientes
module.exports = router