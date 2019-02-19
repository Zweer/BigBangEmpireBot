import { createHash } from 'crypto';
import { mapValues, merge } from 'lodash';
import * as config from 'config';
import * as moment from 'moment';
import * as request from 'request-promise';

import BigBangEmpireError from '../models/utils/error';

import { resource, stat } from '../models/types/common';
import { itemType } from '../models/types/item';
import { optionsWeb } from '../models/types/options';

import constantsObj from '../models/constants';
import extendedConfigObj from '../models/extendedConfig';
import gameObj from '../models/game';

import Battle from '../models/duel/battle';
import CollectedWork from '../models/work/collected';
import Duel from '../models/duel';
import Friend from '../models/friend';
import Item from '../models/inventory/item';
import MissedDuel from '../models/duel/missed';
import Movie from '../models/movie';
import MovieQuest from '../models/movie/quest';
import Opponent from '../models/duel/opponent';
import Quest from '../models/story/quest';
import Reward from '../models/story/reward';
import VotableMovie from '../models/movie/votable';
import MessageCharacter from '../models/mailbox/character';
import Message from '../models/mailbox/message';
import GuildMessage from '../models/guild/message';
import Voucher from '../models/voucher';
import StoryDungeon from '../models/story/storyDungeon';

class Request {
  private semaphore = true;

  private userId: number = 0;
  private userSessionId: string = '0';
  private guildLogSyncState: number;

  static CLIENT_VERSION: number = 82;
  static AUTH_SALT: string = 'bpHgj5214';
  static PLATFORM = 'standalone';

  static AUTH_SERVER: string = config.get('bbe.auth.server');
  static BASE_URL: string = config.get('bbe.baseUrl').replace('{SERVER}', Request.AUTH_SERVER);
  static ENDPOINT_REQUEST: string = '/request.php';

  static CLIENT_ID: string = `${Request.AUTH_SERVER}${moment().format('X')}`;

  static STATUS_CHECK_FOR_QUEST_COMPLETE = ['errFinishInvalidStatus', 'errCheckForQuestCompleteNoActiveQuest', 'errFinishNotYetCompleted'];

  async request(action: string, parameters: object = {}): Promise<any> {
    while (!this.semaphore) {
      await new Promise(resolve => setTimeout(resolve, 2000));
    }

    this.semaphore = false;

    const url = `${Request.BASE_URL}${Request.ENDPOINT_REQUEST}`;
    const form = {
      action,
      rct: 1,
      keep_alive: true,
      device_type: 'web',
      client_version: `flash_${Request.CLIENT_VERSION}`,
      user_session_id: this.userSessionId,
      user_id: this.userId,
      auth: createHash('md5').update(`${action}${Request.AUTH_SALT}${this.userId}`).digest('hex'),

      ...parameters,
    };

    const { data, error } = await request.post({ url, form, json: true });

    this.semaphore = true;

    if (error) {
      throw new BigBangEmpireError(error, action, form);
    }

    if (data.character && gameObj.character) {
      gameObj.character.update(data.character);
    }

    if (data.user && gameObj.user) {
      gameObj.user.update(data.user);
    }

    return data;
  }

  async initEnvironment(): Promise<void> {
    const { extendedConfig } = await this.request('initEnvironment');

    extendedConfigObj.update(extendedConfig);
  }

  async initGame(parameters: optionsWeb): Promise<void> {
    const { constants, extendedConfig } = await this.request('initGame', {
      swf_ui_hash: parameters.swfUi,
      locale_version: parameters.localeVersion,
      swf_main_hash: parameters.swfMain,
      swf_character_hash: parameters.swfCharacter,
      swf_movie_cover_hash: parameters.swfMovieCover,

      no_text: true,
    });

    constantsObj.update(constants);
    extendedConfigObj.update(extendedConfig);
  }

  async login(email, password): Promise<void> {
    const game = await this.request('loginUser', {
      email,
      password,
      platform_user_id: '',
      platform: '',
      app_version: Request.CLIENT_VERSION,
      client_id: Request.CLIENT_ID,
    });

    gameObj.update(game);
    this.userId = gameObj.user.id;
    this.userSessionId = gameObj.user.sessionId;
  }

  async initOffers(locale) {
    const {
      consumable_offers: consumable,
      normal_offers: normal,
      special_offers: special,
      text,
    } = await this.request('getStandalonePaymentOffers', { locale });

    return { consumable, normal, special, text };
  }

