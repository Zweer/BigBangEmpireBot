import { EnvSchema, EnvType, load } from 'ts-dotenv';

const schema: EnvSchema = {
  AUTH_REGION: /^(de|uk|es|fr|gr|pl|tr|it|ru|br|us|int)\d$/,
  AUTH_EMAIL: String,
  AUTH_PASSWORD: String,
  TELEGRAM_TOKEN: String,
  TELEGRAM_ID: String,
};

type BasePathNames = 'request';
type BasePaths = { [key in BasePathNames]: string };

type AssetPathNames = 'mainJs';
type AssetPaths = { [key in AssetPathNames]: string };

class Config {
  env: EnvType<typeof schema>;

  static BASE_URL: string = 'https://{REGION}.bigbangempire.com';

  static BASE_PATHS: BasePaths = {
    request: '',
  };

  static ASSET_URL: string = 'https://bbe-static.akamaized.net';

  static ASSET_PATHS: AssetPaths = {
    mainJs: 'assets/html5/BBE.min.js',
  };

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
}

export default new Config();
