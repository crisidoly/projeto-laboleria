import { db } from "../database/databaseConnection.js";

export async function selectClientsById(clientId) {
    return db.query('SELECT * FROM clients WHERE id = $1', [clientId]);
}

export async function insertOrders(clientId, cakeId, quantity, totalPrice, createdAt) {
    return await db.query(`INSERT INTO orders(clientid, cakeid, quantity, totalprice, createdAt) VALUES($1, $2, $3, $4, $5)`, [clientId, cakeId, quantity, totalPrice, createdAt]);
}
