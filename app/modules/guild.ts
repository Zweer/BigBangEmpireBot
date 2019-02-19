import game from '../models/game';

import request from '../lib/request';

import AbstractModule from '.';

export default class GuildModule extends AbstractModule {
  get newGuildLogEntries() {
    return game.newGuildLogEntries;
  }

  async handle(): Promise<void> {
    await this.handleGuildMessages();

    await this.handleCurrentBattle();
    await this.handleNextBattle();

    await this.handleTemple();
  }

  private async handleGuildMessages() {
    if (this.newGuildLogEntries) {
      const guildMessages = await request.getGuildLog();

      guildMessages.forEach(guildMessage => this.log.info(`👥 ${guildMessage}`));
    }
  }

  private async handleCurrentBattle() {
    // TODO: add if the battle was won or lost
    if (game.character.finishedGuildBattleAttackId) {
      await request.claimGuildBattleReward(game.character.finishedGuildBattleAttackId);
    }

    if (game.character.finishedGuildBattleDefenseId) {
      await request.claimGuildBattleReward(game.character.finishedGuildBattleDefenseId);
    }
  }

  private async handleNextBattle() {
    if (game.guild.pendingGuildBattleAttackId && !game.pendingGuildBattleAttack) {
      await request.joinGuildBattle(true);
    }

    if (game.guild.pendingGuildBattleDefenseId && !game.pendingGuildBattleDefense) {
      await request.joinGuildBattle(false);
    }
  }

  private async handleTemple() {
    await request.getGuildCompetitionTournamentReward();

    // await request.claimGuildCompetitionTournamentReward();
  }
}
