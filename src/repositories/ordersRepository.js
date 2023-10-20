import { db } from "../database/databaseConnection.js";

export async function selectClientsById(clientId) {
    return db.query('SELECT * FROM clients WHERE id = $1', [clientId]);
}

export async function insertOrders(clientId, cakeId, quantity, totalPrice, createdAt) {
    return await db.query(`INSERT INTO orders(clientid, cakeId, quantity, totalprice, createdat) VALUES($1, $2, $3, $4, $5)`, [clientId, cakeId, quantity, totalPrice, createdAt]);
}

export async function getCompleteOrders() {
    const query = 'SELECT * FROM orders';
    return db.query(query);
}