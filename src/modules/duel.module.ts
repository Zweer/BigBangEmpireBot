import { AbstractModule } from './abstract.module';

import log from '../libs/log';
import request from '../libs/request';

import { Opponent } from '../models/duel/opponent';

export class DuelModule extends AbstractModule {
  async iteration() {
    await this.handleMissedDuels();
    await this.handleDuels();
  }

  private async handleMissedDuels() {
    if (this.game.missed_duels === 0) {
      return;
    }

    const missedDuels = await request.getMissedDuelsNew();

    missedDuels.forEach((missedDuel) => log.info(missedDuel));

    await request.claimMissedDuelsRewards();
  }

  private async handleDuels() {
    while (this.game.character.hasDuelStamina()) {
      log.info(`Duel stamina: ${this.game.character.duel_stamina}`);

      // eslint-disable-next-line no-await-in-loop
      const opponents = await request.getDuelOpponents();

      const opponent = Opponent.getDuelOpponent(opponents, this.game);

      // eslint-disable-next-line no-await-in-loop
      const duel = await request.startDuel(opponent.id);

      log.info(duel);

      // eslint-disable-next-line no-await-in-loop
      await request.checkForDuelComplete();

      // eslint-disable-next-line no-await-in-loop
      await request.claimDuelRewards();
    }
  }
}
