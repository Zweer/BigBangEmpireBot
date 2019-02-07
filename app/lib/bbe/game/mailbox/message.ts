import * as moment from 'moment';

import MessageCharacter from './character';

import DataObject from '../utils/dataObject';

export type messageRaw = {
  id: number;
  ts_creation: number;
  character_from_id: number;
  character_to_ids: string;
  subject: string;
  message: string;
  flag: string;
  flag_value: string;
};

export enum messageFlag {
  TEAM_MAIL = 'team_mail',
  GUILD_INVITATION = 'guild_invitation',
  GUILD_APPLICATION = 'guild_application',
  SYSTEM_TEAM_MAIL = 'system_team_mail',
  ITEM = 'item',
  ITEM_HTML = 'item_html',
  PARTNER_AD = 'partner_ad',
  PARTNER_AD_HTML = 'partner_ad_html',
}

export default class Message extends DataObject<messageRaw> {
  id: number;
  tsCreation: moment.Moment;
  characterFromId: number;
  characterToIds: string;
  subject: string;
  message: string;
  flag: messageFlag;
  flagValue: string;
  character: MessageCharacter;

  constructor(data: messageRaw, messageCharacters: { [key: string]: MessageCharacter }) {
    super(data);

    this.character = messageCharacters[this.characterFromId];
  }

  setTsCreation(tsCreation: number) {
    this.tsCreation = moment(tsCreation, 'X');
  }

  get sender() {
    if (this.character) {
      return this.character.name;
    }

    if (this.isTeamMail) {
      return '👨';
    }

    if (this.isSystemTeamMail) {
      return '💻';
    }

    if (this.isItemMail) {
      return '🛍️';
    }

    return '📧';
  }

  get isTeamMail() {
    return this.flag === messageFlag.TEAM_MAIL;
  }

  get isSystemTeamMail() {
    return this.flag === messageFlag.GUILD_INVITATION || this.flag === messageFlag.GUILD_APPLICATION || this.flag === messageFlag.SYSTEM_TEAM_MAIL;
  }

  get isItemMail() {
    return this.flag === messageFlag.ITEM || this.flag === messageFlag.ITEM_HTML;
  }
}
