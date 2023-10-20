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