import * as winston from 'winston';

import Request from '../request';
import TelegramBot from '../telegram';

import Constants from '../models/constants';
import Game from '../models/game';

export default abstract class AbstractModule {
  constructor(readonly game: Game, readonly request: Request, readonly log: winston.Logger, readonly bot: TelegramBot) {}

  abstract async handle(): Promise<void>;
}

export abstract class AbstractModuleWithConstants extends AbstractModule {
  constants: Constants;
}
