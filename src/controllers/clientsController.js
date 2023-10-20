import { db } from "../database/databaseConnection.js";
import { insertClients } from "../repositories/clientsRepository.js";


insertClients

export async function postClients(req, res) {
    const { name, address, phone } = req.body;

    if (!name || !address || !phone) {
        return res.sendStatus(400);
    }

    try {
        await insertClients(name, address, phone);
        res.sendStatus(201);
    } catch (error) {
        console.error(error);
        res.sendStatus(500);
    }
}

export async function getOrdersByClientId(req, res) {
    const { id } = req.params;
  
    try {
      const orders = await db.query(
        `
        SELECT 
            orders.id AS "id",
            orders.quantity,
            orders."createdat",
            orders."totalprice",
            cakes.name AS "name"
        FROM clients
        JOIN orders ON clients.id = orders."clientid"
        JOIN cakes ON orders."cakeid" = cakes.id
        WHERE clients.id = $1
      `,
        [id]
      );
  
      if (orders.rowCount === 0) {
        return res.sendStatus(404);
      }
  
      const ordersByClientId = orders.rows.map((order) => ({
        orderId: order.id,
        quantity: order.quantity,
        createdAt: order.createdat,
        totalPrice: order.totalprice,
        cakeName: order.name,
      }));
  
      res.status(200).send(ordersByClientId);
    } catch (error) {
      console.log(error);
      return res.sendStatus(500);
    }
  }
  