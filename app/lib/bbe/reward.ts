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
}

export default class Reward {
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

  constructor(rewardString: string) {
    const reward: rewardRaw = JSON.parse(rewardString);

    this.xp = reward.xp;
    this.coins = reward.coins;
    this.honor = reward.honor;
    this.premium = reward.premium;
    this.item = reward.item;
    this.dungeonKey = reward.dungeon_key;
    this.movieVotes = reward.movie_votes;
    this.title = reward.title;
    this.improvementPoint = reward.improvement_point;
    this.movieProgress = reward.movie_progress;
    this.storyDungeonPoint = reward.story_dungeon_point;
    this.repeatStoryDungeonIndex = reward.repeat_story_dungeon_index;
    this.opticalChangeResource = reward.optical_change_resource;
    this.fanFotoResource = reward.fan_foto_resource;
    this.eventItem = reward.event_item;
    this.herobookItemCommon = reward.herobook_item_common;
    this.herobookItemRare = reward.herobook_item_rare;
    this.herobookItemEpic = reward.herobook_item_epic;
    this.slotmachineJetons = reward.slotmachine_jetons;
    this.questEnergy = reward.quest_energy;
    this.statPoints = reward.statPoints;
    this.artifactId = reward.artifact_id;
    this.artifactStolen = reward.artifact_stolen;
    this.missiles = reward.missiles;
    this.datingItem = reward.dating_item;
    this.repeatDatingIndex = reward.repeat_dating_index;
    this.guildCompetitionItem = reward.guild_competition_item;
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
      return 1;
    }

    if (this.herobookItemRare) {
      return 2;
    }

    if (this.herobookItemEpic) {
      return 3;
    }

    return 1;
  }
}
