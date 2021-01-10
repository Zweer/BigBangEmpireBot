import { AbstractModule } from './abstract.module';

import log from '../libs/log';
import request from '../libs/request';

import { Item } from '../models/inventory/item';

import { ItemType } from '../types/itemType';
import { Stat } from '../types/stat';

export class CharacterModule extends AbstractModule {
  async iteration() {
    await this.checkDailyLoginBonus();
    await this.checkDailyBonus();
    await this.checkGoals();
    await this.checkAvailableStatPoints();
    await this.checkInventory();
    await this.checkVouchers();
  }

  private async checkDailyLoginBonus() {
    if (this.game.daily_login_bonus_rewards && this.game.daily_login_bonus_day) {
      log.warn('LOGIN BONUS!!!');
    }
  }

  private async checkDailyBonus() {
    const dailyBonusRewards = await request.getDailyBonusRewardData();

    console.log(dailyBonusRewards);
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
      log.info(`There are ${this.game.character.stat_points_available} available stat points: adding one to ${Stat[this.game.character.getLeastTotalStat()]}`);

      // eslint-disable-next-line no-await-in-loop
      await request.improveCharacterStat(this.game.character.getLeastTotalStat());
    }
  }

  private async checkInventory() {
    await this.game.inventory.bagSlots.reduce(async (promise, itemId) => {
      await promise;

      if (itemId === 0) {
        return;
      }

      const item: Item = this.game.getItem(itemId);
      if (item.type === ItemType.MISSILES) {
        // do nothing
        return;
      }

      const equippedItemId = this.game.inventory.getCharacterSlot(item.type);
      if (equippedItemId === 0) {
        if (item.isUsable()) {
          log.info(`Using item ${item.identifier}`);
          await request.useInventoryItem(item.id);
        } else {
          log.info(`Equipping item ${item.identifier} (empty ${ItemType[item.type]} slot)`);
          await request.moveInventoryItem(item.id, item.type);
        }

        return;
      }

      const equippedItem: Item = this.game.getItem(equippedItemId);
      if (item.stat_total <= equippedItem.stat_total) {
        log.info(`Selling item ${item.identifier} (${ItemType[item.type]} slot)\n- mine: ${equippedItem.stat_total}\n- bag: ${item.stat_total}`);
        await request.sellInventoryItem(item.id);
      }

      if (!item.battle_skill && !equippedItem.battle_skill) {
        log.info(`Equipping item ${item.identifier} (better ${ItemType[item.type]} slot)`);
        await request.moveInventoryItem(item.id, item.type);
      }
    }, Promise.resolve());
  }

  private async checkVouchers() {
    await this.game.character.new_user_voucher_ids
      .reduce((promise, voucherId) => promise
        .then(() => request.getUserVoucher(voucherId))
        .then((voucher) => request.redeemVoucher(voucher.code)), Promise.resolve());
  }
}
