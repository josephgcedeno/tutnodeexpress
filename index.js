var express = require('express');
var bodyParser = require('body-parser');
const mysql = require('mysql')
var app = express();
const path = require('path');
var cookieParser = require('cookie-parser');
var session = require('express-session');

app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())
app.set('view engine', 'ejs');

app.use(cookieParser());
app.use(session({secret: "Shh, its a secret!",saveUninitialized:true, resave: false}));
app.use(express.static(path.join(__dirname, '/public')));

const pool  = mysql.createPool({
    host            : 'localhost',
    user            : 'root',
    password        : '',
    database        : 'tutorial2'
})

app.get("/",function(req,res){
    res.render("index")

});

app.all("/signin",(req,res)=>{
    res.render("login")
});

app.all("/signup",(req,res)=>{
    res.render("login")
});

app.listen(process.env.PORT||3000);
console.log("app is running")