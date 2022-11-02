const mongo = require('mongodb');
const MongoClient = mongo.MongoClient;

const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const url = "mongodb://127.0.0.1:27017/";
const mydb = "TheBridge";
const collection = "FullStackDevelop";

var urlencodedParser = bodyParser.urlencoded({ extended: false })
    
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.post('/mostrar', urlencodedParser, (req, res) => {
        MongoClient.connect(url, function(err, db) {
            if (err) throw err;
            var dbo = db.db(mydb);
            dbo.collection(collection).find({}).toArray(function(err, result) {
                if (err) throw err;
                res.send(result); 
                db.close();
            });
        });
        
});

app.post('/insertar', urlencodedParser, (req, res) => {
    var myobj = { "nombre": req.body.user_name, "direccion": req.body.address };
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
    res.send("Nuevo alumno insertado con ÉXITO!");
});

app.post('/actualizar', urlencodedParser, (req, res) => {
    var userName = req.body.user_to_change;
    MongoClient.connect(url, function(err, db) {
        if (err) throw err; 
        var dbo = db.db(mydb);
        var myquery = { "nombre": userName };
        var newvalues = { $set:  { "nombre": req.body.user_name_update, "direccion": req.body.address_update } };
        dbo.collection(collection).updateOne(myquery, newvalues, function(err, res) {
        if (err) throw err;
        console.log("Documento actualizado"); 
        db.close();
        });
    });

    //enviarle respuesta a una petición del navegador
    res.send(`Alumno actualizado con ÉXITO!`);
});

app.post('/borrar', urlencodedParser, (req, res) => {
    var userName = req.body.user_to_delete;
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(mydb);
        var myquery = { "nombre": userName };
        dbo.collection(collection).deleteOne(myquery, function(err, obj) {
        if (err) throw err;
        console.log("Documento borrado");
        db.close();
        });
    });

    //enviarle respuesta a una petición del navegador
    res.send(`Alumno borrado con ÉXITO!`);
});

app.listen(3000);