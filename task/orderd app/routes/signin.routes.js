const app = require("express").Router();
const validation = require("../validation/signIn.validtion");
const signInController = require('../controllers/signIn.control')


app.post("/Signin", validation.signIn,signInController.signIn );

module.exports = app;
