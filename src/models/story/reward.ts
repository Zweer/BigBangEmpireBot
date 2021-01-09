export class Reward {
  static STANDARD_ATTRIBUTES = ['coins', 'xp', 'honor', 'premium', 'statPoints', 'item'];

  coins: number;

  xp: number;

  honor: number;

  premium: number;

  statPoints: number;

  item: number;

  dungeon_key: boolean;

  movie_votes: number;

  title: string;

  improvement_point: number;

  movie_progress: number;

  story_dungeon_point: number;

  repeat_story_dungeon_index: number;

  optical_change_resource: number;

  streaming_resource: number;

  fans: number;

  fan_foto_resource: number;

  event_item: string;

  herobook_item_common: string;

  herobook_item_rare: string;

  herobook_item_epic: string;

  slotmachine_jetons: number;

  quest_energy: number;

  artifact_id: number;

  artifact_stolen: boolean;

  missiles: number;

  dating_item: string;

  repeat_dating_index: number;

  guild_competition_item: string;

  get nonStandardAttributes(): string[] {
    return Object.keys(this)
      .filter((key) => !Reward.STANDARD_ATTRIBUTES.includes(key))
      .filter((key) => !!this[key]);
  }
}
