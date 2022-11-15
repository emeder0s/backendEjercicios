const express = require("express");

const app = express();
app.set('views', '.');
app.set('view engine', 'ejs');

app.get('/', function(req, res){  
    let tableItems = [
        {col1:'1',col2:'<%= %>'},
        {col1:'2',col2:'<%- %>'},
        {col1:'3',col2:'<% %>'},
        {col1:'4', col2: '<% %>'}
    ];  
    res.render('index.ejs', {tabledata: tableItems});
});
app.listen(3000);