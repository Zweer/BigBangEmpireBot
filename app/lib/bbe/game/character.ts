import * as moment from 'moment';

import { resource } from './types/common';

import AbstractCharacter, { abstractCharacterRaw } from './abstracts/character';

export type characterRaw = abstractCharacterRaw & {
  user_id: number,
  locale: string,
  sexuality: string,
  title: string,
  game_currency: number,
  xp: number,
  level: number,
  description: string,
  note: string,
  ts_last_action: number,
  score_honor: number,
  score_level: number,
  score_fans: number,
  stat_points_available: number,
  stat_base_stamina: number,
  stat_base_strength: number,
  stat_base_critical_rating: number,
  stat_base_dodge_rating: number,
  stat_total_stamina: number,
  stat_total_strength: number,
  stat_total_critical_rating: number,
  stat_total_dodge_rating: number,
  stat_weapon_damage: number,
  stat_total: number,
  stat_bought_stamina: number,
  stat_bought_strength: number,
  stat_bought_critical_rating: number,
  stat_bought_dodge_rating: number,
  active_quest_booster_id: string,
  ts_active_quest_boost_expires: number,
  active_stats_booster_id: string,
  ts_active_stats_boost_expires: number,
  active_work_booster_id: string,
  ts_active_work_boost_expires: number,
  ts_active_sense_boost_expires: number,
  ts_active_multitasking_boost_expires: number,
  max_quest_stage: number,
  current_quest_stage: number,
  current_location: number,
  quest_energy: number,
  max_quest_energy: number,
  ts_last_quest_energy_refill: number,
  quest_energy_refill_amount_today: number,
  active_quest_id: number,
  quest_pool: string,
  honor: number,
  ts_last_duel: number,
  active_duel_id: number,
  duel_stamina: number,
  max_duel_stamina: number,
  ts_last_duel_stamina_change: number,
  duel_stamina_cost: number,
  ts_last_duel_enemies_refresh: number,
  current_work_offer_id: string,
  ts_last_work_collection: number,
  active_convention_show_id: number,
  ts_dungeon_key_found: number,
  active_dungeon_quest_id: number,
  ts_last_dungeon_quest: number,
  last_dungeon_quest_lost: boolean,
  active_dungeon_id: number,
  ts_last_dungeon_started: number,
  appearance_skin_color: number,
  appearance_hair_type: number,
  appearance_hair_color: number,
  appearance_head_type: number,
  appearance_eyes_type: number,
  appearance_eyebrows_type: number,
  appearance_eyebrows_color: number,
  appearance_nose_type: number,
  appearance_mouth_type: number,
  appearance_facial_hair_type: number,
  appearance_facial_hair_color: number,
  appearance_decoration_type: number,
  show_head_item: boolean,
  show_chest_item_unlocked: boolean,
  show_chest_item: boolean,
  show_belt_item_unlocked: boolean,
  show_belt_item: boolean,
  show_legs_item_unlocked: boolean,
  show_legs_item: boolean,
  show_boots_item_unlocked: boolean,
  show_boots_item: boolean,
  appearance_photo_rect_type: number,
  appearance_photo_border_type: number,
  appearance_photo_background_type: number,
  appearance_photo_filter_type: number,
  appearance_photo_icon_type: number,
  appearance_photo_sexuality_type: number,
  appearance_tattoo_arm_left: number,
  appearance_tattoo_arm_right: number,
  appearance_tattoo_body: number,
  appearance_tattoo_leg_left: number,
  appearance_tattoo_leg_right: number,
  appearance_bra_type: number,
  appearance_panties_type: number,
  appearance_genitals_type: number,
  appearance_genitals_hair_type: number,
  appearance_genitals_hair_color: number,
  avatar_image: string,
  tutorial_flags: string,
  storygoal: string,
  guild_id: number,
  guild_rank: number,
  finished_guild_battle_attack_id: number,
  finished_guild_battle_defense_id: number,
  guild_donated_game_currency: number,
  guild_donated_premium_currency: number,
  guild_competition_points_gathered: number,
  pending_guild_competition_tournament_rewards: number,
  pending_solo_guild_competition_tournament_rewards: number,
  convention_id: number,
  convention_show_count: number,
  convention_show_identifier: string,
  convention_show_reward: number,
  ts_last_wash_item: number,
  ts_last_daily_login_bonus: number,
  daily_login_bonus_day: number,
  pending_tournament_rewards: number,
  ts_last_shop_refresh: number,
  max_free_shop_refreshes: number,
  shop_refreshes: number,
  movie_energy: number,
  max_movie_energy: number,
  ts_last_movie_energy_change: number,
  movie_pool: string,
  movie_id: number,
  movies: number,
  fans: number,
  ts_last_movie_finished: number,
  movies_started_today: number,
  movie_votes: number,
  selected_movie_id: number,
  selectable_movies_count: number,
  pending_movie_tournament_rewards: number,
  friend_data: string,
  pending_resource_requests: number,
  unused_resources: string,
  used_resources: string,
  battle_data: string,
  ts_last_customize_item: number,
  pending_customize_item: string,
  current_story_dungeon_index: number,
  active_story_dungeon_attack_id: number,
  current_repeat_story_dungeon_id: number,
  active_repeat_story_dungeon_attack_id: number,
  event_quest_id: number,
  current_energy_storage: number,
  current_slotmachine_spin: number,
  slotmachine_spin_count: number,
  ts_last_slotmachine_refill: number,
  new_user_voucher_ids: string,
  herobook_objectives_renewed_today: number,
};

