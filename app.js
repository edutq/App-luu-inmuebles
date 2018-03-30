var express = require('express');
var mysql 	= require('mysql');

var app = express();

app.set('port', process.env.PORT || 3000);

// custom 404 page
app.use(function(req, res){
res.type('text/plain');
res.status(404);
res.send('404 - Not Found');
});
// custom 500 page
app.use(function(err, req, res, next){
console.error(err.stack);
res.type('text/plain');
res.status(500);
res.send('500 - Server Error');
});

//connection to the database using MySQL
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "appluuprueba"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

var http = require('http').Server(app);

http.listen(app.get('port'), function() {
	console.log('Application running on port ' + app.get('port') + '. Using database ' + con.database);
});

module.exports = app;
