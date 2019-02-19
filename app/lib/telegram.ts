import { camelCase, flatten, upperFirst } from 'lodash';
import * as config from 'config';
import * as moment from 'moment';
import * as numeral from 'numeral';
import Telegraf, { ContextMessageUpdate, Markup } from 'telegraf';
import * as Transport from 'winston-transport';

import BigBangEmpireBot from '..';

import log from '../lib/log';
import request from '../lib/request';

import constants from '../models/constants';
import game from '../models/game';

import { stat } from '../models/types/common';
import { optionsTelegramBot } from '../models/types/options';
import { messageFlag } from '../models/mailbox/message';
import Item from '../models/inventory/item';
import Inventory from '../models/inventory';

class TelegramBot {
  readonly bot: Telegraf<ContextMessageUpdate>;
  private bbe: BigBangEmpireBot;

  private users: number[] = [];

  constructor(private options: optionsTelegramBot = config.get('telegram')) {
    // @ts-ignore
    if (this.options.has('self')) {
      this.users.push(this.options.self);
    }

    this.bot = new Telegraf(this.options.token);

    this.startTelegram();
    this.initRoutes();
  }

  setBBE(bbe: BigBangEmpireBot) {
    this.bbe = bbe;
  }

  stop() {
    this.bot.stop();
  }

  async startTelegram() {
    // @ts-ignore
    if (this.options.has('port') && this.options.has('baseurl')) {
      await this.bot.telegram.setWebhook(`${this.options.baseurl}/telegram`);
      this.bot.startWebhook('/telegram', null, this.options.port);
    } else {
      await this.bot.telegram.deleteWebhook();
      this.bot.startPolling();
    }
  }

  initRoutes() {
    this.bot.use(async ({ reply }: ContextMessageUpdate, next) => {
      if (typeof game.character === 'undefined') {
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
    this.initRouteClose();
    this.initRouteHelp();
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
      const messageArr = [game.character.name];
      messageArr.push(`- lvl ${game.character.level} (${numeral(this.bbe.characterLevelPercentage).format('0%')}) (${numeral(this.bbe.rank.character.level).format('0o')})`);
      messageArr.push(`- ${numeral(game.character.gameCurrency).format('0a')} coins`);
      messageArr.push(`- ${numeral(game.user.premiumCurrency).format('0,0')} gems`);
      messageArr.push(`- ${numeral(game.character.honor).format('0a')} honor (${numeral(this.bbe.rank.character.honor).format('0o')})`);
      messageArr.push(`- ${numeral(game.character.fans).format('0a')} fans (${numeral(this.bbe.rank.character.fans).format('0o')})`);

      if (this.bbe.rank.movieTournament) {
        messageArr.push(`- movie tournament: ${numeral(this.bbe.rank.movieTournament).format('0o')}`);
      }

      messageArr.push('--------------------');
      messageArr.push(`- energy: ${game.character.questEnergy} + ${200 - game.character.questEnergyRefillAmountToday} (${this.bbe.quest.remainingTime})`);
      messageArr.push(`- stamina: ${game.character.duelStamina} / ${game.character.maxDuelStamina} (${game.character.duelStaminaCost})`);
      messageArr.push(`- dating: ${numeral(this.bbe.datingStepPercentage).format('0%')}`);

      if (this.bbe.quest.storyDungeon) {
        messageArr.push(`- story dungeon in ${moment.duration(this.bbe.quest.storyDungeon.tsLastAttack.diff(moment())).humanize()}`);
      }

      if (game.movie) {
        messageArr.push('--------------------');
        messageArr.push(`- movie: ${numeral(game.movie.energy / game.movie.neededEnergy).format('0%')}`);
        messageArr.push(`- movie energy: ${game.character.movieEnergy}`);
      }

      if (game.guild) {
        messageArr.push('--------------------');
        messageArr.push(`- ${numeral(game.guild.honor).format('0a')} glory (${numeral(this.bbe.rank.guild.glory).format('0o')})`);
        messageArr.push(`- ${numeral(game.guild.statTotal / constants.guildPercentageTotalBase).format('0%')} expansion (${numeral(this.bbe.rank.guild.expansion).format('0o')})`);
        messageArr.push(`- ${numeral(game.guild.fans).format('0a')} fans (${numeral(this.bbe.rank.guild.fans).format('0o')})`);

        if (this.bbe.rank.temple) {
          messageArr.push(`- temple: ${numeral(this.bbe.rank.temple).format('0o')}`);
        }
      }

      await reply(messageArr.join('\n'));
    });
  }

  initRouteStats() {
    const handleStats = async ({ reply }: ContextMessageUpdate) => {
      const messsageArr = [];
      messsageArr.push(`${game.character.name} (${game.character.statPointsAvailable} points):`);
      messsageArr.push(`- Stamina: ${game.character.statBaseStamina} (${game.character.statTotalStamina})`);
      messsageArr.push(`- Strength: ${game.character.statBaseStrength} (${game.character.statTotalStrength})`);
      messsageArr.push(`- CriticalRating: ${game.character.statBaseCriticalRating} (${game.character.statTotalCriticalRating})`);
      messsageArr.push(`- DodgeRating: ${game.character.statBaseDodgeRating} (${game.character.statTotalDodgeRating})`);
      messsageArr.push(`- Weapon: ${game.character.statWeaponDamage}`);

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

      if (game.character.statPointsAvailable < value) {
        return context.reply('You can\'t add stats: no points available');
      }

      await request.improveCharacterStat(statName, value);

      await handleStats(context);
    });
  }

  initRouteMailbox() {
    this.bot.command('messages', async ({ reply }: ContextMessageUpdate) => {
      const messages = await request.getMessageList();

      const messageArr = [];
      messageArr.push(`You have ${game.newMessages} new message[s]`);

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

      const message = await request.getMessage(messageId as number);

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
          log.error(`Unhandled message flag: ${message.flag} - ${message.flagValue}`);
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

      await request.deleteMessage(messageId);

      await context.reply('Message deleted');
    });
  }

  initRouteItems() {
    // @ts-ignore
    this.bot.action(/items:buy:(?<itemId>\d+):(?<targetSlot>\d+)/, async (context: ContextMessageUpdate) => {
      // @ts-ignore
      const { groups: { itemId, targetSlot } } = context.match;

      await request.buyShopItem(parseInt(itemId, 10), parseInt(targetSlot, 10));

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

  private initRouteClose() {
    this.bot.command('close', async ({ reply }: ContextMessageUpdate) => {
      this.bbe.close();

      await reply('Closing...');
    });

    this.bot.command('restart', async ({ reply }: ContextMessageUpdate) => {
      this.bbe.restart();

      await reply('Restarting...');
    });
  }

  private initRouteHelp() {
    this.bot.command('help', async ({ reply }: ContextMessageUpdate) => {
      await reply(`
From here you can control your Big Bang Empire Bot.

Commands are:

/help - View this help message

/profile - Print info about your hero
/stats - View (and manage) your character's stats
/messages - View the messages

/restart - Restarts the game (if something bad happened)
/close - Shout down the game (enough?)
`);
    });
  }
}

const bot = new TelegramBot();

export class TelegramBotLogger extends Transport {
  static LOG_LEVELS = {
    error: '☠️️',
    warn: '⚠️️',
    info: '️️ℹ️',
    verbose: '💬',
    debug: '🐞',
    silly: '👻',
  };

  async log(info, callback) {
    setImmediate(() => this.emit('logged', info));

    await bot.broadcastMessage(`${TelegramBotLogger.LOG_LEVELS[info.level]} ${info.message}`);

    callback();
  }
}

export default bot;
