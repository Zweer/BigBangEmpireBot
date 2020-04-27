import { Game } from './models/game';

import { StoryModule } from './modules/story.module';

export class BigBangEmpire {
  private game: Game;

  private storyModule: StoryModule;

  async start(): Promise<void> {
    this.game = await Game.create();

    this.storyModule = new StoryModule(this.game);

    await this.play();
  }

  async play(): Promise<void> {
    await this.game.sync();

    await this.storyModule.handle();
  }
}
