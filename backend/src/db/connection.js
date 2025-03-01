import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();

 const connection = mysql.createPool({
    host: process.env.MYSQL_HOST,
    database: process.env.MYSQL_DB,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
  }).promise();

export default connection
