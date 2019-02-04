import _ from 'lodash';
import * as config from 'config';
import * as moment from 'moment';
import * as winston from 'winston';

import { resource } from './game/types/common';
import { optionsConfig, optionsWeb } from './game/types/options';

import Game from './game';
import Constants from './game/constants';
import ExtendedConfig from './game/extendedConfig';
import Friend from './game/friend';
import Quest, { questStatus } from './game/quest';
import Request from './request';
import RequestWeb from './requestWeb';

export default class BigBangEmpireBot {
  readonly game: Game;
  private extendedConfig: ExtendedConfig;
  private constants: Constants;
  private offers: { consumable; normal; special; text };
  private friends: Friend[];

  private level: number = 0;

  private options: optionsConfig;
  private optionsWeb: optionsWeb;

  private request: Request;
  private requestWeb: RequestWeb;
  private log: winston.Logger;

  static BASE_URL: string = 'https://{SERVER}.bigbangempire.com';

  constructor(options?: optionsConfig) {
    this.options = options || config.get('bbe');
    this.game = new Game();

    this.request = new Request(BigBangEmpireBot.BASE_URL, this.options.auth.server, this.options.auth.email, this.options.auth.password, this.game);
    this.requestWeb = new RequestWeb(BigBangEmpireBot.BASE_URL, this.options.auth.server);

    this.log = winston.createLogger({
      level: 'silly',
      format: winston.format.combine(
        winston.format.timestamp(),
        winston.format.printf(info => `${info.timestamp} [${info.level}] ${info.message}`),
      ),
      transports: [new winston.transports.Console()],
    });
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
    await this.request.login(this.options.auth.email, this.options.auth.password);
  }

  async initOffers() {
    this.offers = await this.request.initOffers(this.optionsWeb.locale);
  }

  async initFriends() {
    this.friends = await this.request.initFriends();
  }

  async playRound() {
    await this.syncGame();

    this.handleNewLevel();

    await this.handleCurrentQuest();
    await this.handleStartQuest();

    await this.handleCompleteGoals();
  }

  async syncGame() {
    await this.request.syncGame();
  }

  handleNewLevel() {
    if (this.level !== this.game.character.level && this.level !== 0) {
      this.log.info(`New level: ${this.game.character.level}!!`);
    }

    this.level = this.game.character.level;
  }

  async handleCurrentQuest() {
    const currentQuest = this.game.currentQuest;

    if (!currentQuest || currentQuest.tsComplete.isAfter(moment())) {
      return;
    }

    const currentQuestUpdate = await this.request.checkForQuestComplete();
    if (currentQuestUpdate) {
      currentQuest.update(currentQuestUpdate);
    }

    if (!currentQuest || currentQuest.status !== questStatus.FINISHED) {
      return;
    }

    await this.request.claimQuestRewards();
  }

  async handleStartQuest() {
    if (this.game.currentQuest) {
      return;
    }

    if (this.game.character.questEnergy < 2) {
      this.log.info('Energy low');
      return;
    }

    this.log.debug(`Current energy: ${this.game.character.questEnergy}`);

    const quest = this.game.quests.find((quest: Quest) => quest.energyCost < this.game.character.questEnergy);

    if (quest) {
      await this.doQuest(quest);
    }
  }

  async doQuest(currentQuest: Quest) {
    let startingQuestString = 'Starting a new quest:\n';
    startingQuestString += `- ${currentQuest.xpPerEnergy} xp/energy\n`;
    startingQuestString += `- ${currentQuest.energyCost} energy\n`;

    startingQuestString += currentQuest.rewards.nonStandardAttributes.map(nonStandardAttribute => `- with a ${nonStandardAttribute}\n`).join('');

    if (currentQuest.rewards.dungeonKey) {
      this.log.warn(`Got a new dungeonKey in ${currentQuest.energyCost} minutes`);
    }

    this.log.debug(startingQuestString);

    const quest = await this.request.startQuest(currentQuest.id);

    currentQuest.update(quest);

    if (this.game.character.unusedResources[resource.QUEST_REDUCTION] > 0 && this.game.character.usedResources[resource.QUEST_REDUCTION] < 4 && currentQuest.energyCost > 8) {
      await this.request.useResource(resource.QUEST_REDUCTION);
    }
  }

  async handleCompleteGoals() {
    await Object.keys(this.game.currentGoalValue)
      .map((goalName) => {
        const currentGoalValue = this.game.currentGoalValue[goalName];
        const collectedGoal = this.game.collectedGoals[goalName] || { value: 0 };
        const goal = this.constants.goals[goalName];

        if (currentGoalValue.currentValue <= collectedGoal.value) {
          return;
        }

        let nextGoalValue;
        Object.keys(goal.values)
          .sort((a, b) => parseInt(a, 10) < parseInt(b, 10) ? -1 : 1)
          .every((goalValue) => {
            if (parseInt(goalValue, 10) > collectedGoal.value) {
              nextGoalValue = goalValue;

              return false;
            }

            return true;
          });

        if (nextGoalValue && currentGoalValue.value >= nextGoalValue) {
          return { goalName, nextGoalValue };
        }
      })
      .filter(goal => !!goal)
      .reduce((previousPromise, { goalName, nextGoalValue }) => previousPromise.then(async () => {
        this.log.info(`Completing a goal: ${goalName} (${nextGoalValue})`);

        await this.request.collectGoalReward(goalName, nextGoalValue);
      }), Promise.resolve());
  }
}

new BigBangEmpireBot().run()
  .catch(err => console.error(err));
