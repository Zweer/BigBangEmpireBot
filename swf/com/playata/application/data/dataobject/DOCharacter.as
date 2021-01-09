package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOCharacter extends DataObject
   {
       
      
      public function DOCharacter(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get userId() : int
      {
         return getInt("user_id");
      }
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get locale() : String
      {
         return getString("locale");
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get sexuality() : String
      {
         return getString("sexuality");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get gameCurrency() : int
      {
         return getInt("game_currency");
      }
      
      public function get xp() : int
      {
         return getInt("xp");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get description() : String
      {
         return getString("description");
      }
      
      public function get note() : String
      {
         return getString("note");
      }
      
      public function get tsLastAction() : int
      {
         return getInt("ts_last_action");
      }
      
      public function get onlineStatus() : int
      {
         return getInt("online_status");
      }
      
      public function get scoreHonor() : int
      {
         return getInt("score_honor");
      }
      
      public function get scoreLevel() : int
      {
         return getInt("score_level");
      }
      
      public function get scoreFans() : int
      {
         return getInt("score_fans");
      }
      
      public function get statPointsAvailable() : int
      {
         return getInt("stat_points_available");
      }
      
      public function get statBaseStamina() : int
      {
         return getInt("stat_base_stamina");
      }
      
      public function get statBaseStrength() : int
      {
         return getInt("stat_base_strength");
      }
      
      public function get statBaseCriticalRating() : int
      {
         return getInt("stat_base_critical_rating");
      }
      
      public function get statBaseDodgeRating() : int
      {
         return getInt("stat_base_dodge_rating");
      }
      
      public function get statTotalStamina() : int
      {
         return getInt("stat_total_stamina");
      }
      
      public function get statTotalStrength() : int
      {
         return getInt("stat_total_strength");
      }
      
      public function get statTotalCriticalRating() : int
      {
         return getInt("stat_total_critical_rating");
      }
      
      public function get statTotalDodgeRating() : int
      {
         return getInt("stat_total_dodge_rating");
      }
      
      public function get statWeaponDamage() : int
      {
         return getInt("stat_weapon_damage");
      }
      
      public function get statTotal() : int
      {
         return getInt("stat_total");
      }
      
      public function get statBoughtStamina() : int
      {
         return getInt("stat_bought_stamina");
      }
      
      public function get statBoughtStrength() : int
      {
         return getInt("stat_bought_strength");
      }
      
      public function get statBoughtCriticalRating() : int
      {
         return getInt("stat_bought_critical_rating");
      }
      
      public function get statBoughtDodgeRating() : int
      {
         return getInt("stat_bought_dodge_rating");
      }
      
      public function get activeQuestBoosterId() : String
      {
         return getString("active_quest_booster_id");
      }
      
      public function get tsActiveQuestBoostExpires() : int
      {
         return getInt("ts_active_quest_boost_expires");
      }
      
      public function get activeStatsBoosterId() : String
      {
         return getString("active_stats_booster_id");
      }
      
      public function get tsActiveStatsBoostExpires() : int
      {
         return getInt("ts_active_stats_boost_expires");
      }
      
      public function get activeWorkBoosterId() : String
      {
         return getString("active_work_booster_id");
      }
      
      public function get tsActiveWorkBoostExpires() : int
      {
         return getInt("ts_active_work_boost_expires");
      }
      
      public function get tsActiveSenseBoostExpires() : int
      {
         return getInt("ts_active_sense_boost_expires");
      }
      
      public function get tsActiveMultitaskingBoostExpires() : int
      {
         return getInt("ts_active_multitasking_boost_expires");
      }
      
      public function get maxQuestStage() : int
      {
         return getInt("max_quest_stage");
      }
      
      public function get currentQuestStage() : int
      {
         return getInt("current_quest_stage");
      }
      
      public function get currentLocation() : int
      {
         return getInt("current_location");
      }
      
      public function get questEnergy() : int
      {
         return getInt("quest_energy");
      }
      
      public function get maxQuestEnergy() : int
      {
         return getInt("max_quest_energy");
      }
      
      public function get tsLastQuestEnergyRefill() : int
      {
         return getInt("ts_last_quest_energy_refill");
      }
      
      public function get questEnergyRefillAmountToday() : int
      {
         return getInt("quest_energy_refill_amount_today");
      }
      
      public function get activeQuestId() : int
      {
         return getInt("active_quest_id");
      }
      
      public function get questPool() : String
      {
         return getString("quest_pool");
      }
      
      public function get honor() : int
      {
         return getInt("honor");
      }
      
      public function get tsLastDuel() : int
      {
         return getInt("ts_last_duel");
      }
      
      public function get activeDuelId() : int
      {
         return getInt("active_duel_id");
      }
      
      public function get duelStamina() : int
      {
         return getInt("duel_stamina");
      }
      
      public function get maxDuelStamina() : int
      {
         return getInt("max_duel_stamina");
      }
      
      public function get tsLastDuelStaminaChange() : int
      {
         return getInt("ts_last_duel_stamina_change");
      }
      
      public function get duelStaminaCost() : int
      {
         return getInt("duel_stamina_cost");
      }
      
      public function get tsLastDuelEnemiesRefresh() : int
      {
         return getInt("ts_last_duel_enemies_refresh");
      }
      
      public function get currentWorkOfferId() : String
      {
         return getString("current_work_offer_id");
      }
      
      public function get tsLastWorkCollection() : int
      {
         return getInt("ts_last_work_collection");
      }
      
      public function get activeConventionShowId() : int
      {
         return getInt("active_convention_show_id");
      }
      
      public function get tsDungeonKeyFound() : int
      {
         return getInt("ts_dungeon_key_found");
      }
      
      public function get activeDungeonQuestId() : int
      {
         return getInt("active_dungeon_quest_id");
      }
      
      public function get tsLastDungeonQuest() : int
      {
         return getInt("ts_last_dungeon_quest");
      }
      
      public function get lastDungeonQuestLost() : Boolean
      {
         return getBoolean("last_dungeon_quest_lost");
      }
      
      public function get activeDungeonId() : int
      {
         return getInt("active_dungeon_id");
      }
      
      public function get tsLastDungeonStarted() : int
      {
         return getInt("ts_last_dungeon_started");
      }
      
      public function get appearanceSkinColor() : int
      {
         return getInt("appearance_skin_color");
      }
      
      public function get appearanceHairType() : int
      {
         return getInt("appearance_hair_type");
      }
      
      public function get appearanceHairColor() : int
      {
         return getInt("appearance_hair_color");
      }
      
      public function get appearanceHeadType() : int
      {
         return getInt("appearance_head_type");
      }
      
      public function get appearanceEyesType() : int
      {
         return getInt("appearance_eyes_type");
      }
      
      public function get appearanceEyebrowsType() : int
      {
         return getInt("appearance_eyebrows_type");
      }
      
      public function get appearanceEyebrowsColor() : int
      {
         return getInt("appearance_eyebrows_color");
      }
      
      public function get appearanceNoseType() : int
      {
         return getInt("appearance_nose_type");
      }
      
      public function get appearanceMouthType() : int
      {
         return getInt("appearance_mouth_type");
      }
      
      public function get appearanceFacialHairType() : int
      {
         return getInt("appearance_facial_hair_type");
      }
      
      public function get appearanceFacialHairColor() : int
      {
         return getInt("appearance_facial_hair_color");
      }
      
      public function get appearanceDecorationType() : int
      {
         return getInt("appearance_decoration_type");
      }
      
      public function get showHeadItem() : Boolean
      {
         return getBoolean("show_head_item");
      }
      
      public function get showChestItemUnlocked() : Boolean
      {
         return getBoolean("show_chest_item_unlocked");
      }
      
      public function get showChestItem() : Boolean
      {
         return getBoolean("show_chest_item");
      }
      
      public function get showBeltItemUnlocked() : Boolean
      {
         return getBoolean("show_belt_item_unlocked");
      }
      
      public function get showBeltItem() : Boolean
      {
         return getBoolean("show_belt_item");
      }
      
      public function get showLegsItemUnlocked() : Boolean
      {
         return getBoolean("show_legs_item_unlocked");
      }
      
      public function get showLegsItem() : Boolean
      {
         return getBoolean("show_legs_item");
      }
      
      public function get showBootsItemUnlocked() : Boolean
      {
         return getBoolean("show_boots_item_unlocked");
      }
      
      public function get showBootsItem() : Boolean
      {
         return getBoolean("show_boots_item");
      }
      
      public function get appearancePhotoRectType() : int
      {
         return getInt("appearance_photo_rect_type");
      }
      
      public function get appearancePhotoBorderType() : int
      {
         return getInt("appearance_photo_border_type");
      }
      
      public function get appearancePhotoBackgroundType() : int
      {
         return getInt("appearance_photo_background_type");
      }
      
      public function get appearancePhotoFilterType() : int
      {
         return getInt("appearance_photo_filter_type");
      }
      
      public function get appearancePhotoIconType() : int
      {
         return getInt("appearance_photo_icon_type");
      }
      
      public function get appearancePhotoSexualityType() : int
      {
         return getInt("appearance_photo_sexuality_type");
      }
      
      public function get appearanceTattooArmLeft() : int
      {
         return getInt("appearance_tattoo_arm_left");
      }
      
      public function get appearanceTattooArmRight() : int
      {
         return getInt("appearance_tattoo_arm_right");
      }
      
      public function get appearanceTattooBody() : int
      {
         return getInt("appearance_tattoo_body");
      }
      
      public function get appearanceTattooLegLeft() : int
      {
         return getInt("appearance_tattoo_leg_left");
      }
      
      public function get appearanceTattooLegRight() : int
      {
         return getInt("appearance_tattoo_leg_right");
      }
      
      public function get appearanceBraType() : int
      {
         return getInt("appearance_bra_type");
      }
      
      public function get appearancePantiesType() : int
      {
         return getInt("appearance_panties_type");
      }
      
      public function get appearanceGenitalsType() : int
      {
         return getInt("appearance_genitals_type");
      }
      
      public function get appearanceGenitalsHairType() : int
      {
         return getInt("appearance_genitals_hair_type");
      }
      
      public function get appearanceGenitalsHairColor() : int
      {
         return getInt("appearance_genitals_hair_color");
      }
      
      public function get avatarImage() : String
      {
         return getString("avatar_image");
      }
      
      public function get tutorialFlags() : String
      {
         return getString("tutorial_flags");
      }
      
      public function get storygoal() : String
      {
         return getString("storygoal");
      }
      
      public function get guildId() : int
      {
         return getInt("guild_id");
      }
      
      public function get guildRank() : int
      {
         return getInt("guild_rank");
      }
      
      public function get finishedGuildBattleAttackId() : int
      {
         return getInt("finished_guild_battle_attack_id");
      }
      
      public function get finishedGuildBattleDefenseId() : int
      {
         return getInt("finished_guild_battle_defense_id");
      }
      
      public function get guildDonatedGameCurrency() : int
      {
         return getInt("guild_donated_game_currency");
      }
      
      public function get guildDonatedPremiumCurrency() : int
      {
         return getInt("guild_donated_premium_currency");
      }
      
      public function get guildCompetitionPointsGathered() : int
      {
         return getInt("guild_competition_points_gathered");
      }
      
      public function get pendingGuildCompetitionTournamentRewards() : int
      {
         return getInt("pending_guild_competition_tournament_rewards");
      }
      
      public function get pendingSoloGuildCompetitionTournamentRewards() : int
      {
         return getInt("pending_solo_guild_competition_tournament_rewards");
      }
      
      public function get unreadMassSystemMessages() : int
      {
         return getInt("unread_mass_system_messages");
      }
      
      public function get friendMessagesOnly() : Boolean
      {
         return getBoolean("friend_messages_only");
      }
      
      public function get conventionId() : int
      {
         return getInt("convention_id");
      }
      
      public function get conventionShowCount() : int
      {
         return getInt("convention_show_count");
      }
      
      public function get conventionShowIdentifier() : String
      {
         return getString("convention_show_identifier");
      }
      
      public function get conventionShowReward() : int
      {
         return getInt("convention_show_reward");
      }
      
      public function get tsLastWashItem() : int
      {
         return getInt("ts_last_wash_item");
      }
      
      public function get tsLastDailyLoginBonus() : int
      {
         return getInt("ts_last_daily_login_bonus");
      }
      
      public function get dailyLoginBonusDay() : int
      {
         return getInt("daily_login_bonus_day");
      }
      
      public function get pendingTournamentRewards() : int
      {
         return getInt("pending_tournament_rewards");
      }
      
      public function get pendingGlobalTournamentRewards() : int
      {
         return getInt("pending_global_tournament_rewards");
      }
      
      public function get tsLastShopRefresh() : int
      {
         return getInt("ts_last_shop_refresh");
      }
      
      public function get maxFreeShopRefreshes() : int
      {
         return getInt("max_free_shop_refreshes");
      }
      
      public function get shopRefreshes() : int
      {
         return getInt("shop_refreshes");
      }
      
      public function get movieEnergy() : int
      {
         return getInt("movie_energy");
      }
      
      public function get maxMovieEnergy() : int
      {
         return getInt("max_movie_energy");
      }
      
      public function get tsLastMovieEnergyChange() : int
      {
         return getInt("ts_last_movie_energy_change");
      }
      
      public function get moviePool() : String
      {
         return getString("movie_pool");
      }
      
      public function get movieId() : int
      {
         return getInt("movie_id");
      }
      
      public function get movies() : int
      {
         return getInt("movies");
      }
      
      public function get fans() : int
      {
         return getInt("fans");
      }
      
      public function get tsLastMovieFinished() : int
      {
         return getInt("ts_last_movie_finished");
      }
      
      public function get moviesStartedToday() : int
      {
         return getInt("movies_started_today");
      }
      
      public function get movieVotes() : int
      {
         return getInt("movie_votes");
      }
      
      public function get selectedMovieId() : int
      {
         return getInt("selected_movie_id");
      }
      
      public function get selectableMoviesCount() : int
      {
         return getInt("selectable_movies_count");
      }
      
      public function get pendingMovieTournamentRewards() : int
      {
         return getInt("pending_movie_tournament_rewards");
      }
      
      public function get friendData() : String
      {
         return getString("friend_data");
      }
      
      public function get unusedResources() : String
      {
         return getString("unused_resources");
      }
      
      public function get usedResources() : String
      {
         return getString("used_resources");
      }
      
      public function get battleData() : String
      {
         return getString("battle_data");
      }
      
      public function get tsLastCustomizeItem() : int
      {
         return getInt("ts_last_customize_item");
      }
      
      public function get pendingCustomizeItem() : String
      {
         return getString("pending_customize_item");
      }
      
      public function get currentStoryDungeonIndex() : int
      {
         return getInt("current_story_dungeon_index");
      }
      
      public function get activeStoryDungeonAttackId() : int
      {
         return getInt("active_story_dungeon_attack_id");
      }
      
      public function get currentRepeatStoryDungeonId() : int
      {
         return getInt("current_repeat_story_dungeon_id");
      }
      
      public function get activeRepeatStoryDungeonAttackId() : int
      {
         return getInt("active_repeat_story_dungeon_attack_id");
      }
      
      public function get eventQuestId() : int
      {
         return getInt("event_quest_id");
      }
      
      public function get currentEnergyStorage() : int
      {
         return getInt("current_energy_storage");
      }
      
      public function get currentSlotmachineSpin() : int
      {
         return getInt("current_slotmachine_spin");
      }
      
      public function get slotmachineSpinCount() : int
      {
         return getInt("slotmachine_spin_count");
      }
      
      public function get tsLastSlotmachineRefill() : int
      {
         return getInt("ts_last_slotmachine_refill");
      }
      
      public function get newUserVoucherIds() : String
      {
         return getString("new_user_voucher_ids");
      }
      
      public function get herobookObjectivesRenewedToday() : int
      {
         return getInt("herobook_objectives_renewed_today");
      }
      
      public function get userStoryActivated() : Boolean
      {
         return getBoolean("user_story_activated");
      }
      
      public function get userStoryLocales() : String
      {
         return getString("user_story_locales");
      }
   }
}
