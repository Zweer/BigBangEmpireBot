import * as winston from 'winston';

import Game from '../models/game';
import Request from '../request';
import TelegramBot from '../telegram';

export default abstract class AbstractModule {
  constructor(readonly game: Game, readonly request: Request, readonly log: winston.Logger, readonly bot: TelegramBot) {}

  abstract async handle(): Promise<void>;
}
