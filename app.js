var express = require('express');
var mysql 	= require('mysql');


var app = express();



//connection to the database using MySQL
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "test"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});