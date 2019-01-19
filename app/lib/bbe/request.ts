import { createHash } from 'crypto';
import * as moment from 'moment';
import * as request from 'request-promise';

import BigBangEmpireError from './utils/error';

import { optionsWeb } from './types/options';

import Constants from './constants';
import ExtendedConfig from './extendedConfig';
import Friend from './friend';
import Game from './game';
import Quest from './quest';

export default class Request {
  readonly baseUrl: string;
  readonly clientId: string;

  private userId: number = 0;
  private userSessionId: number = 0;

  static CLIENT_VERSION: number = 81;
  static AUTH_SALT: string = 'bpHgj5214';

  static ENDPOINT_REQUEST: string = '/request.php';

  static ACTION_INIT_ENVIRONMENT = 'initEnvironment';
  static ACTION_INIT_GAME = 'initGame';
  static ACTION_LOGIN_USER = 'loginUser';
  static ACTION_GET_STANDALONE_PAYMENT_OFFERS = 'getStandalonePaymentOffers';
  static ACTION_LOGIN_FRIEND_BAR = 'loginFriendBar';
  static ACTION_SYNC_GAME = 'syncGame';
  static ACTION_CHECK_FOR_QUEST_COMPLETE = 'checkForQuestComplete';

  constructor(baseUrl: string, readonly server: string, readonly email: string, readonly password: string) {
    this.baseUrl = baseUrl.replace('{SERVER}', this.server);
    this.clientId = `${this.server}${moment().format('X')}`;
  }

  setUserId(userId: number) {
    this.userId = userId;
  }

  setUserSessionId(userSessionId: number) {
    this.userSessionId = userSessionId;
  }

  async request(action: string, parameters: object = {}): Promise<any> {
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

  async login(email, password): Promise<Game> {
    const game = await this.request(Request.ACTION_LOGIN_USER, {
      email,
      password,
      platform_user_id: '',
      platform: '',
      app_version: Request.CLIENT_VERSION,
      client_id: this.clientId,
    });

    return new Game(game);
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
      platform: 'standalone',
      existing_session_id: this.userSessionId,
      existing_user_id: this.userId,
    });

    return friendsRaw.map(friendRaw => new Friend(friendRaw));
  }

  async syncGame(): Promise<Game> {
    const game = await this.request(Request.ACTION_SYNC_GAME, { force_sync: false });

    return new Game(game);
  }

  async checkForQuestComplete(): Promise<Quest> {
    try {
      const { quest } = await this.request(Request.ACTION_CHECK_FOR_QUEST_COMPLETE);

      return new Quest(quest);
    } catch (errorRaw) {
      const error = errorRaw as BigBangEmpireError;

      if (error.code === 'errCheckForQuestCompleteNoActiveQuest' || error.code === 'errFinishInvalidStatus') {
        return null;
      }

      throw errorRaw;
    }
  }
}
