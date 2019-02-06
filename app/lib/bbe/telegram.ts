import * as config from 'config';
import Telegraf, { ContextMessageUpdate } from 'telegraf';

import BigBangEmpireBot from '.';

import { optionsTelegramBot } from './game/types/options';

export default class TelegramBot {
  private bot: Telegraf<ContextMessageUpdate>;
  private users: number[] = [];

  constructor(private bbe: BigBangEmpireBot, private options: optionsTelegramBot = config.get('telegram')) {
    this.bot = new Telegraf(this.options.token);
    this.bot.startPolling();

    this.initRoutes();
  }

  initRoutes() {
    this.initRouteStart();
    this.initRouteProfile();
  }

  initRouteStart() {
    this.bot.start(async ({ reply, from }: ContextMessageUpdate) => {
      if (!this.users.includes(from.id)) {
        this.users.push(from.id);
      }

      await reply(`Hey, welcome back to BigBangEmpire ${from.username}`);
    });
  }

  initRouteProfile() {
    this.bot.command('profile', async ({ reply }: ContextMessageUpdate) => {
      const messageArr = [this.bbe.game.character.name];
      messageArr.push(`- lvl ${this.bbe.game.character.level} (0%) (${this.bbe.rank.character.level}°)`);
      messageArr.push(`- ${this.bbe.game.character.gameCurrency} coins`);
      messageArr.push(`- ${this.bbe.game.user.premiumCurrency} gems`);
      messageArr.push(`- ${this.bbe.game.character.honor} honor (${this.bbe.rank.character.honor}°)`);
      messageArr.push(`- ${this.bbe.game.character.fans} fans (${this.bbe.rank.character.fans}°)`);
      messageArr.push('--------------------');
      messageArr.push(`- energy: ${this.bbe.game.character.questEnergy} + ${200 - this.bbe.game.character.questEnergyRefillAmountToday} (questCompletion)`);
      messageArr.push(`- stamina: ${this.bbe.game.character.duelStamina} / ${this.bbe.game.character.maxDuelStamina} (${this.bbe.game.character.duelStaminaCost})`);

      if (this.bbe.game.movie) {
        messageArr.push('--------------------');
        // messageArr.push(`- movie: ${this.bbe.game.movie.energy / this.bbe.game.movie.neededEnergy}`);
        messageArr.push(`- movie energy: ${this.bbe.game.character.movieEnergy}`);
      }

      await reply(messageArr.join('\n'));
    });
  }
}
