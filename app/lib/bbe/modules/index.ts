import Game from '../game';
import Request from '../request';
import TelegramBot from '../telegram';

export default abstract class AbstractModule {
  constructor(readonly game: Game, readonly request: Request, readonly log, readonly bot: TelegramBot) {}

  abstract async handle(): Promise<void>;
}
