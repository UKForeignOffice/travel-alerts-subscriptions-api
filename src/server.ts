import express from "express";
import { logger } from "./logger";
import { PORT, NODE_ENV } from "./config";

export const server = express();

export const startServer = () => {
  server.listen(PORT, () => {
    logger.info(`Server listening on PORT: ${PORT}, NODE_ENV: ${NODE_ENV}`);
  });
};