  async initFriends(): Promise<Friend[]> {
    const { friend_data: friendsRaw } = await this.request('loginFriendBar', {
      platform: Request.PLATFORM,
      existing_session_id: this.userSessionId,
      existing_user_id: this.userId,
    });

    return friendsRaw.map(friendRaw => new Friend(friendRaw));
  }

  async syncGame(force: boolean = false): Promise<void> {
    const game = await this.request('syncGame', { force_sync: force });

    gameObj.update(game);
  }

  async checkForQuestComplete(): Promise<Quest> {
    try {
      const { quest } = await this.request('checkForQuestComplete');

      return new Quest(quest);
    } catch (errorRaw) {
      const error = errorRaw as BigBangEmpireError;

      if (Request.STATUS_CHECK_FOR_QUEST_COMPLETE.includes(error.code)) {
        return null;
      }

      throw errorRaw;
    }
  }

  async claimQuestRewards(): Promise<void> {
    const {
      current_goal_values: currentGoalValues = {},
      current_item_pattern_values: currentItemPatternValues = {},
      inventory,
      quests,
    } = await this.request('claimQuestRewards', {
      discard_item: false,
      create_new: true,
    });

    gameObj.inventory.update(inventory);

    gameObj.setQuests(quests);

    Object.assign(gameObj.currentGoalValue, currentGoalValues);
    Object.assign(gameObj.currentItemPatternValues, currentItemPatternValues);
  }

  async startQuest(quest: Quest): Promise<void> {
    const { quest: updatedQuest } = await this.request('startQuest', { quest_id: quest.id });

    quest.update(updatedQuest);
  }

  async useResource(resourceType: resource): Promise<number> {
    const { quest, saved_seconds: savedSeconds } = await this.request('useResource', {
      feature_type: resourceType,
    });

    gameObj.currentQuest.update(quest);

    return savedSeconds;
  }

  async collectGoalReward(goalName: string, nextGoalValue: number): Promise<void> {
    const {} = await this.request('collectGoalReward', {
      value: nextGoalValue,
      identifier: goalName,
      discard_item: false,
    });
  }

  async moveInventoryItem(item: Item): Promise<void> {
    const { inventory } = await this.request('moveInventoryItem', {
      item_id: item.id,
      target_slot: item.type,
    });

    gameObj.inventory.update(inventory);
  }

  async sellInventoryItem(item: Item): Promise<void> {
    const { inventory } = await this.request('sellInventoryItem', {
      item_id: item.id,
    });

    gameObj.inventory.update(inventory);
  }

  async getDuelOpponents(): Promise<Opponent[]> {
    const { opponents } = await this.request('getDuelOpponents');

    return opponents.map(opponent => new Opponent(opponent));
  }

  async startDuel(opponent: Opponent): Promise<{ battle: Battle, duel: Duel, item: Item }> {
    try {
      const { battle, duel, item } = await this.request('startDuel', {
        character_id: opponent.id,
        use_premium: false,
      });

      return {
        battle: new Battle(battle),
        duel: new Duel(duel),
        item: new Item(item),
      };
    } catch (error) {
      const bbeError = error as BigBangEmpireError;

      if (bbeError.code === 'errStartDuelActiveDuelFound') {
        await this.checkForDuelComplete();
        await this.claimDuelRewards();

        return this.startDuel(opponent);
      }

      throw error;
    }
  }

  async checkForDuelComplete() {
    await this.request('checkForDuelComplete');
  }

  async claimDuelRewards() {
    await this.request('claimDuelRewards', {
      discard_item: false,
    });
  }

  async getMissedDuelsNew(): Promise<MissedDuel[]> {
    const { missed_duel_data: missedDuels, missed_duel_opponents: missedDuelOpponents } = await this.request('getMissedDuelsNew', {
      history: false,
    });

    const opponents = missedDuelOpponents.map(o => new Opponent(o));
    return missedDuels.map(d => new MissedDuel(d, opponents));
  }

  async claimMissedDuelsRewards(): Promise<void> {
    const { missed_duels: missedDuels } = await this.request('claimMissedDuelsRewards');

    gameObj.missedDuels = missedDuels;
  }

  async collectWork(): Promise<CollectedWork> {
    const { collected_work: collectedWork } = await this.request('collectWork');

    return new CollectedWork(collectedWork);
  }

  async acceptAllResourceRequests() {
    await this.request('acceptAllResourceRequests');
  }

  async getAvailableResourceRequestFriends(featureType = 1): Promise<Friend[]> {
    const { resource_request_friends: resourceRequestFriends } = await this.request('getAvailableResourceRequestFriends', {
      platform: Request.PLATFORM,
      feature_type: featureType,
    });

    return resourceRequestFriends.map(f => new Friend(f));
  }

