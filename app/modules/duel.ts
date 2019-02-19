import log from '../lib/log';

import character from '../models/character';
import game from '../models/game';
import inventory from '../models/inventory';

import AbstractModule from '.';

import MissedDuel from '../models/duel/missed';
import Opponent from '../models/duel/opponent';

export default class DuelModule extends AbstractModule {
  private alertMissiles: boolean;
  private canDuel: boolean;

  async handle(): Promise<void> {
    this.handleInventoryFlags();

    await this.handleDuel();
    await this.handleMissedDuels();
  }

  private handleInventoryFlags() {
    if (inventory.missilesItemId === 0) {
      this.canDuel = false;

      if (this.alertMissiles) {
        this.alertMissiles = false;

        log.warn('No more missiles!');
      }
    } else if (!this.canDuel) {
      this.canDuel = true;
      this.alertMissiles = true;

      log.verbose('More missiles...');
    }

    if (inventory.bagItemsId.every(bagItemId => bagItemId !== 0)) {
      this.canDuel = false;

      log.warn('Inventory is full!');
    }
  }

  private async handleDuel() {
    if (character.duelStamina < character.duelStaminaCost || !this.canDuel) {
      return;
    }

    log.debug(`Duel stamina: ${character.duelStamina}`);

    const opponent = await Opponent.getDuelOpponent();

    if (opponent) {
      await opponent.duel();
    } else {
      log.warn('No opponents to duel');
    }
  }

  private async handleMissedDuels() {
    if (game.missedDuels === 0) {
      return;
    }

    const missedDuels = await MissedDuel.getMissedDuelsNew();

    missedDuels.forEach(missedDuel => log.verbose(`${missedDuel}`));

    await MissedDuel.claimMissedDuelsRewards();
  }
}
