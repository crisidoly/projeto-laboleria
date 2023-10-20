import { db } from "../database/databaseConnection.js";

export async function SearchCake(name){
    return await db.query(
		`
        SELECT * FROM cakes
        WHERE name = $1
    `,
		[name]
	);
}

export async function CreateCake(name, price, description, image){
    await db.query(
        `INSERT INTO cakes (name, price, description, image) 
        VALUES ($1, $2, $3, $4)`, [name, price, description, image]
    )
}

export async function selectCakesById(cakeId) {
    return await db.query('SELECT * FROM cakes WHERE id = $1', [cakeId]);
}