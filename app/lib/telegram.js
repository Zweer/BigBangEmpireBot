'use strict';

const numeral = require('numeral');
const TelegramBot = require('node-telegram-bot-api');

class BigBangEmpireTelegram {
  constructor(options, bbe) {
    this.bot = new TelegramBot(options.id, options.options);
    this.bbe = bbe;

    this.initRoutes();
  }

  initRoutes() {
    this.routeStart();
    this.routeInfo();
  }

  routeStart() {
    this.bot.onText(/^\/start\s?(.*)?$/, (msg, match) => {
      const chatId = msg.chat.id;
      const password = match[1];

      if (typeof password === 'undefined') {
        this.bot.sendMessage(chatId, 'You need to specity a password!');

        return;
      }

      if (password !== 'pippo') {
        this.bot.sendMessage(chatId, 'Ops, wrong password');

        return;
      }

      this.bot.sendMessage(chatId, 'Yeee, right password!!');
    });
  }

  routeInfo() {
    this.bot.onText(/^\/info$/, (msg) => {
      const chatId = msg.chat.id;

      let message = `${this.bbe.userInfo.character.name}
- lvl ${this.bbe.userInfo.character.level} (${numeral(this.bbe.retrieveLevelPerc())
        .format('0%')}) (${this.bbe.rankLevel}°)
- ${numeral(this.bbe.userInfo.character.game_currency).format('$ 0,0')}
- ${this.bbe.userInfo.user.premium_currency} gems
- ${numeral(this.bbe.userInfo.character.honor).format('0,0')} honor (${this.bbe.rankHonor}°)
- ${numeral(this.bbe.userInfo.character.fans).format('0.00a')} fans (${this.bbe.rankFans}°)
--------------------
- energy: ${this.bbe.userInfo.character.quest_energy} + ${
  200 - this.bbe.userInfo.character.quest_energy_refill_amount_today}
- stamina: ${this.bbe.userInfo.character.duel_stamina} / ${
  this.bbe.userInfo.character.max_duel_stamina} (${this.bbe.userInfo.character.duel_stamina_cost})`;

      if (this.bbe.userInfo.movie) {
        message += `
--------------------
- movie: ${numeral(this.bbe.userInfo.movie.energy / this.bbe.userInfo.movie.needed_energy)
            .format('0%')}
- movie energy: ${this.bbe.userInfo.character.movie_energy}`;
      }

      this.bot.sendMessage(chatId, message);
    });
  }
}

module.exports = BigBangEmpireTelegram;

