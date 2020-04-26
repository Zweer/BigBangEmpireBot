import { BbeRequest } from './bbe.request';

import { ConfigGameResponseDto } from './dto/config/config.game.response.dto';
import { LoginResponseDto } from './dto/pre/login.response.dto';
import { GetStandalonePaymentOffersResponseDto } from './dto/pre/getStandalonePaymentOffers.response.dto';
import { LoginFriendBarResponseDto } from './dto/pre/loginFriendBar.response.dto';

export class BigBangEmpire {
  private readonly request: BbeRequest;

  private constants: ConfigGameResponseDto['constants'];
  private extendedConfig: ConfigGameResponseDto['extendedConfig'];
  private game: LoginResponseDto;
  private offers: GetStandalonePaymentOffersResponseDto;
  private friends: LoginFriendBarResponseDto;

  constructor() {
    this.request = new BbeRequest();
  }

  async start(): Promise<void> {
    const { constants, extendedConfig } = await this.request.initGame();
    this.constants = constants;
    this.extendedConfig = extendedConfig;

    this.game = await this.request.loginUser();
    this.offers = await this.request.getStandalonePaymentOffers();
    this.friends = await this.request.loginFriendBar();

    await this.play();
  }

  async play(): Promise<void> {

  }
}
