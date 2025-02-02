import express from 'express';
import connection from './db/connection.js';

async function getSchema(table) {
	const sql = `SELECT COLUMN_NAME 
		FROM INFORMATION_SCHEMA.COLUMNS 
		WHERE TABLE_SCHEMA = 'cpp' 
		AND TABLE_NAME = ?
		AND EXTRA NOT LIKE '%auto_increment%'
		AND DATA_TYPE NOT IN ('timestamp', 'datetime');`

	let cols = await connection.query(sql, [table]);
	return cols[0].map(elem => Object.values(elem)[0]);
}

const router = express.Router();

router.get('/:table', async (req, res) => {
	const entries = await connection.query(`SELECT * FROM ??`, [req.params.table]);
	entries[0] ? res.send(entries[0]).status(200) : res.send({message: "Not found"}).status(404);
});

router.get('/:table/:id', async (req, res) => {
	const row = await connection.query(`SELECT * FROM ??	WHERE _id = ?`,
		[req.params.table, req.params.id]);
	row[0][0] ? res.send(row[0]).status(200) : res.send({message: "Not found"}).status(404);
});

router.get('/:table/:id/:subTable', async (req, res) => {
	let tableId;
	req.params.table === 'vendors' ? tableId = 'vendor_id' : tableId = 'user_id';
	const entries = await connection.query(
		`SELECT * FROM ??	WHERE ?? = ?`, [req.params.subTable, tableId,req.params.id]
	);
	entries[0] ? res.send(entries[0]).status(200) : res.send({message: "Not found"}).status(404);
});

router.get('/:table/:id/:subTable/:subId', async (req, res) => {
	let tableId;
	req.params.table === 'vendors' ? tableId = 'vendor_id' : tableId = 'user_id';
	const row = await connection.query(`SELECT * FROM ??	WHERE ?? = ? AND _id = ?`,
		[req.params.subTable, tableId, req.params.id, req.params.subId]);
	row[0][0] ? res.send(row[0]).status(200) : res.send({message: "Not found"}).status(404);
});

router.delete('/:table/:id/:table?/:id?', async (req, res) => {
	const row = await connection.query(
		`DELETE FROM ??	WHERE _id = ?`, [req.params.table, req.params.id]
	);
	row[0].affectedRows ? res.send({message: "Row deleted"}).status(204) :
		res.send({message: "Row not deleted"}).status(500);
});

router.post('/:table/:id?/:table?', async (req, res) => {
	const values = Object.values(req.body)
	const struc = await getSchema(req.params.table);
	const preparedStatement = struc.map(elem => elem = '?');
	const result = await connection.query(
		`INSERT INTO ?? (${struc})	VALUES (${preparedStatement})`, [req.params.table, ...values]
	);
	result[0].affectedRows ? res.send({message: "Added succesfully"}).status(204) :
		res.send({message: "Error adding record"}).status(500);
});

router.patch('/:table/:id/:table?/:id?', async (req, res) => {
	const updates = [];
	for (let key in req.body) {
		updates.push(`${key} = '${req.body[key]}'`);
	}
	const result = await connection.query(
		`UPDATE ??	SET ${updates}	WHERE _id = ?` , [req.params.table, req.params.id]
	);
	result[0].affectedRows ? res.send({message: "Updated succesfully"}).status(204) :
		res.send({message: "Error editing record"}).status(500);
});

export default router;
