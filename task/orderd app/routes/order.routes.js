const app = require("express").Router();
const query = require("../database/db");
const auth = require("../middleware/auth");
const orderController = require("../controllers/order.control");

app.post("/createOrder", auth, orderController.createOrder);

app.post("/GetUserOrders", orderController.GetUserOrders);

app.post("/acceptOrder", orderController.acceptOrder);

module.exports = app;
