import DataObject from '../utils/dataObject';

export type movieQuestRaw = {
  id: number;
  character_id: number;
  movie_id: number;
  identifier: string;
  type: number;
  stat: number;
  status: number;
  ts_complete: number;
  energy_cost: number;
  fight_difficulty: number;
  fight_npc_identifier: string;
  fight_battle_id: number;
  won: boolean;
  rewards: string;
};

export default class MovieQuest extends DataObject<movieQuestRaw> {
  id: number;
  characterId: number;
  movieId: number;
  identifier: string;
  type: number;
  stat: number;
  status: number;
  tsComplete: number;
  energyCost: number;
  fightDifficulty: number;
  fightNpcIdentifier: string;
  fightBattleId: number;
  won: boolean;
  rewards: string;
}
