import DataObject from '../utils/dataObject';
import game from "../game";
import request from "../../lib/request";

export type guildRaw = {
  id: number;
  ts_creation: number;
  initiator_character_id: number;
  leader_character_id: number;
  name: string;
  description: string;
  note: string;
  forum_page: string;
  premium_currency: number;
  game_currency: number;
  status: number;
  accept_members: boolean;
  locale: string;
  pending_guild_battle_attack_id: number;
  pending_guild_battle_defense_id: number;
  honor: number;
  artifact_ids: string;
  missiles: number;
  auto_joins: number;
  battles_fought: number;
  battles_attacked: number;
  battles_defended: number;
  battles_won: number;
  battles_lost: number;
  artifacts_won: number;
  artifacts_lost: number;
  artifacts_owned_max: number;
  artifacts_owned_current: number;
  ts_last_artifact_released: number;
  missiles_fired: number;
  auto_joins_used: number;
  stat_points_available: number;
  stat_guild_capacity: number;
  stat_character_base_stats_boost: number;
  stat_quest_xp_reward_boost: number;
  stat_quest_game_currency_reward_boost: number;
  arena_background: number;
  emblem_background_shape: number;
  emblem_background_color: number;
  emblem_background_border_color: number;
  emblem_icon_shape: number;
  emblem_icon_color: number;
  emblem_icon_size: number;
  studio_room: string;
  studio_quarter: string;
  studio_popularity: string;
  studio_motivation: string;
  studio_equipment: string;
  studio_actors_left: string;
  studio_actors_right: string;
  studio_free_customizations: string;
  use_missiles_attack: boolean;
  use_missiles_defense: boolean;
  use_auto_joins_attack: boolean;
  use_auto_joins_defense: boolean;
  pending_leader_vote_id: number;
  min_apply_level: number;
  min_apply_honor: number;
  apply_open: boolean;
  apply_open_mail: boolean;
  movies: number;
  fans: number;
  active_quest_booster_id: string;
  ts_active_quest_boost_expires: number;
  active_duel_booster_id: string;
  ts_active_duel_boost_expires: number;
};

export class Guild extends DataObject<guildRaw> {
  id: number;
  tsCreation: number;
  initiatorCharacterId: number;
  leaderCharacterId: number;
  name: string;
  description: string;
  note: string;
  forumPage: string;
  premiumCurrency: number;
  gameCurrency: number;
  status: number;
  acceptMembers: boolean;
  locale: string;
  pendingGuildBattleAttackId: number;
  pendingGuildBattleDefenseId: number;
  honor: number;
  artifactIds: string;
  missiles: number;
  autoJoins: number;
  battlesFought: number;
  battlesAttacked: number;
  battlesDefended: number;
  battlesWon: number;
  battlesLost: number;
  artifactsWon: number;
  artifactsLost: number;
  artifactsOwnedMax: number;
  artifactsOwnedCurrent: number;
  tsLastArtifactReleased: number;
  missilesFired: number;
  autoJoinsUsed: number;
  statPointsAvailable: number;
  statGuildCapacity: number;
  statCharacterBaseStatsBoost: number;
  statQuestXpRewardBoost: number;
  statQuestGameCurrencyRewardBoost: number;
  arenaBackground: number;
  emblemBackgroundShape: number;
  emblemBackgroundColor: number;
  emblemBackgroundBorderColor: number;
  emblemIconShape: number;
  emblemIconColor: number;
  emblemIconSize: number;
  studioRoom: string;
  studioQuarter: string;
  studioPopularity: string;
  studioMotivation: string;
  studioEquipment: string;
  studioActorsLeft: string;
  studioActorsRight: string;
  studioFreeCustomizations: string;
  useMissilesAttack: boolean;
  useMissilesDefense: boolean;
  useAutoJoinsAttack: boolean;
  useAutoJoinsDefense: boolean;
  pendingLeaderVoteId: number;
  minApplyLevel: number;
  minApplyHonor: number;
  applyOpen: boolean;
  applyOpenMail: boolean;
  movies: number;
  fans: number;
  activeQuestBoosterId: string;
  tsActiveQuestBoostExpires: number;
  activeDuelBoosterId: string;
  tsActiveDuelBoostExpires: number;

  get statTotal() {
    return this.statGuildCapacity + this.statCharacterBaseStatsBoost + this.statQuestXpRewardBoost + this.statQuestGameCurrencyRewardBoost;
  }

  async joinGuildBattleAttack() {
    if (this.pendingGuildBattleAttackId && !game.pendingGuildBattleAttack) {
      return request.joinGuildBattle(true);
    }
  }

  async joinGuildBattleDefence() {
    if (this.pendingGuildBattleDefenseId && !game.pendingGuildBattleDefense) {
      return request.joinGuildBattle(false);
    }
  }
}

export default new Guild();
