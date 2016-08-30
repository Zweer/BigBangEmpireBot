'use strict';

const _ = require('lodash');
const uuid = require('node-uuid');
const crypto = require('crypto');
const moment = require('moment');
const numeral = require('numeral');
const request = require('request-promise');

class BigBangEmpire {
  constructor(options) {
    this.options = options;
    this.requestDataUrl = 'http://www.bigbangempire.com/platform/requestData.php';
    this.locale = 'en_US';
    this.client_version = 'flash_40';
    this.user_session_id = 0;
    this.user_id = 0;

    this.QUEST_TYPES = {
      1: 'time',
      2: 'fight',
      3: 'stat',
    };

    this.canDuel = true;

    this.log('Init started');
    this.initGame()
      .then(() => { this.log('Init complete'); })
      .then(() => this.initSyncGame())
      .catch((err) => {
        this.log(err);
      });
  }

  log(msg, what) {
    const time = moment().format('HH:mm:ss');
    const msgWhat = what ? ` - [${what}]` : '';

    if (typeof msg !== 'string') {
      console.log(msg);

      return;
    }

    console.log(`${time}${msgWhat} - ${msg}`);
  }

  makeAction(action, form = {}) {
    _.defaults(form, {
      user_id: this.user_id,
      rct: 1,
      action,
      client_version: this.client_version,
      user_session_id: this.user_session_id,
      auth: crypto.createHash('md5').update(uuid.v4()).digest('hex'),
    });

    return request.post({
      url: this.urlRequestServer,
      json: true,
      form,
    });
  }

  initGame() {
    return request
      .post({
        url: this.requestDataUrl,
        json: true,
        form: {
          locale: this.locale,
          server_id: '',
          user_id: 0,
          auth: crypto.createHash('md5').update(uuid.v4()).digest('hex'),
          client_version: '',
          platform: this.options.platform,
          user_session_id: 0,
          rct: 1,
        },
      })
      .then((data) => {
        this.urlCDN = data.data.urlCDN;
        this.urlCDNGetImage = data.data.urlCDNGetImage;
        this.urlRequestServer = data.data.urlRequestServer;
        this.urlSocketServer = data.data.urlSocketServer;
        this.server_id = data.data.server_id;
        this.localeVersion = data.data.localeVersion;
        this.registrationSource = data.data.registrationSource;

        return this.makeAction('initFriendBar');
      })
      .then(() => this.makeAction('initGame', {
        locale_version: this.localeVersion,
        locale: this.locale,
        swf_character_hash: '',
        no_text: true,
        swf_ui_hash: '',
        swf_main_hash: '',
      }))
      .then((data) => {
        this.gameInfo = data.data;

        return this.makeAction('loginUserSSO', {
          platform: this.options.platform,
          platform_user_id: this.options.platform_user_id,
          steam_access_token: this.options.steam_access_token,
        });
      })
      .then((data) => {
        this.userInfo = data.data;

        if (typeof this.userInfo.user === 'undefined') {
          this.log('Invalid credentials');

          process.exit(1);
        }

        this.user_session_id = this.userInfo.user.session_id;
        this.user_id = this.userInfo.user.id;

        this.character_id = this.userInfo.character.id;
        this.guild_id = this.userInfo.character.guild_id;

        return this.makeAction('loginFriendBar', {
          platform: this.options.platform,
          existing_user_id: this.user_id,
          existing_session_id: this.user_session_id,
        });
      })
      .then((data) => {
        this.friends = data.data.friend_data;

        return this.makeAction('updateGameSession', {
          connection_type: 2,
        });
      });
  }

  initSyncGame() {
    return this.makeAction('syncGame')
      .then((data) => {
        this.handleSyncGame(data.data);

        setTimeout(this.initSyncGame.bind(this), this.options.delaySyncGame);
      });
  }

  handleSyncGame(data) {
    _.merge(this.userInfo, data);

    return Promise.all([])
      // .then(() => { this.log('sync'); })
      .then(() => this.handleInventory())
      .then(() => this.handleCurrentQuest())
      .then(() => this.handleCurrentMovieQuest())
      .then(() => this.handleMovieVotes())
      .then(() => this.handleBuyEnergy())
      .then(() => this.handleQuest())
      .then(() => this.handleDuel())
      .then(() => this.handleMissedDuels())
      .then(() => this.handleMovieRefresh())
      .then(() => this.handleMovieChoice())
      .then(() => this.handleMovie())
      .then(() => this.handleMovieStar())
      .then(() => this.handleWork())

      .then(() => this.retrieveRanking())
      // .then(() => { this.log('completed'); })
      .catch((err) => {
        this.log(err);
      });
  }

