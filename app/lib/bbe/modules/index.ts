import Game from '../game';
import Request from '../request';

export default abstract class AbstractModule {
  constructor(readonly game: Game, readonly request: Request, readonly log) {}

  abstract async handle(): Promise<void>;
}
