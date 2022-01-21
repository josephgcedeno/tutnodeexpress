var express = require('express');
var bodyParser = require('body-parser');
const mysql = require('mysql')
var app = express();
const path = require('path');
var cookieParser = require('cookie-parser');
var session = require('express-session');
const { Pool } = require('pg')
require('dotenv').config()


app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())
app.set('view engine', 'ejs');

app.use(cookieParser());
app.use(session({secret: "Shh, its a secret!",saveUninitialized:true, resave: false}));


app.use(express.static(path.join(__dirname, '/public')));

//from line 25 - 35 mysql database
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

// from line 38 - 47 postgres database
const pool = new Pool({
  user: `${process.env.PGUser}`, 
  host: `${process.env.PGHost}`,
  database: `${process.env.PGDatabase}`, 
  password: `${process.env.PGPassword}`, 
  port:  process.env.PGPort, 
  ssl: {
    rejectUnauthorized: false
  }
})

app.get("/",function(req,res){
    res.render("index")
});

app.all("/signin",(req,res)=>{

    if(req.method=="POST"){
        const params = req.body;
        const sql = `SELECT id, role FROM users WHERE username='${params.username}' AND password='${params.password}'`;

        pool.query(sql, (err,results)=>{
            if(err) throw err;
            results = results.rows;
            console.log(results)
            if(results.length==0){
               res.render("login",{error:true})
            }else if(results.length!=0 && results[0].role=="guest"){
                var session = req.session
                session.userid = results[0].id;
                session.username = params.username;
                res.redirect("/guestdashboard");
            }
            else if(results.length!=0 && results[0].role=="admin"){
                var session = req.session
                session.userid = results[0].id;
                session.username = params.username;
                res.redirect("/admindashboard");
            }
        })

    }else{
        res.render("login",{error:false})
    }
});

app.get("/guestdashboard",(req,res)=>{

    if(req.session.userid!=null){

        pool.query("SELECT * FROM users WHERE id = "+req.session.userid,(err, results)=>{
            if(err) throw err;
            results = results.rows;

            pool.query("SELECT status FROM applicationform WHERE userid="+req.session.userid,(err1, results1)=>{
                if(err1) throw err1;
                results1 = results1.rows;

                results1.length >0 ?
                res.render("guestdashboard",{data:results[0],status:results1[0].status}):
                res.render("guestdashboard",{data:results[0],status:null});
            })

        });

    }else{
        res.redirect("/signin");
    }

});


app.post("/update",(req,res)=>{
    const params = req.body;

    const sql = `UPDATE users SET username='${params.upusername}',password='${params.uppassword}',fname='${params.upfname}',lname='${params.uplname}',contactno=${params.upcontactno}, email='${params.upemailadd}' WHERE id = ${params.upid}`;

    pool.query(sql,(err,result)=>{
        if (err) throw err
        res.send(true);

    });

});


app.all("/signup",(req,res)=>{
//     const text = 'INSERT INTO users(name, email) VALUES($1, $2) RETURNING *'
// const values = ['brianc', 'brian.m.carlson@gmail.com']
// // callback
// client.query(text, values, (err, res) => {
// username: 'asdasd',
// password: 'asdasd',
// fname: 'asdasd',
// lname: 'asdasd',
// contactno: '123',
// email: 'sda@asd.cc'
// for (var key of Object.keys(p)) {
//     console.log(key + " -> " + p[key])
// }

    if (req.method == "POST"){
        var params = req.body;
        params.role = "guest";
        var keys = "";
        var values = [];
        var i = 1;
        for (var key of Object.keys(params)){
            
            keys+=key;
            values.push(params[key])
            i != Object.keys(params).length ? keys+="," : "";
            i++;
        }

        const sql = `INSERT INTO users(${keys}) VALUES($1,$2,$3,$4,$5,$6,$7)  RETURNING id`
        pool.query(sql,values,(err,result)=>{
            if(err) throw err;
            result = result.rows;

            var session = req.session;
            session.userid = result[0].id;
            session.username = params.username;

            res.redirect("/guestdashboard");

        })

    }else{
        res.render("signup")
    }
});

app.get("/logout",(req,res)=>{
    req.session.destroy();
    res.redirect("/");
})

app.get("/submitapplication",(req,res)=>{

    if(req.session.userid!=null){
        pool.query(`SELECT * FROM users WHERE id = ${req.session.userid}`, (err, rows) => {
            if(err) throw err;
            rows= rows.rows;
            res.render("applicationform",{data:rows})
        })
    }else{
        res.redirect("/");
    }
});

app.post("/insertapplicationform",(req,res)=>{

    const params = req.body;

    var keys = "";
    var values = [];
    var valuestupp = "";
    var i = 1;
    for (var key of Object.keys(params)){
        
        keys+=key;
        valuestupp+="$"+i;
        values.push(params[key])
        if( i != Object.keys(params).length){
            keys+="," 
            valuestupp+=",";
        } 
        i++;
    }

    const sql = `INSERT INTO applicationform(${keys}) VALUES(${valuestupp})`
    pool.query(sql,values,(err,result)=>{
        if(err) throw err;
        res.redirect("/guestdashboard")
    });


});

app.post("/approveappliaction",(req,res)=>{
    const params=req.body;
    pool.query("UPDATE applicationform SET status = 'approve' WHERE id = "+params.upid,(err)=>{
        if(err) throw err
        res.send(true);
    })
});
app.post("/declineappliaction",(req,res)=>{
    const params=req.body;
    pool.query("UPDATE applicationform SET status = 'decline' WHERE id = "+params.upid,(err)=>{
        if(err) throw err
        res.send(true);
    })
});


app.listen(process.env.PORT||3000);
console.log("app is running")