  handleInventory() {
    if (this.userInfo.inventory.missiles_item_id === 0) {
      this.canDuel = false;
      this.log('NO MORE MISSILES!!!!!!!');
    }

    let inventoryFull = true;
    _.forIn(this.userInfo.inventory, (value, key) => {
      if (key.substr(0, 8) === 'bag_item' && value === 0) {
        inventoryFull = false;
      }
    });

    if (inventoryFull) {
      this.canDuel = false;
      this.log('INVENTORY FULL!!!!!!!');
    }
  }

  handleCurrentQuest() {
    return this.makeAction('checkForQuestComplete')
      .then((dataComplete) => {
        if (
          (dataComplete.data.quest && dataComplete.data.quest.status === 4)
          ||
          dataComplete.error === 'errFinishInvalidStatus'
          ) {
          return this.makeAction('claimQuestRewards', {
            discard_item: false,
            create_new: true,
          })
            .then((data) => {
              _.assign(this.userInfo.user, data.data.user);
              _.assign(this.userInfo.character, data.data.character);
              _.assign(this.userInfo.inventory, data.data.inventory);
              _.assign(this.userInfo.story_dungeon, data.data.story_dungeon);
              _.assign(this.userInfo.current_goal_values, data.data.current_goal_values);
              this.userInfo.quests = data.data.quests;
            });
        }

        return true;
      });
  }

  handleCurrentMovieQuest() {
    if (!this.userInfo.movie) {
      return true;
    }

    return this.makeAction('claimMovieQuestRewards')
      .then((data) => {
        if (data.error) {
          return true;
        }

        _.assign(this.userInfo.character, data.data.character);
        _.assign(this.userInfo.movie, data.data.movie);
        _.assign(this.userInfo.inventory, data.data.inventory);

        this.userInfo.movie_quests = data.data.movie_quests;

        return true;
      });
  }

  handleMovieVotes() {
    if (this.userInfo.character.movie_votes !== 0) {
      return this.makeAction('getMoviesToVote', {
        refresh: false,
      })
        .then((data) => {
          _.assign(this.userInfo.user, data.data.user);
          _.assign(this.userInfo.character, data.data.character);

          const movies = data.data.movies_to_vote;

          this.log(`Voting movie ${movies[0].id}`);

          return this.makeAction('voteForMovie', {
            discard_item: false,
            movie_id: movies[0].id,
          });
        })
        .then((data) => {
          _.assign(this.userInfo.user, data.data.user);
          _.assign(this.userInfo.character, data.data.character);
          _.assign(this.userInfo.inventory, data.data.inventory);
          _.assign(this.userInfo.current_goal_values, data.data.current_goal_values);
        });
    }

    return true;
  }

  handleBuyEnergy() {
    if (
      this.userInfo.character.quest_energy_refill_amount_today < 200
      &&
      this.userInfo.character.quest_energy + 50 < this.userInfo.character.max_quest_energy
    ) {
      return this.makeAction('buyQuestEnergy', {
        use_premium: false,
      })
        .then((data) => {
          _.assign(this.userInfo.character, data.data.character);
          _.assign(this.userInfo.current_goal_values, data.data.current_goal_values);

          return true;
        });
    }

    return true;
  }

  handleQuest() {
    if (this.userInfo.character.active_quest_id || this.userInfo.character.quest_energy === 0) {
      return true;
    }

    this.log(`You have quest energy: ${this.userInfo.character.quest_energy}`);

    let quest;

    const quests = this.userInfo.quests.sort((a, b) => {
      if (typeof a.rewards === 'string') {
        a.rewards = JSON.parse(a.rewards); // eslint-disable-line no-param-reassign
      }

      if (typeof b.rewards === 'string') {
        b.rewards = JSON.parse(b.rewards); // eslint-disable-line no-param-reassign
      }

      if (a.rewards.story_dungeon_point !== b.rewards.story_dungeon_point) {
        return a.rewards.story_dungeon_point > b.rewards.story_dungeon_point ? -1 : 1;
      }

      if (a.rewards.item !== 0) {
        return -1;
      }

      if (b.rewards.item !== 0) {
        return 1;
      }

      return (a.rewards.xp / a.energy_cost) > (b.rewards.xp / b.energy_cost) ? -1 : 1;
    });

    quests.every((tmpQuest) => {
      if (tmpQuest.energy_cost <= this.userInfo.character.quest_energy) {
        quest = tmpQuest;

        return false;
      }

      return true;
    });

    if (quest) {
      return this.makeQuest(quest);
    }

    return true;
  }

