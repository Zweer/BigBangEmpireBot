import * as numeral from 'numeral';

import AbstractModule from '.';

import Opponent from '../models/duel/opponent';

export default class DuelModule extends AbstractModule {
  private alertMissiles: boolean;
  private canDuel: boolean;

  get missilesItemId() {
    return this.game.inventory.missilesItemId;
  }

  get inventory() {
    return this.game.inventory;
  }

  get duelStamina() {
    return this.game.character.duelStamina;
  }

  get duelStaminaCost() {
    return this.game.character.duelStaminaCost;
  }

  get missedDuels() {
    return this.game.missedDuels;
  }

  async handle(): Promise<void> {
    this.handleInventoryFlags();

    await this.handleDuel();
    await this.handleMissedDuels();
  }

  private handleInventoryFlags() {
    if (this.missilesItemId === 0) {
      this.canDuel = false;

      if (this.alertMissiles) {
        this.alertMissiles = false;

        this.log.warn('No more missiles!');
      }
    } else if (!this.canDuel) {
      this.canDuel = true;
      this.alertMissiles = true;

      this.log.verbose('More missiles...');
    }

    if (this.inventory.bagItemsId.every(bagItemId => bagItemId !== 0)) {
      this.canDuel = false;

      this.log.warn('Inventory is full!');
    }
  }

  private async handleDuel() {
    if (this.duelStamina < this.duelStaminaCost || !this.canDuel) {
      return;
    }

    this.log.debug(`Duel stamina: ${this.duelStamina}`);

    const opponents = await this.request.getDuelOpponents();

    if (!opponents) {
      this.log.error('No duel opponents');
    }

    const sortedOpponents = opponents
      .filter(o => !o.name.startsWith('deleted_'))
      .filter(o => !!o)
      .sort((a, b) => b.honor - a.honor);

    const opponent = sortedOpponents.find(o => o.totalStats < this.game.character.statTotal) || sortedOpponents.pop();

    if (opponent) {
      await this.makeDuel(opponent);
    }
  }

  private async makeDuel(opponent: Opponent) {
    this.log.verbose(`Starting duel with ${opponent.name}`);

    const { battle, duel } = await this.request.startDuel(opponent.id);

    const addendum = [''];

    if (duel.characterARewards.premium) {
      addendum.push(`- ${duel.characterARewards.premium} gems`);
    }

    if (duel.characterARewards.item) {
      addendum.push(`- ${duel.characterARewards.item} item`);
    }

    this.log.verbose(`You ${battle.won ? 'won' : 'lost'} the duel!\n- ${numeral(duel.characterARewards.honor).format('+0')} honor${addendum.join('\n')}`);

    await this.request.checkForDuelComplete();
    await this.request.claimDuelRewards();
  }

  private async handleMissedDuels() {
    if (this.missedDuels === 0) {
      return;
    }

    const missedDuels = await this.request.getMissedDuelsNew();

    missedDuels.forEach(missedDuel => this.log.verbose(`Missed duel: ${missedDuel.won ? 'won' : 'lost'}\n- ${missedDuel.opponent.name}\n- ${numeral(missedDuel.characterBRewards.honor).format('+0')} honor`));

    await this.request.claimMissedDuelsRewards();
  }
}
