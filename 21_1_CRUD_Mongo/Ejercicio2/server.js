const mongo = require('mongodb');
const MongoClient = mongo.MongoClient;

const express = require('express');
const bodyParser = require('body-parser');
const app = express();

var urlencodedParser = bodyParser.urlencoded({ extended: false })
    
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.post('/', urlencodedParser, (req, res) => {
    const url = "mongodb://127.0.0.1:27017/";
    var mydb = req.body.database;
    var collection =  req.body.collection;
    var myobj = { "nombre": req.body.user_name, "direccion": req.body.address };

    //Creacion de una BD 
    MongoClient.connect(url+mydb, function(err, db) {
        if (err) throw err;
        console.log("Base de datos creada");
        db.close();
    });
    
    //Creacion de una coleccion dentro de una BD
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(mydb);
        dbo.createCollection(collection, function(err, res) {
            if (err) throw err;
            console.log("Colección creada");
            db.close();
        });
    });

    //Insertar dentro de una coleccion de una BD
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(mydb);
        
        dbo.collection(collection).insertOne(myobj, function(err, res) {
            if (err) throw err;
            console.log("Documento insertado");
            db.close();
        });
    });

    //enviarle respuesta a una petición del navegador
    res.send("ÉXITO!");
});

app.listen(3000);