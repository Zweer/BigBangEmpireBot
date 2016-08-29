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
- lvl ${this.bbe.userInfo.character.level}
- ${numeral(this.bbe.userInfo.character.game_currency).format('$ 0,0')}
- ${this.bbe.userInfo.user.premium_currency} gems
- ${numeral(this.bbe.userInfo.character.honor).format('0,0')} honor
- ${numeral(this.bbe.userInfo.character.fans).format('0.00a')} fans`;

      if (this.bbe.userInfo.movie) {
        message += `\n- movie: ${
          numeral(this.bbe.userInfo.movie.energy / this.bbe.userInfo.movie.needed_energy)
            .format('0%')
        }`;
      }

      this.bot.sendMessage(chatId, message);
    });
  }
}

module.exports = BigBangEmpireTelegram;

