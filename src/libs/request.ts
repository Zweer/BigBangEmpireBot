import axios from 'axios';
import { stringify } from 'querystring';
import { classToPlain, plainToClass } from 'class-transformer';
import merge from 'deepmerge';

import config from './config';

import { ResponseDto } from '../dtos/response.dto';
import { InitEnvironmentResponseDto } from '../dtos/init/initEnvironment.response.dto';
import { InitGameResponseDto } from '../dtos/init/initGame.response.dto';
import { InitGameRequestDto } from '../dtos/init/initGame.request.dto';
import { ExtendedConfigDto } from '../dtos/init/extendedConfig.dto';
import { LoginUserResponseDto } from '../dtos/init/loginUser.response.dto';
import { LoginUserRequestDto } from '../dtos/init/loginUser.request.dto';
import { LoginFriendBarResponseDto } from '../dtos/init/loginFriendBar.response.dto';
import { LoginFriendBarRequestDto } from '../dtos/init/loginFriendBar.request.dto';
import { UserFriendDto } from '../dtos/models/userFriend.dto';
import { SyncGameRequestDto } from '../dtos/init/syncGame.request.dto';
import { UpdateGameSessionResponseDto } from '../dtos/init/updateGameSession.response.dto';
import { UpdateGameSessionRequestDto } from '../dtos/init/updateGameSession.request.dto';
import { ClaimQuestRewardsRequestDto } from '../dtos/story/claimQuestRewards.request.dto';
import { ImproveCharacterStatRequestDto } from '../dtos/character/improveCharacterStat.request.dto';

import { Game } from '../models/game';
import { Constants } from '../models/constants';
import { CollectGoalRewardRequestDto } from '../dtos/character/collectGoalReward.request.dto';
import { GetDuelOpponentsResponseDto } from '../dtos/duel/getDuelOpponents.response.dto';
import { Opponent } from '../models/duel/opponent';
import { GetMissedDuelsNewResponseDto } from '../dtos/duel/getMissedDuelsNew.response.dto';
import { GetMissedDuelsNewRequestDto } from '../dtos/duel/getMissedDuelsNew.request.dto';
import { MissedDuel } from '../models/duel/missedDuel';
import { StartDuelResponseDto } from '../dtos/duel/startDuel.response.dto';
import { StartDuelRequestDto } from '../dtos/duel/startDuel.request.dto';
import { Duel } from '../models/duel/duel';

class Request {
  private version: number;

  private uniqueId: string;

  private get userId() { return this.game?.user?.id?.toString() || '0'; }

  private get userSessionId() { return this.game?.user?.session_id || '0'; }

  private localeVersion: string;

  private get locale() { return this.game?.user?.locale || 'en_US'; }

  private swfMainHash: string;

  private swfCharacterHash: string;

  private swfUiHash: string;

  private swfMovieCoverHash: string;

  private game: Game = new Game();

  async init() {
    function matchAndReturn(where: string, what: RegExp): string {
      const [, found] = where.match(what);

      return found;
    }

    const { data: mainJs } = await axios.get(config.getAssetUrl('mainJs'));
    this.version = parseInt(matchAndReturn(mainJs, config.versionRegExp), 10);

    const { data: mainHtml } = await axios.get(config.getUrl('mainHtml'));
    this.uniqueId = matchAndReturn(mainHtml, config.uniqueIdRegExp);
    this.localeVersion = matchAndReturn(mainHtml, config.localeVersionRegExp);
    this.swfMainHash = matchAndReturn(mainHtml, config.swfMainHashRegExp);
    this.swfCharacterHash = matchAndReturn(mainHtml, config.swfCharacterHashRegExp);
    this.swfUiHash = matchAndReturn(mainHtml, config.swfUiHashRegExp);
    this.swfMovieCoverHash = matchAndReturn(mainHtml, config.swfMovieCoverHashRegExp);
  }

  get defaultRequestParams() {
    return {
      platform: null,
      platform_user_id: null,
      client_id: this.uniqueId,
      app_version: this.version,
      device_info: '{"language":"en","pixelAspectRatio":1,"screenDPI":72,"screenResolutionX":1920,"screenResolutionY":1080,"touchscreenType":0,"os":"HTML5","version":"WEB 8,9,7,0"}',
      device_id: 'web',
      user_id: this.userId,
      user_session_id: this.userSessionId,
      client_version: `html5_${this.version}`,
      rct: 1,
      keep_active: true,
      device_type: 'web',
    };
  }

