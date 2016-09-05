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

    this.level = 0;
    this.endQuest = 0;

    this.bot = {};

    this.QUEST_TYPES = {
      1: 'time',
      2: 'fight',
      3: 'stat',
    };

    this.ITEM_TYPES = {
      1: 'head',
      2: 'chest',
      3: 'belt',
      4: 'legs',
      5: 'boots',
      6: 'necklace',
      7: 'ring',
      8: 'piercing',
      9: 'gadget',
      10: 'missiles',
    };

    this.canDuel = true;

    this.log('Init started');
    this.initGame()
      .then(() => { this.log('Init completed'); })
      .then(() => this.firstSyncGame())
      .then(() => this.syncGame())
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
    })
      .then((data) => {
        if (data.error === '') {
          const userInfo = _.omitBy(data.data, _.isEmpty);

          _.merge(this.userInfo, userInfo);
        } else if ([
          'errFinishNotYetCompleted',
          'errClaimMovieQuestRewardsInvalidQuest',
          'errGenerateNewMoviesNotYetAllowed',
        ].indexOf(data.error) === -1) {
          throw new Error(`${data.error} @ ${action} ${JSON.stringify(form)}`);
        }

        return data;
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

  firstSyncGame() {
    // Retrieving current quest
    this.userInfo.quests.every((quest) => {
      if (quest.status === 2) {
        this.endQuest = quest.ts_complete;

        return false;
      }

      return true;
    });
  }

  syncGame() {
    return this.makeAction('syncGame')
      .then(() => {
        setTimeout(this.syncGame.bind(this), this.options.delaySyncGame);

        return Promise.all([])
        // .then(() => { this.log('sync'); })
          .then(() => this.handleNewLevel())
          .then(() => this.handleStatPointAvailable())
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
          .then(() => this.handleMessages())
          .then(() => this.handleCompletedGoals())

          .then(() => this.retrieveRanking())
          // .then(() => { this.log('completed'); })

          .catch((err) => {
            this.log(`------------------ ERROR ------------------\n${err}`);
            this.bot.broadcastMsg(`Error: ${err.message}`);
          });
      });
  }

  isOutOfGuild(character) {
    return this.userInfo.guild_members.every((member) => character.id !== member.id);
  }

  handleNewLevel() {
    if (this.level !== this.userInfo.character.level && this.level !== 0) {
      const msg = `New level: ${this.userInfo.character.level}!!`;

      this.log(msg);
      this.bot.broadcastMsg(msg);
    }

    this.level = this.userInfo.character.level;
  }

  handleCompletedGoals() {
    return Promise.all(_.values(_.mapValues(this.userInfo.current_goal_values, (goal, name) => {
      let collectedGoalValue = 0;
      this.userInfo.collected_goals.forEach((collected) => {
        if (collected[name]) {
          collectedGoalValue = parseInt(collected[name].value, 10);
        }
      });

      const value = parseInt(goal.current_value, 10);

      if (value <= collectedGoalValue) {
        return true;
      }

      const goalValues = Object.keys(this.gameInfo.constants.goals[name].values).sort((a, b) => {
        if (parseInt(a, 10) < parseInt(b, 10)) {
          return -1;
        }

        return 1;
      });

      let nextGoalValue;

      goalValues.every((goalValue) => {
        if (goalValue > collectedGoalValue) {
          nextGoalValue = goalValue;

          return false;
        }

        return true;
      });

      if (typeof nextGoalValue !== 'undefined' && value >= nextGoalValue) {
        this.log(`Completing a goal: ${name}`);

        return this.makeAction('collectGoalReward', {
          value: nextGoalValue,
          identifier: name,
          discard_item: false,
        });
      }

      return true;
    })));
  }

  handleStatPointAvailable() {
    if (this.userInfo.character.stat_points_available === 0) {
      return true;
    }

    this.log(`You have stat point available: ${this.userInfo.character.stat_points_available}`);

    return this.makeSkill();
  }

  makeSkill() {
    let stats = [
      {
        stat: this.userInfo.character.stat_total_strength,
        index: 1,
        name: 'strength',
      },
      {
        stat: this.userInfo.character.stat_total_stamina,
        index: 2,
        name: 'stamina',
      },
      {
        stat: this.userInfo.character.stat_total_critical_rating,
        index: 3,
        name: 'critical',
      },
      {
        stat: this.userInfo.character.stat_total_dodge_rating,
        index: 4,
        name: 'dodge',
      },
    ];

    stats = stats.sort((a, b) => {
      if (a.stat < b.stat) {
        return -1;
      }

      return 1;
    });

    this.log(`Adding one stat point in: ${stats[0].name}`);

    return this.makeAction('improveCharacterStat', {
      stat_type: stats[0].index,
    });
  }

  handleInventory() {
    if (this.userInfo.inventory.missiles_item_id === 0) {
      this.canDuel = false;

      const msg = 'NO MORE MISSILES!!!!!!!';

      this.log(msg);
      this.bot.broadcastMsg(msg);
    }

    let inventoryFull = true;

    Promise.all(_.values(_.mapValues(this.userInfo.inventory, (value, key) => {
      if (key.substr(0, 8) === 'bag_item') {
        if (value === 0) {
          inventoryFull = false;

          return true;
        }

        const item = _.find(this.userInfo.items, { id: value });
        if (!item) {
          return true;
        }

        const type = this.ITEM_TYPES[item.type];

        if (this.userInfo.inventory[`${type}_item_id`] === 0) {
          this.log(`Moving item: ${type}`);

          return this.makeAction('moveInventoryItem', {
            item_id: item.id,
            target_slot: item.type,
          });
        }

        const equipped = _.find(this.userInfo.items, {
          id: this.userInfo.inventory[`${type}_item_id`],
        });

        if (item.battle_skill || item.premium_item || item.type === 10) {
          return true;
        }

        const itemTotalStats = item.stat_stamina + item.stat_strength + item.stat_critical_rating +
          item.stat_dodge_rating + item.stat_weapon_damage;
        const equippedTotalStats = equipped.stat_stamina + equipped.stat_strength +
          equipped.stat_critical_rating + equipped.stat_dodge_rating + equipped.stat_weapon_damage;

        if (itemTotalStats < equippedTotalStats) {
          this.log(`Selling item: ${type}
- my: ${equippedTotalStats} - bag: ${itemTotalStats}`);

          return this.makeAction('sellInventoryItem', {
            item_id: item.id,
          })
            .then(() => {
              inventoryFull = false;
            });
        }

        if (itemTotalStats > equippedTotalStats + 15) {
          this.log(`Moving item: ${type}
- my: ${equippedTotalStats} - bag: ${itemTotalStats}`);

          return this.makeAction('moveInventoryItem', {
            item_id: item.id,
            target_slot: item.type,
          });
        }

        return true;
      }

      return true;
    })))
      .then(() => {
        if (inventoryFull) {
          this.canDuel = false;
          this.log('INVENTORY FULL!!!!!!!');
        }
      });
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
              this.endQuest = 0;

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
          const movies = data.data.movies_to_vote;

          this.log(`Voting movie ${movies[0].id}`);

          return this.makeAction('voteForMovie', {
            discard_item: false,
            movie_id: movies[0].id,
          });
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
        delete a.rewards.movie_votes; // eslint-disable-line no-param-reassign
      }

      if (typeof b.rewards === 'string') {
        b.rewards = JSON.parse(b.rewards); // eslint-disable-line no-param-reassign
        delete b.rewards.movie_votes; // eslint-disable-line no-param-reassign
      }

      if (Object.keys(a.rewards).length > 6) {
        return -1;
      }

      if (Object.keys(b.rewards).length > 6) {
        return 1;
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
    startingString += `- ${Math.round(quest.rewards.xp / quest.energy_cost)} xp/energy\n`;
    startingString += `- ${quest.energy_cost} energy`;

    const rewardKeys = Object.keys(quest.rewards);

    if (rewardKeys.length > 6) {
      rewardKeys.slice(6).forEach((reward) => {
        if (reward === 'dungeon_key') {
          this.bot.broadcastMsg(`Got a new "${reward}" in ${quest.energy_cost} minutes`);
        }

        startingString += `\n- with a "${reward}"`;
      });
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
          return data;
        }

        this.endQuest = data.data.quest.ts_complete;

        if (typeof this.userInfo.character.unused_resources === 'string') {
          this.userInfo.character.unused_resources =
            JSON.parse(this.userInfo.character.unused_resources);
        }

        if (typeof this.userInfo.character.used_resources === 'string'
          &&
          this.userInfo.character.used_resources) {
          this.userInfo.character.used_resources =
            JSON.parse(this.userInfo.character.used_resources);
        }

        if (
          this.userInfo.character.unused_resources[1] > 0
          &&
          this.userInfo.character.used_resources[1] < 4
          &&
          quest.energy_cost > 8
          ) {
          this.log('Reducing quest time');

          return this.makeAction('useResource', {
            feature_type: 1,
          });
        }

        return data;
      });
  }

  handleDuel(best) {
    if (this.userInfo.character.duel_stamina < this.userInfo.character.duel_stamina_cost
        ||
        !this.canDuel) {
      return true;
    }

    this.log(`You have enough duel stamina: ${this.userInfo.character.duel_stamina}`);

    return this.makeAction('getDuelOpponents')
      .then((data) => {
        if (!data.data.opponents) {
          this.log(data);

          throw new Error('No opponents');
        }

        const character = data.data.character;
        const opponents = data.data.opponents.sort((a, b) => a.honor < b.honor);

        const myTotal = character.stat_total_stamina +
          character.stat_total_strength +
          character.stat_total_critical_rating +
          character.stat_total_dodge_rating;

        let opponent;

        opponents.every((tmpOpponent) => {
          if (!this.isOutOfGuild(tmpOpponent)) {
            this.log(`${tmpOpponent.name} is in my guild: can't duel!`);

            return true;
          }

          if (best) {
            opponent = tmpOpponent;

            return false;
          }

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

        return this.handleDuel(true);
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

        return this.makeAction('checkForDuelComplete');
      })
      .then(() => this.makeAction('claimDuelRewards', {
        discard_item: false,
      }));
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

        return this.makeAction('claimMissedDuelsRewards');
      });
  }

  handleMovieRefresh() {
    if (this.userInfo.movie) {
      return true;
    }

    return this.makeAction('refreshMoviePool', {
      use_premium: false,
    });
  }

  handleMovieChoice() {
    if (typeof this.userInfo.movies === 'undefined') {
      return true;
    }

    const msg = 'Choosing the next movie';
    this.log(msg);
    this.bot.broadcastMsg(msg);

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
          const msg = 'Movie finished';

          this.log(msg);
          this.bot.broadcastMsg(msg);

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
    });
  }

  handleWork() {
    const lastWork = this.userInfo.character.ts_last_work_collection;
    const now = Math.round(new Date().getTime() / 1000);
    const diff = now - lastWork;

    if (diff > 60 * 60 * 3) {
      return this.makeAction('collectWork');
    }

    return true;
  }

  handleMessages() {
    if (this.userInfo.new_messages === 0) {
      return true;
    }

    const msg = `You have ${this.userInfo.new_messages} new messages (${
      this.userInfo.character.pending_resource_requests} resource requests)`;

    this.log(msg);
    this.bot.broadcastMsg(msg);

    if (this.userInfo.character.pending_resource_requests > 0) {
      this.log('Accepting all resource requests');

      return this.makeAction('acceptAllResourceRequests');
    }

    return true;
  }

  retrieveRanking() {
    return this.makeAction('retrieveLeaderboard', {
      sort_type: 1,
      character_name: this.userInfo.character.name,
    })
      .then((data) => {
        this.rankHonor = data.data.centered_rank;

        return this.makeAction('retrieveLeaderboard', {
          sort_type: 2,
          character_name: this.userInfo.character.name,
        });
      })
      .then((data) => {
        this.rankLevel = data.data.centered_rank;

        return this.makeAction('retrieveLeaderboard', {
          sort_type: 3,
          character_name: this.userInfo.character.name,
        });
      })
      .then((data) => {
        this.rankFans = data.data.centered_rank;
      });
  }

  retrieveLevelPerc() {
    const lvl = this.userInfo.character.level;
    const nextLvl = lvl + 1;

    const xp = this.userInfo.character.xp;
    const lvlXp = this.gameInfo.constants.levels[lvl].xp;
    const nextLvlXp = this.gameInfo.constants.levels[nextLvl].xp;

    const diff = xp - lvlXp;
    const diffNext = nextLvlXp - lvlXp;

    return diff / diffNext;
  }

  retrieveQuestCompletion() {
    if (this.endQuest === 0) {
      return false;
    }

    const now = Math.round(new Date().getTime() / 1000);
    const diff = this.endQuest - now;

    const minutes = Math.round(diff / 60);
    const seconds = diff % 60;

    return `${minutes} minute${minutes === 1 ? '' : 's'} ${
      seconds} second${seconds === 1 ? '' : 's'}`;
  }
}

module.exports = BigBangEmpire;
