import { createHash } from 'crypto';
import * as moment from 'moment';
import * as request from 'request-promise';

import BigBangEmpireError from './game/error';

import {resource, stat} from './game/types/common';
import { itemType } from './game/types/item';
import { optionsWeb } from './game/types/options';

import Battle from './game/battle';
import CollectedWork from './game/work/collected';
import Constants from './game/constants';
import Duel from './game/duel';
import ExtendedConfig from './game/extendedConfig';
import Friend from './game/friend';
import Game from './game';
import Item from './game/item';
import MissedDuel from './game/duel/missed';
import Movie from './game/movie';
import MovieQuest from './game/movie/quest';
import Opponent from './game/duel/opponent';
import Quest from './game/quest';
import Reward from "./game/reward";
import VotableMovie from "./game/movie/votable";

export default class Request {
  readonly baseUrl: string;
  readonly clientId: string;

  private semaphore = true;

  private userId: number = 0;
  private userSessionId: string = '0';

  static CLIENT_VERSION: number = 82;
  static AUTH_SALT: string = 'bpHgj5214';
  static PLATFORM = 'standalone';

  static ENDPOINT_REQUEST: string = '/request.php';

  static ACTION_INIT_ENVIRONMENT = 'initEnvironment';
  static ACTION_INIT_GAME = 'initGame';
  static ACTION_LOGIN_USER = 'loginUser';
  static ACTION_GET_STANDALONE_PAYMENT_OFFERS = 'getStandalonePaymentOffers';
  static ACTION_LOGIN_FRIEND_BAR = 'loginFriendBar';
  static ACTION_SYNC_GAME = 'syncGame';
  static ACTION_CHECK_FOR_QUEST_COMPLETE = 'checkForQuestComplete';
  static ACTION_CLAIM_QUEST_REWARDS = 'claimQuestRewards';
  static ACTION_START_QUEST = 'startQuest';
  static ACTION_USE_RESOURCES = 'useResource';
  static ACTION_USE_COLLEECTED_GOAL_REWARD = 'collectGoalReward';
  static ACTION_MOVE_INVENTORY_ITEM = 'moveInventoryItem';
  static ACTION_SELL_INVENTORY_ITEM = 'sellInventoryItem';
  static ACTION_GET_DUEL_OPPONENTS = 'getDuelOpponents';
  static ACTION_START_DUEL = 'startDuel';
  static ACTION_CHECK_FOR_DUEL_COMPLETE = 'checkForDuelComplete';
  static ACTION_CLAIM_DUEL_REWARDS = 'claimDuelRewards';
  static ACTION_GET_MISSED_DUELS_NEW = 'getMissedDuelsNew';
  static ACTION_CLAIM_MISSED_DUELS_REWARDS = 'claimMissedDuelsRewards';
  static ACTION_COLLECT_WORK = 'collectWork';
  static ACTION_ACCEPT_ALL_RESOURCE_REQUESTS = 'acceptAllResourceRequests';
  static ACTION_GET_AVAILABLE_RESOURCE_REQUEST_FRIENDS = 'getAvailableResourceRequestFriends';
  static ACTION_CREATE_RESOURCE_REQUEST = 'createResourceRequest';
  static ACTION_RETRIEVE_LEADERBOARD = 'retrieveLeaderboard';
  static ACTION_BUY_QUEST_ENERGY = 'buyQuestEnergy';
  static ACTION_CLAIM_MOVIE_QUEST_REWARDS = 'claimMovieQuestRewards';
  static ACTION_REFRESH_MOVIE_POOL = 'refreshMoviePool';
  static ACTION_START_MOVIE = 'startMovie';
  static ACTION_START_MOVIE_QUEST = 'startMovieQuest';
  static ACTION_CLAIM_MOVIE_STAR = 'claimMovieStar';
  static ACTION_FINISH_MOVIE = 'finishMovie';
  static ACTION_GET_MOVIES_TO_VOTE = 'getMoviesToVote';
  static ACTION_VOTE_FOR_MOVIE = 'voteForMovie';
  static ACTION_EXTEND_MOVIE_TIME = 'extendMovieTime';
  static ACTION_IMPROVE_CHARACTER_STAT = 'improveCharacterStat';

