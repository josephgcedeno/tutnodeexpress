# Note: Mas better ning tutorial kesa sa actual nako na buhat sa assesment!
# Video Tutorial:
- [Part 1](https://drive.google.com/file/d/1owR9sgzGbcw8f5XTOD3DSH0-HQsBlo48/view?fbclid=IwAR0XOkbvg_oyhMn8fZ8m5v6buV4TIWUTYP0yOqHcDDiQ0P0hNvKF0oWlJsk)
- [Part 2](https://drive.google.com/file/d/1EW8WuRVhYXO7VnLn5Qv9PyR4wJ98CZi3/view?fbclid=IwAR3xyBU98iSdgE17oYlrzYtzEynAB8_65kBsB2gMV7MQcbvR-AcOBcHhm9g)

# Setup Express app and EJS

- mkdir expressapp && cd expressapp
- npm init -y
- npm install express ejs body-parser mysql cookie-parser express-session
- npm install -g nodemon
- npm install --save-dev nodemon
- initial code: 
    ```
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

    const db = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : '',
        database : 'tutorial2'
    });

    db.connect((err)=>{
        if(err) throw err
        console.log("Connected to db")
    })

    app.get("/",(req,res)=>{
        res.render("index");
    });

    app.listen(process.env.PORT||3000);
    ```
- nodemon app.js
- access at localhost:3000

# To setup XAMPP
- just open xampp 
- then enable action start
- CREATE DATABASE LOVE;
