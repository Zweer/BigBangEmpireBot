package com.playata.application.request
{
   import com.playata.application.data.dataobject.DOBankInventory;
   import com.playata.application.data.dataobject.DOBattle;
   import com.playata.application.data.dataobject.DOBattleOpponent;
   import com.playata.application.data.dataobject.DOBonusInfo;
   import com.playata.application.data.dataobject.DOCharacter;
   import com.playata.application.data.dataobject.DOCharacterSelectionEntry;
   import com.playata.application.data.dataobject.DOClientSessionInfo;
   import com.playata.application.data.dataobject.DOConstantsOverride;
   import com.playata.application.data.dataobject.DOConvention;
   import com.playata.application.data.dataobject.DOConventionReward;
   import com.playata.application.data.dataobject.DOConventionShow;
   import com.playata.application.data.dataobject.DOCustomBannerAdvertisment;
   import com.playata.application.data.dataobject.DODatingLookup;
   import com.playata.application.data.dataobject.DODatingStep;
   import com.playata.application.data.dataobject.DODuel;
   import com.playata.application.data.dataobject.DODuelOpponentEntry;
   import com.playata.application.data.dataobject.DODungeon;
   import com.playata.application.data.dataobject.DODungeonLevel;
   import com.playata.application.data.dataobject.DODungeonQuest;
   import com.playata.application.data.dataobject.DOEventQuest;
   import com.playata.application.data.dataobject.DOFanFoto;
   import com.playata.application.data.dataobject.DOFriend;
   import com.playata.application.data.dataobject.DOGuild;
   import com.playata.application.data.dataobject.DOGuildBattle;
   import com.playata.application.data.dataobject.DOGuildBattleListEntry;
   import com.playata.application.data.dataobject.DOGuildBattleReward;
   import com.playata.application.data.dataobject.DOGuildCompetition;
   import com.playata.application.data.dataobject.DOGuildHistoryBattle;
   import com.playata.application.data.dataobject.DOGuildLeaderVote;
   import com.playata.application.data.dataobject.DOGuildListEntry;
   import com.playata.application.data.dataobject.DOGuildMember;
   import com.playata.application.data.dataobject.DOHerobookObjective;
   import com.playata.application.data.dataobject.DOInventory;
   import com.playata.application.data.dataobject.DOItem;
   import com.playata.application.data.dataobject.DOLeaderboardCharacter;
   import com.playata.application.data.dataobject.DOLeaderboardGuild;
   import com.playata.application.data.dataobject.DOLeaderboardGuildCompetition;
   import com.playata.application.data.dataobject.DOLeaderboardMovie;
   import com.playata.application.data.dataobject.DOLeaderboardSoloGuildCompetition;
   import com.playata.application.data.dataobject.DOMarriageLookup;
   import com.playata.application.data.dataobject.DOMessage;
   import com.playata.application.data.dataobject.DOMissedDuel;
   import com.playata.application.data.dataobject.DOMovie;
   import com.playata.application.data.dataobject.DOMovieHistory;
   import com.playata.application.data.dataobject.DOMovieQuest;
   import com.playata.application.data.dataobject.DOOpticalChangeChest;
   import com.playata.application.data.dataobject.DOOpticalChangesLookup;
   import com.playata.application.data.dataobject.DOOutfit;
   import com.playata.application.data.dataobject.DOPaymentPromotion;
   import com.playata.application.data.dataobject.DOPlatformFriend;
   import com.playata.application.data.dataobject.DOQuest;
   import com.playata.application.data.dataobject.DOResourceRequest;
   import com.playata.application.data.dataobject.DOStoryDungeon;
   import com.playata.application.data.dataobject.DOTitle;
   import com.playata.application.data.dataobject.DOTournamentCharacterReward;
   import com.playata.application.data.dataobject.DOTournamentGuildCompetitionReward;
   import com.playata.application.data.dataobject.DOTournamentSoloGuildCompetitionReward;
   import com.playata.application.data.dataobject.DOUser;
   import com.playata.application.data.dataobject.DOUserVoucher;
   import com.playata.application.data.dataobject.DOVoteMovie;
   import com.playata.application.data.dataobject.DOWork;
   import com.playata.application.data.dataobject.DOWorkData;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObjectArray;
   
   public class AppRequestResponseData extends TypedObject
   {
       
      
      public function AppRequestResponseData(param1:Object)
      {
         super(param1);
      }
      
      public function get saved_seconds() : int
      {
         return getInt("saved_seconds");
      }
      
      public function get quest() : DOQuest
      {
         if(hasData("quest",true))
         {
            return new DOQuest(getData("quest"));
         }
         return null;
      }
      
      public function get convention_show() : DOConventionShow
      {
         if(hasData("convention_show",true))
         {
            return new DOConventionShow(getData("convention_show"));
         }
         return null;
      }
      
      public function get character() : DOCharacter
      {
         if(hasData("character",true))
         {
            return new DOCharacter(getData("character"));
         }
         return null;
      }
      
      public function get custom_banner_advertisments() : DataObjectArray
      {
         if(hasData("custom_banner_advertisments",true))
         {
            return new DataObjectArray(getArray("custom_banner_advertisments"),DOCustomBannerAdvertisment);
         }
         return null;
      }
      
      public function get video_advertisment_id() : int
      {
         return getInt("video_advertisment_id");
      }
      
      public function get success() : Boolean
      {
         return getBoolean("success");
      }
      
      public function get user() : DOUser
      {
         if(hasData("user",true))
         {
            return new DOUser(getData("user"));
         }
         return null;
      }
      
      public function get valid() : Boolean
      {
         return getBoolean("valid");
      }
      
      public function get inventory() : DOInventory
      {
         if(hasData("inventory",true))
         {
            return new DOInventory(getData("inventory"));
         }
         return null;
      }
      
      public function get quests() : DataObjectArray
      {
         if(hasData("quests",true))
         {
            return new DataObjectArray(getArray("quests"),DOQuest);
         }
         return null;
      }
      
      public function get items() : DataObjectArray
      {
         if(hasData("items",true))
         {
            return new DataObjectArray(getArray("items"),DOItem);
         }
         return null;
      }
      
      public function get win_messages() : Vector.<String>
      {
         return getStringVector("win_messages");
      }
      
      public function get reward() : String
      {
         return getString("reward");
      }
      
      public function get item() : DOItem
      {
         if(hasData("item",true))
         {
            return new DOItem(getData("item"));
         }
         return null;
      }
      
      public function get slotmachine_slot1() : int
      {
         return getInt("slotmachine_slot1");
      }
      
      public function get slotmachine_slot2() : int
      {
         return getInt("slotmachine_slot2");
      }
      
      public function get slotmachine_slot3() : int
      {
         return getInt("slotmachine_slot3");
      }
      
      public function get slotmachine_reward_quality() : int
      {
         return getInt("slotmachine_reward_quality");
      }
      
      public function get work() : DOWork
      {
         if(hasData("work",true))
         {
            return new DOWork(getData("work"));
         }
         return null;
      }
      
      public function get movie_vote_reward() : String
      {
         return getString("movie_vote_reward");
      }
      
      public function get available() : Boolean
      {
         return getBoolean("available");
      }
      
      public function get alternative() : String
      {
         return getString("alternative");
      }
      
      public function get requested_character() : DOCharacter
      {
         if(hasData("requested_character",true))
         {
            return new DOCharacter(getData("requested_character"));
         }
         return null;
      }
      
      public function get requested_character_inventory() : DOInventory
      {
         if(hasData("requested_character_inventory",true))
         {
            return new DOInventory(getData("requested_character_inventory"));
         }
         return null;
      }
      
      public function get requested_character_inventory_items() : DataObjectArray
      {
         if(hasData("requested_character_inventory_items",true))
         {
            return new DataObjectArray(getArray("requested_character_inventory_items"),DOItem);
         }
         return null;
      }
      
      public function get requested_character_guild() : DOGuild
      {
         if(hasData("requested_character_guild",true))
         {
            return new DOGuild(getData("requested_character_guild"));
         }
         return null;
      }
      
      public function get marriages() : DataObjectArray
      {
         if(hasData("marriages",true))
         {
            return new DataObjectArray(getArray("marriages"),DOMarriageLookup);
         }
         return null;
      }
      
      public function get requested_character_optical_changes() : TypedObject
      {
         return getTypedObject("requested_character_optical_changes");
      }
      
      public function get requested_character_current_goal_values() : TypedObject
      {
         return getTypedObject("requested_character_current_goal_values");
      }
      
      public function get requested_character_collected_goals() : TypedObject
      {
         return getTypedObject("requested_character_collected_goals");
      }
      
      public function get max_spendable_amount() : int
      {
         return getInt("max_spendable_amount");
      }
      
      public function get character_selection_data() : DataObjectArray
      {
         if(hasData("character_selection_data",true))
         {
            return new DataObjectArray(getArray("character_selection_data"),DOCharacterSelectionEntry);
         }
         return null;
      }
      
      public function get redirect_url() : String
      {
         return getString("redirect_url");
      }
      
      public function get character_selection_entry() : DOCharacterSelectionEntry
      {
         if(hasData("character_selection_entry",true))
         {
            return new DOCharacterSelectionEntry(getData("character_selection_entry"));
         }
         return null;
      }
      
      public function get convention_previous_stars() : Vector.<String>
      {
         return getStringVector("convention_previous_stars");
      }
      
      public function get convention() : DOConvention
      {
         if(hasData("convention",true))
         {
            return new DOConvention(getData("convention"));
         }
         return null;
      }
      
      public function get convention_reward() : DOConventionReward
      {
         if(hasData("convention_reward",true))
         {
            return new DOConventionReward(getData("convention_reward"));
         }
         return null;
      }
      
      public function get battle() : DOBattle
      {
         if(hasData("battle",true))
         {
            return new DOBattle(getData("battle"));
         }
         return null;
      }
      
      public function get current_goal_values() : TypedObject
      {
         return getTypedObject("current_goal_values");
      }
      
      public function get convention_character_data() : Array
      {
         return getArray("convention_character_data");
      }
      
      public function get dating_lookup() : DODatingLookup
      {
         if(hasData("dating_lookup",true))
         {
            return new DODatingLookup(getData("dating_lookup"));
         }
         return null;
      }
      
      public function get dating_step() : DataObjectArray
      {
         if(hasData("dating_step",true))
         {
            return new DataObjectArray(getArray("dating_step"),DODatingStep);
         }
         return null;
      }
      
      public function get completed_dating_steps() : Vector.<String>
      {
         return getStringVector("completed_dating_steps");
      }
      
      public function get event_quest() : DOEventQuest
      {
         if(hasData("event_quest",true))
         {
            return new DOEventQuest(getData("event_quest"));
         }
         return null;
      }
      
      public function get guild() : DOGuild
      {
         if(hasData("guild",true))
         {
            return new DOGuild(getData("guild"));
         }
         return null;
      }
      
      public function get guild_competition_data() : DOGuildCompetition
      {
         if(hasData("guild_competition_data",true))
         {
            return new DOGuildCompetition(getData("guild_competition_data"));
         }
         return null;
      }
      
      public function get story_dungeons() : DataObjectArray
      {
         if(hasData("story_dungeons",true))
         {
            return new DataObjectArray(getArray("story_dungeons"),DOStoryDungeon);
         }
         return null;
      }
      
      public function get fan_foto() : DOFanFoto
      {
         if(hasData("fan_foto",true))
         {
            return new DOFanFoto(getData("fan_foto"));
         }
         return null;
      }
      
      public function get current_item_pattern_values() : TypedObject
      {
         return getTypedObject("current_item_pattern_values");
      }
      
      public function get dungeon() : DODungeon
      {
         if(hasData("dungeon",true))
         {
            return new DODungeon(getData("dungeon"));
         }
         return null;
      }
      
      public function get herobook_objectives() : DataObjectArray
      {
         if(hasData("herobook_objectives",true))
         {
            return new DataObjectArray(getArray("herobook_objectives"),DOHerobookObjective);
         }
         return null;
      }
      
      public function get pending_guild_battle_attack() : DOGuildBattle
      {
         if(hasData("pending_guild_battle_attack",true))
         {
            return new DOGuildBattle(getData("pending_guild_battle_attack"));
         }
         return null;
      }
      
      public function get pending_guild_battle_defense() : DOGuildBattle
      {
         if(hasData("pending_guild_battle_defense",true))
         {
            return new DOGuildBattle(getData("pending_guild_battle_defense"));
         }
         return null;
      }
      
      public function get movie() : DOMovie
      {
         if(hasData("movie",true))
         {
            return new DOMovie(getData("movie"));
         }
         return null;
      }
      
      public function get dungeon_level() : DODungeonLevel
      {
         if(hasData("dungeon_level",true))
         {
            return new DODungeonLevel(getData("dungeon_level"));
         }
         return null;
      }
      
      public function get dungeon_levels() : DataObjectArray
      {
         if(hasData("dungeon_levels",true))
         {
            return new DataObjectArray(getArray("dungeon_levels"),DODungeonLevel);
         }
         return null;
      }
      
      public function get dungeon_quest() : DODungeonQuest
      {
         if(hasData("dungeon_quest",true))
         {
            return new DODungeonQuest(getData("dungeon_quest"));
         }
         return null;
      }
      
      public function get hash() : String
      {
         return getString("hash");
      }
      
      public function get collected_item_pattern() : TypedObject
      {
         return getTypedObject("collected_item_pattern");
      }
      
      public function get is_enabled() : Boolean
      {
         return getBoolean("is_enabled");
      }
      
      public function get duel() : DODuel
      {
         if(hasData("duel",true))
         {
            return new DODuel(getData("duel"));
         }
         return null;
      }
      
      public function get missed_duels() : int
      {
         return getInt("missed_duels");
      }
      
      public function get opponents() : DataObjectArray
      {
         if(hasData("opponents",true))
         {
            return new DataObjectArray(getArray("opponents"),DODuelOpponentEntry);
         }
         return null;
      }
      
      public function get missed_duel() : DODuel
      {
         if(hasData("missed_duel",true))
         {
            return new DODuel(getData("missed_duel"));
         }
         return null;
      }
      
      public function get missed_duel_battle() : DOBattle
      {
         if(hasData("missed_duel_battle",true))
         {
            return new DOBattle(getData("missed_duel_battle"));
         }
         return null;
      }
      
      public function get decrease_counter() : Boolean
      {
         return getBoolean("decrease_counter");
      }
      
      public function get missed_duel_data() : DataObjectArray
      {
         if(hasData("missed_duel_data",true))
         {
            return new DataObjectArray(getArray("missed_duel_data"),DOMissedDuel);
         }
         return null;
      }
      
      public function get missed_duel_opponents() : DataObjectArray
      {
         if(hasData("missed_duel_opponents",true))
         {
            return new DataObjectArray(getArray("missed_duel_opponents"),DOBattleOpponent);
         }
         return null;
      }
      
      public function get opponent() : DOCharacter
      {
         if(hasData("opponent",true))
         {
            return new DOCharacter(getData("opponent"));
         }
         return null;
      }
      
      public function get opponent_inventory() : DOInventory
      {
         if(hasData("opponent_inventory",true))
         {
            return new DOInventory(getData("opponent_inventory"));
         }
         return null;
      }
      
      public function get opponent_inventory_items() : DataObjectArray
      {
         if(hasData("opponent_inventory_items",true))
         {
            return new DataObjectArray(getArray("opponent_inventory_items"),DOItem);
         }
         return null;
      }
      
      public function get title() : DOTitle
      {
         if(hasData("title",true))
         {
            return new DOTitle(getData("title"));
         }
         return null;
      }
      
      public function get new_fan_foto_id() : int
      {
         return getInt("new_fan_foto_id");
      }
      
      public function get friend_data() : DataObjectArray
      {
         if(hasData("friend_data",true))
         {
            return new DataObjectArray(getArray("friend_data"),DOFriend);
         }
         return null;
      }
      
      public function get text() : TypedObject
      {
         return getTypedObject("text");
      }
      
      public function get synced() : Boolean
      {
         return getBoolean("synced");
      }
      
      public function get sync_states() : TypedObject
      {
         return getTypedObject("sync_states");
      }
      
      public function get platform_friends() : DataObjectArray
      {
         if(hasData("platform_friends",true))
         {
            return new DataObjectArray(getArray("platform_friends"),DOPlatformFriend);
         }
         return null;
      }
      
      public function get version_check() : String
      {
         return getString("version_check");
      }
      
      public function get config_overwrites() : TypedObject
      {
         return getTypedObject("config_overwrites");
      }
      
      public function get extendedConfig() : TypedObject
      {
         return getTypedObject("extendedConfig");
      }
      
      public function get textures() : TypedObject
      {
         return getTypedObject("textures");
      }
      
      public function get constants() : TypedObject
      {
         return getTypedObject("constants");
      }
      
      public function get server_selection_data() : TypedObject
      {
         return getTypedObject("server_selection_data");
      }
      
      public function get new_messages() : int
      {
         return getInt("new_messages");
      }
      
      public function get new_guild_log_entries() : int
      {
         return getInt("new_guild_log_entries");
      }
      
      public function get guild_members() : DataObjectArray
      {
         if(hasData("guild_members",true))
         {
            return new DataObjectArray(getArray("guild_members"),DOGuildMember);
         }
         return null;
      }
      
      public function get conventions() : DataObjectArray
      {
         if(hasData("conventions",true))
         {
            return new DataObjectArray(getArray("conventions"),DOConvention);
         }
         return null;
      }
      
      public function get convention_rewards() : DataObjectArray
      {
         if(hasData("convention_rewards",true))
         {
            return new DataObjectArray(getArray("convention_rewards"),DOConventionReward);
         }
         return null;
      }
      
      public function get ingame_notifications() : TypedObject
      {
         return getTypedObject("ingame_notifications");
      }
      
      public function get special_offers() : Array
      {
         return getArray("special_offers");
      }
      
      public function get daily_login_bonus_rewards() : TypedObject
      {
         return getTypedObject("daily_login_bonus_rewards");
      }
      
      public function get daily_login_bonus_day() : int
      {
         return getInt("daily_login_bonus_day");
      }
      
      public function get bonus_info() : DOBonusInfo
      {
         if(hasData("bonus_info",true))
         {
            return new DOBonusInfo(getData("bonus_info"));
         }
         return null;
      }
      
      public function get guild_leader_vote() : DOGuildLeaderVote
      {
         if(hasData("guild_leader_vote",true))
         {
            return new DOGuildLeaderVote(getData("guild_leader_vote"));
         }
         return null;
      }
      
      public function get sync_timestamp() : int
      {
         return getInt("sync_timestamp");
      }
      
      public function get expired_guild_boosters() : Vector.<String>
      {
         return getStringVector("expired_guild_boosters");
      }
      
      public function get constants_override() : DataObjectArray
      {
         if(hasData("constants_override",true))
         {
            return new DataObjectArray(getArray("constants_override"),DOConstantsOverride);
         }
         return null;
      }
      
      public function get client_info() : DOClientSessionInfo
      {
         if(hasData("client_info",true))
         {
            return new DOClientSessionInfo(getData("client_info"));
         }
         return null;
      }
      
      public function get collected_goals() : TypedObject
      {
         return getTypedObject("collected_goals");
      }
      
      public function get guild_battle_guilds() : DataObjectArray
      {
         if(hasData("guild_battle_guilds",true))
         {
            return new DataObjectArray(getArray("guild_battle_guilds"),DOGuild);
         }
         return null;
      }
      
      public function get requested_guild() : DOGuild
      {
         if(hasData("requested_guild",true))
         {
            return new DOGuild(getData("requested_guild"));
         }
         return null;
      }
      
      public function get requested_guild_members() : DataObjectArray
      {
         if(hasData("requested_guild_members",true))
         {
            return new DataObjectArray(getArray("requested_guild_members"),DOGuildMember);
         }
         return null;
      }
      
      public function get guild_history_battle() : DOGuildBattle
      {
         if(hasData("guild_history_battle",true))
         {
            return new DOGuildBattle(getData("guild_history_battle"));
         }
         return null;
      }
      
      public function get guild_history_battles() : DataObjectArray
      {
         if(hasData("guild_history_battles",true))
         {
            return new DataObjectArray(getArray("guild_history_battles"),DOGuildHistoryBattle);
         }
         return null;
      }
      
      public function get guild_battle_entries() : DataObjectArray
      {
         if(hasData("guild_battle_entries",true))
         {
            return new DataObjectArray(getArray("guild_battle_entries"),DOGuildBattleListEntry);
         }
         return null;
      }
      
      public function get guild_entries() : DataObjectArray
      {
         if(hasData("guild_entries",true))
         {
            return new DataObjectArray(getArray("guild_entries"),DOGuildListEntry);
         }
         return null;
      }
      
      public function get guild_log() : TypedObject
      {
         return getTypedObject("guild_log");
      }
      
      public function get tournament_guild_competition_reward() : DOTournamentGuildCompetitionReward
      {
         if(hasData("tournament_guild_competition_reward",true))
         {
            return new DOTournamentGuildCompetitionReward(getData("tournament_guild_competition_reward"));
         }
         return null;
      }
      
      public function get tournament_solo_guild_competition_reward() : DOTournamentSoloGuildCompetitionReward
      {
         if(hasData("tournament_solo_guild_competition_reward",true))
         {
            return new DOTournamentSoloGuildCompetitionReward(getData("tournament_solo_guild_competition_reward"));
         }
         return null;
      }
      
      public function get leaderboard_guilds() : DataObjectArray
      {
         if(hasData("leaderboard_guilds",true))
         {
            return new DataObjectArray(getArray("leaderboard_guilds"),DOLeaderboardGuild);
         }
         return null;
      }
      
      public function get max_guilds() : int
      {
         return getInt("max_guilds");
      }
      
      public function get centered_rank() : int
      {
         return getInt("centered_rank");
      }
      
      public function get bank_inventory() : DOBankInventory
      {
         if(hasData("bank_inventory",true))
         {
            return new DOBankInventory(getData("bank_inventory"));
         }
         return null;
      }
      
      public function get owned_item_templates() : Vector.<String>
      {
         return getStringVector("owned_item_templates");
      }
      
      public function get leaderboard_characters() : DataObjectArray
      {
         if(hasData("leaderboard_characters",true))
         {
            return new DataObjectArray(getArray("leaderboard_characters"),DOLeaderboardCharacter);
         }
         return null;
      }
      
      public function get max_characters() : int
      {
         return getInt("max_characters");
      }
      
      public function get message() : DOMessage
      {
         if(hasData("message",true))
         {
            return new DOMessage(getData("message"));
         }
         return null;
      }
      
      public function get marriage() : DOMarriageLookup
      {
         if(hasData("marriage",true))
         {
            return new DOMarriageLookup(getData("marriage"));
         }
         return null;
      }
      
      public function get messages_character_info() : TypedObject
      {
         return getTypedObject("messages_character_info");
      }
      
      public function get messages() : DataObjectArray
      {
         if(hasData("messages",true))
         {
            return new DataObjectArray(getArray("messages"),DOMessage);
         }
         return null;
      }
      
      public function get messages_read() : Array
      {
         return getArray("messages_read");
      }
      
      public function get messages_ignored_character_info() : TypedObject
      {
         return getTypedObject("messages_ignored_character_info");
      }
      
      public function get messages_sent_count() : int
      {
         return getInt("messages_sent_count");
      }
      
      public function get messages_received_count() : int
      {
         return getInt("messages_received_count");
      }
      
      public function get movie_quests() : DataObjectArray
      {
         if(hasData("movie_quests",true))
         {
            return new DataObjectArray(getArray("movie_quests"),DOMovieQuest);
         }
         return null;
      }
      
      public function get movie_history() : DataObjectArray
      {
         if(hasData("movie_history",true))
         {
            return new DataObjectArray(getArray("movie_history"),DOMovieHistory);
         }
         return null;
      }
      
      public function get movies_count() : int
      {
         return getInt("movies_count");
      }
      
      public function get movies() : DataObjectArray
      {
         if(hasData("movies",true))
         {
            return new DataObjectArray(getArray("movies"),DOMovie);
         }
         return null;
      }
      
      public function get movie_quest() : DOMovieQuest
      {
         if(hasData("movie_quest",true))
         {
            return new DOMovieQuest(getData("movie_quest"));
         }
         return null;
      }
      
      public function get movie_battle() : DOBattle
      {
         if(hasData("movie_battle",true))
         {
            return new DOBattle(getData("movie_battle"));
         }
         return null;
      }
      
      public function get movies_to_select() : DataObjectArray
      {
         if(hasData("movies_to_select",true))
         {
            return new DataObjectArray(getArray("movies_to_select"),DOMovie);
         }
         return null;
      }
      
      public function get selected_movie() : DOMovie
      {
         if(hasData("selected_movie",true))
         {
            return new DOMovie(getData("selected_movie"));
         }
         return null;
      }
      
      public function get movies_to_vote() : DataObjectArray
      {
         if(hasData("movies_to_vote",true))
         {
            return new DataObjectArray(getArray("movies_to_vote"),DOVoteMovie);
         }
         return null;
      }
      
      public function get current_optical_changes() : DOOpticalChangesLookup
      {
         if(hasData("current_optical_changes",true))
         {
            return new DOOpticalChangesLookup(getData("current_optical_changes"));
         }
         return null;
      }
      
      public function get collected_optical_changes() : TypedObject
      {
         return getTypedObject("collected_optical_changes");
      }
      
      public function get chests() : DataObjectArray
      {
         if(hasData("chests",true))
         {
            return new DataObjectArray(getArray("chests"),DOOpticalChangeChest);
         }
         return null;
      }
      
      public function get outfit() : DOOutfit
      {
         if(hasData("outfit",true))
         {
            return new DOOutfit(getData("outfit"));
         }
         return null;
      }
      
      public function get outfits() : DataObjectArray
      {
         if(hasData("outfits",true))
         {
            return new DataObjectArray(getArray("outfits"),DOOutfit);
         }
         return null;
      }
      
      public function get last_payment_confirmed() : Boolean
      {
         return getBoolean("last_payment_confirmed");
      }
      
      public function get consumable_offers() : Array
      {
         return getArray("consumable_offers");
      }
      
      public function get payment_promotion_data() : DOPaymentPromotion
      {
         if(hasData("payment_promotion_data",true))
         {
            return new DOPaymentPromotion(getData("payment_promotion_data"));
         }
         return null;
      }
      
      public function get normal_offers() : Array
      {
         return getArray("normal_offers");
      }
      
      public function get payment_id() : int
      {
         return getInt("payment_id");
      }
      
      public function get payment_link() : String
      {
         return getString("payment_link");
      }
      
      public function get story_dungeon() : DOStoryDungeon
      {
         if(hasData("story_dungeon",true))
         {
            return new DOStoryDungeon(getData("story_dungeon"));
         }
         return null;
      }
      
      public function get resource_requests() : DataObjectArray
      {
         if(hasData("resource_requests",true))
         {
            return new DataObjectArray(getArray("resource_requests"),DOResourceRequest);
         }
         return null;
      }
      
      public function get friend_user_ids() : Vector.<int>
      {
         return getIntVector("friend_user_ids");
      }
      
      public function get resource_request() : DOResourceRequest
      {
         if(hasData("resource_request",true))
         {
            return new DOResourceRequest(getData("resource_request"));
         }
         return null;
      }
      
      public function get from_character_name() : String
      {
         return getString("from_character_name");
      }
      
      public function get resource_request_friends() : DataObjectArray
      {
         if(hasData("resource_request_friends",true))
         {
            return new DataObjectArray(getArray("resource_request_friends"),DOFriend);
         }
         return null;
      }
      
      public function get completed_story_dungeons() : Vector.<int>
      {
         return getIntVector("completed_story_dungeons");
      }
      
      public function get movie_tournament_end_timestamp() : int
      {
         return getInt("movie_tournament_end_timestamp");
      }
      
      public function get tournament_end_timestamp() : int
      {
         return getInt("tournament_end_timestamp");
      }
      
      public function get tournament_movie_rewards() : TypedObject
      {
         return getTypedObject("tournament_movie_rewards");
      }
      
      public function get tournament_rewards() : DOTournamentCharacterReward
      {
         if(hasData("tournament_rewards",true))
         {
            return new DOTournamentCharacterReward(getData("tournament_rewards"));
         }
         return null;
      }
      
      public function get leaderboard_guild_competitions() : DataObjectArray
      {
         if(hasData("leaderboard_guild_competitions",true))
         {
            return new DataObjectArray(getArray("leaderboard_guild_competitions"),DOLeaderboardGuildCompetition);
         }
         return null;
      }
      
      public function get max_guild_competitions() : int
      {
         return getInt("max_guild_competitions");
      }
      
      public function get guilds_with_rewards() : int
      {
         return getInt("guilds_with_rewards");
      }
      
      public function get guild_competition_tournament_end_timestamp() : int
      {
         return getInt("guild_competition_tournament_end_timestamp");
      }
      
      public function get leaderboard_movies() : DataObjectArray
      {
         if(hasData("leaderboard_movies",true))
         {
            return new DataObjectArray(getArray("leaderboard_movies"),DOLeaderboardMovie);
         }
         return null;
      }
      
      public function get max_movies() : int
      {
         return getInt("max_movies");
      }
      
      public function get leaderboard_solo_guild_competitions() : DataObjectArray
      {
         if(hasData("leaderboard_solo_guild_competitions",true))
         {
            return new DataObjectArray(getArray("leaderboard_solo_guild_competitions"),DOLeaderboardSoloGuildCompetition);
         }
         return null;
      }
      
      public function get max_solo_guild_competitions() : int
      {
         return getInt("max_solo_guild_competitions");
      }
      
      public function get reactivation_code() : String
      {
         return getString("reactivation_code");
      }
      
      public function get campaigns() : TypedObject
      {
         return getTypedObject("campaigns");
      }
      
      public function get user_geo_location() : String
      {
         return getString("user_geo_location");
      }
      
      public function get finished_guild_battle_attack() : DOGuildBattle
      {
         if(hasData("finished_guild_battle_attack",true))
         {
            return new DOGuildBattle(getData("finished_guild_battle_attack"));
         }
         return null;
      }
      
      public function get finished_guild_battle_defense() : DOGuildBattle
      {
         if(hasData("finished_guild_battle_defense",true))
         {
            return new DOGuildBattle(getData("finished_guild_battle_defense"));
         }
         return null;
      }
      
      public function get guild_battle_rewards() : DataObjectArray
      {
         if(hasData("guild_battle_rewards",true))
         {
            return new DataObjectArray(getArray("guild_battle_rewards"),DOGuildBattleReward);
         }
         return null;
      }
      
      public function get battles() : DataObjectArray
      {
         if(hasData("battles",true))
         {
            return new DataObjectArray(getArray("battles"),DOBattle);
         }
         return null;
      }
      
      public function get ref() : String
      {
         return getString("ref");
      }
      
      public function get reskill_enabled() : Boolean
      {
         return getBoolean("reskill_enabled");
      }
      
      public function get advertisment_info() : TypedObject
      {
         return getTypedObject("advertisment_info");
      }
      
      public function get show_advertisment() : Boolean
      {
         return getBoolean("show_advertisment");
      }
      
      public function get show_preroll_advertisment() : Boolean
      {
         return getBoolean("show_preroll_advertisment");
      }
      
      public function get titles() : DataObjectArray
      {
         if(hasData("titles",true))
         {
            return new DataObjectArray(getArray("titles"),DOTitle);
         }
         return null;
      }
      
      public function get expired_boosters() : Vector.<String>
      {
         return getStringVector("expired_boosters");
      }
      
      public function get tos_update_needed() : Boolean
      {
         return getBoolean("tos_update_needed");
      }
      
      public function get pp_update_needed() : Boolean
      {
         return getBoolean("pp_update_needed");
      }
      
      public function get new_version() : Boolean
      {
         return getBoolean("new_version");
      }
      
      public function get login_count() : int
      {
         return getInt("login_count");
      }
      
      public function get server_timestamp_offset() : int
      {
         return getInt("server_timestamp_offset");
      }
      
      public function get ad_provider_keys() : Vector.<String>
      {
         return getStringVector("ad_provider_keys");
      }
      
      public function get user_voucher_rewards() : TypedObject
      {
         return getTypedObject("user_voucher_rewards");
      }
      
      public function get isValid() : Boolean
      {
         return getBoolean("isValid");
      }
      
      public function get voucher() : DOUserVoucher
      {
         if(hasData("voucher",true))
         {
            return new DOUserVoucher(getData("voucher"));
         }
         return null;
      }
      
      public function get voucher_rewards() : TypedObject
      {
         return getTypedObject("voucher_rewards");
      }
      
      public function get collected_work() : DOWorkData
      {
         if(hasData("collected_work",true))
         {
            return new DOWorkData(getData("collected_work"));
         }
         return null;
      }
   }
}
