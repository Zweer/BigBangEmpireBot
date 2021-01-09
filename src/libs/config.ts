import { EnvSchema, EnvType, load } from 'ts-dotenv';
import {createHash} from "crypto";

const schema: EnvSchema = {
  AUTH_REGION: /^(de|uk|es|fr|gr|pl|tr|it|ru|br|us|int)\d$/,
  AUTH_EMAIL: String,
  AUTH_PASSWORD: String,
  TELEGRAM_TOKEN: String,
  TELEGRAM_ID: String,
};

type BasePathNames = 'request' | 'mainHtml';
type BasePaths = { [key in BasePathNames]: string };

type AssetPathNames = 'mainJs';
type AssetPaths = { [key in AssetPathNames]: string };

class Config {
  env: EnvType<typeof schema>;

  static BASE_URL: string = 'https://{REGION}.bigbangempire.com';

  static BASE_PATHS: BasePaths = {
    mainHtml: '',
    request: 'request.php',
  };

  static ASSET_URL: string = 'https://bbe-static.akamaized.net';

  static ASSET_PATHS: AssetPaths = {
    mainJs: 'assets/html5/BBE.min.js',
  };

  versionRegExp: RegExp = /this.clientVersion ?= ?(\d+)/;

  uniqueIdRegExp: RegExp = /uniqueId: ?"(\w+)",?/;

  localeVersionRegExp: RegExp = /localeVersion: ?"(\w+)",?/;

  localeRegExp: RegExp = /default_locale: ?"(\w+)",?/;

  swfMainHashRegExp: RegExp = /urlSwfMain: ?".+\?(\w+)",?/;

  swfCharacterHashRegExp: RegExp = /urlSwfCharacter: ?".+\?(\w+)",?/;

  swfUiHashRegExp: RegExp = /urlSwfUi: ?".+\?(\w+)",?/;

  swfMovieCoverHashRegExp: RegExp = /urlSwfMovieCover: ?".+\?(\w+)",?/;

  private salt: string = 'bpHgj5214';

  constructor() {
    this.env = load(schema);
  }

  get auth() {
    const { env } = this;

    return {
      get region() { return env.AUTH_REGION; },
      get email() { return env.AUTH_EMAIL; },
      get password() { return env.AUTH_PASSWORD; },
    };
  }

  get telegram() {
    const { env } = this;

    return {
      get token() { return env.TELEGRAM_TOKEN; },
      get id() { return env.TELEGRAM_ID; },
    };
  }

  getUrl(path: BasePathNames) {
    return `${Config.BASE_URL.replace('{REGION}', this.auth.region)}/${Config.BASE_PATHS[path]}`;
  }

  // eslint-disable-next-line class-methods-use-this
  getAssetUrl(path: AssetPathNames) {
    return `${Config.ASSET_URL}/${Config.ASSET_PATHS[path]}`;
  }

  getRequestSignature(action: string, userId: string) {
    return createHash('md5').update(`${action}${this.salt}${userId}`).digest('hex');
  }
}

export default new Config();