  private async send<U, T extends {} = {}>(action: string, params: T = {} as any, mergeGameObject: boolean = true): Promise<U> {
    const requestParams = {
      action,
      auth: config.getRequestSignature(action, this.userId),
      ...this.defaultRequestParams,
      ...params,
    };

    const { data } = await axios.post<ResponseDto<U>>(config.getUrl('request'), stringify(requestParams));

    if (data.error) {
      throw new Error(`${data.error} while requesting "${action}"`);
    }

    if (mergeGameObject) {
      const newData = data.data;
      const oldData = classToPlain(this.game);
      const mergedData = merge(oldData, newData);
      Object.assign(this.game, plainToClass(Game, mergedData));
    }

    return data.data;
  }

  async initEnvironment(): Promise<InitEnvironmentResponseDto> {
    return this.send('initEnvironment', {}, false);
  }

  async initGame(): Promise<{ constants: Constants, extendedConfig: ExtendedConfigDto }> {
    const data = await this.send<InitGameResponseDto, InitGameRequestDto>('initGame', {
      no_text: true,
      locale_version: this.localeVersion,
      locale: this.locale,
      swf_main_hash: this.swfMainHash,
      swf_character_hash: this.swfCharacterHash,
      swf_ui_hash: this.swfUiHash,
      swf_movie_cover_hash: this.swfMovieCoverHash,
    }, false);

    return {
      constants: plainToClass(Constants, data.constants),
      extendedConfig: data.extendedConfig,
    };
  }

  async loginUser(email: string, password: string): Promise<Game> {
    await this.send<LoginUserResponseDto, LoginUserRequestDto>('loginUser', {
      email,
      password,
    });

    return this.game;
  }

  async getStandalonePaymentOffers(): Promise<void> {
    await this.send('getStandalonePaymentOffers', {
      locale: this.locale,
    }, false);
  }

  async loginFriendBar(): Promise<UserFriendDto[]> {
    const data = await this.send<LoginFriendBarResponseDto, LoginFriendBarRequestDto>('loginFriendBar', {
      existing_session_id: this.userSessionId,
      existing_user_id: this.userId,
      platform: 'standalone',
    }, false);

    return data.friend_data;
  }

  async syncGame(force: boolean = false): Promise<void> {
    await this.send<LoginUserResponseDto, SyncGameRequestDto>('syncGame', { force });
  }

  async updateGameSession(): Promise<void> {
    await this.send<UpdateGameSessionResponseDto, UpdateGameSessionRequestDto>('updateGameSession', {
      connection_type: 2,
    }, false);
  }

  async claimQuestRewards(): Promise<void> {
    await this.send<LoginUserResponseDto, ClaimQuestRewardsRequestDto>('claimQuestRewards', {
      discard_item: false,
      create_new: true,
    });
  }

  async improveCharacterStat(statType: number, skillValue: number = 1): Promise<void> {
    await this.send<LoginUserResponseDto, ImproveCharacterStatRequestDto>('improveCharacterStat', {
      stat_type: statType,
      skill_value: skillValue,
    });
  }

  // DEPRECATED??
  async getGoalItemRewards(identifier: string): Promise<void> {
    await this.send('getGoalItemRewards', {
      identifier,
    });
  }

  async collectGoalReward(identifier: string, value: number): Promise<void> {
    await this.send<LoginUserResponseDto, CollectGoalRewardRequestDto>('collectGoalReward', {
      identifier,
      value,
      discard_item: false,
    });
  }

  async getDuelOpponents(): Promise<Opponent[]> {
    const { opponents } = await this.send<GetDuelOpponentsResponseDto>('getDuelOpponents', {}, false);

    return plainToClass(Opponent, opponents);
  }

  async getMissedDuelsNew(): Promise<MissedDuel[]> {
    const data = await this.send<GetMissedDuelsNewResponseDto, GetMissedDuelsNewRequestDto>('getMissedDuelsNew', { history: false }, false);

    const opponents = plainToClass(Opponent, data.missed_duel_opponents);
    const missedDuels = plainToClass(MissedDuel, data.missed_duel_data);

    missedDuels.forEach((missedDuel) => missedDuel.findOpponent(opponents));

    return missedDuels;
  }

  async claimMissedDuelsRewards(): Promise<void> {
    await this.send('claimMissedDuelsRewards');
  }

  async startDuel(opponentId: number): Promise<Duel> {
    const data = await this.send<StartDuelResponseDto, StartDuelRequestDto>('startDuel', {
      character_id: opponentId,
      use_premium: false,
    });

    const opponent = plainToClass(Opponent, data.opponent);
    const duel = plainToClass(Duel, data.duel);

    duel.opponent = opponent;

    return duel;
  }

  async checkForDuelComplete(): Promise<void> {
    await this.send('checkForDuelComplete');
  }

  async claimDuelRewards(): Promise<void> {
    await this.send<LoginUserResponseDto>('claimDuelRewards', {
      discard_item: false,
    });
  }
}

export default new Request();
