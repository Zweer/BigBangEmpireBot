import { createLogger, format, transports } from 'winston';

const logger = createLogger({
  level: 'silly',
  format: format.simple(),
  transports: [
    new transports.Console(),
  ],
});

export default logger;