  makeQuest(quest) {
    let startingString = 'Starting a quest\n';
    startingString += `- ${Math.round(quest.rewards.xp / quest.energy_cost)} xp/energy`;

    if (quest.rewards.story_dungeon_point) {
      startingString += '\n- with a "story dungeon point"';
    }

    if (quest.rewards.item) {
      startingString += '\n- with an item';
    }

    this.log(startingString);

    return this.makeAction('startQuest', {
      quest_id: quest.id,
    })
      .then((data) => {
        if (data.error) {
          this.log(data.error);

          return data;
        }

        _.assign(this.userInfo.character, data.data.character);

        return data;
      });
  }

  handleDuel() {
    if (this.userInfo.character.duel_stamina < this.userInfo.character.duel_stamina_cost
        &&
        this.canDuel) {
      return true;
    }

    this.log(`You have enough duel stamina: ${this.userInfo.character.duel_stamina}`);

    return this.makeAction('getDuelOpponents')
      .then((data) => {
        const character = data.data.character;
        const opponents = data.data.opponents.sort((a, b) => a.honor < b.honor);

        const myTotal = character.stat_total_stamina +
          character.stat_total_strength +
          character.stat_total_critical_rating +
          character.stat_total_dodge_rating;

        let opponent;

        opponents.every((tmpOpponent) => {
          if (myTotal > tmpOpponent.total_stats) {
            opponent = tmpOpponent;

            return false;
          }

          return true;
        });

        if (!opponent) {
          opponent = opponents.pop();
        }

        if (opponent) {
          return this.makeDuel(opponent);
        }

        return true;
      });
  }

  makeDuel(opponent) {
    this.log(`Starting a duel with ${opponent.name}`);

    return this.makeAction('startDuel', {
      character_id: opponent.id,
      use_premium: false,
    })
      .then((data) => {
        if (data.error === 'errStartDuelActiveDuelFound') {
          return this.makeAction('checkForDuelComplete')
            .then(() => this.makeAction('claimDuelRewards', {
              discard_item: false,
            }))
            .then(() => this.makeDuel(opponent))
            .then(() => {
              throw new Error('Just kidding');
            });
        }

        return data;
      })
      .then((data) => {
        const reward = JSON.parse(data.data.duel.character_a_rewards);
        const wonOrLost = data.data.battle.winner === 'a' ? 'won' : 'lost';
        let addendum = '';

        if (reward.premium) {
          addendum += `, ${reward.premium} gems`;
        }

        if (reward.item) {
          addendum += `, ${reward.item} item`;
        }

        this.log(`You ${wonOrLost} the duel! ${
          numeral(reward.honor).format('+0')} honor${addendum}`);

        _.assign(this.userInfo.user, data.data.user);
        _.assign(this.userInfo.character, data.data.character);
        _.assign(this.userInfo.current_goal_values, data.data.current_goal_values);

        return this.makeAction('checkForDuelComplete');
      })
      .then(() => this.makeAction('claimDuelRewards', {
        discard_item: false,
      }))
      .then((data) => {
        _.assign(this.userInfo.user, data.data.user);
        _.assign(this.userInfo.character, data.data.character);
        _.assign(this.userInfo.inventory, data.data.inventory);
        _.assign(this.userInfo.current_goal_values, data.data.current_goal_values);

        return true;
      });
  }

  handleMissedDuels() {
    if (this.userInfo.missed_duels === 0) {
      return true;
    }

    const duels = this.userInfo.missed_duels === 1 ? 'duel' : 'duels';
    this.log(`You have missed ${this.userInfo.missed_duels} ${duels}`);

    return this.makeAction('getMissedDuelsNew', {
      history: false,
    })
      .then((data) => {
        data.data.missed_duel_data.forEach((duel) => {
          const wonOrLost = duel.winner === 'a' ? 'lost' : 'won';

          // eslint-disable-next-line no-param-reassign
          duel.character_b_rewards = JSON.parse(duel.character_b_rewards);
          this.log(`Missed duel: ${wonOrLost}, ${duel.character_b_rewards.honor} honor`);
        });

        _.assign(this.userInfo.user, data.data.user);
        _.assign(this.userInfo.character, data.data.character);

        return this.makeAction('claimMissedDuelsRewards');
      });
  }

