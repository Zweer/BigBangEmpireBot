import * as moment from 'moment';

import AbstractModule from '.';

import Game from '../game';
import Request from '../request';
import TelegramBot from '../telegram';

import Constants from '../game/constants';

export default class ProfileModule extends AbstractModule {
  static WORK_DELAY = [3, 'hours'];

  constructor(readonly game: Game, readonly request: Request, readonly log, readonly bot: TelegramBot, readonly constants: Constants) {
    super(game, request, log, bot);
  }

  get tsLastWorkCollection() {
    return this.game.character.tsLastWorkCollection;
  }

  async handle(): Promise<void> {
    await this.handleCollectWork();
    await this.handleCompleteGoals();
  }

  private async handleCollectWork() {
    const threeHoursAgo = moment().subtract(...ProfileModule.WORK_DELAY);

    if (this.tsLastWorkCollection.isBefore(threeHoursAgo)) {
      const collectedWork = await this.request.collectWork();

      this.log.verbose(`Collected work: ${collectedWork.gameCurrencyReward} coins (${collectedWork.offer})`);
    }
  }

  private async handleCompleteGoals() {
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
        this.log.verbose(`Completing a goal: ${goalName} (${nextGoalValue})`);

        await this.request.collectGoalReward(goalName, nextGoalValue);
      }), Promise.resolve());

    this.game.currentGoalValue = {};
  }
}
