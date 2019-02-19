import * as winston from 'winston';

import Request from '../lib/request';
import TelegramBot from '../lib/telegram';

import Constants from '../models/constants';

export default abstract class AbstractModule {
  constructor(readonly request: Request, readonly log: winston.Logger, readonly bot: TelegramBot) {}

  abstract async handle(): Promise<void>;
}

export abstract class AbstractModuleWithConstants extends AbstractModule {
  constants: Constants;
}
