import { Game } from '../models/game';
import { Constants } from '../models/constants';

export abstract class AbstractModule {
  constructor(protected game: Game, protected constants: Constants) {}

  abstract iteration();
}
