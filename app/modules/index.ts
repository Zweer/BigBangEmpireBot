import * as winston from 'winston';

import TelegramBot from '../lib/telegram';

export default abstract class AbstractModule {
  constructor(readonly log: winston.Logger, readonly bot: TelegramBot) {}

  abstract async handle(): Promise<void>;
}
