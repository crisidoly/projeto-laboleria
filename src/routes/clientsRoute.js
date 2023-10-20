import { Router } from "express"
import { clientsShema } from "../schemas/appSchema.js";
import validateSchema from "../middleware/schemaValidation.js";
import { getOrdersByClientId, postClients } from "../controllers/clientsController.js";

const clientsRouter = Router()

clientsRouter.post("/clients", validateSchema(clientsShema), postClients);
clientsRouter.get("/clients/:id/orders", getOrdersByClientId);

export default clientsRouter 