type resources = {
  [resource.QUEST_REDUCTION]: number,
  [resource.SLOTMACHINE]: number,
  [resource.SLOTMACHINE_JETON]: number,
};

export default class Character extends AbstractCharacter<characterRaw> {
  userId: number;
  locale: string;
  sexuality: string;
  title: string;
  gameCurrency: number;
  xp: number;
  level: number;
  description: string;
  note: string;
  tsLastAction: number;
  scoreHonor: number;
  scoreLevel: number;
  scoreFans: number;
  statPointsAvailable: number;
  statBaseStamina: number;
  statBaseStrength: number;
  statBaseCriticalRating: number;
  statBaseDodgeRating: number;
  statTotalStamina: number;
  statTotalStrength: number;
  statTotalCriticalRating: number;
  statTotalDodgeRating: number;
  statWeaponDamage: number;
  statTotal: number;
  statBoughtStamina: number;
  statBoughtStrength: number;
  statBoughtCriticalRating: number;
  statBoughtDodgeRating: number;
  activeQuestBoosterId: string;
  tsActiveQuestBoostExpires: number;
  activeStatsBoosterId: string;
  tsActiveStatsBoostExpires: number;
  activeWorkBoosterId: string;
  tsActiveWorkBoostExpires: number;
  tsActiveSenseBoostExpires: number;
  tsActiveMultitaskingBoostExpires: number;
  maxQuestStage: number;
  currentQuestStage: number;
  currentLocation: number;
  questEnergy: number;
  maxQuestEnergy: number;
  tsLastQuestEnergyRefill: number;
  questEnergyRefillAmountToday: number;
  activeQuestId: number;
  questPool: string;
  honor: number;
  tsLastDuel: number;
  activeDuelId: number;
  duelStamina: number;
  maxDuelStamina: number;
  tsLastDuelStaminaChange: number;
  duelStaminaCost: number;
  tsLastDuelEnemiesRefresh: number;
  currentWorkOfferId: string;
  tsLastWorkCollection: moment.Moment;
  activeConventionShowId: number;
  tsDungeonKeyFound: number;
  activeDungeonQuestId: number;
  tsLastDungeonQuest: number;
  lastDungeonQuestLost: boolean;
  activeDungeonId: number;
  tsLastDungeonStarted: number;
  appearanceSkinColor: number;
  appearanceHairType: number;
  appearanceHairColor: number;
  appearanceHeadType: number;
  appearanceEyesType: number;
  appearanceEyebrowsType: number;
  appearanceEyebrowsColor: number;
  appearanceNoseType: number;
  appearanceMouthType: number;
  appearanceFacialHairType: number;
  appearanceFacialHairColor: number;
  appearanceDecorationType: number;
  showHeadItem: boolean;
  showChestItemUnlocked: boolean;
  showChestItem: boolean;
  showBeltItemUnlocked: boolean;
  showBeltItem: boolean;
  showLegsItemUnlocked: boolean;
  showLegsItem: boolean;
  showBootsItemUnlocked: boolean;
  showBootsItem: boolean;
  appearancePhotoRectType: number;
  appearancePhotoBorderType: number;
  appearancePhotoBackgroundType: number;
  appearancePhotoFilterType: number;
  appearancePhotoIconType: number;
  appearancePhotoSexualityType: number;
  appearanceTattooArmLeft: number;
  appearanceTattooArmRight: number;
  appearanceTattooBody: number;
  appearanceTattooLegLeft: number;
  appearanceTattooLegRight: number;
  appearanceBraType: number;
  appearancePantiesType: number;
  appearanceGenitalsType: number;
  appearanceGenitalsHairType: number;
  appearanceGenitalsHairColor: number;
  avatarImage: string;
  tutorialFlags: string;
  storygoal: string;
  guildId: number;
  guildRank: number;
  finishedGuildBattleAttackId: number;
  finishedGuildBattleDefenseId: number;
  guildDonatedGameCurrency: number;
  guildDonatedPremiumCurrency: number;
  guildCompetitionPointsGathered: number;
  pendingGuildCompetitionTournamentRewards: number;
  pendingSoloGuildCompetitionTournamentRewards: number;
  conventionId: number;
  conventionShowCount: number;
  conventionShowIdentifier: string;
  conventionShowReward: number;
  tsLastWashItem: number;
  tsLastDailyLoginBonus: number;
  dailyLoginBonusDay: number;
  pendingTournamentRewards: number;
  tsLastShopRefresh: moment.Moment;
  maxFreeShopRefreshes: number;
  shopRefreshes: number;
  movieEnergy: number;
  maxMovieEnergy: number;
  tsLastMovieEnergyChange: number;
  moviePool: string;
  movieId: number;
  movies: number;
  fans: number;
  tsLastMovieFinished: moment.Moment;
  moviesStartedToday: number;
  movieVotes: number;
  selectedMovieId: number;
  selectableMoviesCount: number;
  pendingMovieTournamentRewards: number;
  friendData: string;
  pendingResourceRequests: number;
  unusedResources: resources;
  usedResources: resources;
  battleData: string;
  tsLastCustomizeItem: number;
  pendingCustomizeItem: string;
  currentStoryDungeonIndex: number;
  activeStoryDungeonAttackId: number;
  currentRepeatStoryDungeonId: number;
  activeRepeatStoryDungeonAttackId: number;
  eventQuestId: number;
  currentEnergyStorage: number;
  currentSlotmachineSpin: number;
  slotmachineSpinCount: number;
  tsLastSlotmachineRefill: number;
  newUserVoucherIds: string;
  herobookObjectivesRenewedToday: number;

  setUnusedResources(unusedResources: string) {
    if (unusedResources && typeof unusedResources === 'string') {
      this.unusedResources = JSON.parse(unusedResources);
    }
  }

  setUsedResources(usedResources: string) {
    if (usedResources && typeof usedResources === 'string') {
      this.usedResources = JSON.parse(usedResources);
    }
  }

  setTsLastWorkCollection(tsLastWorkCollection: number) {
    this.tsLastWorkCollection = moment(tsLastWorkCollection, 'X');
  }

  setTsLastMovieFinished(tsLastMovieFinished: number) {
    this.tsLastMovieFinished = moment(tsLastMovieFinished, 'X');
  }

  setTsLastShopRefresh(tsLastShopRefresh: number) {
    this.tsLastShopRefresh = moment(tsLastShopRefresh, 'X');
  }

  get hasRefreshedShopToday() {
    return this.tsLastShopRefresh.isSame(moment(), 'day');
  }
}
