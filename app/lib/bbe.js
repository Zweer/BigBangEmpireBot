'use strict';

const _ = require('lodash');
const crypto = require('crypto');
const moment = require('moment');
const numeral = require('numeral');
const cheerio = require('cheerio');
const request = require('request-promise');

const DEBUG_DUNGEON = false;

class BigBangEmpire {
  constructor(options = {}) {
    this.options = options;
    this.baseUrl = this.options.BASE_URL;
    this.restart = false;
    this.close = false;
    this.closeWhenNoEnergy = false;
    this.requestedResources = false;
    this.canDuel = true;
    this.alertMissiles = true;

    this.client_version = 'flash_81';
    this.user_session_id = 0;
    this.user_id = 0;
    this.userInfo = {};

    this.AUTH_SALT = 'bpHgj5214'; // MD5: action + salt + userId

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
      8: 'gadget',
      9: 'missiles',
      10: 'piercing',
    };

    this.DUNGEON_STATUS = [
      'Unknown',
      'Created',
      'Open',
      'Finished',
      'TimeUp',
      'Closed',
    ];

    this.GUILD_EVENT_TYPES = {
      0: 'Unknown',
      1: 'MemberJoined',
      2: 'MemberLeft',
      3: 'MemberKicked',
      4: 'MemberNewRank',
      5: 'MemberDonated',
      6: 'GuildStatChanged',
      7: 'DescriptionChanged',
      8: 'NoteChanged',
      9: 'EmblemChanged',
      10: 'MemberDeleted',
      11: 'MissilesRecharged',
      12: 'NameChanged',
      13: 'ArenaChanged',
      14: 'AutoJoinsRecharged',
      101: 'GuildBattle_Attack',
      102: 'GuildBattle_Defense',
      103: 'GuildBattle_JoinedAttack',
      104: 'GuildBattle_JoinedDefense',
      105: 'GuildBattle_BattleWon',
      106: 'GuildBattle_BattleLost',
      107: 'GuildBattle_ArtifactWon',
      108: 'GuildBattle_ArtifactLost',
      109: 'GuildBattle_AbortedAttack',
      110: 'GuildBattle_AbortedDefense',
      111: 'GuildBattle_PremiumCurrencyReward',
      301: 'GuildLeaderVote_Init',
      302: 'GuildLeaderVote_Finished_SameLeader',
      303: 'GuildLeaderVote_Finished_NewLeader',
    };

    /**
     * {
     * appCDNUrl: 'http://static.bigbangempire.com/',
     * appConfigPlatform: 'standalone',
     * appConfigLocale: 'en_US',
     * appConfigServerId: 'us2',
     * applicationTitle: 'Big Bang Empire',
     * urlPublic: 'http://us2.bigbangempire.com/',
     * urlRequestServer: 'http://us2.bigbangempire.com/request.php',
     * urlSocketServer: 'http://us2c-sock1.bigbangempire.com',
     * urlSwfPreloader: 'http://static.bigbangempire.com/swf/preloader.swf?fbe01a8a445bf72538a8456fe712b3dc',
     * urlSwfMain: 'http://static.bigbangempire.com/swf/main.swf?a193f2c7e2c2f1ece01d8c0609e42ade',
     * urlSwfCharacter: 'http://static.bigbangempire.com/swf/character.swf?3157e992cfb950a2f354b636a8df7db0',
     * urlSwfCharacterUSK18: '',
     * urlSwfUi: 'http://static.bigbangempire.com/swf/ui.swf?02486ce31d42b85b9594daa16cdaefd2',
     * urlCDN: 'http://static.bigbangempire.com/',
     * urlCDNGetImage: 'http://bbe-getimage.akamaized.net/',
     * urlLogo: '',
     * userId: '0',
     * userSessionId: '0',
     * testMode: 'false',
     * debugRunTests: 'false',
     * registrationSource: 'ref=;subid=;lp=;',
     * startupParams: '',
     * platform: 'standalone',
     * ssoInfo: '',
     * uniqueId: 'us21474388564',
     * server_id: 'us2',
     * default_locale: 'en_US',
     * localeVersion: '986790a2a1d494789a2877e5894f5b45',
     * blockRegistration: 'false',
     * isFriendbarSupported: 'true'
     * }
     */
    this.config = {};

