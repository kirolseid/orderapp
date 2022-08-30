const { check } = require("express-validator");

module.exports.signUp = [
  check("firstName").isAlpha(),
  check("MiddleName").isAlpha(),
  check("LastName").isAlpha(),
  check("email").isEmail(),
  check("phone").isMobilePhone(),
  check("password").isStrongPassword(),
];
