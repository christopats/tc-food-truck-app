import express from 'express';
import dotenv from 'dotenv';
import router from './src/router.js';

dotenv.config();

const port = 5000;

const server = express();

server.use(express.json());

server.use('/', router);

server.listen(port, () => {
  console.log(`server running on port ${port}`);
});