    this.level = 0;
    this.endQuest = 0;
    this.rankRetrieved = 0;

    this.bot = {};

    Promise.resolve()
      .then(() => this.init())
      .then(() => this.initFriendBar())
      .then(() => this.initGame())
      .then(() => this.startGame())
      .catch((err) => {
        BigBangEmpire.log(err);
      });
  }

  /**
   * { user_id, rct, action, client_version, user_session_id, auth }
   * @param action
   * @param form
   * @param save
   * @return {Promise}
   */
  request(action, form = {}, save = true) {
    _.defaults(form, {
      user_id: this.user_id,
      rct: 1,
      action,
      client_version: this.client_version,
      user_session_id: this.user_session_id,
      auth: crypto.createHash('md5').update(action + this.AUTH_SALT + this.user_id).digest('hex'),
    });

    return request.post({
      url: this.config.urlRequestServer,
      json: true,
      form,
    })
      .then((data) => {
        if (data.error === '') {
          const userInfo = _.omitBy(data.data, (value) => _.isArray(value) && _.isEmpty(value));

          if (save) {
            _.merge(this.userInfo, userInfo);
          }
        } else if ([
          'errFinishNotYetCompleted',
          'errClaimMovieQuestRewardsInvalidQuest',
          'errFinishInvalidStatus',
          'errGenerateNewMoviesNotYetAllowed',
          'errCheckForQuestCompleteNoActiveQuest',
          'errGenerateNewMoviesLimitReached',
        ].indexOf(data.error) === -1) {
          throw new Error(`${data.error} @ ${action} ${JSON.stringify(form)}`);
        }

        return data;
      });
  }

  init() {
    BigBangEmpire.log('init started');

    return request
      .get({
        url: this.baseUrl,
        transform: (body) => cheerio.load(body),
      })
      .then(($) => {
        const jsCode = $('#flashContainer script').text();

        jsCode.split('\n').every((unformattedLine) => {
          const line = unformattedLine.trim();

          if (line === '') {
            return true;
          }

          const matchVar = line.match(/(var )?(\w+)([\s=:]+)"([^"]*)"(;|,)?/);
          if (matchVar) {
            this.config[matchVar[2]] = matchVar[4];

            return true;
          }

          return !!(line.match(/\/\//) || line.match(/var (\w+) = \{/));
        });
      });
  }

  initFriendBar() {
    BigBangEmpire.log('initFriendBar started');

    return this.request('initFriendBar', {
      client_version: 'friendbar_1',
    }, false);
  }

  initGame() {
    BigBangEmpire.log('initGame started');

    return this.request('initGame', {
      locale: this.config.appConfigLocale,
      locale_version: this.config.locale_version,
      swf_ui_hash: BigBangEmpire.getHashFromUrl(this.config.urlSwfUi),
      swf_character_hash: BigBangEmpire.getHashFromUrl(this.config.urlSwfCharacter),
      swf_main_hash: BigBangEmpire.getHashFromUrl(this.config.urlSwfMain),
      no_text: true,
    }, false)
      .then((data) => {
        this.gameInfo = data.data;
      });
  }

  startGame() {
    BigBangEmpire.log('starting the routine');

    return this.loginUser()
      .then(() => this.firstSyncGame())
      .then(() => this.syncGame());
  }

  restartGame() {
    this.restart = true;
  }

  closeGame() {
    this.close = true;
  }

  closeGameWhenNoEnergy() {
    this.closeWhenNoEnergy = true;
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

  loginUser() {
    return this.request('loginUser', {
      platform: '',
      platform_user_id: '',
      client_id: 'it11473609268',
      email: this.options.auth.email,
      password: this.options.auth.password,
    })
      .then((data) => {
        this.user_id = data.data.user.id;
        this.user_session_id = data.data.user.session_id;
      });
  }

  syncGame() {
    if (this.restart) {
      this.restart = false;

      this.userInfo = {};

      return this.startGame();
    }

    if (this.close) {
      process.exit(0);
      return true;
    }

    return this.request('syncGame', { force_sync: false })
      .then(() => {
        setTimeout(this.syncGame.bind(this), this.options.delaySyncGame);

        return Promise.all([])
        // .then(() => { BigBangEmpire.log('sync'); })
          .then(() => this.handleNewLevel())            // done
          .then(() => this.handleStatPointAvailable())  // done
          .then(() => this.handleInventoryBasic())      // done
          .then(() => this.handleInventoryAdvanced())   // done
          .then(() => this.handleCurrentQuest())        // done
          .then(() => this.handleCurrentMovieQuest())
          .then(() => this.handleMovieVotes())
          .then(() => this.handleStoryDungeonAttack())
          .then(() => this.handleBuyEnergy())
          .then(() => this.handleQuest())               // done
          // .then(() => this.handleDungeon())
          // .then(() => this.handleDungeonQuest())
          .then(() => this.handleResourceRequest())
          .then(() => this.handleDuel())
          .then(() => this.handleMissedDuels())
          .then(() => this.handleMovieRefresh())
          .then(() => this.handleMovieChoice())
          .then(() => this.handleMovie())
          .then(() => this.handleMovieStar())
          .then(() => this.handleWork())
          .then(() => this.handleMessages())
          .then(() => this.handleGuildMessages())
          .then(() => this.handleItemPattern())
          .then(() => this.handleGuildBattle())
          .then(() => this.handleCompletedGoals())

          .then(() => this.retrieveRanking())
          // .then(() => { BigBangEmpire.log('completed'); })

          .catch((err) => {
            BigBangEmpire.log(`------------------ ERROR ------------------\n${err}`);
            this.broadcastMsg(`Error: ${err.message}`, false);
          });
      });
  }

  isOutOfGuild(character) {
    return this.userInfo.guild_members.every((member) => character.id !== member.id);
  }

  get myItems() {
    const myItems = {};

    _.forEach(this.userInfo.inventory, (value, key) => {
      if (key.match(/_item_id$/)) {
        myItems[key] = this.findItem(value);
      }
    });

    return myItems;
  }

  get myBattleSkills() {
    const myBattleSkills = {};

    _.forEach(this.myItems, (value, key) => {
      if (value && value.battle_skill) {
        myBattleSkills[key] = JSON.parse(value.battle_skill);
      }
    });

    return myBattleSkills;
  }

  findItem(id) {
    return _.find(this.userInfo.items, { id });
  }

  handleNewLevel() {
    if (this.level !== this.userInfo.character.level && this.level !== 0) {
      this.broadcastMsg(`New level: ${this.userInfo.character.level}!!`);
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
        BigBangEmpire.log(`Completing a goal: ${name}`);

        return this.request('collectGoalReward', {
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

    BigBangEmpire.log(`You have stat point available: ${
      this.userInfo.character.stat_points_available}`);

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

    BigBangEmpire.log(`Adding one stat point in: ${stats[0].name}`);

    return this.request('improveCharacterStat', {
      stat_type: stats[0].index,
    });
  }

  handleInventoryBasic() {
    if (this.userInfo.inventory.missiles_item_id === 0) {
      this.canDuel = false;

      if (this.alertMissiles) {
        this.alertMissiles = false;

        this.broadcastMsg('NO MORE MISSILES!!!!!!!');
      }
    } else if (!this.canDuel) {
      this.canDuel = true;
      this.alertMissiles = true;

      this.broadcastMsg('More Missiles...');
    }

    let inventoryFull = true;

    Promise.all(_.values(_.mapValues(this.userInfo.inventory, (value, key) => {
      if (key.substr(0, 8) === 'bag_item') {
        if (value === 0) {
          inventoryFull = false;

          return false;
        }
      }

      return true;
    })));

    if (inventoryFull) {
      this.canDuel = false;

      this.broadcastMsg('INVENTORY FULL!!!!!!!');
    } else if (this.userInfo.inventory.missiles_item_id !== 0) {
      this.canDuel = true;
    }
  }

  handleInventoryAdvanced() {
    let modified = false;

    return Promise.all(_.values(_.mapValues(this.userInfo.inventory, (itemId, itemKey) => {
      if (modified) {
        return true;
      }

      if (itemKey.match(/^bag_item/) && itemId !== 0) {
        const item = this.findItem(itemId);

        if (item) {
          const type = this.ITEM_TYPES[item.type];

          if (this.userInfo.inventory[`${type}_item_id`] === 0) {
            BigBangEmpire.log(`Moving item: ${type}`);

            modified = true;

            return this.request('moveInventoryItem', {
              item_id: item.id,
              target_slot: item.type,
            });
          }

          const equipped = this.findItem(this.userInfo.inventory[`${type}_item_id`]);

          const itemTotalStats = item.stat_stamina + item.stat_strength +
            item.stat_critical_rating + item.stat_dodge_rating + item.stat_weapon_damage;
          const equippedTotalStats = equipped.stat_stamina + equipped.stat_strength +
            equipped.stat_critical_rating + equipped.stat_dodge_rating +
            equipped.stat_weapon_damage;

          if (itemTotalStats < equippedTotalStats + 10) {
            this.broadcastMsg(`Selling item: ${type}
- my: ${equippedTotalStats} 
- bag: ${itemTotalStats}`);

            return this.request('sellInventoryItem', {
              item_id: item.id,
            });
          }

          this.broadcastMsg(`New item: ${type}
- my: ${equippedTotalStats} 
- bag: ${itemTotalStats}`);
        }
      }

      return true;
    })));
  }

  handleInventoryFull() {
    if (this.userInfo.inventory.missiles_item_id === 0) {
      this.canDuel = false;

      this.broadcastMsg('NO MORE MISSILES!!!!!!!');
    }

    let inventoryFull = true;

    Promise.all(_.values(_.mapValues(this.userInfo.inventory, (value, key) => {
      if (key.substr(0, 8) === 'bag_item') {
        if (value === 0) {
          inventoryFull = false;

          return true;
        }

        const item = this.findItem(value);
        if (!item) {
          return true;
        }

        const type = this.ITEM_TYPES[item.type];

        if (this.userInfo.inventory[`${type}_item_id`] === 0) {
          BigBangEmpire.log(`Moving item: ${type}`);

          return this.request('moveInventoryItem', {
            item_id: item.id,
            target_slot: item.type,
          });
        }

        const equipped = this.findItem(this.userInfo.inventory[`${type}_item_id`]);

        if (item.battle_skill || item.premium_item || item.type === 10) {
          return true;
        }

        const itemTotalStats = item.stat_stamina + item.stat_strength + item.stat_critical_rating +
          item.stat_dodge_rating + item.stat_weapon_damage;
        const equippedTotalStats = equipped.stat_stamina + equipped.stat_strength +
          equipped.stat_critical_rating + equipped.stat_dodge_rating + equipped.stat_weapon_damage;

        if (itemTotalStats < equippedTotalStats) {
          BigBangEmpire.log(`Selling item: ${type}
- my: ${equippedTotalStats} - bag: ${itemTotalStats}`);

          return this.request('sellInventoryItem', {
            item_id: item.id,
          })
            .then(() => {
              inventoryFull = false;
            });
        }

        if (itemTotalStats > equippedTotalStats + 15) {
          BigBangEmpire.log(`Moving item: ${type}
- my: ${equippedTotalStats} - bag: ${itemTotalStats}`);

          return this.request('moveInventoryItem', {
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
          BigBangEmpire.log('INVENTORY FULL!!!!!!!');
        }
      });
  }

  handleCurrentQuest() {
    return this.request('checkForQuestComplete')
      .then((dataComplete) => {
        if (
          (dataComplete.data.quest && dataComplete.data.quest.status === 4)
          ||
          dataComplete.error === 'errFinishInvalidStatus'
        ) {
          return this.request('claimQuestRewards', {
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

    return this.request('claimMovieQuestRewards')
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
      return this.request('getMoviesToVote', {
        refresh: false,
      })
        .then((data) => {
          const movies = data.data.movies_to_vote;

          BigBangEmpire.log(`Voting movie ${movies[0].id}`);

          return this.request('voteForMovie', {
            discard_item: false,
            movie_id: movies[0].id,
          });
        });
    }

    return true;
  }

  handleStoryDungeonAttack() {
    if (this.userInfo.character.active_quest_id || this.userInfo.character.quest_energy === 0) {
      return true;
    }

    if (!this.userInfo.story_dungeon) {
      return true;
    }

    const now = Math.round(new Date().getTime() / 1000);

    if (this.userInfo.story_dungeon.status === 2
      &&
      now > this.userInfo.story_dungeon.ts_last_attack + 3600) {
      this.broadcastMsg('Starting a Story Dungeon Attack');

      return this.request('startStoryDungeonBattle', {
        finish_cooldown: false,
      })
        .then(() => this.request('claimStoryDungeonReward', {
          discard_item: false,
        }))
        .then(() => {
          delete this.userInfo.story_dungeon;
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
      return this.request('buyQuestEnergy', {
        use_premium: false,
      });
    }

    return true;
  }

  handleQuest() {
    if (this.userInfo.character.active_quest_id || DEBUG_DUNGEON) {
      return true;
    }

    if (this.userInfo.character.quest_energy < 2) {
      if (this.closeWhenNoEnergy) {
        this.broadcastMsg('No more energy, shutting down!');
        this.closeGame();
      }

      return true;
    }

    BigBangEmpire.log(`You have quest energy: ${this.userInfo.character.quest_energy}`);

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
          this.broadcastMsg(`Got a new "${reward}" in ${quest.energy_cost} minutes`);
        }

        startingString += `\n- with a "${reward}"`;
      });
    }

    if (quest.rewards.item) {
      startingString += '\n- with an item';
    }

    BigBangEmpire.log(startingString);

    return this.request('startQuest', {
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
          BigBangEmpire.log('Reducing quest time');

          return this.request('useResource', {
            feature_type: 1,
          });
        }

        return data;
      });
  }

  handleDungeon() {
    if (!DEBUG_DUNGEON) {
      if (this.userInfo.character.active_quest_id || this.userInfo.character.quest_energy < 2) {
        return true;
      }
    }

    if (!this.userInfo.character.has_dungeon_key || this.userInfo.dungeon) {
      return true;
    }

    this.chooseDungeon();

    return true;
  }

  chooseDungeon() {

    const dungeons = this.gameInfo.constants.dungeon_templates;

    let identifier = '';
    let maxOffset = 0;

    _.forEach(dungeons, (dungeon, tmpIdentifier) => {
      dungeon.maxOffset = 0; // eslint-disable-line no-param-reassign
      dungeon.maxLevel = 0; // eslint-disable-line no-param-reassign

      _.forEach(dungeon.levels, (level, levelNo) => {
        if (this.userInfo.character.fans > level.min_fans) {
          if (levelNo > dungeon.maxLevel) {
            dungeon.maxLevel = levelNo; // eslint-disable-line no-param-reassign
          }

          if (level.reward_item_level_offset > dungeon.maxOffset) {
            // eslint-disable-next-line no-param-reassign
            dungeon.maxOffset = level.reward_item_level_offset;
          }
        }
      });

      if (dungeon.maxOffset > maxOffset) {
        identifier = tmpIdentifier;
        maxOffset = dungeon.maxOffset;
      }
    });

    if (identifier) {
      this.broadcastMsg(`Choosing the dungeon: ${identifier}`);

      return this.request('openDungeon', { dungeon_identifier: identifier });
    }

    return true;
  }

  handleDungeonQuest() {
    if (!this.userInfo.dungeon || !this.userInfo.dungeon_quest) {
      return true;
    }

    BigBangEmpire.log('Starting dungeon quest');

    return this.request('startDungeonQuest', {
      dungeon_quest_id: this.userInfo.dungeon_quest.id,
      finish_cooldown: false,
    })
      .then(() => this.request('finishDungeonQuest'))
      .then(() => this.request('claimDungeonQuestRewards', { discard_item: false }))
      .catch((err) => {
        if (!err.message.match(/errStartDungeonQuestActiveCooldown/)) {
          throw err;
        }
      });
  }

  handleResourceRequest() {
    if (this.requestedResources) {
      return true;
    }

    this.requestedResources = true;

    BigBangEmpire.log('Requesting resources');

    return this.request('getAvailableResourceRequestFriends', {
      platform: this.config.platform,
      feature_type: 1,
    }, false)
      .then((data) => data.data.resource_request_friends.map((friend) => friend.user_id))
      .then((friends) => friends.length && this.request('createResourceRequest', {
        feature_type: 1,
        user_ids: friends.join(';'),
      }));
  }

  handleDuel(best) {
    if (this.userInfo.character.duel_stamina < this.userInfo.character.duel_stamina_cost
      ||
      !this.canDuel) {
      return true;
    }

    BigBangEmpire.log(`You have enough duel stamina: ${this.userInfo.character.duel_stamina}`);

    return this.request('getDuelOpponents')
      .then((data) => {
        if (!data.data.opponents) {
          BigBangEmpire.log(data);

          throw new Error('No opponents');
        }

        const character = data.data.character;
        const opponents = data.data.opponents.sort((a, b) => a.honor < b.honor);

        const myTotal = character.stat_total_stamina +
          character.stat_total_strength +
          character.stat_total_critical_rating +
          character.stat_total_dodge_rating;

        const myBattleSkills = Object.keys(this.myBattleSkills).length;

        let opponent;

        opponents.every((tmpOpponent) => {
          const battleData = tmpOpponent.battle_data ? JSON.parse(tmpOpponent.battle_data) : {};

          if (!this.isOutOfGuild(tmpOpponent)) {
            BigBangEmpire.log(`${tmpOpponent.name} is in my guild: can't duel!`);

            return true;
          }

          if (best) {
            opponent = tmpOpponent;

            return false;
          }

          if (myTotal > tmpOpponent.total_stats
            &&
            myBattleSkills > Object.keys(battleData.effects)) {
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
    BigBangEmpire.log(`Starting a duel with ${opponent.name}`);

    return this.request('startDuel', {
      character_id: opponent.id,
      use_premium: false,
    })
      .then((data) => {
        if (data.error === 'errStartDuelActiveDuelFound') {
          return this.request('checkForDuelComplete')
            .then(() => this.request('claimDuelRewards', {
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

        BigBangEmpire.log(`You ${wonOrLost} the duel! ${
          numeral(reward.honor).format('+0')} honor${addendum}`);

        return this.request('checkForDuelComplete');
      })
      .then(() => this.request('claimDuelRewards', {
        discard_item: false,
      }));
  }

  handleMissedDuels() {
    if (this.userInfo.missed_duels === 0) {
      return true;
    }

    const duels = this.userInfo.missed_duels === 1 ? 'duel' : 'duels';
    BigBangEmpire.log(`You have missed ${this.userInfo.missed_duels} ${duels}`);

    return this.request('getMissedDuelsNew', {
      history: false,
    })
      .then((data) => {
        data.data.missed_duel_data.forEach((duel) => {
          const wonOrLost = duel.winner === 'a' ? 'lost' : 'won';

          // eslint-disable-next-line no-param-reassign
          duel.character_b_rewards = JSON.parse(duel.character_b_rewards);
          BigBangEmpire.log(`Missed duel: ${wonOrLost}, ${duel.character_b_rewards.honor} honor`);
        });

        this.userInfo.missed_duels = 0;

        return this.request('claimMissedDuelsRewards');
      });
  }

  handleMovieRefresh() {
    if (this.userInfo.movie) {
      return true;
    }

    return this.request('refreshMoviePool', {
      use_premium: false,
    });
  }

  handleMovieChoice() {
    if (typeof this.userInfo.movies === 'undefined') {
      return true;
    }

    this.broadcastMsg('Choosing the next movie');

    const movies = this.userInfo.movies.sort((a, b) => {
      if (a.fans > b.fans) {
        return -1;
      }

      return 1;
    });

    return this.request('startMovie', {
      movie_id: movies[0].id,
    })
      .then(() => {
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
    BigBangEmpire.log(`Starting a movie quest: ${quest.rewards.movie_progress} reward`);

    return this.request('startMovieQuest', {
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
        .then(() => this.request('finishMovie'))
        .then(() => {
          this.broadcastMsg('Movie finished');

          delete this.userInfo.movie;
          delete this.userInfo.movie_quests;

          return true;
        });
    }

    return true;
  }

  makeMovieStar() {
    return this.request('claimMovieStar', {
      discard_item: false,
    });
  }

  handleWork() {
    const lastWork = this.userInfo.character.ts_last_work_collection;
    const now = Math.round(new Date().getTime() / 1000);
    const diff = now - lastWork;

    if (diff > 60 * 60 * 3) {
      return this.request('collectWork');
    }

    return true;
  }

  handleMessages() {
    if (this.userInfo.new_messages === 0) {
      return true;
    }

    this.broadcastMsg(`You have ${this.userInfo.new_messages} new messages (${
      this.userInfo.character.pending_resource_requests} resource requests)`);

    if (this.userInfo.character.pending_resource_requests > 0) {
      BigBangEmpire.log('Accepting all resource requests');

      return this.request('acceptAllResourceRequests');
    }

    return true;
  }

  handleGuildMessages() {
    if (!this.userInfo.new_guild_log_entries) {
      return true;
    }

    const whoMany = this.userInfo.new_guild_log_entries;

    return this.request('getGuildLog', { init_request: true })
      .then(() => {
        const logs = this.userInfo.guild_log.sort((a, b) => {
          if (a.timestamp < b.timestamp) {
            return 1;
          }

          if (a.timestamp > b.timestamp) {
            return -1;
          }

          return 0;
        });

        BigBangEmpire.log(logs[0]);

        for (let i = 0; i < whoMany; ++i) {
          this.printGuildChatMsg(logs[i]);
        }
      });
  }

  printGuildChatMsg(msg) {
    BigBangEmpire.log(msg);
  }

  handleItemPattern() {
    // collected_item_pattern
    // current_item_pattern_values

    return true;
  }

  handleGuildBattle() {
    if (!this.userInfo.pending_guild_battle_attack) {
      return true;
    }

    if (this.userInfo.pending_guild_battle_attack.character_ids
        .indexOf(this.userInfo.character.id) !== -1) {
      return true;
    }

    this.broadcastMsg('Joining guild battle');

    return this.request('joinGuildBattle', { attack: true });
  }

  retrieveRanking() {
    this.rankRetrieved++;

    const rankType = (this.rankRetrieved % 3) + 1;

    return this.request('retrieveLeaderboard', {
      sort_type: rankType,
      character_name: this.userInfo.character.name,
    })
      .then((data) => {
        switch (rankType) {
          case 1:
            this.rankHonor = data.data.centered_rank;
            break;

          case 2:
            this.rankLevel = data.data.centered_rank;
            break;

          case 3:
            this.rankFans = data.data.centered_rank;
            break;

          default:
            BigBangEmpire.log(data);
            break;
        }
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

  broadcastMsg(msg, log = true) {
    if (log) {
      BigBangEmpire.log(msg);
    }

    this.bot.broadcastMsg(msg);
  }

  static log(msg, what) {
    const time = moment().format('HH:mm:ss');
    const msgWhat = what ? ` - [${what}]` : '';

    if (typeof msg !== 'string') {
      console.log(msg);

      return;
    }

    console.log(`${time}${msgWhat} - ${msg}`);
  }

  static getHashFromUrl(url) {
    return url.split('?')[1];
  }
}

module.exports = BigBangEmpire;
