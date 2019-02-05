import * as config from 'config';
import Telegraf, { ContextMessageUpdate } from 'telegraf';

import { optionsTelegramBot } from './game/types/options';

export default class TelegramBot {
  private bot: Telegraf<ContextMessageUpdate>;
  private users: number[] = [];

  constructor(private options: optionsTelegramBot = config.get('telegram')) {
    this.bot = new Telegraf(this.options.token);
    this.bot.startPolling();

    this.initRoutes();
  }

  initRoutes() {
    this.bot.start(async ({ reply, from }: ContextMessageUpdate) => {
      if (!this.users.includes(from.id)) {
        this.users.push(from.id);
      }

      await reply(`Hey, welcome back to BigBangEmpire ${from.username}`);
    });
  }
}
