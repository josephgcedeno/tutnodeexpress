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

app.get("/",function(req,res){
    res.render("index")

});

app.all("/signin",(req,res)=>{

    if(req.method=="POST"){
        const params = req.body;

        const sql = `SELECT id, role FROM users WHERE username="${params.username}" AND password="${params.password}"`;

        db.query(sql, (err,results)=>{
            if(err) throw err;
            console.log(results)
            if(results.length==0){
               res.render("login",{error:true})
            }else if(results.length!=0 && results[0].role=="guest"){
                var session = req.session
                session.userid = {id:results[0].id};
                res.redirect("/guestdashboard");
            }
            else if(results.length!=0 && results[0].role=="admin"){
                var session = req.session
                session.userid = {id:results[0].id};
                res.redirect("/admindashboard");
            }
        })


    }else{
        res.render("login",{error:false})
    }
});

app.get("/guestdashboard",(req,res)=>{

    if(req.session.userid!=null){

        const user_id = req.session.userid.id;
        const sql = "SELECT * FROM users WHERE id="+user_id;

        db.query( sql,(err,results)=>
        {
            if (err) throw err;

            res.render("guestdashboard",{data:results[0]});

        })


    }else{
        res.redirect("/signin")
    }

});

app.all("/signup",(req,res)=>{

    if (req.method == "POST"){
        var params = req.body;

        params.role = "guest";

        const sql = "INSERT INTO users SET ?";

        db.query(sql, params, (err,result)=>{
            if(err) throw err

            db.query("SELECT LAST_INSERT_ID() as id",(err1,result1)=>{

               if(err1) throw err1
               var session = req.session

               session.userid = {id:result1[0].id};

               res.redirect("/guestdashboard");             

            })
        })

    }else{
        res.render("signup")
    }
});

app.post("/update",(req,res)=>{

    const params = req.body;

    const sql = `UPDATE users SET username="${params.upusername}",password="${params.uppassword}",fname="${params.upfname}",lname="${params.uplname}",contactno=${params.upcontactno}, email="${params.upemailadd}" WHERE id = ${params.upid}`;

    db.query(sql,(err,results)=>{
        if (err) throw err
        res.send(true);
    });

});

app.get("/submitapplication/:id",(req,res)=>{

    if(req.session.userid!=null){
        db.query(`SELECT * FROM users WHERE id = ${req.params.id}`, (err, rows) => {
            if(err) throw err;
            res.render("applicationform",{data:rows})
        })
    }else{
        res.redirect("/");
    }

});

app.get("/logout",(req,res)=>{
    req.session.destroy();
    res.redirect('/');
});

app.listen(process.env.PORT||3000);
console.log("app is running")