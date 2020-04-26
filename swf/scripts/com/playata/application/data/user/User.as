package com.playata.application.data.user
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOCharacter;
   import com.playata.application.data.goal.GoalFilter;
   import com.playata.application.data.item.ItemPatternFilter;
   import com.playata.application.data.sewing_machine.SewingMachineFilter;
   import com.playata.application.data.stream.SystemMessageFilter;
   import com.playata.application.ui.ViewManager;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.user.UserBase;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.platform.Platform;
   
   public class User extends UserBase
   {
      
      private static var _enablePremiumCurrencySpendSound:Boolean = true;
       
      
      private var _character:Character = null;
      
      public function User(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get current() : User
      {
         return ViewManager.instance.user;
      }
      
      public static function enablePremiumCurrencySpendSound(param1:Boolean) : void
      {
         _enablePremiumCurrencySpendSound = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_character != null)
         {
            _character.dispose();
            _character = null;
         }
      }
      
      public function get character() : Character
      {
         return _character;
      }
      
      public function refreshCharacter(param1:DOCharacter) : void
      {
         if(_character == null)
         {
            _character = new Character(param1);
         }
         else
         {
            _character.update(param1);
         }
      }
      
      override public function refreshData(param1:TypedObject) : void
      {
         if(_enablePremiumCurrencySpendSound)
         {
            if(param1.hasData("premium_currency") && _userData.hasData("premium_currency"))
            {
               if(param1.getInt("premium_currency") < _userData.getInt("premium_currency"))
               {
                  Environment.audio.playFX("premium_currency_spend.mp3");
               }
            }
         }
         if(_settings != null && param1.hasData("settings",true))
         {
            _settings = null;
         }
         _userData.extend(param1);
      }
      
      public function get autoShowMissedDuels() : Boolean
      {
         return this.getSettingValue("missed_duels_auto_shown") !== false;
      }
      
      public function set autoShowMissedDuels(param1:Boolean) : void
      {
         this.setSettingValue("missed_duels_auto_shown",param1);
      }
      
      public function get showFriendbar() : Boolean
      {
         return this.getSettingValue("hide_friendbar") !== true;
      }
      
      public function set showFriendbar(param1:Boolean) : void
      {
         this.setSettingValue("hide_friendbar",!param1);
      }
      
      public function get showStorygoals() : Boolean
      {
         return this.getSettingValue("hide_storygoals") !== true;
      }
      
      public function set showStorygoals(param1:Boolean) : void
      {
         this.setSettingValue("hide_storygoals",!param1);
      }
      
      public function get showItemPattern() : Boolean
      {
         return this.getSettingValue("show_item_pattern") !== false;
      }
      
      public function set showItemPattern(param1:Boolean) : void
      {
         this.setSettingValue("show_item_pattern",param1);
      }
      
      public function get highlightMovieButton() : Boolean
      {
         return this.getSettingValue("highlight_movie") !== false;
      }
      
      public function set highlightMovieButton(param1:Boolean) : void
      {
         this.setSettingValue("highlight_movie",param1);
      }
      
      public function get showGuildBattles() : Boolean
      {
         return this.getSettingValue("show_guild_battles") !== false;
      }
      
      public function set showGuildBattles(param1:Boolean) : void
      {
         this.setSettingValue("show_guild_battles",param1);
      }
      
      public function get showDuelBattles() : Boolean
      {
         return this.getSettingValue("show_duel_battles") !== false;
      }
      
      public function set showDuelBattles(param1:Boolean) : void
      {
         this.setSettingValue("show_duel_battles",param1);
      }
      
      public function get showFightMissionBattles() : Boolean
      {
         return this.getSettingValue("show_fight_mission_battles") !== false;
      }
      
      public function set showFightMissionBattles(param1:Boolean) : void
      {
         this.setSettingValue("show_fight_mission_battles",param1);
      }
      
      public function get showDungeonBattles() : Boolean
      {
         return this.getSettingValue("show_dungeon_battles") !== false;
      }
      
      public function set showDungeonBattles(param1:Boolean) : void
      {
         this.setSettingValue("show_dungeon_battles",param1);
      }
      
      public function get showMovieBattles() : Boolean
      {
         return this.getSettingValue("show_movie_battles") !== false;
      }
      
      public function set showMovieBattles(param1:Boolean) : void
      {
         this.setSettingValue("show_movie_battles",param1);
      }
      
      public function get showStoryDungeonBattles() : Boolean
      {
         return this.getSettingValue("show_story_dungeon_battles") !== false;
      }
      
      public function set showStoryDungeonBattles(param1:Boolean) : void
      {
         this.setSettingValue("show_story_dungeon_battles",param1);
      }
      
      public function get showShopPreview() : Boolean
      {
         return this.getSettingValue("show_shop_preview") !== false;
      }
      
      public function set showShopPreview(param1:Boolean) : void
      {
         this.setSettingValue("show_shop_preview",param1);
      }
      
      public function get showDungeonStatAnimation() : Boolean
      {
         return this.getSettingValue("show_dungeon_stat_animation") !== false;
      }
      
      public function set showDungeonStatAnimation(param1:Boolean) : void
      {
         this.setSettingValue("show_dungeon_stat_animation",param1);
      }
      
      public function get showMovieStatAnimation() : Boolean
      {
         return this.getSettingValue("show_movie_stat_animation") !== false;
      }
      
      public function set showMovieStatAnimation(param1:Boolean) : void
      {
         this.setSettingValue("show_movie_stat_animation",param1);
      }
      
      public function get showQuestStatAnimation() : Boolean
      {
         return this.getSettingValue("show_quest_stat_animation") !== false;
      }
      
      public function set showQuestStatAnimation(param1:Boolean) : void
      {
         this.setSettingValue("show_quest_stat_animation",param1);
      }
      
      public function get showDatingStatAnimation() : Boolean
      {
         return this.getSettingValue("show_dating_stat_animation") !== false;
      }
      
      public function set showDatingStatAnimation(param1:Boolean) : void
      {
         this.setSettingValue("show_dating_stat_animation",param1);
      }
      
      public function get playBackgroundSounds() : Boolean
      {
         return this.getSettingValue("background_sounds") !== false;
      }
      
      public function set playBackgroundSounds(param1:Boolean) : void
      {
         this.setSettingValue("background_sounds",param1);
      }
      
      public function get playNotificationSounds() : Boolean
      {
         return this.getSettingValue("nofitication_sounds") !== false;
      }
      
      public function set playNotificationSounds(param1:Boolean) : void
      {
         this.setSettingValue("nofitication_sounds",param1);
      }
      
      public function get playGuiSounds() : Boolean
      {
         return this.getSettingValue("gui_sounds") !== false;
      }
      
      public function set playGuiSounds(param1:Boolean) : void
      {
         this.setSettingValue("gui_sounds",param1);
      }
      
      public function get playGuildSounds() : Boolean
      {
         return this.getSettingValue("guild_sounds") !== false;
      }
      
      public function set playGuildSounds(param1:Boolean) : void
      {
         this.setSettingValue("guild_sounds",param1);
      }
      
      public function get showGuildEmoticons() : Boolean
      {
         return this.getSettingValue("show_guild_emoticons") !== false;
      }
      
      public function set showGuildEmoticons(param1:Boolean) : void
      {
         this.setSettingValue("show_guild_emoticons",param1);
      }
      
      public function get autoLogoffActive() : Boolean
      {
         return this.getSettingValue("auto_logoff") !== false;
      }
      
      public function set autoLogoffActive(param1:Boolean) : void
      {
         this.setSettingValue("auto_logoff",param1);
      }
      
      public function get friendRequestsOnly() : Boolean
      {
         return this.getSettingValue("friend_requests_only") === true;
      }
      
      public function set friendRequestsOnly(param1:Boolean) : void
      {
         User.current.setSettingValue("friend_requests_only",param1);
      }
      
      public function get ignoreGuildInvites() : Boolean
      {
         return this.getSettingValue("ignore_guild_invites") === true;
      }
      
      public function set ignoreGuildInvites(param1:Boolean) : void
      {
         this.setSettingValue("ignore_guild_invites",param1);
      }
      
      public function get showGuildEvents() : Boolean
      {
         return this.getSettingValue("show_guild_events") !== false;
      }
      
      public function set showGuildEvents(param1:Boolean) : void
      {
         this.setSettingValue("show_guild_events",param1);
      }
      
      public function get showOnlyUnlockedGoals() : Boolean
      {
         return this.getSettingValue("goal_only_unlocked") === true;
      }
      
      public function get soundVolumne() : Number
      {
         var _loc2_:Object = this.getSettingValue("sound_volume");
         var _loc1_:* = 1;
         if(_loc2_ != null)
         {
            _loc1_ = Number(_loc2_ as Number);
         }
         return _loc1_;
      }
      
      public function set soundVolumne(param1:Number) : void
      {
         this.setSettingValue("sound_volume",param1);
      }
      
      public function get goalFilter() : GoalFilter
      {
         if(hasSetting("goal_filter_settings"))
         {
            return new GoalFilter(getSettingValue("goal_filter_settings"));
         }
         return null;
      }
      
      public function get showOnlyAvailableTitles() : Boolean
      {
         var _loc1_:Object = this.getSettingValue("only_available_titles");
         return _loc1_ === true;
      }
      
      public function get clientAnimationQuality() : int
      {
         var _loc1_:int = getSettingValue("animation_quality") as int;
         return _loc1_ == 0?3:int(_loc1_);
      }
      
      public function get soundPackage() : int
      {
         var _loc1_:int = getSettingValue("sound_package") as int;
         return _loc1_ == 0?0:int(_loc1_);
      }
      
      public function getWhiteLabelId() : String
      {
         var _loc5_:* = null;
         var _loc3_:String = _userData.getString("network");
         var _loc4_:* = null;
         if(_loc3_ != "")
         {
            _loc4_ = Platform.getWhiteLabelId(_loc3_);
            if(_loc4_)
            {
               return _loc4_;
            }
         }
         var _loc1_:String = this.ref;
         if(!_loc1_)
         {
            _loc4_ = AppEnvironment.appPlatform.whiteLabelId;
            if(_loc4_)
            {
               return _loc4_;
            }
            return null;
         }
         var _loc2_:Object = Core.config.cfg("whitelabel_config");
         var _loc7_:int = 0;
         var _loc6_:* = _loc2_;
         for(_loc4_ in _loc2_)
         {
            _loc5_ = _loc2_[_loc4_];
            if(_loc5_["active"])
            {
               if(!(!Core.config.cfg("testMode") && _loc5_["test"]))
               {
                  if(_loc5_["refs"].indexOf(_loc1_) != -1)
                  {
                     return _loc4_;
                  }
               }
            }
         }
         return null;
      }
      
      public function hasWhiteLabelTextOverwrite(param1:String) : Boolean
      {
         var _loc2_:String = getWhiteLabelId();
         if(!_loc2_)
         {
            return false;
         }
         var _loc3_:Object = Core.config.cfg("whitelabel_config")[_loc2_];
         if(!_loc3_.hasOwnProperty("ingame_overwrites"))
         {
            return false;
         }
         return _loc3_["ingame_overwrites"][param1] === true;
      }
      
      public function get applicationName() : String
      {
         var _loc1_:String = getWhiteLabelId();
         if(!_loc1_)
         {
            return Core.config.getString("applicationTitle");
         }
         if(!Core.config.cfg("whitelabel_config")[_loc1_]["application_name"])
         {
            return Core.config.getString("applicationTitle");
         }
         return Core.config.cfg("whitelabel_config")[_loc1_]["application_name"];
      }
      
      public function get systemMessageFilter() : SystemMessageFilter
      {
         if(hasSetting("system_message_filter_settings"))
         {
            return new SystemMessageFilter(getSettingValue("system_message_filter_settings"));
         }
         return null;
      }
      
      public function get sewingMachineFilter() : SewingMachineFilter
      {
         if(hasSetting("sewing_machine_filter_settings"))
         {
            return new SewingMachineFilter(getSettingValue("sewing_machine_filter_settings"));
         }
         return null;
      }
      
      public function get itemPatternFilter() : ItemPatternFilter
      {
         if(hasSetting("item_pattern_filter_settings"))
         {
            return new ItemPatternFilter(getSettingValue("item_pattern_filter_settings"));
         }
         return null;
      }
   }
}
