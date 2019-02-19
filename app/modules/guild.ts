import character from '../models/character';
import game from '../models/game';
import guild from '../models/guild';

import log from '../lib/log';
import request from '../lib/request';

import AbstractModule from '.';
import GuildMessage from '../models/guild/message';

export default class GuildModule extends AbstractModule {
  async handle(): Promise<void> {
    await this.handleGuildMessages();

    await this.handleCurrentBattle();
    await this.handleNextBattle();

    await this.handleTemple();
  }

  private async handleGuildMessages() {
    if (game.newGuildLogEntries) {
      const guildMessages = await GuildMessage.getGuildLog();

      guildMessages.forEach(guildMessage => log.info(`👥 ${guildMessage}`));
    }
  }

  private async handleCurrentBattle() {
    // TODO: add if the battle was won or lost
    await character.claimGuildBattleAttackReward();
    await character.claimGuildBattleDefenseReward();
  }

  private async handleNextBattle() {
    await guild.joinGuildBattleAttack();
    await guild.joinGuildBattleDefence();
  }

  private async handleTemple() {
    await request.getGuildCompetitionTournamentReward();

    // await request.claimGuildCompetitionTournamentReward();
  }
}
