import { Router } from "express"
import cakesRouter from "./cakesRoute.js"
import clientsRouter from "./clientsRoute.js"
import ordersRoute from "./ordersRoute.js"

const router = Router()

router.use(cakesRouter)
router.use(clientsRouter)
router.use(ordersRoute)

export default router