  static STATUS_CHECK_FOR_QUEST_COMPLETE = ['errFinishInvalidStatus', 'errCheckForQuestCompleteNoActiveQuest', 'errFinishNotYetCompleted'];

  constructor(baseUrl: string, readonly server: string, readonly email: string, readonly password: string, readonly game: Game) {
    this.baseUrl = baseUrl.replace('{SERVER}', this.server);
    this.clientId = `${this.server}${moment().format('X')}`;
  }

  async request(action: string, parameters: object = {}): Promise<any> {
    while (!this.semaphore) {
      await new Promise(resolve => setTimeout(resolve, 2000));
    }

    this.semaphore = false;

    const url = `${this.baseUrl}${Request.ENDPOINT_REQUEST}`;
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

    return data;
  }

  async initEnvironment(): Promise<ExtendedConfig> {
    const { textures, extendedConfig } = await this.request(Request.ACTION_INIT_ENVIRONMENT);

    return new ExtendedConfig(extendedConfig);
  }

  async initGame(parameters: optionsWeb): Promise<{ constants: Constants, extendedConfig: ExtendedConfig }> {
    const { constants, extendedConfig } = await this.request(Request.ACTION_INIT_GAME, {
      swf_ui_hash: parameters.swfUi,
      locale_version: parameters.localeVersion,
      swf_main_hash: parameters.swfMain,
      swf_character_hash: parameters.swfCharacter,
      swf_movie_cover_hash: parameters.swfMovieCover,

      no_text: true,
    });

    return {
      constants: new Constants(constants),
      extendedConfig: new ExtendedConfig(extendedConfig),
    };
  }

  async login(email, password): Promise<void> {
    const game = await this.request(Request.ACTION_LOGIN_USER, {
      email,
      password,
      platform_user_id: '',
      platform: '',
      app_version: Request.CLIENT_VERSION,
      client_id: this.clientId,
    });

    this.game.update(game);
    this.userId = this.game.user.id;
    this.userSessionId = this.game.user.sessionId;
  }

  async initOffers(locale) {
    const {
      consumable_offers: consumable,
      normal_offers: normal,
      special_offers: special,
      text,
    } = await this.request(Request.ACTION_GET_STANDALONE_PAYMENT_OFFERS, { locale });

    return { consumable, normal, special, text };
  }

  async initFriends(): Promise<Friend[]> {
    const { friend_data: friendsRaw } = await this.request(Request.ACTION_LOGIN_FRIEND_BAR, {
      platform: Request.PLATFORM,
      existing_session_id: this.userSessionId,
      existing_user_id: this.userId,
    });

    return friendsRaw.map(friendRaw => new Friend(friendRaw));
  }

  async syncGame(): Promise<void> {
    const game = await this.request(Request.ACTION_SYNC_GAME, { force_sync: false });

    this.game.update(game);
  }

  async checkForQuestComplete(): Promise<Quest> {
    try {
      const { quest } = await this.request(Request.ACTION_CHECK_FOR_QUEST_COMPLETE);

      return new Quest(quest);
    } catch (errorRaw) {
      const error = errorRaw as BigBangEmpireError;

      if (Request.STATUS_CHECK_FOR_QUEST_COMPLETE.includes(error.code)) {
        return null;
      }

      throw errorRaw;
    }
  }

  async claimQuestRewards(): Promise<{ currentGoalValues: object, currentItemPatternValues: object }> {
    const {
      character,
      current_goal_values: currentGoalValues = {},
      current_item_pattern_values: currentItemPatternValues = {},
      inventory,
      quests,
      user,
    } = await this.request(Request.ACTION_CLAIM_QUEST_REWARDS, {
      discard_item: false,
      create_new: true,
    });

    this.game.character.update(character);
    this.game.inventory.update(inventory);
    this.game.user.update(user);

    this.game.quests = quests.map(quest => new Quest(quest));

    Object.assign(this.game.currentGoalValue, currentGoalValues);
    Object.assign(this.game.currentItemPatternValues, currentItemPatternValues);

    return {
      currentGoalValues,
      currentItemPatternValues,
    };
  }

