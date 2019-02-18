import AbstractModule from '.';

export default class GuildModule extends AbstractModule {
  get newGuildLogEntries() {
    return this.game.newGuildLogEntries;
  }

  async handle(): Promise<void> {
    await this.handleGuildMessages();

    await this.handleCurrentBattle();
    await this.handleNextBattle();

    await this.handleTemple();
  }

  private async handleGuildMessages() {
    if (this.newGuildLogEntries) {
      const guildMessages = await this.request.getGuildLog();

      guildMessages.forEach(guildMessage => this.log.info(`👥 ${guildMessage}`));
    }
  }

  private async handleCurrentBattle() {
    // TODO: add if the battle was won or lost
    if (this.game.character.finishedGuildBattleAttackId) {
      await this.request.claimGuildBattleReward(this.game.character.finishedGuildBattleAttackId);
    }

    if (this.game.character.finishedGuildBattleDefenseId) {
      await this.request.claimGuildBattleReward(this.game.character.finishedGuildBattleDefenseId);
    }
  }

  private async handleNextBattle() {
    if (this.game.guild.pendingGuildBattleAttackId && !this.game.pendingGuildBattleAttack) {
      await this.request.joinGuildBattle(true);
    }

    if (this.game.guild.pendingGuildBattleDefenseId && !this.game.pendingGuildBattleDefense) {
      await this.request.joinGuildBattle(false);
    }
  }

  private async handleTemple() {
    await this.request.getGuildCompetitionTournamentReward();

    // await this.request.claimGuildCompetitionTournamentReward();
  }
}
