import log from '../lib/log';
import request from '../lib/request';

import character from '../models/character';
import constants from '../models/constants';
import game from '../models/game';

import AbstractModule from '.';

import Booster from '../models/booster';
import Voucher from '../models/voucher';
import CollectedWork from '../models/work/collected';

export default class ProfileModule extends AbstractModule {
  async handle(): Promise<void> {
    await this.handleDailyBonus();
    await this.handleVoucher();
    await this.handleBoosters();
    await this.handleCollectWork();
    await this.handleCompleteGoals();
  }

  private async handleDailyBonus() {
    await request.getDailyBonusRewardData();
  }

  private async handleVoucher() {
    if (character.newUserVoucherIds.length) {
      await Promise.all(character.newUserVoucherIds.map(async (voucherId) => {
        const voucher = await Voucher.getUserVoucher(voucherId);

        log.info(`Voucher:\n${voucher.rewards}`);
        await voucher.redeemVoucher();
      }));
    }
  }

  private async handleBoosters() {
    if (!character.activeQuestBoosterId) {
      await Booster.buyBestBooster(1);
    }

    if (!character.activeStatsBoosterId) {
      await Booster.buyBestBooster(2);
    }

    if (!character.activeWorkBoosterId) {
      await Booster.buyBestBooster(3);
    }
  }

  private async handleCollectWork() {
    if (CollectedWork.needToCollect) {
      const collectedWork = await CollectedWork.collectWork();

      log.verbose(`${collectedWork}`);
    }
  }

  private async handleCompleteGoals() {
    await Object.keys(game.currentGoalValue)
      .map((goalName) => {
        const currentGoalValue = game.currentGoalValue[goalName];
        const collectedGoal = game.collectedGoals[goalName] || { value: 0 };
        const goal = constants.goals[goalName];

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
        log.verbose(`Completing a goal: ${goalName} (${nextGoalValue})`);

        await request.collectGoalReward(goalName, nextGoalValue);
      }), Promise.resolve());

    game.currentGoalValue = {};
  }
}
