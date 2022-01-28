### Note: Mas better ning tutorial kesa sa actual nako na buhat sa assesment!
# Actual App deployed on heroku:
- [Preview](https://tutut2.herokuapp.com/)
 ![Preview Image](https://raw.githubusercontent.com/josephgcedeno/tutnodeexpress/master/public/prev.png)


# Video Tutorial:
- [Part 1](https://drive.google.com/file/d/1owR9sgzGbcw8f5XTOD3DSH0-HQsBlo48/view?fbclid=IwAR0XOkbvg_oyhMn8fZ8m5v6buV4TIWUTYP0yOqHcDDiQ0P0hNvKF0oWlJsk)
- [Part 2](https://drive.google.com/file/d/1EW8WuRVhYXO7VnLn5Qv9PyR4wJ98CZi3/view?fbclid=IwAR3xyBU98iSdgE17oYlrzYtzEynAB8_65kBsB2gMV7MQcbvR-AcOBcHhm9g)
- [Part 3](https://drive.google.com/file/d/1ZmGOKoDvIfPgAf5sI83jgFwy6hcnyOcY/view?usp=sharing)

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
# Pushing to heroku:
- heroku login // enter credentials
- heroku create [APP_NAME] 
- git init
- git add .
- git commit -m "commit to push"
- git heroku push master

# Postgres SQL:
- Download PGadmin [Ubuntu](https://tecadmin.net/how-to-install-pgadmin4-on-ubuntu-20-04/) [Windows](https://www.pgadmin.org/download/pgadmin-4-windows/)
- Navigate to heroku create [postgres instance](https://data.heroku.com/). Simply attach the instance to your heroku project/appliaction.
- Go to your project, navigate to you resources tab. Below click your postgres instance.
- Go to settings, click View Credentials. Save your credentials.
- On PGAdmin just enter your credentials. On Advance tab add restriction based on your database name.
- On your terminal install: npm install pg --save
- On your index.js
  ```
   const pool = new Pool({
      user: `username`, 
      host: `hostname`,
      database: `dbname`, 
      password: `password`, 
      port: 5432 , 
      ssl: {
        rejectUnauthorized: false
      }
    })
  ```
- Sample Query:
  ```
     pool.query(`
      SELECT *
      FROM applicationform
      INNER JOIN users ON applicationform.userid = users.id;
      `, (err, rows) => {
          if (!err) {
              rows= rows.rows;
              res.render('admin',{data:rows});
          } 
      })

  
  ```

