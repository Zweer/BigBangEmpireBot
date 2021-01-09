import log from '../libs/log';
import request from '../libs/request';

import { AbstractModule } from './abstract.module';
import { Stats } from '../dtos/types';

export class CharacterModule extends AbstractModule {
  async iteration() {
    await this.checkDailyReward();
    await this.checkGoals();
    await this.checkAvailableStatPoints();
  }

  private async checkDailyReward() {
    if (this.game.daily_login_bonus_rewards && this.game.daily_login_bonus_day) {
      log.warn('LOGIN BONUS!!!');
    }
  }

  private async checkGoals() {
    await this.game.current_goal_values
      .map((currentGoal) => ({
        currentGoal,
        goal: this.constants.goals.find((goal) => goal.identifier === currentGoal.identifier),
        collectedGoal: this.game.collected_goals.find((collectedGoal) => collectedGoal.identifier === currentGoal.identifier) || { value: 0 },
      }))
      .filter(({ currentGoal, collectedGoal }) => currentGoal.current_value > collectedGoal.value)
      .map(({ currentGoal, goal, collectedGoal }) => goal.values
        .filter((goalValue) => goalValue.value > collectedGoal.value && goalValue.value < currentGoal.current_value)
        .map((goalValue) => ({
          identifier: goal.identifier,
          value: goalValue.value,
        })))
      .flat()
      .reduce((promise, { identifier, value }) => promise
        .then(() => request.getGoalItemRewards(identifier))
        .then(() => request.collectGoalReward(identifier, value))
        .then(() => log.info(`Collected goal "${identifier}" #${value}`)), Promise.resolve());
  }

  private async checkAvailableStatPoints() {
    while (this.game.character.hasAvailableStatPoints()) {
      log.info(`There are ${this.game.character.stat_points_available} available stat points: adding one to ${Stats[this.game.character.getLeastTotalStat()]}`);

      // eslint-disable-next-line no-await-in-loop
      await request.improveCharacterStat(this.game.character.getLeastTotalStat());
    }
  }
}
