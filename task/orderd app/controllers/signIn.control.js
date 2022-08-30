const { validationResult } = require("express-validator");
const query = require("../database/db");
const bcrypt = require("bcrypt");

exports.signIn = (req, res) => {
  const { email, password } = req.body;
  let error = validationResult(req);
  query.execute(
    `SELECT Email , Password ,Token FROM user WHERE Email = "${email}"`,
    async (err, data) => {
      console.log(data);
      if (error.isEmpty()) {
        if (data) {
          const match = await bcrypt.compare(password, data[0].Password);
          if (match) {
            const token = data[0].Token;

            // console.log("done");
            res.json({ mass: "login success", token });
            req.session.email = data[0].Email;
          } else {
            res.json({ mass: "pass is incorrect" });
          }
        } else {
          res.json({ mass: "Email is incorrect" });
        }
      } else {
        res.json({ errors: error.array() });
        console.log(error.array());
      }
    }
  );
};