  handleMovieRefresh() {
    if (typeof this.userInfo.movie !== 'undefined') {
      return true;
    }

    return this.makeAction('refreshMoviePool', {
      use_premium: false,
    })
      .then((data) => {
        _.assign(this.userInfo.character, data.data.character);
        _.assign(this.userInfo.movies, data.data.movies);
      });
  }

  handleMovieChoice() {
    if (typeof this.userInfo.movies === 'undefined') {
      return true;
    }

    this.log('Choosing the next movie');

    const movies = this.userInfo.movies.sort((a, b) => {
      if (a.fans > b.fans) {
        return -1;
      }

      return 1;
    });

    return this.makeAction('startMovie', {
      movie_id: movies[0].id,
    })
      .then((data) => {
        _.assign(this.userInfo.character, data.data.character);
        _.assign(this.userInfo.movie, data.data.movie);
        _.assign(this.userInfo.movie_quests, data.data.movie_quests);

        delete this.userInfo.movies;

        return true;
      });
  }

  handleMovie() {
    if (!this.userInfo.movie || !this.userInfo.movie_quests) {
      return true;
    }

    let quest;

    this.userInfo.movie_quests.every((tmpQuest) => {
      if (typeof tmpQuest.rewards === 'string') {
        tmpQuest.rewards = JSON.parse(tmpQuest.rewards); // eslint-disable-line no-param-reassign
      }

      if (tmpQuest.type === 3) {
        quest = tmpQuest;

        return false;
      }

      return true;
    });

    if (quest && this.userInfo.character.movie_energy >= quest.energy_cost) {
      return this.makeMovieQuest(quest);
    }

    return true;
  }

  makeMovieQuest(quest) {
    this.log(`Starting a movie quest: ${quest.rewards.movie_progress} reward`);

    this.makeAction('startMovieQuest', {
      movie_quest_id: quest.id,
    });
  }

  handleMovieStar() {
    if (!this.userInfo.movie) {
      return true;
    }

    const needed = this.userInfo.movie.needed_energy;
    const energy = this.userInfo.movie.energy;
    const claimed = this.userInfo.movie.claimed_stars;

    if (energy * 10 >= needed && claimed < 1) {
      return this.makeMovieStar();
    }

    if (energy * 2.5 >= needed && claimed < 2) {
      return this.makeMovieStar();
    }

    if (energy >= needed && claimed < 3) {
      return this.makeMovieStar()
        .then(() => this.makeAction('finishMovie'))
        .then((data) => {
          this.log('Movie finished');

          _.assign(this.userInfo.user, data.data.user);
          _.assign(this.userInfo.character, data.data.character);
          _.assign(this.userInfo.guild, data.data.guild);
          _.assign(this.userInfo.current_goal_values, data.data.current_goal_values);

          delete this.userInfo.movie;
          delete this.userInfo.movie_quests;

          return true;
        });
    }

    return true;
  }

  makeMovieStar() {
    return this.makeAction('claimMovieStar', {
      discard_item: false,
    })
      .then((data) => {
        _.assign(this.userInfo.character, data.data.character);
        _.assign(this.userInfo.inventory, data.data.inventory);
        _.assign(this.userInfo.movie, data.data.movie);

        return true;
      });
  }

  handleWork() {
    const lastWork = this.userInfo.character.ts_last_work_collection;
    const now = Math.round(new Date().getTime() / 1000);
    const diff = now - lastWork;

    if (diff > 60 * 60 * 3) {
      return this.makeAction('collectWork')
        .then((data) => {
          _.assign(this.userInfo.character, data.data.character);
          _.assign(this.userInfo.current_goal_values, data.data.current_goal_values);

          return true;
        });
    }

    return true;
  }

  retrieveRanking() {
    return this.makeAction('retrieveLeaderboard', {
      sort_type: 1,
    })
      .then((data) => {
        this.rankHonor = data.data.centered_rank;

        return this.makeAction('retrieveLeaderboard', {
          sort_type: 2,
        });
      })
      .then((data) => {
        this.rankLevel = data.data.centered_rank;

        return this.makeAction('retrieveLeaderboard', {
          sort_type: 3,
        });
      })
      .then((data) => {
        this.rankFans = data.data.centered_rank;
      });
  }
}

module.exports = BigBangEmpire;