  async startQuest(questId: number): Promise<Quest> {
    const { character, quest, user } = await this.request(Request.ACTION_START_QUEST, { quest_id: questId });

    this.game.character.update(character);
    this.game.user.update(user);

    return new Quest(quest);
  }

  async useResource(resourceType: resource): Promise<void> {
    const response = await this.request(Request.ACTION_USE_RESOURCES, {
      feature_type: resourceType,
    });

    console.log(response);
  }

  async collectGoalReward(goalName: string, nextGoalValue: number): Promise<void> {
    const { character, user /*, collected_goals */ } = await this.request(Request.ACTION_USE_COLLEECTED_GOAL_REWARD, {
      value: nextGoalValue,
      identifier: goalName,
      discard_item: false,
    });

    this.game.character.update(character);
    this.game.user.update(user);
  }

  async moveInventoryItem(itemId: number, itemType: itemType): Promise<void> {
    const { character, inventory, user } = await this.request(Request.ACTION_MOVE_INVENTORY_ITEM, {
      item_id: itemId,
      target_slot: itemType,
    });

    this.game.character.update(character);
    this.game.user.update(user);
    this.game.inventory.update(inventory);
  }

  async sellInventoryItem(itemId: number): Promise<void> {
    const { character, inventory, user } = await this.request(Request.ACTION_SELL_INVENTORY_ITEM, {
      item_id: itemId,
    });

    this.game.character.update(character);
    this.game.user.update(user);
    this.game.inventory.update(inventory);
  }

  async getDuelOpponents(): Promise<Opponent[]> {
    const { opponents } = await this.request(Request.ACTION_GET_DUEL_OPPONENTS);

    return opponents.map(opponent => new Opponent(opponent));
  }

