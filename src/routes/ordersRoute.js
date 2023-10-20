import { Router } from "express";
import validateSchema from "../middleware/schemaValidation.js";
import { ordersSchema } from "../schemas/appSchema.js";
import { getOrders, getOrdersId, postOrder } from "../controllers/ordersController.js"

const ordersRoute = Router();

ordersRoute.post("/order", validateSchema(ordersSchema), postOrder);
ordersRoute.get("/orders", getOrders);
ordersRoute.get("/orders/:id", getOrdersId);

export default ordersRoute
