import * as winston from 'winston';

import { TelegramBotLogger } from './telegram';

export default winston.createLogger({
  level: 'silly',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.printf(info => `${info.timestamp} [${info.level}] ${info.message}`),
  ),
  transports: [
    new winston.transports.Console(),
    new TelegramBotLogger({ level: 'info' }),
  ],
});