  async startDuel(opponentId: number): Promise<{ battle: Battle, duel: Duel, item: Item }> {
    try {
      const { battle, character, duel, item, user } = await this.request(Request.ACTION_START_DUEL, {
        character_id: opponentId,
        use_premium: false,
      });

      this.game.character.update(character);
      this.game.user.update(user);

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

        return this.startDuel(opponentId);
      }

      throw error;
    }
  }

  async checkForDuelComplete() {
    const { user } = await this.request(Request.ACTION_CHECK_FOR_DUEL_COMPLETE);

    this.game.user.update(user);
  }

  async claimDuelRewards() {
    const { character, user } = await this.request(Request.ACTION_CLAIM_DUEL_REWARDS, {
      discard_item: false,
    });

    this.game.character.update(character);
    this.game.user.update(user);
  }

  async getMissedDuelsNew(): Promise<MissedDuel[]> {
    const { character, missed_duel_data: missedDuels, missed_duel_opponents: missedDuelOpponents, user } = await this.request(Request.ACTION_GET_MISSED_DUELS_NEW, {
      history: false,
    });

    this.game.character.update(character);
    this.game.user.update(user);

    const opponents = missedDuelOpponents.map(o => new Opponent(o));
    return missedDuels.map(d => new MissedDuel(d, opponents));
  }

  async claimMissedDuelsRewards(): Promise<void> {
    const { missed_duels: missedDuels } = await this.request(Request.ACTION_CLAIM_MISSED_DUELS_REWARDS);

    this.game.missedDuels = missedDuels;
  }

  async collectWork(): Promise<CollectedWork> {
    const { character, collected_work: collectedWork, user } = await this.request(Request.ACTION_COLLECT_WORK);

    this.game.character.update(character);
    this.game.user.update(user);

    return new CollectedWork(collectedWork);
  }

  async acceptAllResourceRequests() {
    const response = await this.request(Request.ACTION_ACCEPT_ALL_RESOURCE_REQUESTS);

    // this.game.character.update(character);
    // this.game.user.update(user);

    console.log(response);
  }

  async getAvailableResourceRequestFriends(featureType = 1): Promise<Friend[]> {
    const { resource_request_friends: resourceRequestFriends } = await this.request(Request.ACTION_GET_AVAILABLE_RESOURCE_REQUEST_FRIENDS, {
      platform: Request.PLATFORM,
      feature_type: featureType,
    });

    return resourceRequestFriends.map(f => new Friend(f));
  }

  async createResourceRequest(friends: Friend[], featureType = 1): Promise<void> {
    const { character, user } = await this.request(Request.ACTION_CREATE_RESOURCE_REQUEST, {
      feature_type: featureType,
      user_ids: friends.map(f => f.userId).join(';'),
    });

    this.game.character.update(character);
    this.game.user.update(user);
  }

  async retrieveLeaderboard(sortType): Promise<number> {
    const { centered_rank: rank } = await this.request(Request.ACTION_RETRIEVE_LEADERBOARD, {
      sort_type: sortType,
      character_name: this.game.character.name,
    });

    return rank;
  }

  async buyQuestEnergy(): Promise<void> {
    const { character, user } = await this.request(Request.ACTION_BUY_QUEST_ENERGY, {
      use_premium: false,
    });

    this.game.character.update(character);
    this.game.user.update(user);
  }

  async claimMovieQuestRewards() {
    const { character, movie, movie_quests: movieQuests, user } = await this.request(Request.ACTION_CLAIM_MOVIE_QUEST_REWARDS);

    this.game.character.update(character);
    this.game.movie.update(movie);
    this.game.setMovieQuests(movieQuests);
    this.game.user.update(user);
  }

  async refreshMoviePool(): Promise<void> {
    const { character, movies, user } = await this.request(Request.ACTION_REFRESH_MOVIE_POOL, {
      use_premium: false,
    });

    this.game.character.update(character);
    this.game.setMovies(movies);
    this.game.user.update(user);
  }

  async startMovie(movie: Movie): Promise<void> {
    const { character, movie: movieAddendum, movie_quests: movieQuests, user } = await this.request(Request.ACTION_START_MOVIE, {
      movie_id: movie.id,
    });

    this.game.character.update(character);
    this.game.movie = movie.update(movieAddendum);
    this.game.setMovieQuests(movieQuests);
    this.game.user.update(user);
  }

  async startMovieQuest(movieQuest: MovieQuest): Promise<void> {
    const { character, user } = await this.request(Request.ACTION_START_MOVIE_QUEST, {
      movie_quest_id: movieQuest.id,
    });

    this.game.character.update(character);
    this.game.user.update(user);
  }

  async claimMovieStar() {
    const { character, movie, user } = await this.request(Request.ACTION_CLAIM_MOVIE_STAR, {
      discard_item: false,
    });

    this.game.character.update(character);
    this.game.movie.update(movie);
    this.game.user.update(user);
  }

  async finishMovie() {
    const { character, movie, user } = await this.request(Request.ACTION_FINISH_MOVIE);

    this.game.character.update(character);
    this.game.movie.update(movie),
    this.game.user.update(user);
  }

  async getMoviesToVote(): Promise<{ movies: VotableMovie[], reward: Reward }> {
    const { character, movies_to_vote: moviesToVote, movie_vote_reward: movieVoteReward, user } = await this.request(Request.ACTION_GET_MOVIES_TO_VOTE, {
      refresh: false,
    });

    this.game.character.update(character);
    this.game.user.update(user);

    return {
      movies: moviesToVote.map(m => new VotableMovie(m)),
      reward: new Reward(movieVoteReward),
    };
  }

  async voteForMovie(movie: VotableMovie) {
    const { character, user } = await this.request(Request.ACTION_VOTE_FOR_MOVIE, {
      discard_item: false,
      movie_id: movie.id,
    });

    this.game.character.update(character);
    this.game.user.update(user);
  }

  async extendMovieTime() {
    const { character, movie, user } = await this.request(Request.ACTION_EXTEND_MOVIE_TIME, {
      use_premium: false,
    });

    this.game.character.update(character);
    this.game.movie.update(movie);
    this.game.user.update(user);
  }

  async improveCharacterStat(statistic: stat, value: number = 1) {
    const { character, user } = await this.request(Request.ACTION_IMPROVE_CHARACTER_STAT, {
      stat_type: statistic,
      skill_value: value,
    });

    this.game.character.update(character);
    this.game.user.update(user);
  }
}
