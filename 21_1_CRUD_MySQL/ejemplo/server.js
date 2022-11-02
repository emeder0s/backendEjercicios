const mysql = require('mysql');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'crud'
});

connection.connect((err)=> {
    if(!err){
        console.log('Connection Established Successfully');
        // let query = 'SELECT * from tabla1';
        // connection.query(query, (err, rows) => {
        //     if(err) throw err;
        //     console.log('Datos de tabla1: \n', rows);
        //     connection.end();
        // });
        // let insertQuery = 'INSERT INTO ?? (??) VALUES (?)';
        // let query2 = mysql.format(insertQuery,["tabla1","campoTexto","Añadido desde Node"]);
        
        // connection.query(query2, (err, response) => {
        //     if(err) throw err;
        //     console.log(response.insertId);
        //     // connection.end();
        // }); 
        // let selectQuery = 'SELECT * FROM ?? WHERE ?? = ?';    
        // let query3 = mysql.format(selectQuery,["tabla1","campoTexto", "Añadido desde Node"]);
        // connection.query(query3, (err, data) => {
        //     if(err) throw err;
        //     console.log(data);
        //     //connection.end();
        // }); 
        // let updateQuery = "UPDATE ?? SET ?? = ? WHERE ?? = ?";
        // let query4 = mysql.format(updateQuery,["tabla1","campoTexto","Cambiado desde Node 2","id",1]);
    
        // connection.query(query4, (err, response) => {
        //     if(err) throw err;
        //     console.log(response);
        //     console.log(query4);
        //     connection.end();
        // });
    }else{
        console.log('Connection Failed!'+ JSON.stringify(err,undefined,2));
    }
});