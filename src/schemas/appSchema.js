import joi from "joi"

export const CakeSchema = joi.object({
    name: joi.string().required().min(2),
    price: joi.number().required().min(0),
    image: joi.string().required().uri().min(1),
    description: joi.string().min(0).allow('').allow(null)
});

export const clientsShema = joi.object({
    name: joi.string().required().min(1),
    address: joi.string().required().min(1),
    phone: joi.string().required().min(10).max(11)
})

export const ordersSchema = joi.object({
    clientId:  joi.number().required(),
    cakeId:  joi.number().required(),
    quantity: joi.number().required().min(1).max(5)
})

