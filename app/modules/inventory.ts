import log from '../lib/log';
import bot from '../lib/telegram';

import character from '../models/character';
import game from '../models/game';
import inventory, { Inventory } from '../models/inventory';

import AbstractModule from '.';

import { itemType } from '../models/types/item';

export default class InventoryModule extends AbstractModule {
  private refreshShop: boolean = true;
  private notifiedItems: number[] = [];
  private oldStatPointAvailable: number = 0;

  async handle(): Promise<void> {
    await this.handleInventoryAdvanced();
    await this.handleInventoryShop();
    await this.handleRefreshShop();
    await this.handleStatPointAvailable();
  }

  private async handleInventoryAdvanced() {
    let modified;

    do {
      modified = false;

      // @ts-ignore
      await Promise.serial(inventory.bagItemsId.map((bagItemId) => {
        if (modified) {
          return;
        }

        const item = game.getItem(bagItemId);
        if (!item) {
          return;
        }

        const equippedItemId = inventory.getItemBySlot(item.type);

        if (!equippedItemId) {
          if (item.isUsable) {
            return item.useInventoryItem();
          }

          log.verbose(`Moving item: ${item.slot} (empty slot)`);

          modified = true;

          return item.moveInventoryItem();
        }

        const equippedItem = game.getItem(equippedItemId);

        if (equippedItem && item.statTotal <= equippedItem.statTotal) {
          if (item.type === itemType.MISSILES) {
            return;
          }

          log.verbose(`Selling item: ${item.slot}\n- my: ${equippedItem.statTotal}\n- bag: ${item.statTotal}`);

          return item.sellInventoryItem();
        }

        if (!item.battleSkill && !equippedItem.battleSkill) {
          log.verbose(`Moving item: ${item.slot} (better item)`);

          modified = true;

          return item.moveInventoryItem();
        }

        log.verbose(`New item: ${item.slot}\n- my: ${equippedItem.statTotal}\n- bag: ${item.statTotal}`);
      }));
    } while (modified);
  }

  private async handleInventoryShop() {
    await Promise.all(inventory.shopItemsId.map(async (shopItemId) => {
      if (!shopItemId) {
        return;
      }

      const item = game.getItem(shopItemId);
      const equippedItemId = inventory.getItemBySlot(item.slot);
      const equippedItem = equippedItemId && game.getItem(equippedItemId);

      const isUnequipped = !equippedItem;
      const isBetter = equippedItem && item.statTotal > equippedItem.statTotal;
      const isMissiles = item.type === itemType.MISSILES;

      if (isUnequipped || isBetter || isMissiles) {
        const messages = [];
        messages.push(`- ${item.slot}`);
        messages.push(`- ${item.buyPrice} ${item.premiumItem ? 'diamonds' : 'coins'}`);

        if (isUnequipped) {
          messages.push('- You don\'t have this slot equipped');
        }

        if (isBetter) {
          messages.push(`- It's ${item.statTotal - equippedItem.statTotal} points better`);
        }

        if (isMissiles) {
          messages.push('- It\'s missiles');
        }

        if (item.premiumItem) {
          if (this.notifiedItems.includes(item.id)) {
            return;
          }

          this.notifiedItems.push(item.id);

          return bot.askForItemPurchase(item, messages);
        }

        log.info(['You are buying an item:', ...messages].join('\n'));

        return item.buyShopItem();
      }
    }));

    this.refreshShop = true;
  }

  private async handleRefreshShop() {
    if (!character.hasRefreshedShopToday && this.refreshShop) {
      log.info('Refreshing shop');

      await Inventory.refreshShopItems();
    }
  }

  private handleStatPointAvailable() {
    if (!character.statPointsAvailable) {
      return;
    }

    if (this.oldStatPointAvailable !== character.statPointsAvailable) {
      log.verbose(`You have stat points available: ${character.statPointsAvailable}`);
    }

    this.oldStatPointAvailable = character.statPointsAvailable;
  }
}
