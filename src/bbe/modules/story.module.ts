import { AbstractModule } from './index';

export class StoryModule extends AbstractModule {
  async handle(): Promise<void> {
    console.log(this.game);
  }
}
