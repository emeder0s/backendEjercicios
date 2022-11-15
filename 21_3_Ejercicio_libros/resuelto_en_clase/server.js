
const { MongoClient } = require('mongodb');
var ObjectId = require('mongodb').ObjectId;
const express = require('express');
const { json } = require('stream/consumers');
const app = express();
app.use(express.json());
app.use(express.urlencoded());
const mydb = "libreria";
const libros = "libros";
const autores = "autores";

const url = "mongodb://127.0.0.1:27017/";

// const myobj = { "nombre": "Ana", "direccion": "C/Alcalá 1" };

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});
    
app.post('/titulo', async(req, res) => {
    let libro = await busquedaTitulo(req.body.titulo);
    let autores = await busquedaAutores(libro.autores)
    res.send({libro, autores});
});

app.post('/add', async(req, res) => {
    var nombres = req.body.nombreautores.split(",");
    var apellidos = req.body.apellidosautores.split(",");
    var nacimientos = req.body.nacimientos.split(",");
    var generos = req.body.generos.split(",");
    var objAutores = {"nombres": nombres, "apellidos": apellidos, "nacimientos": nacimientos,"generos": generos};
    var idsAutores = await insertarAutores(objAutores);
    var objLibro = { "titulo": req.body.titulolibro, "ISBN": req.body.isbn,"genero": req.body.genero,"paginas": req.body.numpaginas,"autores": idsAutores};
    console.log(objLibro);
    await insertarLibro(objLibro);
    res.send(req.body);

});
    
app.listen(3000);

async function insertarLibro(libro){
    const client = new MongoClient(url + mydb);
    try {
        await client.connect();
        const db = client.db(mydb);
        await db.collection(libros).insertOne(libro);
        console.log("Libro insertado");
    } catch (e) {
        console.error(e);
    } finally {
        await client.close();
    }

}

async function exiteAutor(autor){
    const client = new MongoClient(url + mydb);
    try {
        await client.connect();
        const db = client.db(mydb);
        var query = {nombre:autor.nombre,apellidos:autor.apellidos}
        const resultado =  await db.collection(autores).findOne(query);
        return resultado;
    } catch (e) {
        console.error(e);
    } finally {
        await client.close();
    }

}

function getAutorObjetsArray(objAutores){
    var autores =objAutores.nombres.map((element,index) => {
        var autor = {"nombre": element, "apellidos": objAutores.apellidos[index],"fecha_nacimiento": objAutores.nacimientos[index],"genero": objAutores.generos[index]}
        return autor;
    });
    return autores;
}

async function insertarAutores(objAutores){
    var autoresArray = getAutorObjetsArray(objAutores);
    var ids = await Promise.all(
        autoresArray.map(async autor=>{
            var existe = await exiteAutor(autor);
            if (!existe){
                console.log(`Insertamos ${autor.nombre} ${autor.apellidos}`);
                const client = new MongoClient(url + mydb);
                try {
                    await client.connect();
                    const db = client.db(mydb);
                    var id = await db.collection(autores).insertOne(autor);
                    return id.insertedId.toString()
                } catch (e) {
                    console.error(e);
                } finally {
                    await client.close();
                }
            }else{
                console.log(`Ya está insertado ${autor.nombre} ${autor.apellidos}`);
                return existe._id.toString();
            }
        })
    )
    return ids;
}

async function getAutorById(id){
    const client = new MongoClient(url + mydb);
    try {
        await client.connect();
        const db = client.db(mydb);
        var id_autor = new ObjectId(id);
        const resultado =  await db.collection(autores).findOne({_id:id_autor});
        return resultado;
    } catch (e) {
        console.error(e);
    } finally {
        await client.close();
    }
}

async function busquedaAutores(autoresId){
    var autores = await Promise.all(
        autoresId.map(async (id) => {
          return await getAutorById(id);
        })
      )
      return autores;
}

async function busquedaTitulo(titulo) {

    const client = new MongoClient(url + mydb);
    try {

        await client.connect();
        const db = client.db(mydb);
        //Búsqueda con un resultado
        const resultado =  await db.collection(libros).findOne({titulo});
        return resultado;
    } catch (e) {
        console.error(e);
    } finally {
        await client.close();
    }
}

// main().catch(console.error);
