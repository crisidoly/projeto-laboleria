import { Router } from "express"
import { CakeSchema } from "../schemas/appSchema.js"
import validateSchema from "../middleware/schemaValidation.js"
import { PostCake } from "../controllers/cakesController.js"
CakeSchema

const cakesRouter = Router()

cakesRouter.post('/cakes', validateSchema(CakeSchema), PostCake)

export default cakesRouter 