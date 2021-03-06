import { AbstractModule } from './abstract.module';

import log from '../libs/log';
import request from '../libs/request';

import { ItemType } from '../types/itemType';
import { Stat } from '../types/stat';

export class CharacterModule extends AbstractModule {
  async iteration() {
    await this.checkDailyLoginBonus();
    await this.checkGoals();
    await this.checkAvailableStatPoints();
    await this.checkInventory();
    await this.checkShop();
    await this.checkVouchers();
  }

  private async checkDailyLoginBonus() {
    if (this.game.daily_login_bonus_rewards && this.game.daily_login_bonus_day) {
      log.warn('LOGIN BONUS!!!');
    }
  }

  private async checkGoals() {
    const currentGoals = this.game.current_goal_values
      .map((currentGoal) => ({
        currentGoal,
        goal: this.constants.goals.find((goal) => goal.identifier === currentGoal.identifier),
        collectedGoal: this.game.collected_goals.find((collectedGoal) => collectedGoal.identifier === currentGoal.identifier) || { value: 0 },
      }));

    const currentGoalsFiltered = currentGoals
      .filter(({ currentGoal, collectedGoal }) => currentGoal.current_value > collectedGoal.value);

    const currentGoalsFilteredValues = currentGoalsFiltered
      .map(({ currentGoal, goal, collectedGoal }) => goal.values
        .filter((goalValue) => goalValue.value > collectedGoal.value && goalValue.value <= currentGoal.current_value)
        .map((goalValue) => ({
          identifier: goal.identifier,
          value: goalValue.value,
        })))
      .flat();

    await currentGoalsFilteredValues
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

      const item = this.game.getItem(itemId);
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

      const equippedItem = this.game.getItem(equippedItemId);
      if (item.stat_total <= equippedItem.stat_total) {
        log.info(`Selling item ${item.identifier} (${ItemType[item.type]} slot)\n- mine: ${equippedItem.stat_total}\n- bag: ${item.stat_total}`);
        await request.sellInventoryItem(item.id);

        return;
      }

      if (!item.battle_skill && !equippedItem.battle_skill) {
        log.info(`Equipping item ${item.identifier} (better ${ItemType[item.type]} slot)`);
        await request.moveInventoryItem(item.id, item.type);
      }
    }, Promise.resolve());
  }

  private async checkShop() {
    await this.game.inventory.shopSlots.reduce(async (promise, itemId) => {
      await promise;

      if (itemId === 0) {
        return;
      }

      const item = this.game.getItem(itemId);
      let toBuy = false;

      if (item.type === ItemType.MISSILES) {
        toBuy = true;
      }

      const equippedItemId = this.game.inventory.getCharacterSlot(item.type);
      if (equippedItemId === 0) {
        toBuy = true;
      }

      const equippedItem = this.game.getItem(equippedItemId);
      if (item.stat_total > (equippedItem?.stat_total || 0) || item.battle_skill) {
        toBuy = true;
      }

      if (toBuy && !item.premium_item && item.buy_price < this.game.character.game_currency) {
        await request.buyShopItem(itemId, item.type);
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
