import { Router } from "express";
import validateSchema from "../middleware/schemaValidation.js";
import { ordersSchema } from "../schemas/appSchema.js";
import { getOrders, postOrder } from "../controllers/ordersController.js"

const ordersRoute = Router();

ordersRoute.post("/order", validateSchema(ordersSchema), postOrder);
ordersRoute.get("/orders", getOrders);

export default ordersRoute