  async createResourceRequest(friends: Friend[], featureType = 1): Promise<void> {
    await this.request('createResourceRequest', {
      feature_type: featureType,
      user_ids: friends.map(f => f.userId).join(';'),
    });
  }

  async retrieveLeaderboard(sortType): Promise<number> {
    const { centered_rank: rank } = await this.request('retrieveLeaderboard', {
      sort_type: sortType,
      character_name: gameObj.character.name,
    });

    return rank;
  }

  async retrieveGuildLeaderboard(sortType): Promise<number> {
    const { centered_rank: rank } = await this.request('retrieveGuildLeaderboard', {
      sort_type: sortType,
      same_locale: false,
    });

    return rank;
  }

  async retrieveMovieTournamentLeaderboard(): Promise<number> {
    const { centered_rank: rank } = await this.request('retrieveMovieTournamentLeaderboard');

    return rank;
  }

  async retrieveSoloGuildCompetitionTournamentLeaderboard(): Promise<number> {
    const { centered_rank: rank } = await this.request('retrieveSoloGuildCompetitionTournamentLeaderboard');

    return rank;
  }

  async buyQuestEnergy(): Promise<void> {
    await this.request('buyQuestEnergy', {
      use_premium: false,
    });
  }

  async claimMovieQuestRewards() {
    const { movie, movie_quests: movieQuests } = await this.request('claimMovieQuestRewards');

    gameObj.movie.update(movie);
    gameObj.setMovieQuests(movieQuests);
  }

  async refreshMoviePool(): Promise<void> {
    const { movies } = await this.request('refreshMoviePool', {
      use_premium: false,
    });

    gameObj.setMovies(movies);
  }

  async startMovie(movie: Movie): Promise<void> {
    const { movie: movieAddendum, movie_quests: movieQuests } = await this.request('startMovie', {
      movie_id: movie.id,
    });

    gameObj.movie = movie.update(movieAddendum);
    gameObj.setMovieQuests(movieQuests);
  }

  async startMovieQuest(movieQuest: MovieQuest): Promise<void> {
    await this.request('startMovieQuest', {
      movie_quest_id: movieQuest.id,
    });
  }

  async claimMovieStar() {
    const { movie } = await this.request('claimMovieStar', {
      discard_item: false,
    });

    gameObj.movie.update(movie);
  }

  async finishMovie() {
    const { movie } = await this.request('finishMovie');

    gameObj.movie.update(movie);
  }

  async getMoviesToVote(): Promise<{ movies: VotableMovie[], reward: Reward }> {
    const { movies_to_vote: moviesToVote, movie_vote_reward: movieVoteReward } = await this.request('getMoviesToVote', {
      refresh: false,
    });

    return {
      movies: moviesToVote.map(m => new VotableMovie(m)),
      reward: new Reward(movieVoteReward),
    };
  }

  async voteForMovie(movie: VotableMovie) {
    await this.request('voteForMovie', {
      discard_item: false,
      movie_id: movie.id,
    });
  }

  async extendMovieTime() {
    const { movie } = await this.request('extendMovieTime', {
      use_premium: false,
    });

    gameObj.movie.update(movie);
  }

  async improveCharacterStat(statistic: stat, value: number = 1) {
    await this.request('improveCharacterStat', {
      stat_type: statistic,
      skill_value: value,
    });
  }

  async getMessageList(received = true): Promise<Message[]> {
    const { messages, messages_character_info: messageCharactersInfo } = await this.request('getMessageList', {
      load_received: received,
      load_sent: !received,
      load_ignored: true,
      max_message_id: 0,
      offset: 0,
    });

    const messageCharacters = mapValues(messageCharactersInfo, (m => new MessageCharacter(m)));

    return messages.map(m => new Message(m, messageCharacters));
  }

  async getMessage(message: number | Message): Promise<Message> {
    const messageId = message instanceof Message ? message.id : message;

    const { message: completeMessage, messages_character_info: messageCharactersInfo } = await this.request('getMessage', {
      message_id: messageId,
    });

    const messageCharacters = mapValues(messageCharactersInfo, (m => new MessageCharacter(m)));

    return new Message(completeMessage, messageCharacters);
  }

  async deleteMessage(message: number | Message): Promise<void> {
    return this.deleteMessages([message]);
  }

