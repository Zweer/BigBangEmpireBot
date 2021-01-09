import config from './libs/config';
import request from './libs/request';

import { ExtendedConfigDto } from './dtos/init/extendedConfig.dto';
import { UserFriendDto } from './dtos/models/userFriend.dto';

import { Constants } from './models/constants';
import { Game } from './models/game';

import { AbstractModule } from './modules/abstract.module';
import { StoryModule } from './modules/story.module';
import { CharacterModule } from './modules/character.module';

export class BigBangEmpire {
  private constants: Constants;

  // @ts-ignore
  private extendedConfig: ExtendedConfigDto;

  private game: Game;

  // @ts-ignore
  private friends: UserFriendDto[];

  private modules: AbstractModule[] = [];

  async start() {
    await request.init();

    await request.initEnvironment();

    const initGame = await request.initGame();
    this.constants = initGame.constants;
    this.extendedConfig = initGame.extendedConfig;

    this.game = await request.loginUser(config.auth.email, config.auth.password);

    await request.getStandalonePaymentOffers();

    this.friends = await request.loginFriendBar();

    this.initModules();

    await this.iteration();
  }

  private initModules() {
    [
      StoryModule,
      CharacterModule,
    ].map((Module) => this.modules.push(new Module(this.game, this.constants)));
  }

  private async iteration() {
    await request.syncGame();
    await request.updateGameSession();

    await this.modules.reduce((promise, module) => promise.then(() => module.iteration()), Promise.resolve());

    await new Promise((resolve) => setTimeout(resolve, 10000));

    await this.iteration();
  }
}
