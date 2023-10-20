import { db } from "../database/databaseConnection.js";

export async function insertClients(name, address, phone) {
    return db.query(`INSERT INTO clients ("name", "address", "phone") VALUES ($1, $2, $3);`, [name, address, phone]);
}

export function getClientsById(id) {
    return db.query('SELECT * FROM clients WHERE id = $1', [id]);
}

export function getOrdersByClientId(id) {
    return db.query('SELECT * FROM orders WHERE clientid = $1', [id]);
}

export async function selectClientsById(clientId) {
    return db.query('SELECT * FROM clients WHERE id = $1', [clientId]);
}