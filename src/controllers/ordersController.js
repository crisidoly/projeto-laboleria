import dayjs from "dayjs";
import { db } from "../database/databaseConnection.js";
import { selectClientsById } from "../repositories/clientsRepository.js"
import { selectCakesById } from "../repositories/cakesRepository.js"
import { insertOrders } from "../repositories/ordersRepository.js";



export async function postOrder(req, res){

    const {clientId, cakeId, quantity} = req.body
    
    const clientExist = await selectClientsById(clientId);

    if(!clientExist.rows[0]) {
        return res.sendStatus(404);
    };
    const cakeExist = await selectCakesById(cakeId);

    if(!cakeExist.rows[0]) {
        return res.sendStatus(404);
    };

    if(quantity < 0 || quantity > 5){
        return res.sendStatus(400);
    }

    const totalPrice = (cakeExist.rows[0].price) * quantity;
    const createdAt = dayjs().format('YYYY-MM-DD HH:mm:ss');
    

    try{
        await insertOrders(clientId, cakeId, quantity, totalPrice, createdAt);
        return res.sendStatus(201);

    }catch (err) {
        console.log(err);
        return res.sendStatus(500);
    }
}

export async function getOrders(req, res) {
    const { date } = req.query;
    
    try {
      const query = `
        SELECT orders.*,
          clients.id AS "clientid",
          clients.name AS "name",
          clients.address AS "adress",
          clients.phone AS "phone",

          cakes.id AS "cakeid",
          cakes.name AS "name",
          cakes.price AS "price",
          cakes.image AS "image",
          cakes.description AS "description"
        FROM orders
        JOIN clients ON clients.id = orders."clientid"
        JOIN cakes ON cakes.id = orders."cakeid"
        ${date ? 'WHERE "createdAt" = $1' : ''}
      `;
  
      const params = date ? [date] : [];
  
      const orders = await db.query(query, params);
  
      const orderResult = orders.rows.map((order) => ({
        id: order.id,
        client: {
          id: order.clientid,
          name: order.name,
          address: order.adress,
          phone: order.phone,
        },
        cake: {
          id: order.cakeid,
          name: order.name,
          price: order.price,
          image: order.image,
          description: order.description,
        },
        createdAt: order.createdat,
        quantity: order.quantity,
        totalPrice: order.totalprice,
      }));
  
      if (orderResult.length === 0) {
        return res.status(404).send([]);
      } else {
        res.send(orderResult);
      }
    } catch (error) {
      console.log(error);
      return res.sendStatus(500);
    }
  }
  
  export async function getOrdersId(req, res) {
    const { id } = req.params;
  
    try {
      const orders = await db.query(
        `
        SELECT orders.*,
        clients.id AS "id",
        clients.name AS "name",
        clients.address AS "adress",
        clients.phone AS "phone",
        cakes.id AS "id",
        cakes.name AS "name",     
        cakes.price AS "price",
        cakes.image AS "image",
        cakes.description AS "description"
        FROM orders
          JOIN clients ON clients.id = orders."clientid"
          JOIN cakes ON cakes.id = orders."cakeid"
          WHERE orders.id = $1
          `,
        [id]
      );
  
      if (orders.rowCount === 0) {
        return res.sendStatus(404);
      }
  
      const order = orders.rows[0];
  
      const orderResult = {
        id: order.id,
        client: {
          id: order.id,
          name: order.name,
          address: order.adress,
          phone: order.phone,
        },
        cake: {
          id: order.id,
          name: order.name,
          price: order.price,
          image: order.image,
          description: order.description,
        },
        createdAt: order.createdat,
        quantity: order.quantity,
        totalPrice: order.totalPrice,
      };
  
      res.send(orderResult);
    } catch (error) {
      console.log(error);
      res.sendStatus(500);
    }
  }
  