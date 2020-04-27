import { Game } from '../models/game';

export abstract class AbstractModule {
  protected readonly game: Game;

  constructor(game: Game) {
    this.game = game;
  }

  async abstract handle(): Promise<void>;
}
