const mysql = require("mysql2");
const query = mysql.createConnection({
  host: "localhost",
  database: "orderapp",
  user: "root",
  password: "",
});

module.exports = query;
