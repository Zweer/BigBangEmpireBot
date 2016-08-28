'use strict';

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
- lvl ${this.bbe.userInfo.character.level}
- $${this.bbe.userInfo.character.game_currency}
- ${this.bbe.userInfo.user.premium_currency} gems
- ${this.bbe.userInfo.character.honor} honor
- ${this.bbe.userInfo.character.fans} fans`;

      if (this.bbe.userInfo.movie) {
        message += `\n- movie: ${
          Math.round(this.bbe.userInfo.movie.energy / this.bbe.userInfo.movie.needed)
        }%`;
      }

      this.bot.sendMessage(chatId, message);
    });
  }
}

module.exports = BigBangEmpireTelegram;