  async deleteMessages(messages: (number | Message)[]): Promise<void> {
    const messagesId = messages.map(message => message instanceof Message ? message.id : message);

    await this.request('deleteMessages', {
      message_ids: messagesId.join(','),
    });
  }

  async claimDatingStepReward(datingIndex: number, stepIndex: number) {
    await this.request('claimDatingStepReward', {
      dating_index: datingIndex,
      step_index: stepIndex,
      discard_item: false,
    });
  }

  async startNewDatingStep(datingIndex: number, stepIndex: number) {
    await this.request('startNewDatingStep', {
      dating_index: datingIndex,
      step_index: stepIndex,
    });

    // updating things is too difficult, better allow it to recreate everything
    await this.syncGame(true);
  }

  async startDatingBattle(datingIndex: number, stepIndex: number) {
    await this.request('startDatingBattle', {
      dating_index: datingIndex,
      step_index: stepIndex,
      finish_cooldown: false,
    });

    await this.syncGame(true);
  }

  async getGuildLog(init = true): Promise<GuildMessage[]> {
    const parameters = {
      init_request: init,
    };

    if (gameObj.guild && this.guildLogSyncState) {
      parameters[`sync_guild${gameObj.guild.id}`] = this.guildLogSyncState;
    }

    const response = await this.request('getGuildLog', parameters);

    const { guild_log: guildLogs, sync_states: syncStates, synced } = response;
    if (synced) {
      return [];
    }

    this.guildLogSyncState = syncStates[`getguildlog_guild${gameObj.guild.id}`];

    return Object.keys(guildLogs).map(guildLogId => new GuildMessage(guildLogs[guildLogId], guildLogId));
  }

  async joinGuildBattle(attack: boolean) {
    await this.request('joinGuildBattle', { attack });

    await this.syncGame(true);
  }

  async buyShopItem(item: Item | number, targetSlot: number): Promise<void> {
    const itemId = item instanceof Item ? item.id : item;

    const { inventory, current_item_pattern_values: currentItemPatternValues } = await this.request('buyShopItem', {
      item_id: itemId,
      target_slot: targetSlot,
    });

    gameObj.inventory.update(inventory);
    merge(gameObj.currentItemPatternValues, currentItemPatternValues);
  }

  async refreshShopItems(usePremium = false): Promise<void> {
    const { inventory, items } = await this.request('refreshShopItems', {
      use_premium: usePremium,
    });

    gameObj.inventory.update(inventory);
    gameObj.items.push(...items.map(i => new Item(i)));
  }

  async useInventoryItem(item: Item | number) {
    const itemId = item instanceof Item ? item.id : item;

    const response = await this.request('useInventoryItem', {
      item_id: itemId,
    });

    console.log(response);
  }

  async getUserVoucher(voucherId: number) {
    const { voucher } = await this.request('getUserVoucher', {
      id: voucherId,
    });

    return new Voucher(voucher);
  }

  async redeemVoucher(voucher: Voucher) {
    await this.request('redeemVoucher', {
      code: voucher.code,
    });

    await this.syncGame(true);
  }

  async buyBooster(booster: string): Promise<void> {
    await this.request('buyBooster', {
      id: booster,
    });

    await this.syncGame(true);
  }

  async claimGuildBattleReward(guildBattleId: number) {
    await this.request('claimGuildBattleReward', {
      guild_battle_id: guildBattleId,
      discard_item: false,
    });
  }

  async getGuildCompetitionTournamentReward() {
    const response = await this.request('getGuildCompetitionTournamentReward');

    return response;
  }

  async claimGuildCompetitionTournamentReward() {
    const response = await this.request('claimGuildCompetitionTournamentReward', {
      discard_item: false,
    });

    console.log(response);
  }

  async startStoryDungeonBattle(storyDungeon: StoryDungeon) {
    const { story_dungeon: updatedStoryDungeon } = await this.request('startStoryDungeonBattle', {
      story_dungeon_index: storyDungeon.storyDungeonIndex,
      finish_cooldown: false,
    });

    storyDungeon.update(updatedStoryDungeon);
  }

  async claimStoryDungeonReward(storyDungeon: StoryDungeon) {
    await this.request('claimStoryDungeonReward', {
      story_dungeon_index: storyDungeon.storyDungeonIndex,
      discard_item: false,
    });
  }

  async getDailyBonusRewardData() {
    const response = await this.request('getDailyBonusRewardData');

    return response;
  }

  async collectHerobookReward(id: number) {
    const response = await this.request('collectHerobookReward', {
      id,
      discard_item: false,
    });

    console.log(response);
  }
}

export default new Request();
