import * as moment from 'moment';

import DataObject from '../utils/dataObject';
import Reward from './reward';
import request from "../../lib/request";

export type herobookObjectiveRaw = {
  id: number;
  ts_end: number;
  character_id: number;
  identifier: string;
  status: herobookObjectiveStatus;
  duration_type: herobookObjectiveDurationType;
  type: herobookObjectiveType;
  current_value: number;
  max_value: number;
  rewards: string;
};

export enum herobookObjectiveType {
  UNKNOWN,
  ITEMS_SEWED,
  WASHING_MACHINE_USED,
  CONVENTION_COMPLETED,
  COMPLETE_DUNGEON_QUEST,
  COMPLETE_DUNGEON,
  DEFEATED_DUNGEON_BOSS,
  TIME_WORKED,
  SHOP_REFRESHED,
  MISSILES_FIRED,
  BUY_STAT_POINTS,
  DUELS_FOUGHT,
  DUELS_WON,
  TIME_QUEST_COMPLETED,
  QUEST_COMPLETED,
  FIGHT_QUEST_WON,
  STAT_QUEST_WON,
  STAMINA_STAT_QUEST_WON,
  STRENGTH_STAT_QUEST_WON,
  CRITICAL_RATING_STAT_QUEST_WON,
  DODGE_RATING_STAT_QUEST_WON,
  ENERGY_USED,
  EVENT_ITEM_COLLECTED_COMMON,
  EVENT_ITEM_COLLECTED_RARE,
  EVENT_ITEM_COLLECTED_EPIC,
  MOVIE_FINISHED,
  MOVIE_QUEST_COMPLETED,
  MOVIE_ENERGY_USED,
}

export enum herobookObjectiveStatus {
  UNKNOWN,
  STARTED,
  FINISHED,
  FINISHED_REWARDS_COLLECTED,
  ABORTED,
}

export enum herobookObjectiveDurationType {
  UNKNOWN,
  DAILY,
  WEEKLY,
}

export default class HerobookObjective extends DataObject<herobookObjectiveRaw> {
  id: number;
  tsEnd: moment.Moment;
  characterId: number;
  identifier: string;
  status: herobookObjectiveStatus;
  durationType: herobookObjectiveDurationType;
  type: herobookObjectiveType;
  currentValue: number;
  maxValue: number;
  rewards: Reward;

  setTsEnd(tsEnd: number) {
    this.tsEnd = moment(tsEnd, 'X');
  }

  setRewards(rewards: string) {
    this.rewards = new Reward(rewards);
  }

  get isFinished() {
    return this.status === herobookObjectiveStatus.FINISHED;
  }

  async collectReward() {
    // return request.collectHerobookReward(this);
  }
}
