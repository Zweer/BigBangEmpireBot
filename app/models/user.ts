import DataObject from './utils/dataObject';

export type userRaw = {
  id: number;
  session_id: string;
  email: string;
  geo_country_code: string;
  network: string;
  locale: string;
  registration_source: string;
  ts_creation: number;
  confirmed: boolean;
  premium_currency: number;
  settings: string;
};

export class User extends DataObject<userRaw> {
  id: number;
  sessionId: string;
  email: string;
  geoCountryCode: string;
  network: string;
  locale: string;
  registrationSource: string;
  tsCreation: number;
  confirmed: boolean;
  premiumCurrency: number;
  settings: string;
}

export default new User();
