const query = require("../database/db");

exports.createOrder = (req, res) => {
  const { userId, totalPrice, orderDetails } = req.body;
  let orderId;
  console.log(req.body);
  query.execute(
    `INSERT INTO orderapp.order (User_id,Totalprice) VALUES ('${userId}','${totalPrice}')`,
    (err, result) => {
      // console.log("order",result);
      // console.log("ordererr",err);
      query.execute(
        `SELECT id FROM orderapp.order ORDER BY id DESC LIMIT 1`,
        (err, result) => {
          console.log("id", result[0].id);
          orderId = result[0].id;

          orderDetails.forEach((element) => {
            // console.log(element);
            query.execute(
              `INSERT INTO orderdetails (order_id , Product_id , Quantity) VALUES 
              ( '${orderId} ','${element[0]} ', '${element[1]}' )`,
              (er, result) => {
                // res.json({mess:"order Add"})
                // console.log("rds",result);
                // console.log("deeee",er);
              }
            );
          });
          query.execute(
            `INSERT INTO userorders (Order_id,User_id) VALUES 
              ( '${orderId}','${userId}' )`,
            (err, result) => {}
          );
        }
      );
    }
  );
  res.json({ mass: "order Added" });
};

exports.GetUserOrders = (req, res) => {
  const { userid } = req.body;
  query.execute(
    `SELECT user.Firstname AS user,orderapp.order.* FROM user JOIN orderapp.order ON user.id = orderapp.order.User_id WHERE User_id=${userid}`,
    (err, result) => {
      res.json({ mass: result });
    }
  );
};

exports.acceptOrder = (req, res) => {
  const { orderId, status } = req.body;
  if (status == "accept") {
    query.execute(
      `UPDATE orderapp.order SET Status = 1 WHERE id = ${orderId}`,
      (err, result) => {
        res.json({ mass: "accepted" });
      }
    );
  } else {
    res.json({ mass: "reject" });
  }
};
