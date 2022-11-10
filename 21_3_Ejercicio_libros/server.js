const express = require('express');
const mongo = require('mongodb');
var ObjectId = require('mongodb').ObjectId;
const MongoClient = mongo.MongoClient;
const app = express();
const bodyParser = require('body-parser');

const url = "mongodb://127.0.0.1:27017/";
const mydb = "Libreria";
const libros = "Libros";
const autores = "Autores";

var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
  });

app.post('/show', urlencodedParser, (req, res) => {
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(mydb);
        dbo.collection(libros).find({}).toArray(function(err, result) {
            if (err) throw err;
            res.send(result); 
            db.close();
        });
    });
    
});

app.post('/show-book', urlencodedParser, (req, res) => {
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(mydb);
        var queryLibro= {titulo:req.body.title}
        dbo.collection(libros).findOne(queryLibro, function(err, libro) {
            if (err) throw err;
            if (libro){
                MongoClient.connect(url, function(err, db1) {
                    if (err) throw err;
                        var dbo = db1.db(mydb);
                        var o_id = new ObjectId(libro.id_autor);
                        var queryAutor = { "_id" : o_id};
                        dbo.collection(autores).findOne(queryAutor, function(err, autor) {
                            if (err) throw err;
                            res.send({libro,autor})
                            db1.close();
                        });
                });
            }
            db.close();
          });
          
    });
});

async function insertarAutor(objAutor){
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(mydb);
        
        dbo.collection(autores).insertOne(objAutor, function(err, res) {
            if (err) throw err;
            console.log("Autor insertado");
            db.close();
        });
    });
}

function insertarLibro(objLibro,id_autor ){
    objLibro.id_autor = id_autor;

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(mydb);
        
        dbo.collection(libros).insertOne(objLibro, function(err, res) {
            if (err) throw err;
            console.log("Libro insertado");
            db.close();
        });
    });
}

async function getIdAutor(queryAutor){
    const client = new MongoClient(url + mydb);
    try {
        await client.connect();
        const db = client.db(mydb);
        const autor =  await db.collection(autores).findOne(queryAutor);
        return autor._id;
    }catch (e) {
        console.error(e);
    } finally {
        await client.close();
    }
}

app.post('/add', urlencodedParser, (req, res) => {
     var objLibro = { "titulo": req.body.titulolibro, "ISBN": req.body.isbn,"tipo": req.body.tipo,"num_pagina": req.body.numpagina,"id_autor": ""};
     var objAutor = {"nombre": req.body.nomautor, "apellidos": req.body.apeautor, "año_nacimiento": req.body.nacimiento,"tipo_libro": req.body.tipolibros,}
    
      MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(mydb);
        var queryAutor= {nombre:req.body.nomautor,apellidos:req.body.apeautor}
        dbo.collection(autores).findOne(queryAutor, async function(err, autor) {
            if (err) throw err;
            if(!autor){
                await insertarAutor(objAutor);
                var id_autor = getIdAutor(queryAutor);
                console.log(id_autor);
                insertarLibro(objLibro, id_autor);
            }else{
                var id_autor = new ObjectId(autor._id);
                insertarLibro(objLibro, id_autor);
            }
            db.close();
        });
    });
    res.send("Libro insertado con Éxito")
});

app.listen(3000);