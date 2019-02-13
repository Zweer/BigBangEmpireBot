import * as moment from 'moment';

import DataObject from '../utils/dataObject';

export type guildMessageEventRaw = {
  timestamp: number;
  character_id: number;
  character_name: string;
  type: number;
  value1: string;
  value2: string;
  value3: string;
};

export type guildMessageRaw = {
  timestamp: number;
  character_from_name: string;
  character_to_id: number;
  is_officer: number;
  is_private: number;
  message: string;
};

export enum guildMessageType {
  MEMBER_JOINED = 1,
  MEMBER_LEFT = 2,
  MEMBER_KICKED = 3,
  MEMBER_NEW_RANK = 4,
  MEMBER_DONATED = 5,
  GUILD_STAT_CHANGED = 6,
  GUILD_DESCRIPTION_CHANGED = 7,
  GUILD_NOTE_CHANGED = 8,
  GUILD_EMBLEM_CHANGED = 9,
  GUILD_MEMBER_DELETED = 10,
  GUILD_MISSILES_RECHARGED = 11,
  GUILD_NAME_CHANGED = 12,
  GUILD_ARENA_CHANGED = 13,
  AUTO_JOINS_RECHARGED = 14,
  ARTIFACT_RELEASED = 15,
  GUILD_LOCALE_CHANGED = 16,
  GUILD_BATTLE_ATTACK = 101,
  GUILD_BATTLE_DEFENSE = 102,
  GUILD_BATTLE_WON = 105,
  GUILD_BATTLE_LOST = 106,
  GUILD_BATTLE_ARTIFACT_WON = 107,
  GUILD_BATTLE_ARTIFACT_LOST = 108,
  GUILD_BATTLE_ABORTED_ATTACK = 109,
  GUILD_BATTLE_ABORTED_DEFENSE = 110,
  GUILD_BATTLE_PREMIUM_CURRENCY_REWARD = 111,
  VOTEOUT_STARTED = 301,
  VOTEOUT_ENDED_SAME = 302,
  VOTEOUT_ENDED_NEW = 303,
  GUILD_COMPETITION_FINISHED = 401,
  GUILD_COMPETITION_FINISHED_NO_REWARDS = 402,
  GUILD_COMPETITION_FINISHED_NO_RANK = 403,
  SLOTMACHINE_REWARD_GAME_CURRENCY = 501,
  SLOTMACHINE_REWARD_ITEM = 502,
  SLOTMACHINE_REWARD_BOOSTER = 503,
  SLOTMACHINE_REWARD_STAT_POINTS = 504,
  SLOTMACHINE_REWARD_XP = 505,
  SLOTMACHINE_REWARD_ENERGY = 506,
  BOOSTER_BOUGHT = 601,
  BOOSTER_EXTENDED = 602,
  BOOSTER_EXPIRED = 603,
}

export default class GuildMessage extends DataObject<guildMessageEventRaw | guildMessageRaw> {
  id: string;

  timestamp: moment.Moment;

  characterId: number;
  characterName: string;
  type: number;
  value1: string;
  value2: string;
  value3: string;

  characterToId: number;
  isOfficer: boolean;
  isPrivate: boolean;
  message: string;

  constructor(guildMessage: guildMessageEventRaw | guildMessageRaw, id: string) {
    super(guildMessage);

    this.id = id.split('_').pop();
  }

  setTimestamp(timestamp: number) {
    this.timestamp = moment(timestamp, 'X');
  }

  setIsOfficer(isOfficer: number) {
    this.isOfficer = isOfficer === 1;
  }

  setIsPrivate(isPrivate: number) {
    this.isPrivate = isPrivate === 1;
  }

  setCharacterFromName(characterFromName: string) {
    this.characterName = characterFromName;
  }

  setCharacterFromId(characterFromId: number) {
    this.characterId = characterFromId;
  }

  get isEvent() {
    return !!this.type;
  }

  get isEmote() {
    return !this.isEvent && this.message.toLowerCase().startsWith('/me');
  }

  toString() {
    if (this.isEvent) {
      switch (this.type) {
        default:
          return `[${guildMessageType[this.type]}] ${this.characterName}`;
      }
    }

    if (this.isOfficer) {
      return `[OFF] ${this.characterName}: ${this.message}`;
    }

    if (this.isPrivate) {
      return `[PVT] ${this.characterName}: ${this.message}`;
    }

    return `${this.characterName}: ${this.message}`;
  }
}
