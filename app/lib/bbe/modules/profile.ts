import { findKey } from 'lodash';
import * as moment from 'moment';

import { AbstractModuleWithConstants } from '.';

export default class ProfileModule extends AbstractModuleWithConstants {
  static WORK_DELAY = [3, 'hours'];

  get newUserVoucherIds() {
    return this.game.character.newUserVoucherIds;
  }

  get tsLastWorkCollection() {
    return this.game.character.tsLastWorkCollection;
  }

  get activeQuestBoosterId() {
    return this.game.character.activeQuestBoosterId;
  }

  get activeStatsBoosterId() {
    return this.game.character.activeStatsBoosterId;
  }

  get activeWorkBoosterId() {
    return this.game.character.activeWorkBoosterId;
  }

  get currentGoalValue() {
    return this.game.currentGoalValue;
  }

  get collectedGoals() {
    return this.game.collectedGoals;
  }

  async handle(): Promise<void> {
    await this.handleVoucher();
    await this.handleBoosters();
    await this.handleCollectWork();
    await this.handleCompleteGoals();
  }

  private async handleVoucher() {
    if (this.newUserVoucherIds.length) {
      await Promise.all(this.newUserVoucherIds.map(async (voucherId) => {
        const voucher = await this.request.getUserVoucher(voucherId);

        this.log.info(`Voucher:\n${voucher.rewards}`);
        await this.request.redeemVoucher(voucher);
      }));
    }
  }

  private async handleBoosters() {
    if (!this.activeQuestBoosterId) {
      await this.buyBestBooster(1);
    }

    if (!this.activeStatsBoosterId) {
      await this.buyBestBooster(2);
    }

    if (!this.activeWorkBoosterId) {
      await this.buyBestBooster(3);
    }
  }

  private async buyBestBooster(type: number, premium: boolean = false) {
    const boosterId = findKey(this.constants.boosters, b => b.type === type && b.premium_item === premium);

    this.log.info(`Buying booster ${boosterId}`);

    await this.request.buyBooster(boosterId);
  }

  private async handleCollectWork() {
    const threeHoursAgo = moment().subtract(...ProfileModule.WORK_DELAY);

    if (this.tsLastWorkCollection.isBefore(threeHoursAgo)) {
      const collectedWork = await this.request.collectWork();

      this.log.verbose(`Collected work: ${collectedWork.gameCurrencyReward} coins (${collectedWork.offer})`);
    }
  }

  private async handleCompleteGoals() {
    await Object.keys(this.currentGoalValue)
      .map((goalName) => {
        const currentGoalValue = this.currentGoalValue[goalName];
        const collectedGoal = this.collectedGoals[goalName] || { value: 0 };
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
