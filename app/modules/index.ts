import * as winston from 'winston';

import Request from '../lib/request';
import TelegramBot from '../lib/telegram';

export default abstract class AbstractModule {
  constructor(readonly request: Request, readonly log: winston.Logger, readonly bot: TelegramBot) {}

  abstract async handle(): Promise<void>;
}
