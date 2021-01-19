var express = require('express') //llamamos a Express
var app = express()       
var cors=require('cors');
var bodyParser = require('body-parser')        
var mysql=require('../db/mysql');
var jwt=require('jsonwebtoken');
var config=require('./config/config');
app.set('llave',config.llave);
 
 
var port = process.env.PORT || 1339 // establecemos nuestro puerto
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())            
 
// es bueno que haya un prefijo, sobre todo por el tema de versiones de la API
var rutaValidacion=require('express').Router();
var router = require('./routes')
 
 
rutaValidacion.get('/login',(req,res)=>{
      let user=req.body.usuario;
      let pwd=req.body.password;
      if (!user || !pwd)
            res.json({mensaje:'falta datos'});
      else{
            mysql.query('select * from users where login=? && password= ?',[user,pwd],(err,rows,fields)=>{
                  if(!err)
                     //rows vacio
                     if (rows.length!=0){
                        const payload={check:true};
                        const token=jwt.sign(payload,app.get('llave'),{expiresIn:1440});
                        res.json({mensaje:'Autenticación correcta', rows:rows, token:token});
                     }else{
                        res.json({mensaje:'El usuario no existe'});
                     }
                  else
                     res.json(err);
            })
      }      
})
 
 
 
 
app.use('/',rutaValidacion);
app.use('/api', router)
//arrancamos el servidor
app.listen(port)
console.log('API escuchando en el puerto ' + port)
