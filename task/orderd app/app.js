const express = require("express");
const app = express();
const port = 3000;
var bodyParser = require("body-parser");
var session = require('express-session');
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    
  }))

app.use(express.json());

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(require("./routes/signUp.routes"));
app.use(require("./routes/signin.routes"));
app.use(require("./routes/order.routes"));

app.get("/", (req, res) => res.send("Hello World!"));
app.listen(port, () => console.log(`Example app listening on port ${port}!`));
