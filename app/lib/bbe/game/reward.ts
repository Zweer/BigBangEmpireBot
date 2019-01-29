import { itemQuality } from './types/common';

import DataObject from './utils/dataObject';

export type rewardRaw = {
  xp: number;
  coins: number;
  honor: number;
  premium: number;
  item: number;
  dungeon_key: boolean;
  movie_votes: number;
  title: string;
  improvement_point: number;
  movie_progress: number;
  story_dungeon_point: number;
  repeat_story_dungeon_index: number;
  optical_change_resource: number;
  fan_foto_resource: number;
  event_item: string;
  herobook_item_common: string;
  herobook_item_rare: string;
  herobook_item_epic: string;
  slotmachine_jetons: number;
  quest_energy: number;
  statPoints: number;
  artifact_id: number;
  artifact_stolen: boolean;
  missiles: number;
  dating_item: string;
  repeat_dating_index: number;
  guild_competition_item: string;
};

export default class Reward extends DataObject<rewardRaw> {
  readonly xp: number;
  readonly coins: number;
  readonly honor: number;
  readonly premium: number;
  readonly item: number;
  readonly dungeonKey: boolean;
  readonly movieVotes: number;
  readonly title: string;
  readonly improvementPoint: number;
  readonly movieProgress: number;
  readonly storyDungeonPoint: number;
  readonly repeatStoryDungeonIndex: number;
  readonly opticalChangeResource: number;
  readonly fanFotoResource: number;
  readonly eventItem: string;
  readonly herobookItemCommon: string;
  readonly herobookItemRare: string;
  readonly herobookItemEpic: string;
  readonly slotmachineJetons: number;
  readonly questEnergy: number;
  readonly statPoints: number;
  readonly artifactId: number;
  readonly artifactStolen: boolean;
  readonly missiles: number;
  readonly datingItem: string;
  readonly repeatDatingIndex: number;
  readonly guildCompetitionItem: string;

  readonly nonStandardAttributes: string[];

  static STANDARD_ATTRIBUTES = ['coins', 'xp', 'honor', 'premium', 'statPoints'];

  constructor(rewardString: string) {
    const rewardRaw: rewardRaw = JSON.parse(rewardString);

    super(rewardRaw);

    this.nonStandardAttributes = Object.keys(rewardRaw)
      .filter(key => !Reward.STANDARD_ATTRIBUTES.includes(key))
      .filter(key => !!rewardRaw[key]);
  }

  get herobookItem(): string {
    if (this.herobookItemCommon) {
      return this.herobookItemCommon;
    }

    if (this.herobookItemRare) {
      return this.herobookItemRare;
    }

    if (this.herobookItemEpic) {
      return this.herobookItemEpic;
    }

    return null;
  }

  get herobookItemQuality(): number {
    if (this.herobookItemCommon) {
      return itemQuality.COMMON;
    }

    if (this.herobookItemRare) {
      return itemQuality.RARE;
    }

    if (this.herobookItemEpic) {
      return itemQuality.EPIC;
    }

    return itemQuality.COMMON;
  }
}
