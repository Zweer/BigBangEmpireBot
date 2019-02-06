import * as config from 'config';
import * as numeral from 'numeral';
import Telegraf, { ContextMessageUpdate } from 'telegraf';
import * as Transport from 'winston-transport';

import BigBangEmpireBot from '.';

import { optionsTelegramBot } from './game/types/options';

export class TelegramBotLogger extends Transport {
  private bot: TelegramBot;

  static LOG_LEVELS = {
    error: '☠️️',
    warn: '⚠️️',
    info: 'ℹ️️',
    verbose: '💬',
    debug: '🐞',
    silly: '👻',
  };

  constructor(options) {
    super(options);

    this.bot = options.bot;
  }

  async log(info, callback) {
    setImmediate(() => this.emit('logged', info));

    await this.bot.broadcast(`${TelegramBotLogger.LOG_LEVELS[info.level]} ${info.message}`);

    callback();
  }
}

export default class TelegramBot {
  private bot: Telegraf<ContextMessageUpdate>;
  private users: number[] = [];

  constructor(private bbe: BigBangEmpireBot, private options: optionsTelegramBot = config.get('telegram')) {
    // @ts-ignore
    if (this.options.has('self')) {
      this.users.push(this.options.self);
    }

    this.bot = new Telegraf(this.options.token);
    this.bot.startPolling();

    this.initRoutes();
  }

  initRoutes() {
    this.bot.use(async ({ reply }: ContextMessageUpdate, next) => {
      if (typeof this.bbe.game === 'undefined') {
        await reply('BBE not yet initialized. Please retry in seconds');

        return;
      }

      next();
    });

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
      messageArr.push(`- lvl ${this.bbe.game.character.level} (${numeral(this.bbe.levelPerc).format('0%')}) (${numeral(this.bbe.rank.character.level).format('0o')})`);
      messageArr.push(`- ${numeral(this.bbe.game.character.gameCurrency).format('0,0')} coins`);
      messageArr.push(`- ${numeral(this.bbe.game.user.premiumCurrency).format('0,0')} gems`);
      messageArr.push(`- ${numeral(this.bbe.game.character.honor).format('0a')} honor (${numeral(this.bbe.rank.character.honor).format('0o')})`);
      messageArr.push(`- ${numeral(this.bbe.game.character.fans).format('0a')} fans (${numeral(this.bbe.rank.character.fans).format('0o')})`);
      messageArr.push('--------------------');
      messageArr.push(`- energy: ${this.bbe.game.character.questEnergy} + ${200 - this.bbe.game.character.questEnergyRefillAmountToday} (${this.bbe.questRemaining})`);
      messageArr.push(`- stamina: ${this.bbe.game.character.duelStamina} / ${this.bbe.game.character.maxDuelStamina} (${this.bbe.game.character.duelStaminaCost})`);

      if (this.bbe.game.movie) {
        messageArr.push('--------------------');
        // messageArr.push(`- movie: ${this.bbe.game.movie.energy / this.bbe.game.movie.neededEnergy}`);
        messageArr.push(`- movie energy: ${this.bbe.game.character.movieEnergy}`);
      }

      await reply(messageArr.join('\n'));
    });
  }

  async broadcast(message) {
    await Promise.all(this.users.map(async user => this.bot.telegram.sendMessage(user, message)));
  }
}
