import { BbeRequest } from '../bbe.request';

import { LoginResponseDto } from '../dto/pre/login.response.dto';
import { GetStandalonePaymentOffersResponseDto } from '../dto/pre/getStandalonePaymentOffers.response.dto';
import { LoginFriendBarResponseDto } from '../dto/pre/loginFriendBar.response.dto';

import { User } from './user';
import { Character } from './character';
import { ConfigGameResponseDto } from '../dto/config/config.game.response.dto';

export class Game {
  // @ts-ignore
  private readonly constants: ConfigGameResponseDto['constants'];
  // @ts-ignore
  private readonly extendedConfig: ConfigGameResponseDto['extendedConfig'];

  private readonly user: User;
  private readonly character: Character;

  constructor(
    { constants, extendedConfig }: ConfigGameResponseDto,
    game: LoginResponseDto,
    _offers: GetStandalonePaymentOffersResponseDto,
    _friends: LoginFriendBarResponseDto,
  ) {
    this.constants = constants;
    this.extendedConfig = extendedConfig;

    this.user = Object.assign(new User(), game.user);
    this.character = Object.assign(new Character(), game.character);
  }

  async sync() {
    const game = await BbeRequest.syncGame();

    Object.assign(this.user, game.user || {});
    Object.assign(this.character, game.character || {});
  }

  static async create(): Promise<Game> {
    return new Game(
      await BbeRequest.initGame(),
      await BbeRequest.loginUser(),
      await BbeRequest.getStandalonePaymentOffers(),
      await BbeRequest.loginFriendBar(),
    );
  }
}
