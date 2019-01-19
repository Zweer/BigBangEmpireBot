import * as config from 'config';

import { optionsConfig, optionsWeb } from './types/options';

import Constants from './constants';
import ExtendedConfig from './extendedConfig';
import Friend from './friend';
import Game from './game';
import Request from './request';
import RequestWeb from './requestWeb';

export default class BigBangEmpireBot {
  private game: Game;
  private extendedConfig: ExtendedConfig;
  private constants: Constants;
  private offers: { consumable; normal; special; text };
  private friends: Friend[];

  private options: optionsConfig;
  private optionsWeb: optionsWeb;

  private request: Request;
  private requestWeb: RequestWeb;

  static BASE_URL: string = 'https://{SERVER}.bigbangempire.com';

  constructor(options?: optionsConfig) {
    this.options = options || config.get('bbe');

    this.request = new Request(BigBangEmpireBot.BASE_URL, this.options.auth.server, this.options.auth.email, this.options.auth.password);
    this.requestWeb = new RequestWeb(BigBangEmpireBot.BASE_URL, this.options.auth.server);
  }

  async run() {
    await this.initConfigFromWeb();
    await this.initEnvironment();
    await this.initGame();
    await this.login();
    await this.initOffers();
    await this.initFriends();

    await this.playRound();
  }

  async initConfigFromWeb() {
    this.optionsWeb = await this.requestWeb.initConfigFromWeb();
  }

  async initEnvironment() {
    this.extendedConfig = await this.request.initEnvironment();
  }

  async initGame() {
    const { constants, extendedConfig } = await this.request.initGame(this.optionsWeb);

    this.constants = constants;
    this.extendedConfig.update(extendedConfig);
  }

  async login() {
    this.game = await this.request.login(this.options.auth.email, this.options.auth.password);

    this.request.setUserId(this.game.user.id);
    this.request.setUserSessionId(this.game.user.sessionId);
  }

  async initOffers() {
    this.offers = await this.request.initOffers(this.optionsWeb.locale);
  }

  async initFriends() {
    this.friends = await this.request.initFriends();
  }

  async playRound() {
    await this.syncGame();

    await this.handleCurrentQuest();
  }

  async syncGame() {
    this.game.update(await this.request.syncGame());
  }

  async handleCurrentQuest() {
    const currentQuest = await this.request.checkForQuestComplete();

    if (!currentQuest || currentQuest.status !== )

    console.log('aaa');
  }
}

new BigBangEmpireBot()
  .run()
  .catch(err => console.error(err));
