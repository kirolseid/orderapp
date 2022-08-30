const { check } = require("express-validator");

module.exports.signIn = [
  check("email").isEmail(),
  check("password").isStrongPassword(),
];
