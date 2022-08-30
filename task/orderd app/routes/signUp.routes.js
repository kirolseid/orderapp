const app = require("express").Router();
const validation = require("../validation/singUp.validtion");
const sinupController =require("../controllers/signUp.control")


app.post("/signUp", validation.signUp,sinupController.signUP);

module.exports = app;
