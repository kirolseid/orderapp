const { validationResult } = require("express-validator");
const query = require("../database/db");
const bcrypt = require("bcrypt");
var jwt = require("jsonwebtoken");

exports.signUP = (req, res) => {
  // console.log(query);
  console.log(req.body);
  const { firstName, MiddleName, LastName, email, phone, password } = req.body;
  let token = jwt.sign({ email }, "secretKey");
  let error = validationResult(req);
  if (error.isEmpty()) {
    query.query(
      `SELECT Email FROM user WHERE Email='${email}'`,
      (err, user) => {
        console.log("user", user);
        if (user.length > 0) {
          res.json({ mass: "Email is exist" });
        } else {
          bcrypt.hash(password, 7, function (err, hash) {
            query.query(
              `INSERT INTO user
                    (Firstname,Middlename,Lastname,Email,Password,Phonenumber,Token)
                VALUES
                    ('${firstName}','${MiddleName}','${LastName}','${email}','${hash}','${phone}','${token}')`,
              (err, result, feilds) => {
                // console.log("Number of records inserted: " + result.affectedRows)
                console.log("err", err);
                console.log("res", result);
                console.log("filds", feilds);
                res.json({ mass: "success" });
              }
            );
          });
        }
      }
    );
  } else {
    res.json({ errors: error.array() });
    console.log(error.array());
  }
};
