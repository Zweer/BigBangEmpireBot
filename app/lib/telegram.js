'use strict';

const numeral = require('numeral');
const TelegramBot = require('node-telegram-bot-api');

class BigBangEmpireTelegram {
  constructor(options, bbe) {
    this.bot = new TelegramBot(options.id, options.options);
    this.bbe = bbe;

    this.bbe.bot = this;

    this.froms = [];

    this.initRoutes();
  }

  initRoutes() {
    this.routeInfo();
  }

  handleReceiver(msg) {
    const newFrom = msg.from;
    const isMissing = this.froms.every((from) => from.id !== newFrom.id);

    if (isMissing) {
      this.froms.push(newFrom);
    }
  }

  broadcastMsg(msg) {
    this.froms.forEach((from) => {
      this.bot.sendMessage(from.id, msg);
    });
  }

  routeInfo() {
    this.bot.onText(/^\/profile$/, (msg) => {
      this.handleReceiver(msg);

      const chatId = msg.chat.id;
      const questCompletion = this.bbe.retrieveQuestCompletion();

      Promise.resolve()
        .then(() => {
          let message = `${this.bbe.userInfo.character.name}
- lvl ${this.bbe.userInfo.character.level} (${numeral(this.bbe.retrieveLevelPerc())
            .format('0%')}) (${this.bbe.rankLevel}°)
- ${numeral(this.bbe.userInfo.character.game_currency).format('$ 0,0')}
- ${this.bbe.userInfo.user.premium_currency} gems
- ${numeral(this.bbe.userInfo.character.honor).format('0,0')} honor (${this.bbe.rankHonor}°)
- ${numeral(this.bbe.userInfo.character.fans).format('0.00a')} fans (${this.bbe.rankFans}°)
--------------------
- energy: ${this.bbe.userInfo.character.quest_energy} + ${
          200 - this.bbe.userInfo.character.quest_energy_refill_amount_today} ${
            questCompletion ? `(${questCompletion})` : ''}
- stamina: ${this.bbe.userInfo.character.duel_stamina} / ${
            this.bbe.userInfo.character.max_duel_stamina} (${
              this.bbe.userInfo.character.duel_stamina_cost})`;

          if (this.bbe.userInfo.movie) {
            message += `
--------------------
- movie: ${numeral(this.bbe.userInfo.movie.energy / this.bbe.userInfo.movie.needed_energy)
              .format('0%')}
- movie energy: ${this.bbe.userInfo.character.movie_energy}`;
          }

          this.bot.sendMessage(chatId, message);
        });
    });
  }
}

module.exports = BigBangEmpireTelegram;

