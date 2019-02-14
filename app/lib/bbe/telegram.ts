import {camelCase, flatten, upperFirst} from 'lodash';
import * as config from 'config';
import * as numeral from 'numeral';
import Telegraf, {ContextMessageUpdate, Markup} from 'telegraf';
import * as Transport from 'winston-transport';

import BigBangEmpireBot from '.';

import {stat} from './models/types/common';
import {optionsTelegramBot} from './models/types/options';
import {messageFlag} from "./models/mailbox/message";
import Item from "./models/item";
import Inventory from "./models/inventory";

export class TelegramBotLogger extends Transport {
  private bot: TelegramBot;

  static LOG_LEVELS = {
    error: '☠️️',
    warn: '⚠️️',
    info: '️️ℹ️',
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

    await this.bot.broadcastMessage(`${TelegramBotLogger.LOG_LEVELS[info.level]} ${info.message}`);

    callback();
  }
}

export default class TelegramBot {
  readonly bot: Telegraf<ContextMessageUpdate>;

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
      if (typeof this.bbe.game.character === 'undefined') {
        await reply('BBE not yet initialized. Please retry in seconds');

        return;
      }

      next();
    });

    this.initRouteStart();
    this.initRouteProfile();
    this.initRouteStats();
    this.initRouteMailbox();
    this.initRouteItems();
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
      messageArr.push(`- ${numeral(this.bbe.game.character.gameCurrency).format('0a')} coins`);
      messageArr.push(`- ${numeral(this.bbe.game.user.premiumCurrency).format('0,0')} gems`);
      messageArr.push(`- ${numeral(this.bbe.game.character.honor).format('0a')} honor (${numeral(this.bbe.rank.character.honor).format('0o')})`);
      messageArr.push(`- ${numeral(this.bbe.game.character.fans).format('0a')} fans (${numeral(this.bbe.rank.character.fans).format('0o')})`);

      if (this.bbe.rank.movieTournament) {
        messageArr.push(`- movie tournament: ${numeral(this.bbe.rank.movieTournament).format('0o')}`);
      }

      messageArr.push('--------------------');
      messageArr.push(`- energy: ${this.bbe.game.character.questEnergy} + ${200 - this.bbe.game.character.questEnergyRefillAmountToday} (${this.bbe.questRemaining})`);
      messageArr.push(`- stamina: ${this.bbe.game.character.duelStamina} / ${this.bbe.game.character.maxDuelStamina} (${this.bbe.game.character.duelStaminaCost})`);

      if (this.bbe.game.movie) {
        messageArr.push('--------------------');
        messageArr.push(`- movie: ${numeral(this.bbe.game.movie.energy / this.bbe.game.movie.neededEnergy).format('0%')}`);
        messageArr.push(`- movie energy: ${this.bbe.game.character.movieEnergy}`);
      }

      if (this.bbe.game.guild) {
        messageArr.push('--------------------');
        messageArr.push(`- ${numeral(this.bbe.game.guild.honor).format('0a')} glory (${numeral(this.bbe.rank.guild.glory).format('0o')})`);
        messageArr.push(`- ${numeral(this.bbe.game.guild.statTotal / this.bbe.constants.guildPercentageTotalBase).format('0%')} expansion (${numeral(this.bbe.rank.guild.expansion).format('0o')})`);
        messageArr.push(`- ${numeral(this.bbe.game.guild.fans).format('0a')} fans (${numeral(this.bbe.rank.guild.fans).format('0o')})`);

        if (this.bbe.rank.temple) {
          messageArr.push(`- temple: ${numeral(this.bbe.rank.movieTournament).format('0o')}`);
        }
      }

      await reply(messageArr.join('\n'));
    });
  }

  initRouteStats() {
    const handleStats = async ({ reply }: ContextMessageUpdate) => {
      const messsageArr = [];
      messsageArr.push(`${this.bbe.game.character.name} (${this.bbe.game.character.statPointsAvailable} points):`);
      messsageArr.push(`- Stamina: ${this.bbe.game.character.statBaseStamina} (${this.bbe.game.character.statTotalStamina})`);
      messsageArr.push(`- Strength: ${this.bbe.game.character.statBaseStrength} (${this.bbe.game.character.statTotalStrength})`);
      messsageArr.push(`- CriticalRating: ${this.bbe.game.character.statBaseCriticalRating} (${this.bbe.game.character.statTotalCriticalRating})`);
      messsageArr.push(`- DodgeRating: ${this.bbe.game.character.statBaseDodgeRating} (${this.bbe.game.character.statTotalDodgeRating})`);
      messsageArr.push(`- Weapon: ${this.bbe.game.character.statWeaponDamage}`);

      const extra = Markup
        .inlineKeyboard(flatten(Object.keys(stat)
          .filter(s => parseInt(s, 10))
          .map(s => [1, 10].map(i => Markup.callbackButton(`+ ${upperFirst(camelCase(stat[s]))} (${i})`, `stats:add:${s}:${i}`)))), { columns: 2 })
        // @ts-ignore
        .extra();

      await reply(messsageArr.join('\n'), extra);
    };

    this.bot.command('stats', ctx => handleStats(ctx));

    // @ts-ignore
    this.bot.action(/stats:add:(?<statNameStr>\w+):(?<valueStr>\d+)/, async (context: ContextMessageUpdate) => {
      // @ts-ignore
      const { groups: { statNameStr, valueStr } } = context.match;

      if (!stat[statNameStr]) {
        return context.reply('Invalid stat');
      }

      const statName = parseInt(statNameStr, 10);
      const value = parseInt(valueStr, 10);

      if (this.bbe.game.character.statPointsAvailable < value) {
        return context.reply('You can\'t add stats: no points available');
      }

      await this.bbe.request.improveCharacterStat(statName, value);

      await handleStats(context);
    });
  }

  initRouteMailbox() {
    this.bot.command('messages', async ({ reply }: ContextMessageUpdate) => {
      const messages = await this.bbe.request.getMessageList();

      const messageArr = [];
      messageArr.push(`You have ${this.bbe.game.newMessages} new message[s]`);

      const extra = Markup
        .inlineKeyboard(messages.map(m => Markup.callbackButton(`${m.subject} (${m.sender})`, `messages:read:${m.id}`)))
        // @ts-ignore
        .extra();

      await reply(messageArr.join('\n'), extra);
    });

    // @ts-ignore
    this.bot.action(/messages:read:(?<messageId>\d+)/, async (context: ContextMessageUpdate) => {
      // @ts-ignore
      const { groups: { messageId } } = context.match;

      const message = await this.bbe.request.getMessage(messageId as number);

      const messageArr = [];
      messageArr.push(`From: ${message.sender}`);
      messageArr.push(`Subject: ${message.subject}`);
      messageArr.push(`Date: ${message.tsCreation.format('YYYY-MM-DD HH:mm')}`);
      messageArr.push();
      messageArr.push(message.message);

      const buttons = [];

      switch (message.flag) {
        case messageFlag.NOTHING:
          buttons.push(Markup.callbackButton('Delete', `messages:delete:${messageId}`));
          buttons.push(Markup.callbackButton('Reply', `messages:reply:${messageId}`));
          break;

        case messageFlag.GUILD_INVITATION:
          buttons.push(Markup.callbackButton('Join', `guilds:join:${message.flagValue}`));
          buttons.push(Markup.callbackButton('Decline', `guilds:decline:${message.flagValue}`));
          break;

        default:
          this.bbe.log.error(`Unhandled message flag: ${message.flag} - ${message.flagValue}`);
          break;
      }

      const extra = Markup
        .inlineKeyboard(buttons, { columns: 2 })
        // @ts-ignore
        .extra();

      await context.reply(messageArr.join('\n'), extra);
    });

    // @ts-ignore
    this.bot.action(/messages:delete:(?<messageId>\d+)/, async (context: ContextMessageUpdate) => {
      // @ts-ignore
      const { groups: { messageId } } = context.match;

      await this.bbe.request.deleteMessage(messageId);

      await context.reply('Message deleted');
    });
  }

  initRouteItems() {
    // @ts-ignore
    this.bot.action(/items:buy:(?<itemId>\d+):(?<targetSlot>\d+)/, async (context: ContextMessageUpdate) => {
      // @ts-ignore
      const { groups: { itemId, targetSlot } } = context.match;

      await this.bbe.request.buyShopItem(parseInt(itemId, 10), parseInt(targetSlot, 10));

      await context.reply('Item bought!');
    });
  }

  async broadcast(mapFunction) {
    return Promise.all(this.users.map(user => mapFunction(user)));
  }

  async broadcastMessage(message: string, extra = {}) {
    return this.broadcast(user => this.bot.telegram.sendMessage(user, message, extra));
  }

  async askForItemPurchase(item: Item, messages: string[], inventory: Inventory) {
    const messageArr = [];
    messageArr.push('There\'s an interesting item in the shop:');
    messageArr.push(...messages);

    const extra = Markup
      .inlineKeyboard([Markup.callbackButton('Buy', `items:buy:${item.id}:${inventory.firstAvailableSlot}`)])
      // @ts-ignore
      .extra();

    return this.broadcastMessage(messageArr.join('\n'), extra);
  }
}
