import axios from 'axios';
import { createHash } from 'crypto';
import * as querystring from 'querystring';

import { BbeConfig } from './bbe.config';

import { ConfigEnvironmentResponseDto } from './dto/config/config.environment.response.dto';
import { ConfigGameResponseDto } from './dto/config/config.game.response.dto';
import { ConfigWeb } from './dto/config/config.web';
import { ResponseDto } from './dto/response.dto';
import { ConfigGameRequestDto } from './dto/config/config.game.request.dto';
import { LoginResponseDto } from './dto/pre/login.response.dto';
import { LoginRequestDto } from './dto/pre/login.request.dto';
import { GetStandalonePaymentOffersResponseDto } from './dto/pre/getStandalonePaymentOffers.response.dto';
import { GetStandalonePaymentOffersRequestDto } from './dto/pre/getStandalonePaymentOffers.request.dto';
import { LoginFriendBarResponseDto } from './dto/pre/loginFriendBar.response.dto';
import { LoginFriendBarRequestDto } from './dto/pre/loginFriendBar.request.dto';
import { SyncGameResponseDto } from './dto/pre/syncGame.response.dto';
import { SyncGameRequestDto } from './dto/pre/syncGame.request.dto';
import { StartQuestResponseDto } from './dto/story/startQuest.response.dto';
import { StartQuestRequestDto } from './dto/story/startQuest.request.dto';

export class BbeRequest {
  private static readonly config: BbeConfig = new BbeConfig();

  private static userId: string = '0';
  private static userSessionId: string = '0';
  private static locale: string;

  private static async send<U, T extends {} = {}>(action: string, params: T = {} as any): Promise<U> {
    const url = this.config.requestUrl;
    const form = {
      action,
      rct: 1,
      user_id: this.userId,
      user_session_id: this.userSessionId,
      client_version: `html5_${BbeConfig.CURRENT_VERSION}`,
      auth: this.getAuth(action, this.userId),
      keep_active: true,
      device_type: 'web',

      ...params,
    };

    const { data } = await axios.post<ResponseDto<U>>(url, querystring.stringify(form));

    if (data.error) {
      throw new Error(`${data.error} while requesting "${action}"`);
    }

    return data.data;
  }

  static async retrieveConfig(): Promise<ConfigWeb> {
    const response = await axios.get(this.config.baseUrl);

    const matches = [...response.data.matchAll(/^\s*(?<name>\w+):\s"(?<value>(.*\?(?<hash>.+))|(.*))",?$/gm)];
    return Object.fromEntries(matches
      .flatMap((match) => [
        [match.groups.name, match.groups.value],
        (match.groups.hash && match.groups.name.startsWith('url')) && [match.groups.name.replace('url', 'version'), match.groups.hash],
      ])
      .filter((match) => !!match));
  }

  static async initEnvironment(): Promise<ConfigEnvironmentResponseDto> {
    return this.send<ConfigEnvironmentResponseDto>('initEnvironment');
  }

  static async initGame(config?: ConfigWeb): Promise<ConfigGameResponseDto> {
    if (!config) {
      // eslint-disable-next-line no-param-reassign
      config = await this.retrieveConfig();
    }

    return this.send<ConfigGameResponseDto, ConfigGameRequestDto>('initGame', {
      no_text: true,
      locale_version: config.localeVersion,
      locale: config.default_locale,
      swf_main_hash: config.versionSwfMain,
      swf_character_hash: config.versionSwfCharacter,
      swf_ui_hash: config.versionSwfUi,
      swf_movie_cover_hash: config.versionSwfMovieCover,
    });
  }

  static async loginUser(email?: string, password?: string): Promise<LoginResponseDto> {
    const data = await this.send<LoginResponseDto, LoginRequestDto>('loginUser', {
      email: email || this.config.email,
      password: password || this.config.password,
      platform: '',
      platform_user_id: '',
      client_id: `${this.config.region}${Math.floor(new Date().getTime() / 1000)}`,
      app_version: BbeConfig.CURRENT_VERSION,
      device_info: '{"language":"en","pixelAspectRatio":1,"screenDPI":72,"screenResolutionX":1920,"screenResolutionY":1080,"touchscreenType":0,"os":"HTML5","version":"WEB 8,9,5,0"}',
      device_id: 'web',
    });

    this.userId = data.user.id.toString();
    this.userSessionId = data.user.session_id;
    this.locale = data.user.locale;

    return data;
  }

  static async getStandalonePaymentOffers(): Promise<GetStandalonePaymentOffersResponseDto> {
    return this.send<GetStandalonePaymentOffersResponseDto, GetStandalonePaymentOffersRequestDto>('getStandalonePaymentOffers', {
      locale: this.locale,
    });
  }

  static async loginFriendBar(): Promise<LoginFriendBarResponseDto> {
    return this.send<LoginFriendBarResponseDto, LoginFriendBarRequestDto>('loginFriendBar', {
      existing_user_id: this.userId,
      existing_session_id: this.userSessionId,
      platform: 'standalone',
    });
  }

  static async syncGame(force: boolean = false): Promise<SyncGameResponseDto> {
    return this.send<SyncGameResponseDto, SyncGameRequestDto>('syncGame', {
      force_sync: force,
    });
  }

  static async startQuest(id: string): Promise<StartQuestResponseDto> {
    return this.send<StartQuestResponseDto, StartQuestRequestDto>('startQuest', { quest_id: id });
  }

  private static getAuth(action: string, userId: string): string {
    return createHash('md5').update(`${action}${BbeConfig.SALT}${userId}`).digest('hex');
  }
}
