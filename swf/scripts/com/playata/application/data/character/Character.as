package com.playata.application.data.character
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.Application;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.Battle;
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.bonus.BonusInfo;
   import com.playata.application.data.bonus.DailyBonusLookup;
   import com.playata.application.data.bonus.DailyBonusReward;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.constants.CCharacterAppearance;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CCustomStage;
   import com.playata.application.data.constants.CDungeonTemplate;
   import com.playata.application.data.constants.CGoal;
   import com.playata.application.data.constants.CGuildArtifact;
   import com.playata.application.data.constants.CLevel;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.convention.ConventionReward;
   import com.playata.application.data.convention.ConventionShow;
   import com.playata.application.data.dataobject.DOBankInventory;
   import com.playata.application.data.dataobject.DOCharacter;
   import com.playata.application.data.dataobject.DOConvention;
   import com.playata.application.data.dataobject.DOConventionReward;
   import com.playata.application.data.dataobject.DOConventionShow;
   import com.playata.application.data.dataobject.DODailyBonusLookup;
   import com.playata.application.data.dataobject.DODailyBonusReward;
   import com.playata.application.data.dataobject.DODatingLookup;
   import com.playata.application.data.dataobject.DODuel;
   import com.playata.application.data.dataobject.DODuelOpponentEntry;
   import com.playata.application.data.dataobject.DODungeon;
   import com.playata.application.data.dataobject.DODungeonLevel;
   import com.playata.application.data.dataobject.DODungeonQuest;
   import com.playata.application.data.dataobject.DOEventQuest;
   import com.playata.application.data.dataobject.DOFanFoto;
   import com.playata.application.data.dataobject.DOGuild;
   import com.playata.application.data.dataobject.DOGuildBattle;
   import com.playata.application.data.dataobject.DOInventory;
   import com.playata.application.data.dataobject.DOItem;
   import com.playata.application.data.dataobject.DOMovie;
   import com.playata.application.data.dataobject.DOOpticalChangesLookup;
   import com.playata.application.data.dataobject.DOOutfit;
   import com.playata.application.data.dataobject.DOQuest;
   import com.playata.application.data.dataobject.DOResourceRequest;
   import com.playata.application.data.dataobject.DOStoryDungeon;
   import com.playata.application.data.dataobject.DOStreaming;
   import com.playata.application.data.dataobject.DOTitle;
   import com.playata.application.data.dataobject.DOUserVoucher;
   import com.playata.application.data.dating.Dating;
   import com.playata.application.data.duel.Duel;
   import com.playata.application.data.duel.DuelOpponent;
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.data.dungeon.DungeonQuest;
   import com.playata.application.data.event.EventQuest;
   import com.playata.application.data.event.IngameNotifications;
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.goal.Goal;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.goal.Goals;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildBattle;
   import com.playata.application.data.herobook.Herobook;
   import com.playata.application.data.inventory.BankInventory;
   import com.playata.application.data.inventory.Inventory;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item.ItemSet;
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.marriage.Marriages;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.outfit.Outfits;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.resource.ResourceRequest;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.stream.Streams;
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.titles.Title;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.data.voucher.UserVoucher;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogBoosterExpired;
   import com.playata.application.ui.dialogs.DialogCollectDailyBonusReward;
   import com.playata.application.ui.elements.avatar.ICharacterTooltipProvider;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.goal.UiGoalFilter;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.application.ui.elements.hud.UiPremiumCurrencyPanel;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.localization.LocText;
   
   public class Character extends DOCharacter implements ICharacterTooltipProvider
   {
       
      
      private var _inventory:Inventory = null;
      
      private var _bankInventory:BankInventory = null;
      
      private var _duel:Duel = null;
      
      private var _quests:IntMap = null;
      
      private var _conventionShows:IntMap;
      
      private var _items:IntMap;
      
      private var _missedDuels:int = 0;
      
      private var _shownMissedDuels:int = 0;
      
      private var _newGuildLogEntries:int = 0;
      
      private var _duelOpponents:Vector.<DuelOpponent> = null;
      
      private var _duelStaminaCorrection:int = 0;
      
      private var _duelStaminaCorrectionValue:int = 0;
      
      private var _goalValues:TypedObject = null;
      
      private var _collectedGoals:StringMap = null;
      
      private var _runOutOfMissiles:Boolean = false;
      
      private var _guild:Guild = null;
      
      private var _currentBag:int = 0;
      
      private var _currentBank:int = 0;
      
      private var _finishedAttackGuildBattle:GuildBattle = null;
      
      private var _finishedDefenseGuildBattle:GuildBattle = null;
      
      private var _conventions:Vector.<Convention>;
      
      private var _conventionRewards:Vector.<ConventionReward>;
      
      private var _newConventionIds:Vector.<int>;
      
      private var _dungeons:IntMap;
      
      private var _movies:IntMap;
      
      private var _herobook:Herobook;
      
      private var _resourceRequests:Vector.<ResourceRequest>;
      
      private var _userVouchers:Vector.<UserVoucher>;
      
      private var _newTutorialFlags:Vector.<String>;
      
      private var _titles:StringMap;
      
      private var _newTitlesCount:int;
      
      private var _ingameNotifications:IngameNotifications;
      
      private var _storyDungeons:Vector.<StoryDungeon>;
      
      private var _eventQuests:Vector.<EventQuest>;
      
      private var _movieVoteRewards:Reward = null;
      
      private var _outfits:Outfits = null;
      
      private var _dating:Dating = null;
      
      private var _dailyBonusLookup:DailyBonusLookup = null;
      
      private var _streams:Streams = null;
      
      private var _streaming:Streaming = null;
      
      private var _fanFoto:FanFoto = null;
      
      public function Character(param1:DOCharacter)
      {
         _conventionShows = new IntMap();
         _items = new IntMap();
         _conventions = new Vector.<Convention>();
         _conventionRewards = new Vector.<ConventionReward>();
         _newConventionIds = new Vector.<int>();
         _dungeons = new IntMap();
         _movies = new IntMap();
         _herobook = new Herobook();
         _resourceRequests = new Vector.<ResourceRequest>();
         _userVouchers = new Vector.<UserVoucher>();
         _newTutorialFlags = new Vector.<String>(0);
         _storyDungeons = new Vector.<StoryDungeon>();
         _eventQuests = new Vector.<EventQuest>();
         super(param1);
         if(User.current == null && param1.hasData("gender"))
         {
            if(param1.gender == "f")
            {
               LocText.current.gender = 2;
            }
            else
            {
               LocText.current.gender = 1;
            }
         }
         if(hasData("user_id") && hasData("game_currency") && Application.userController.appUser && Application.userController.appUser.id == userId && param1.hasData("game_currency") && param1.getNumber("game_currency") >= 2147483647)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/game_currency_cap_reached/title"),LocText.current.text("dialog/game_currency_cap_reached/text",LocText.current.formatHugeNumber(2147483647)),LocText.current.text("general/button_ok")));
            setData("game_currency",2147483647);
         }
         _streams = new Streams();
      }
      
      public static function fromData(param1:Object) : Character
      {
         var _loc2_:RequestedCharacterData = new RequestedCharacterData(param1);
         var _loc3_:Character = new Character(_loc2_.requested_character);
         if(_loc2_.requested_character_inventory)
         {
            _loc3_.refreshInventory(new DOInventory(_loc2_.requested_character_inventory),false);
         }
         if(_loc2_.requested_character_inventory_items)
         {
            _loc3_.refreshItems(_loc2_.requested_character_inventory_items);
         }
         if(_loc2_.requested_character_current_goal_values)
         {
            _loc3_.refreshGoalValues(_loc2_.requested_character_current_goal_values);
         }
         if(_loc2_.requested_character_collected_goals)
         {
            _loc3_.refreshCollectedGoals(_loc2_.requested_character_collected_goals);
         }
         if(_loc2_.requested_character_guild)
         {
            _loc3_.refreshGuild(_loc2_.requested_character_guild);
         }
         if(_loc2_.requested_character_optical_changes)
         {
            _loc3_.update(new TypedObject({"optical_changes":_loc2_.requested_character_optical_changes}));
         }
         return _loc3_;
      }
      
      public static function getCleanName(param1:String) : String
      {
         var _loc2_:* = param1;
         if(_loc2_.indexOf("___") != -1)
         {
            _loc2_ = LocText.current.text("general/character_deleted");
         }
         return _loc2_;
      }
      
      public static function toAppearanceSettings(param1:Character) : AppearanceSettings
      {
         var _loc4_:TypedObject = new TypedObject({"gender":param1.gender});
         var _loc2_:CCharacterAppearance = CCharacterAppearance.fromId(param1.gender);
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_.constantKeys;
         for each(var _loc3_ in _loc2_.constantKeys)
         {
            if(!(_loc3_ == "hair_back" || _loc3_ == "hair_middle" || _loc3_.indexOf("_change_cost_") > 0 || _loc3_.indexOf("photo") == 0 || _loc3_.indexOf("_change_required_level") > 0 || _loc3_.indexOf("_style") > 0))
            {
               if(param1.hasData("appearance_" + _loc3_))
               {
                  _loc4_.setInt(_loc3_,param1.getInt("appearance_" + _loc3_));
               }
               else if(_loc3_ == "panties_type" || _loc3_ == "bra_type")
               {
                  _loc4_.setInt(_loc3_,_loc2_.getIntVector(_loc3_)[1]);
               }
               else
               {
                  _loc4_.setInt(_loc3_,_loc2_.getIntVector(_loc3_)[0]);
               }
            }
         }
         _loc4_.setBoolean("show_head_item",param1.isHeadItemShown);
         _loc4_.setBoolean("show_chest_item",param1.isChestItemShown);
         _loc4_.setBoolean("show_belt_item",param1.isBeltItemShown);
         _loc4_.setBoolean("show_legs_item",param1.isLegsItemShown);
         _loc4_.setBoolean("show_boots_item",param1.isBootsItemShown);
         _loc4_.setString("head",param1.getItem("head_item_id") != null?param1.getItem("head_item_id").identifier:null);
         _loc4_.setString("belt",param1.getItem("belt_item_id") != null?param1.getItem("belt_item_id").identifier:null);
         _loc4_.setString("boots",param1.getItem("boots_item_id") != null?param1.getItem("boots_item_id").identifier:null);
         _loc4_.setString("chest",param1.getItem("chest_item_id") != null?param1.getItem("chest_item_id").identifier:null);
         _loc4_.setString("legs",param1.getItem("legs_item_id") != null?param1.getItem("legs_item_id").identifier:null);
         _loc4_.setString("missiles",param1.getItem("missiles_item_id") != null?param1.getItem("missiles_item_id").identifier:null);
         return new AppearanceSettings(_loc4_);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_inventory != null)
         {
            _inventory.dispose();
            _inventory = null;
         }
         if(_bankInventory != null)
         {
            _bankInventory.dispose();
            _bankInventory = null;
         }
      }
      
      override public function update(param1:TypedObject) : void
      {
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc9_:int = 0;
         var _loc19_:int = 0;
         var _loc5_:int = 0;
         var _loc10_:* = null;
         var _loc3_:* = null;
         var _loc21_:DOCharacter = new DOCharacter(param1);
         if(_loc21_.hasData("level") && hasData("level"))
         {
            if(_loc21_.level > this.level)
            {
               _loc13_ = Environment.info.defaultLocale;
               var _loc23_:int = 0;
               var _loc22_:* = CCustomStage.ids;
               for each(var _loc4_ in CCustomStage.ids)
               {
                  _loc14_ = CCustomStage.fromId(_loc4_);
                  if(!(_loc14_.locales.indexOf("all") == -1 && _loc14_.locales.indexOf(_loc13_) == -1))
                  {
                     if(_loc14_.minLevel == _loc21_.level)
                     {
                        MessageRouter.dispatch(new Message("CharacterMessage.notifyStageUp",_loc14_.stage,this));
                     }
                  }
               }
            }
         }
         if(_loc21_.hasData("max_quest_stage") && hasData("max_quest_stage"))
         {
            if(_loc21_.maxQuestStage > maxQuestStage)
            {
               UiPremiumCurrencyPanel.instance.offset = UiPremiumCurrencyPanel.instance.offset + CConstant.stage_level_up_premium_amount;
               MessageRouter.dispatch(new Message("CharacterMessage.notifyStageUp",_loc21_.maxQuestStage,this));
            }
         }
         var _loc11_:Boolean = false;
         if(_loc21_.hasData("level") && hasData("level"))
         {
            if(_loc21_.level > level)
            {
               _loc11_ = true;
               MessageRouter.dispatch(new Message("CharacterMessage.notifyLevelUp",_loc21_.level,this));
            }
         }
         if(AppConfig.dungeonsEnabled && _loc21_.hasData("fans") && hasData("fans"))
         {
            _loc9_ = fansTotal;
            _loc19_ = _loc21_.fans;
            var _loc25_:int = 0;
            var _loc24_:* = CDungeonTemplate.ids;
            for each(var _loc8_ in CDungeonTemplate.ids)
            {
               _loc5_ = GameUtil.getDungeonUnlockFansCount(_loc8_);
               if(_loc9_ < _loc5_ && _loc19_ >= _loc5_)
               {
                  PanelCitymap.unlockedDungeon = _loc8_;
                  break;
               }
            }
         }
         var _loc18_:Boolean = false;
         if(_loc21_.hasData("avatar_image") && _loc21_.avatarImage != avatarImage)
         {
            _loc18_ = true;
         }
         if(_loc21_.hasData("level") && hasData("level"))
         {
            if(_loc21_.level > level && _loc21_.level == CConstant.inventory_bag2_unlock_level)
            {
               MessageRouter.dispatch(new Message("CharacterMessage.notifyInventoryBag2Unlock",_loc21_.level,this));
            }
            else if(_loc21_.level > level && _loc21_.level == CConstant.inventory_bag3_unlock_level)
            {
               MessageRouter.dispatch(new Message("CharacterMessage.notifyInventoryBag3Unlock",_loc21_.level,this));
            }
         }
         _newTutorialFlags.length = 0;
         if(_loc21_.hasData("tutorial_flags",true))
         {
            if(hasData("tutorial_flags"))
            {
               _loc10_ = TypedObject.fromJsonString(tutorialFlags);
               _loc3_ = TypedObject.fromJsonString(_loc21_.tutorialFlags);
               var _loc27_:int = 0;
               var _loc26_:* = _loc3_.keys;
               for each(var _loc15_ in _loc3_.keys)
               {
                  if(!_loc10_.hasData(_loc15_) || _loc10_.getData(_loc15_) !== true)
                  {
                     _newTutorialFlags.push(_loc15_);
                  }
               }
            }
         }
         if(hasNewTutorialFlag("stats_spent"))
         {
            MessageRouter.dispatch(new Message("CharacterMessage.notifyInitialStatPointsSpend",null,this));
         }
         if(_loc21_.hasData("guild_id") && hasData("guild_id") && _loc21_.guildId === 0 && guildId !== 0)
         {
            UiGuildChatTab.instance.clearChatLog();
            AppEnvironment.friendBar.leaveGuild();
         }
         var _loc16_:Vector.<String> = new Vector.<String>(0);
         var _loc6_:Boolean = _loc21_.hasData("active_quest_booster_id") && _loc21_.activeQuestBoosterId === "" && hasData("active_quest_booster_id") && super.activeQuestBoosterId != "";
         var _loc17_:Boolean = _loc21_.hasData("active_stats_booster_id") && _loc21_.activeStatsBoosterId === "" && hasData("active_stats_booster_id") && super.activeStatsBoosterId != "";
         var _loc20_:Boolean = _loc21_.hasData("active_work_booster_id") && _loc21_.activeWorkBoosterId === "" && hasData("active_work_booster_id") && super.activeWorkBoosterId != "";
         var _loc12_:Boolean = _loc21_.hasData("ts_active_sense_boost_expires") && _loc21_.tsActiveSenseBoostExpires === 0 && hasData("ts_active_sense_boost_expires") && tsActiveSenseBoostExpires > 0;
         var _loc2_:Boolean = _loc21_.hasData("ts_active_multitasking_boost_expires") && _loc21_.tsActiveMultitaskingBoostExpires === 0 && hasData("ts_active_multitasking_boost_expires") && tsActiveMultitaskingBoostExpires > 0;
         if(_loc6_)
         {
            _loc16_.push(super.activeQuestBoosterId);
         }
         if(_loc17_)
         {
            _loc16_.push(super.activeStatsBoosterId);
         }
         if(_loc20_)
         {
            _loc16_.push(super.activeWorkBoosterId);
         }
         if(_loc12_)
         {
            _loc16_.push("booster_sense");
         }
         if(_loc2_)
         {
            _loc16_.push("booster_multitasking");
         }
         if(_loc6_)
         {
            Environment.application.sendActionRequest("refreshQuests",{},handleRequests);
         }
         var _loc7_:Vector.<GoalValue> = null;
         if(_loc21_.hasData("level") && _loc21_.level > level)
         {
            _loc7_ = Goals.instance.unavailableGoalValues(this);
         }
         if(hasData("user_id") && hasData("game_currency") && Application.userController.appUser && Application.userController.appUser.id == userId && _loc21_.hasData("game_currency") && _loc21_.getNumber("game_currency") >= 2147483647 && _loc21_.getNumber("game_currency") != getNumber("game_currency"))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/game_currency_cap_reached/title"),LocText.current.text("dialog/game_currency_cap_reached/text",LocText.current.formatHugeNumber(2147483647)),LocText.current.text("general/button_ok")));
            _loc21_.setData("game_currency",2147483647);
         }
         if(_loc21_.hasData("guild_id") && _loc21_.guildId === 0)
         {
            _guild = null;
         }
         super.update(_loc21_);
         if(_loc16_.length > 0)
         {
            Environment.panelManager.showDialog(new DialogBoosterExpired(_loc16_));
         }
         if(User.current != null)
         {
            if(hasData("user_id") && userId == User.current.id && _loc21_.hasData("gender"))
            {
               if(_loc21_.gender == "f")
               {
                  LocText.current.gender = 2;
               }
               else
               {
                  LocText.current.gender = 1;
               }
            }
         }
         else if(_loc21_.hasData("gender"))
         {
            if(_loc21_.gender == "f")
            {
               LocText.current.gender = 2;
            }
            else
            {
               LocText.current.gender = 1;
            }
         }
         if(_loc7_ != null)
         {
            Goals.instance.checkNewGoalValues(this,_loc7_);
         }
         if(_loc11_ || _loc18_)
         {
            AppEnvironment.friendBar.syncFriendBarCharacter(User.current.character);
         }
      }
      
      public function refreshInventory(param1:DOInventory, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         if(_inventory == null)
         {
            _inventory = new Inventory(param1,param2);
         }
         else
         {
            _loc3_ = 0;
            if(param2)
            {
               if(_inventory.hasData("missiles_item_id") && _inventory.missilesItemId != 0 && param1.hasData("missiles_item_id") && param1.missilesItemId === 0)
               {
                  _loc3_ = _inventory.missilesItemId;
               }
            }
            _inventory.update(param1);
            if(_loc3_ != 0)
            {
               if(!hasInventoryItem(_loc3_) && _inventory.lastSoldItemId != _loc3_)
               {
                  _runOutOfMissiles = true;
               }
            }
         }
      }
      
      public function refreshBankInventory(param1:DOBankInventory) : void
      {
         if(_bankInventory == null)
         {
            _bankInventory = new BankInventory(param1);
         }
         else
         {
            _bankInventory.update(param1);
         }
      }
      
      public function hasRunOutMissiles() : Boolean
      {
         var _loc1_:Boolean = _runOutOfMissiles;
         _runOutOfMissiles = false;
         return _loc1_;
      }
      
      public function refreshQuests(param1:DataObjectArray) : void
      {
         _quests = new IntMap();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            _quests.setData(_loc2_.id,new Quest(_loc2_));
         }
      }
      
      public function refreshQuest(param1:DOQuest) : Quest
      {
         if(!param1.hasData("id"))
         {
            return null;
         }
         if(!_quests.exists(param1.id))
         {
            return null;
         }
         (_quests.getData(param1.id) as Quest).update(param1);
         return _quests.getData(param1.id) as Quest;
      }
      
      public function addNewConventionEventId(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _newConventionIds;
         for each(var _loc2_ in _newConventionIds)
         {
            if(_loc2_ == param1)
            {
               return;
            }
         }
         _newConventionIds.push(param1);
      }
      
      public function removeNewConventionId(param1:int) : void
      {
         var _loc2_:int = _newConventionIds.indexOf(param1);
         if(_loc2_ !== -1)
         {
            _newConventionIds.splice(_loc2_,1);
         }
      }
      
      public function get hasNewConventionIds() : Boolean
      {
         return _newConventionIds.length > 0;
      }
      
      public function get newConventionIds() : Vector.<int>
      {
         return _newConventionIds;
      }
      
      public function get hasFinishedConventionIds() : Boolean
      {
         return finishedConventions.length > 0;
      }
      
      public function refreshConventionShow(param1:DOConventionShow) : ConventionShow
      {
         return DataObject.createOrUpdateMap(ConventionShow,_conventionShows,param1);
      }
      
      public function refreshItem(param1:DOItem) : Item
      {
         var _loc2_:Item = DataObject.createOrUpdateMap(Item,_items,param1);
         if(_loc2_ != null)
         {
            _loc2_.updateOwner(gender,name);
         }
         return _loc2_;
      }
      
      public function refreshItems(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshItem(_loc2_);
         }
      }
      
      public function refreshDuel(param1:DODuel) : Duel
      {
         _duel = DataObject.createOrUpdate(Duel,_duel,param1);
         return _duel;
      }
      
      public function refreshDuelOpponents(param1:DataObjectArray) : void
      {
         _duelOpponents = new Vector.<DuelOpponent>();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            _duelOpponents.push(new DuelOpponent(_loc2_));
         }
         _duelOpponents.sort(sortByHonor);
      }
      
      private function sortByHonor(param1:DuelOpponent, param2:DuelOpponent) : int
      {
         if(param1.honor < param2.honor)
         {
            return 1;
         }
         if(param1.honor > param2.honor)
         {
            return -1;
         }
         return 0;
      }
      
      public function refreshGuild(param1:DOGuild) : void
      {
         _guild = DataObject.createOrUpdate(Guild,_guild,param1);
      }
      
      public function refreshGoalValues(param1:TypedObject) : void
      {
         var _loc6_:Boolean = false;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:Boolean = false;
         if(_goalValues == null)
         {
            _goalValues = param1;
         }
         else
         {
            _loc6_ = false;
            var _loc8_:int = 0;
            var _loc7_:* = param1.keys;
            for each(var _loc3_ in param1.keys)
            {
               _loc2_ = Goals.instance.goal(_loc3_);
               if(_loc2_)
               {
                  _loc5_ = _loc2_.currentTargetValue(this);
                  _loc4_ = !_loc5_.isCollectable(this) && !_loc5_.isCollected(this);
                  if(!param1.getTypedObject(_loc3_).hasData("value"))
                  {
                     _goalValues.getTypedObject(_loc3_).setInt("current_value",param1.getTypedObject(_loc3_).getInt("current_value"));
                  }
                  else
                  {
                     _goalValues.setData(_loc3_,param1.getData(_loc3_));
                  }
                  if(_loc4_ && Goals.instance.goal(_loc3_).currentTargetValue(this).isCollectable(this))
                  {
                     _loc6_ = true;
                  }
               }
            }
            if(_loc6_)
            {
               Environment.audio.playFX("goal_completed.mp3");
               ViewManager.instance.baseUserPanel.refreshGoalIcon(false,true);
               MessageRouter.dispatch(new Message("CharacterMessage.notifyGoalCollectable"));
            }
         }
      }
      
      public function refreshCollectedGoals(param1:TypedObject) : void
      {
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc3_:* = _collectedGoals != null;
         if(_collectedGoals == null)
         {
            _collectedGoals = new StringMap();
         }
         var _loc2_:Vector.<GoalValue> = new Vector.<GoalValue>();
         if(_loc3_)
         {
            _loc2_ = Goals.instance.unavailableGoalValues(this);
         }
         var _loc12_:int = 0;
         var _loc11_:* = param1.rawData;
         for each(var _loc5_ in param1.rawData)
         {
            var _loc10_:int = 0;
            var _loc9_:* = _loc5_;
            for(var _loc6_ in _loc5_)
            {
               if(!_collectedGoals.exists(_loc6_))
               {
                  _collectedGoals.setData(_loc6_,new IntMap());
               }
               _loc4_ = new TypedObject(_loc5_[_loc6_]);
               _loc7_ = _loc4_.getInt("value");
               _loc8_ = _collectedGoals.getData(_loc6_);
               if(!_loc8_.exists(_loc7_))
               {
                  _loc8_.setData(_loc7_,DateTime.fromStringServer(_loc4_.getString("date")).timestamp);
               }
            }
         }
         if(_loc3_)
         {
            Goals.instance.checkNewGoalValues(this,_loc2_);
         }
      }
      
      public function refreshFinishedGuildBattleAttack(param1:DOGuildBattle) : void
      {
         _finishedAttackGuildBattle = DataObject.createOrUpdate(GuildBattle,_finishedAttackGuildBattle,param1);
      }
      
      public function refreshFinishedGuildBattleDefense(param1:DOGuildBattle) : void
      {
         _finishedDefenseGuildBattle = DataObject.createOrUpdate(GuildBattle,_finishedDefenseGuildBattle,param1);
      }
      
      public function refreshConventions(param1:DataObjectArray) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            refreshConvention(_loc3_);
         }
         var _loc7_:int = 0;
         var _loc6_:* = _conventions;
         for each(var _loc2_ in _conventions)
         {
            if(_loc2_.status == 1)
            {
               if(conventionId != _loc2_.id)
               {
                  addNewConventionEventId(_loc2_.id);
               }
            }
         }
      }
      
      public function refreshConvention(param1:DOConvention) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = _conventions;
         for each(var _loc3_ in _conventions)
         {
            if(_loc3_.id == param1.id)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(_loc2_ == null)
         {
            _loc4_ = new Convention(param1);
            _conventions.push(_loc4_);
         }
         else
         {
            _loc2_.update(param1);
         }
      }
      
      public function getConvention(param1:int) : Convention
      {
         var _loc4_:int = 0;
         var _loc3_:* = _conventions;
         for each(var _loc2_ in _conventions)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function refreshConventionRewards(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshConventionReward(_loc2_);
         }
      }
      
      public function refreshConventionReward(param1:DOConventionReward) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = _conventionRewards;
         for each(var _loc2_ in _conventionRewards)
         {
            if(_loc2_.id == param1.id)
            {
               _loc4_ = _loc2_;
               break;
            }
         }
         if(_loc4_ == null)
         {
            _loc3_ = new ConventionReward(param1);
            _conventionRewards.push(_loc3_);
         }
         else
         {
            _loc4_.update(param1);
         }
      }
      
      public function getConventionReward(param1:int) : ConventionReward
      {
         var _loc4_:int = 0;
         var _loc3_:* = _conventionRewards;
         for each(var _loc2_ in _conventionRewards)
         {
            if(_loc2_.conventionId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function refreshConventionCharacterData(param1:Array) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc3_ in param1)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _conventions;
            for each(var _loc2_ in _conventions)
            {
               if(_loc2_.id == _loc3_.convention_id)
               {
                  _loc2_.update(new TypedObject(_loc3_));
                  break;
               }
            }
         }
      }
      
      public function getConventionShowCount(param1:int) : int
      {
         if(conventionId == param1)
         {
            return conventionShowCount;
         }
         return 0;
      }
      
      public function getActiveConventionByStage(param1:int) : Convention
      {
         var _loc4_:int = 0;
         var _loc3_:* = _conventions;
         for each(var _loc2_ in _conventions)
         {
            if(_loc2_.isValid)
            {
               if(_loc2_.stage == param1)
               {
                  if(_loc2_.isRunning)
                  {
                     return _loc2_;
                  }
               }
            }
         }
         return null;
      }
      
      public function get finishedConventions() : Vector.<Convention>
      {
         var _loc1_:Vector.<Convention> = new Vector.<Convention>();
         var _loc4_:int = 0;
         var _loc3_:* = _conventions;
         for each(var _loc2_ in _conventions)
         {
            if(_loc2_.isFinished && _loc2_.isValid)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get pendingConventions() : Vector.<Convention>
      {
         var _loc1_:Vector.<Convention> = new Vector.<Convention>();
         var _loc4_:int = 0;
         var _loc3_:* = _conventions;
         for each(var _loc2_ in _conventions)
         {
            if(_loc2_.isPending && _loc2_.isValid)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function refreshDungeon(param1:DODungeon) : void
      {
         var _loc2_:* = null;
         if(_dungeons.exists(param1.id))
         {
            _dungeons.getData(param1.id).update(param1);
         }
         else
         {
            _loc2_ = new Dungeon(param1);
            _dungeons.setData(param1.id,_loc2_);
         }
      }
      
      public function refreshDungeonLevel(param1:DODungeonLevel) : void
      {
         if(!_dungeons.exists(param1.dungeonId))
         {
            return;
         }
         var _loc2_:Dungeon = _dungeons.getData(param1.dungeonId);
         _loc2_.refreshLevel(param1);
      }
      
      public function refreshDungeonLevels(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshDungeonLevel(_loc2_);
         }
      }
      
      public function refreshDungeonQuest(param1:DODungeonQuest) : void
      {
         if(!_dungeons.exists(param1.dungeonId))
         {
            return;
         }
         var _loc2_:Dungeon = _dungeons.getData(param1.dungeonId);
         _loc2_.currentLevel.refreshQuest(param1);
      }
      
      public function get hasDungeonQuestCooldown() : Boolean
      {
         return secondsToNextDungeonQuest > 0;
      }
      
      public function get secondsToNextDungeonQuest() : int
      {
         var _loc1_:int = tsLastDungeonQuest;
         if(_loc1_ <= 0)
         {
            return 0;
         }
         var _loc2_:int = !!lastDungeonQuestLost?CConstant.dungeon_quest_cooldown_lost:int(CConstant.dungeon_quest_cooldown_win);
         var _loc3_:int = _loc1_ + _loc2_;
         if(_loc3_ < TimeUtil.now)
         {
            return 0;
         }
         return _loc3_ - TimeUtil.now;
      }
      
      public function goalValue(param1:Goal, param2:Boolean = false) : int
      {
         if(_goalValues == null)
         {
            return 0;
         }
         if(_goalValues.hasData(param1.identifier,true))
         {
            if(param2)
            {
               return _goalValues.getData(param1.identifier)["current_value"];
            }
            return _goalValues.getData(param1.identifier)["value"];
         }
         return 0;
      }
      
      public function isGoalCollected(param1:Goal, param2:GoalValue) : Boolean
      {
         return collectedGoalDateTimestamp(param1,param2) !== 0;
      }
      
      public function collectedGoalDateTimestamp(param1:Goal, param2:GoalValue) : int
      {
         if(!_collectedGoals.exists(param1.identifier))
         {
            return 0;
         }
         var _loc3_:IntMap = _collectedGoals.getData(param1.identifier);
         if(!_loc3_.exists(param2.value))
         {
            return 0;
         }
         return _loc3_.getData(param2.value);
      }
      
      public function collectedGoalDate(param1:Goal, param2:GoalValue) : String
      {
         var _loc3_:int = collectedGoalDateTimestamp(param1,param2);
         if(_loc3_ == 0)
         {
            return "";
         }
         return AppDateTime.timestampToLocalString(_loc3_,AppDateTime.dateFormat);
      }
      
      public function openGoalValues() : Vector.<GoalValue>
      {
         var _loc1_:Vector.<GoalValue> = new Vector.<GoalValue>();
         var _loc7_:int = 0;
         var _loc6_:* = Goals.instance.goals;
         for each(var _loc3_ in Goals.instance.goals)
         {
            if(_loc3_.identifier != "account_confirmed")
            {
               if(!(_loc3_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
               {
                  if(!(_loc3_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                  {
                     var _loc5_:int = 0;
                     var _loc4_:* = _loc3_.values;
                     for each(var _loc2_ in _loc3_.values)
                     {
                        if(!_loc2_.isCollected(this))
                        {
                           if(!(!_loc2_.isCollectable(this) && !_loc2_.isAvailable(this)))
                           {
                              _loc1_.push(_loc2_);
                           }
                        }
                     }
                     continue;
                  }
                  continue;
               }
               continue;
            }
         }
         return _loc1_;
      }
      
      public function openGoals(param1:Boolean = false, param2:int = 0, param3:Boolean = false, param4:Boolean = true) : Vector.<Goal>
      {
         var _loc6_:* = null;
         var _loc8_:Boolean = false;
         var _loc5_:Vector.<Goal> = new Vector.<Goal>();
         var _loc12_:int = 0;
         var _loc11_:* = Goals.instance.goals;
         for each(var _loc7_ in Goals.instance.goals)
         {
            if(!(param2 > 0 && _loc7_.category != param2))
            {
               if(_loc7_.identifier != "account_confirmed")
               {
                  if(!(_loc7_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                  {
                     if(!(_loc7_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                     {
                        if(param3)
                        {
                           _loc6_ = _loc7_.currentTargetValue(this,true);
                           if(!_loc6_.isCollected(this))
                           {
                              _loc8_ = false;
                              var _loc10_:int = 0;
                              var _loc9_:* = _loc7_.values;
                              for each(_loc6_ in _loc7_.values)
                              {
                                 if(!(param1 && !_loc6_.isCollectable(this) && !_loc6_.isAvailable(this)))
                                 {
                                    if(!_loc6_.isCollected(this) && UiGoalFilter.isAllowed(_loc6_,this))
                                    {
                                       _loc8_ = true;
                                       break;
                                    }
                                 }
                              }
                              if(_loc8_)
                              {
                                 _loc5_.push(_loc7_);
                              }
                              else
                              {
                                 continue;
                              }
                           }
                        }
                        else
                        {
                           _loc5_.push(_loc7_);
                        }
                     }
                  }
               }
            }
         }
         if(param4)
         {
            _loc5_.sort(sortGoalsByTargetValueAndPosition);
         }
         return _loc5_;
      }
      
      public function finishedGoalValueCount(param1:int = 0) : int
      {
         var _loc2_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:* = Goals.instance.goals;
         for each(var _loc4_ in Goals.instance.goals)
         {
            if(!(param1 > 0 && _loc4_.category != param1))
            {
               if(_loc4_.identifier != "account_confirmed")
               {
                  if(!(_loc4_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                  {
                     if(!(_loc4_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                     {
                        var _loc6_:int = 0;
                        var _loc5_:* = _loc4_.values;
                        for each(var _loc3_ in _loc4_.values)
                        {
                           if(_loc3_.isCollected(this))
                           {
                              _loc2_++;
                           }
                        }
                        continue;
                     }
                     continue;
                  }
                  continue;
               }
               continue;
            }
         }
         return _loc2_;
      }
      
      public function finishedGoals(param1:int = 0) : Vector.<Goal>
      {
         var _loc2_:Vector.<Goal> = new Vector.<Goal>();
         var _loc8_:int = 0;
         var _loc7_:* = Goals.instance.goals;
         for each(var _loc4_ in Goals.instance.goals)
         {
            if(!(param1 > 0 && _loc4_.category != param1))
            {
               if(_loc4_.identifier != "account_confirmed")
               {
                  if(!(_loc4_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                  {
                     if(!(_loc4_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                     {
                        var _loc6_:int = 0;
                        var _loc5_:* = _loc4_.values;
                        for each(var _loc3_ in _loc4_.values)
                        {
                           if(_loc3_.isCollected(this))
                           {
                              _loc2_.push(_loc4_);
                              break;
                           }
                        }
                        continue;
                     }
                     continue;
                  }
                  continue;
               }
               continue;
            }
         }
         _loc2_.sort(sortGoalsByPosition);
         return _loc2_;
      }
      
      public function recentGoalValues(param1:int, param2:int) : Vector.<GoalValue>
      {
         var _loc6_:Vector.<GoalValue> = new Vector.<GoalValue>();
         var _loc11_:int = 0;
         var _loc10_:* = Goals.instance.goals;
         for each(var _loc5_ in Goals.instance.goals)
         {
            if(!(param1 > 0 && _loc5_.category != param1))
            {
               if(_loc5_.identifier != "account_confirmed")
               {
                  if(!(_loc5_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                  {
                     if(!(_loc5_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                     {
                        var _loc9_:int = 0;
                        var _loc8_:* = _loc5_.values;
                        for each(var _loc4_ in _loc5_.values)
                        {
                           if(_loc4_.isCollected(this))
                           {
                              _loc6_.push(_loc4_);
                           }
                        }
                        continue;
                     }
                     continue;
                  }
                  continue;
               }
               continue;
            }
         }
         _loc6_.sort(sortByCollectionDate);
         var _loc3_:Vector.<GoalValue> = new Vector.<GoalValue>();
         var _loc13_:int = 0;
         var _loc12_:* = _loc6_;
         for each(var _loc7_ in _loc6_)
         {
            if(_loc3_.length < param2)
            {
               _loc3_.push(_loc7_);
               continue;
            }
            break;
         }
         return _loc3_;
      }
      
      public function get statisticGoalValues() : Vector.<GoalValue>
      {
         var _loc3_:Vector.<GoalValue> = new Vector.<GoalValue>();
         var _loc7_:int = 0;
         var _loc6_:* = Goals.instance.goals;
         for each(var _loc2_ in Goals.instance.goals)
         {
            if(_loc2_.identifier != "account_confirmed")
            {
               if(!(_loc2_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
               {
                  if(!(_loc2_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                  {
                     if(CGoal.fromId(_loc2_.identifier).statistics)
                     {
                        var _loc5_:int = 0;
                        var _loc4_:* = _loc2_.values;
                        for each(var _loc1_ in _loc2_.values)
                        {
                           if(_loc1_.currentValue < _loc1_.value)
                           {
                              _loc3_.push(_loc1_);
                              break;
                           }
                        }
                        if(_loc1_.currentValue >= _loc1_.value)
                        {
                           _loc3_.push(_loc1_);
                        }
                     }
                  }
               }
            }
         }
         return _loc3_;
      }
      
      private function sortGoalsByTargetValueAndPosition(param1:Goal, param2:Goal) : int
      {
         var _loc3_:Boolean = param1.currentTargetValue(this,true).isCollectable(this);
         var _loc4_:Boolean = param2.currentTargetValue(this,true).isCollectable(this);
         if(_loc3_ != _loc4_)
         {
            return int(_loc4_) - int(_loc3_);
         }
         return param1.position - param2.position;
      }
      
      private function sortGoalsByPosition(param1:Goal, param2:Goal) : int
      {
         return param1.position - param2.position;
      }
      
      private function sortByCollectionDate(param1:GoalValue, param2:GoalValue) : int
      {
         return param1.collectedDateTimestamp(this) > param2.collectedDateTimestamp(this)?-1:1;
      }
      
      public function get currentStoryGoal() : GoalValue
      {
         var _loc1_:GoalValue = pinnedStorygoal;
         if(_loc1_)
         {
            return _loc1_;
         }
         return defaultStorygoal;
      }
      
      public function get pinnedStorygoal() : GoalValue
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc4_:GoalValue = null;
         if(storygoal != "")
         {
            _loc3_ = storygoal.split(";");
            if(_loc3_.length == 2)
            {
               _loc1_ = _loc3_[0];
               var _loc6_:int = 0;
               var _loc5_:* = Goals.instance.goals;
               for each(_loc2_ in Goals.instance.goals)
               {
                  if(_loc2_.identifier == _loc1_)
                  {
                     _loc4_ = _loc2_.currentTargetValue(this);
                     break;
                  }
               }
            }
         }
         if(_loc4_ && !_loc4_.isCollected(this) && (_loc4_.isAvailable(this) || _loc4_.isCollectable(this)))
         {
            return _loc4_;
         }
         return null;
      }
      
      public function get defaultStorygoal() : GoalValue
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:Vector.<GoalValue> = new Vector.<GoalValue>();
         var _loc7_:int = 0;
         var _loc6_:* = Goals.instance.goals;
         for each(_loc3_ in Goals.instance.goals)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _loc3_.values;
            for each(_loc2_ in _loc3_.values)
            {
               if(!_loc2_.isCollected(this))
               {
                  if(_loc2_.isStoryGoal)
                  {
                     if(!(!_loc2_.isAvailable(this) && !_loc2_.isCollectable(this)))
                     {
                        if(!(_loc3_.isHidden && !_loc2_.isCollectable(this)))
                        {
                           _loc1_.push(_loc2_);
                        }
                     }
                  }
               }
            }
         }
         _loc1_.sort(sortByIndex);
         if(_loc1_.length)
         {
            return _loc1_[0];
         }
         return null;
      }
      
      private function sortByIndex(param1:GoalValue, param2:GoalValue) : int
      {
         return param1.position - param2.position;
      }
      
      public function collectableGoalValues(param1:int = 0, param2:Boolean = false) : Vector.<GoalValue>
      {
         var _loc3_:Vector.<GoalValue> = new Vector.<GoalValue>();
         var _loc9_:int = 0;
         var _loc8_:* = Goals.instance.goals;
         for each(var _loc5_ in Goals.instance.goals)
         {
            if(!(param1 && _loc5_.category != param1))
            {
               if(_loc5_.identifier != "account_confirmed")
               {
                  if(!(_loc5_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                  {
                     if(!(_loc5_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                     {
                        var _loc7_:int = 0;
                        var _loc6_:* = _loc5_.values;
                        for each(var _loc4_ in _loc5_.values)
                        {
                           if(!_loc4_.isCollected(this) && _loc4_.isCollectable(this))
                           {
                              if(!(param2 && !UiGoalFilter.isAllowed(_loc4_,this)))
                              {
                                 _loc3_.push(_loc4_);
                              }
                           }
                        }
                        continue;
                     }
                     continue;
                  }
                  continue;
               }
               continue;
            }
         }
         return _loc3_;
      }
      
      public function get hasCollectableGoalValues() : Boolean
      {
         var _loc6_:int = 0;
         var _loc5_:* = Goals.instance.goals;
         for each(var _loc2_ in Goals.instance.goals)
         {
            if(_loc2_.identifier != "account_confirmed")
            {
               if(!(_loc2_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
               {
                  if(!(_loc2_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
                  {
                     var _loc4_:int = 0;
                     var _loc3_:* = _loc2_.values;
                     for each(var _loc1_ in _loc2_.values)
                     {
                        if(_loc1_.isCollectable(this) && !_loc1_.isCollected(this))
                        {
                           return true;
                        }
                     }
                     continue;
                  }
                  continue;
               }
               continue;
            }
         }
         return false;
      }
      
      public function get hasNewGoalValues() : Boolean
      {
         var _loc6_:int = 0;
         var _loc5_:* = Goals.instance.goals;
         for each(var _loc2_ in Goals.instance.goals)
         {
            if(!(_loc2_.identifier == "first_quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
            {
               if(!(_loc2_.identifier == "quest_resource_request_accepted" && !AppEnvironment.appPlatform.isResourceRequestAllowed))
               {
                  var _loc4_:int = 0;
                  var _loc3_:* = _loc2_.values;
                  for each(var _loc1_ in _loc2_.values)
                  {
                     if(_loc1_.isNew)
                     {
                        return true;
                     }
                  }
                  continue;
               }
               continue;
            }
         }
         return false;
      }
      
      public function getCharacterTooltipInformation() : CharacterTooltipInformation
      {
         var _loc1_:CharacterTooltipInformation = new CharacterTooltipInformation();
         _loc1_.totalStamina = statTotalStamina;
         _loc1_.totalStrength = statTotalStrength;
         _loc1_.totalCriticalRating = statTotalCriticalRating;
         _loc1_.totalDodgeRating = statTotalDodgeRating;
         _loc1_.avatarImageSettings = avatarImage;
         _loc1_.battleEffectsData = battleEffectsData;
         return _loc1_;
      }
      
      public function getCurrentSettings(param1:int = 0, param2:Outfit = null) : AppearanceSettings
      {
         var _loc5_:AppearanceSettings = new AppearanceSettings({"gender":gender});
         var _loc3_:CCharacterAppearance = CCharacterAppearance.fromId(gender);
         var _loc7_:int = 0;
         var _loc6_:* = _loc3_.constantKeys;
         for each(var _loc4_ in _loc3_.constantKeys)
         {
            if(!(_loc4_ == "hair_back" || _loc4_ == "hair_middle" || _loc4_.indexOf("change_cost") > 0 || _loc4_.indexOf("required_level") > 0 || _loc4_.indexOf("_style") > 0))
            {
               if(!(this != User.current.character && _loc4_.indexOf("photo_") == 0))
               {
                  if(hasData("appearance_" + _loc4_))
                  {
                     _loc5_.setAppearance(_loc4_,getInt("appearance_" + _loc4_));
                  }
                  else if(_loc4_ == "eyebrows_color")
                  {
                     _loc5_.setAppearance(_loc4_,getInt("appearance_hair_color"));
                  }
                  else if(_loc4_ == "facial_hair_color")
                  {
                     _loc5_.setAppearance(_loc4_,getInt("appearance_hair_color"));
                  }
               }
            }
         }
         _loc5_.show_head_item = isHeadItemShown;
         _loc5_.show_chest_item = isChestItemShown;
         _loc5_.show_belt_item = isBeltItemShown;
         _loc5_.show_legs_item = isLegsItemShown;
         _loc5_.show_boots_item = isBootsItemShown;
         if(!param2)
         {
            param2 = outfits.getOutfitWithSetting(param1);
         }
         if(param2 && param2.characterId == id)
         {
            _loc5_.head = param2.getItem(1) != null?param2.getItem(1).identifier:null;
            _loc5_.chest = param2.getItem(2) != null?param2.getItem(2).identifier:null;
            _loc5_.belt = param2.getItem(3) != null?param2.getItem(3).identifier:null;
            _loc5_.legs = param2.getItem(4) != null?param2.getItem(4).identifier:null;
            _loc5_.boots = param2.getItem(5) != null?param2.getItem(5).identifier:null;
         }
         else
         {
            _loc5_.head = getItem("head_item_id") != null?getItem("head_item_id").identifier:null;
            _loc5_.chest = getItem("chest_item_id") != null?getItem("chest_item_id").identifier:null;
            _loc5_.belt = getItem("belt_item_id") != null?getItem("belt_item_id").identifier:null;
            _loc5_.legs = getItem("legs_item_id") != null?getItem("legs_item_id").identifier:null;
            _loc5_.boots = getItem("boots_item_id") != null?getItem("boots_item_id").identifier:null;
         }
         _loc5_.missiles = getItem("missiles_item_id") != null?getItem("missiles_item_id").identifier:null;
         return _loc5_;
      }
      
      public function get isHeadItemShown() : Boolean
      {
         if(!hasData("show_head_item"))
         {
            return true;
         }
         return showHeadItem;
      }
      
      public function get isChestItemShowUnlocked() : Boolean
      {
         if(!hasData("show_chest_item_unlocked"))
         {
            return false;
         }
         return showChestItemUnlocked;
      }
      
      public function get isChestItemShown() : Boolean
      {
         if(!hasData("show_chest_item"))
         {
            return true;
         }
         return showChestItem;
      }
      
      public function get isBeltItemShowUnlocked() : Boolean
      {
         if(!hasData("show_belt_item_unlocked"))
         {
            return false;
         }
         return showBeltItemUnlocked;
      }
      
      public function get isBeltItemShown() : Boolean
      {
         if(!hasData("show_belt_item"))
         {
            return true;
         }
         return showBeltItem;
      }
      
      public function get isLegsItemShowUnlocked() : Boolean
      {
         if(!hasData("show_legs_item_unlocked"))
         {
            return false;
         }
         return showLegsItemUnlocked;
      }
      
      public function get isLegsItemShown() : Boolean
      {
         if(!hasData("show_legs_item"))
         {
            return true;
         }
         return showLegsItem;
      }
      
      public function get isBootsItemShowUnlocked() : Boolean
      {
         if(!hasData("show_boots_item_unlocked"))
         {
            return false;
         }
         return showBootsItemUnlocked;
      }
      
      public function get isBootsItemShown() : Boolean
      {
         if(!hasData("show_boots_item"))
         {
            return true;
         }
         return showBootsItem;
      }
      
      public function get isMe() : Boolean
      {
         if(User.current == null || User.current.character == null)
         {
            return false;
         }
         return User.current.character.id == id;
      }
      
      public function get inventory() : Inventory
      {
         return _inventory;
      }
      
      public function get bankInventory() : BankInventory
      {
         return _bankInventory;
      }
      
      public function get quests() : IntMap
      {
         return _quests;
      }
      
      public function getQuestById(param1:int) : Quest
      {
         if(!_quests.exists(param1))
         {
            return null;
         }
         return _quests.getData(param1);
      }
      
      public function get conventionShows() : IntMap
      {
         return _conventionShows;
      }
      
      public function get items() : IntMap
      {
         return _items;
      }
      
      public function get duelOpponents() : Vector.<DuelOpponent>
      {
         return _duelOpponents;
      }
      
      public function get missedDuels() : int
      {
         return _missedDuels;
      }
      
      public function set missedDuels(param1:int) : void
      {
         if(param1 > _missedDuels)
         {
            Environment.audio.playFX("missed_duel_notification.mp3");
         }
         _missedDuels = param1;
         if(_missedDuels == 0)
         {
            _shownMissedDuels = 0;
         }
      }
      
      public function get missingBoosterCount() : int
      {
         var _loc1_:int = 0;
         if(!questBoosterActive)
         {
            _loc1_++;
         }
         if(!statsBoosterActive)
         {
            _loc1_++;
         }
         if(!workBoosterActive)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function get newGuildLogEntries() : int
      {
         return _newGuildLogEntries;
      }
      
      public function set newGuildLogEntries(param1:int) : void
      {
         if(param1 > 0)
         {
            ViewManager.instance.baseUserPanel.highlightGuildButton();
         }
         _newGuildLogEntries = param1;
      }
      
      public function get shownMissedDuels() : int
      {
         return _shownMissedDuels;
      }
      
      public function set shownMissedDuels(param1:int) : void
      {
         _shownMissedDuels = param1;
      }
      
      public function get unshownMissedDuels() : int
      {
         return _missedDuels - _shownMissedDuels;
      }
      
      public function get activeQuest() : Quest
      {
         if(activeQuestId == 0)
         {
            return null;
         }
         var _loc1_:Quest = _quests.getData(activeQuestId);
         return _loc1_;
      }
      
      public function get activeConventionShow() : ConventionShow
      {
         if(activeConventionShowId == 0)
         {
            return null;
         }
         var _loc1_:ConventionShow = _conventionShows.getData(activeConventionShowId);
         return _loc1_;
      }
      
      public function get activeDuel() : Duel
      {
         if(activeDuelId == 0)
         {
            return null;
         }
         if(_duel != null && _duel.id == activeDuelId)
         {
            return _duel;
         }
         return null;
      }
      
      public function get activeDungeonQuest() : DungeonQuest
      {
         if(activeDungeonQuestId == 0)
         {
            return null;
         }
         var _loc1_:DungeonQuest = currentDungeon.currentLevel.currentQuest;
         if(_loc1_.id == activeDungeonQuestId)
         {
            return _loc1_;
         }
         return null;
      }
      
      public function get guild() : Guild
      {
         if(!hasGuild)
         {
            return null;
         }
         return _guild;
      }
      
      public function get boosterStamina() : int
      {
         return Math.round(statBaseStamina * (activeStatsBoosterAmount / 100));
      }
      
      public function get boosterStrength() : int
      {
         return Math.round(statBaseStrength * (activeStatsBoosterAmount / 100));
      }
      
      public function get boosterCriticalRating() : int
      {
         return Math.round(statBaseCriticalRating * (activeStatsBoosterAmount / 100));
      }
      
      public function get boosterDodgeRating() : int
      {
         return Math.round(statBaseDodgeRating * (activeStatsBoosterAmount / 100));
      }
      
      public function get guildBoosterStamina() : int
      {
         return Math.ceil(statBaseStamina * (activeGuildStatsBoosterAmount / 100));
      }
      
      public function get guildBoosterStrength() : int
      {
         return Math.ceil(statBaseStrength * (activeGuildStatsBoosterAmount / 100));
      }
      
      public function get guildBoosterCriticalRating() : int
      {
         return Math.ceil(statBaseCriticalRating * (activeGuildStatsBoosterAmount / 100));
      }
      
      public function get guildBoosterDodgeRating() : int
      {
         return Math.ceil(statBaseDodgeRating * (activeGuildStatsBoosterAmount / 100));
      }
      
      public function get maxBankIndex() : int
      {
         if(_bankInventory == null)
         {
            return 0;
         }
         return _bankInventory.maxBankIndex;
      }
      
      public function get bankInventoryAvailable() : Boolean
      {
         return level >= CConstant.inventory_bag3_unlock_level;
      }
      
      public function get itemStamina() : int
      {
         if(_inventory == null)
         {
            return 0;
         }
         var _loc1_:int = 0;
         if(getItemByType(1))
         {
            _loc1_ = _loc1_ + getItemByType(1).statStamina;
         }
         if(getItemByType(2))
         {
            _loc1_ = _loc1_ + getItemByType(2).statStamina;
         }
         if(getItemByType(3))
         {
            _loc1_ = _loc1_ + getItemByType(3).statStamina;
         }
         if(getItemByType(4))
         {
            _loc1_ = _loc1_ + getItemByType(4).statStamina;
         }
         if(getItemByType(5))
         {
            _loc1_ = _loc1_ + getItemByType(5).statStamina;
         }
         if(getItemByType(6))
         {
            _loc1_ = _loc1_ + getItemByType(6).statStamina;
         }
         if(getItemByType(7))
         {
            _loc1_ = _loc1_ + getItemByType(7).statStamina;
         }
         if(getItemByType(10))
         {
            _loc1_ = _loc1_ + getItemByType(10).statStamina;
         }
         if(getItemByType(8))
         {
            _loc1_ = _loc1_ + getItemByType(8).statStamina;
         }
         if(getItemByType(9))
         {
            _loc1_ = _loc1_ + getItemByType(9).statStamina;
         }
         return _loc1_;
      }
      
      public function get itemStrength() : int
      {
         if(_inventory == null)
         {
            return 0;
         }
         var _loc1_:int = 0;
         if(getItemByType(1))
         {
            _loc1_ = _loc1_ + getItemByType(1).statStrength;
         }
         if(getItemByType(2))
         {
            _loc1_ = _loc1_ + getItemByType(2).statStrength;
         }
         if(getItemByType(3))
         {
            _loc1_ = _loc1_ + getItemByType(3).statStrength;
         }
         if(getItemByType(4))
         {
            _loc1_ = _loc1_ + getItemByType(4).statStrength;
         }
         if(getItemByType(5))
         {
            _loc1_ = _loc1_ + getItemByType(5).statStrength;
         }
         if(getItemByType(6))
         {
            _loc1_ = _loc1_ + getItemByType(6).statStrength;
         }
         if(getItemByType(7))
         {
            _loc1_ = _loc1_ + getItemByType(7).statStrength;
         }
         if(getItemByType(10))
         {
            _loc1_ = _loc1_ + getItemByType(10).statStrength;
         }
         if(getItemByType(8))
         {
            _loc1_ = _loc1_ + getItemByType(8).statStrength;
         }
         if(getItemByType(9))
         {
            _loc1_ = _loc1_ + getItemByType(9).statStrength;
         }
         return _loc1_;
      }
      
      public function get itemCriticalRating() : int
      {
         if(_inventory == null)
         {
            return 0;
         }
         var _loc1_:int = 0;
         if(getItemByType(1))
         {
            _loc1_ = _loc1_ + getItemByType(1).statCriticalRating;
         }
         if(getItemByType(2))
         {
            _loc1_ = _loc1_ + getItemByType(2).statCriticalRating;
         }
         if(getItemByType(3))
         {
            _loc1_ = _loc1_ + getItemByType(3).statCriticalRating;
         }
         if(getItemByType(4))
         {
            _loc1_ = _loc1_ + getItemByType(4).statCriticalRating;
         }
         if(getItemByType(5))
         {
            _loc1_ = _loc1_ + getItemByType(5).statCriticalRating;
         }
         if(getItemByType(6))
         {
            _loc1_ = _loc1_ + getItemByType(6).statCriticalRating;
         }
         if(getItemByType(7))
         {
            _loc1_ = _loc1_ + getItemByType(7).statCriticalRating;
         }
         if(getItemByType(10))
         {
            _loc1_ = _loc1_ + getItemByType(10).statCriticalRating;
         }
         if(getItemByType(8))
         {
            _loc1_ = _loc1_ + getItemByType(8).statCriticalRating;
         }
         if(getItemByType(9))
         {
            _loc1_ = _loc1_ + getItemByType(9).statCriticalRating;
         }
         return _loc1_;
      }
      
      public function get itemDodgeRating() : int
      {
         if(_inventory == null)
         {
            return 0;
         }
         var _loc1_:int = 0;
         if(getItemByType(1))
         {
            _loc1_ = _loc1_ + getItemByType(1).statDodgeRating;
         }
         if(getItemByType(2))
         {
            _loc1_ = _loc1_ + getItemByType(2).statDodgeRating;
         }
         if(getItemByType(3))
         {
            _loc1_ = _loc1_ + getItemByType(3).statDodgeRating;
         }
         if(getItemByType(4))
         {
            _loc1_ = _loc1_ + getItemByType(4).statDodgeRating;
         }
         if(getItemByType(5))
         {
            _loc1_ = _loc1_ + getItemByType(5).statDodgeRating;
         }
         if(getItemByType(6))
         {
            _loc1_ = _loc1_ + getItemByType(6).statDodgeRating;
         }
         if(getItemByType(7))
         {
            _loc1_ = _loc1_ + getItemByType(7).statDodgeRating;
         }
         if(getItemByType(10))
         {
            _loc1_ = _loc1_ + getItemByType(10).statDodgeRating;
         }
         if(getItemByType(8))
         {
            _loc1_ = _loc1_ + getItemByType(8).statDodgeRating;
         }
         if(getItemByType(9))
         {
            _loc1_ = _loc1_ + getItemByType(9).statDodgeRating;
         }
         return _loc1_;
      }
      
      public function get itemSetStamina() : int
      {
         return itemSetStatValue(1);
      }
      
      public function get itemSetStrength() : int
      {
         return itemSetStatValue(2);
      }
      
      public function get itemSetCriticalRating() : int
      {
         return itemSetStatValue(3);
      }
      
      public function get itemSetDodgeRating() : int
      {
         return itemSetStatValue(4);
      }
      
      public function getItem(param1:String) : Item
      {
         if(_inventory == null)
         {
            return null;
         }
         if(!_inventory.hasData(param1))
         {
            return null;
         }
         var _loc2_:int = _inventory.getInt(param1);
         if(_loc2_ == 0)
         {
            return null;
         }
         return getItemById(_loc2_);
      }
      
      public function getBagItem(param1:int) : Item
      {
         if(_inventory == null)
         {
            return null;
         }
         var _loc2_:int = _inventory.getBagItemId(param1);
         if(_loc2_ == 0)
         {
            return null;
         }
         return getItemById(_loc2_);
      }
      
      public function get sewingMachineAvailable() : Boolean
      {
         return level >= CConstant.sewing_machine_req_level;
      }
      
      public function get washingMachineAvailable() : Boolean
      {
         return level >= CConstant.washing_machine_req_level;
      }
      
      public function get customizeItemAvailable() : Boolean
      {
         return User.current.character.level >= CConstant.customize_item_req_level && AppConfig.battleSkillsEnabled;
      }
      
      public function getShopItem(param1:int) : Item
      {
         return getItem("shop_item" + param1 + "_id");
      }
      
      public function getItemById(param1:int) : Item
      {
         if(!hasItem(param1))
         {
            return null;
         }
         return _items.getData(param1);
      }
      
      public function get battleSkillStamina() : int
      {
         return battleSkillStatVale(1);
      }
      
      public function get battleSkillStrength() : int
      {
         return battleSkillStatVale(2);
      }
      
      public function get battleSkillCriticalRating() : int
      {
         return battleSkillStatVale(3);
      }
      
      public function get battleSkillDodgeRating() : int
      {
         return battleSkillStatVale(4);
      }
      
      private function battleSkillStatVale(param1:int) : int
      {
         var _loc3_:* = null;
         var _loc6_:* = null;
         if(!§§pop())
         {
            return 0;
         }
         var _loc5_:* = 0;
         var _loc2_:Vector.<String> = new <String>["head_item_id","chest_item_id","belt_item_id","legs_item_id","boots_item_id","necklace_item_id","ring_item_id","piercing_item_id","gadget_item_id"];
         var _loc9_:int = 0;
         var _loc8_:* = _loc2_;
         for each(var _loc7_ in _loc2_)
         {
            _loc3_ = getItem(_loc7_);
            if(_loc3_)
            {
               _loc6_ = _loc3_.battleSkillData;
               if(_loc6_)
               {
                  switch(int(param1) - 1)
                  {
                     case 0:
                        if(_loc6_.id == 7 || _loc6_.id == 27)
                        {
                           _loc5_ = Number(_loc5_ + (_loc6_.value1 as Number));
                        }
                        continue;
                     case 1:
                        if(_loc6_.id == 6 || _loc6_.id == 27)
                        {
                           _loc5_ = Number(_loc5_ + (_loc6_.value1 as Number));
                        }
                        continue;
                     case 2:
                        if(_loc6_.id == 8 || _loc6_.id == 27)
                        {
                           _loc5_ = Number(_loc5_ + (_loc6_.value1 as Number));
                        }
                        continue;
                     case 3:
                        if(_loc6_.id == 9 || _loc6_.id == 27)
                        {
                           _loc5_ = Number(_loc5_ + (_loc6_.value1 as Number));
                        }
                        continue;
                  }
               }
               else
               {
                  continue;
               }
            }
            else
            {
               continue;
            }
         }
         if(_loc5_ == 0)
         {
            return 0;
         }
         _loc5_ = Number(_loc5_ / 100);
         var _loc4_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc4_ = statBaseStamina;
               break;
            case 1:
               _loc4_ = statBaseStrength;
               break;
            case 2:
               _loc4_ = statBaseCriticalRating;
               break;
            case 3:
               _loc4_ = statBaseDodgeRating;
         }
         return Math.ceil(_loc4_ * _loc5_);
      }
      
      public function isItemEquipped(param1:Item) : Boolean
      {
         var _loc2_:Item = getItemByType(param1.type);
         if(!_loc2_)
         {
            return false;
         }
         return _loc2_.id == param1.id;
      }
      
      public function getItemByType(param1:int) : Item
      {
         if(_inventory == null)
         {
            return null;
         }
         switch(int(param1) - 1)
         {
            case 0:
               return getItem("head_item_id");
            case 1:
               return getItem("chest_item_id");
            case 2:
               return getItem("belt_item_id");
            case 3:
               return getItem("legs_item_id");
            case 4:
               return getItem("boots_item_id");
            case 5:
               return getItem("necklace_item_id");
            case 6:
               return getItem("ring_item_id");
            case 7:
               return getItem("gadget_item_id");
            case 8:
               return getItem("missiles_item_id");
            case 9:
               return getItem("piercing_item_id");
         }
      }
      
      public function hasItem(param1:int) : Boolean
      {
         if(param1 == 0)
         {
            return false;
         }
         return _items.exists(param1);
      }
      
      public function hasInventoryItem(param1:int) : Boolean
      {
         if(_inventory == null)
         {
            return false;
         }
         if(param1 == 0)
         {
            return false;
         }
         if(!hasItem(param1))
         {
            return false;
         }
         return _inventory.bagItem1Id == param1 || _inventory.bagItem2Id == param1 || _inventory.bagItem3Id == param1 || _inventory.bagItem4Id == param1 || _inventory.bagItem5Id == param1 || _inventory.bagItem6Id == param1 || _inventory.bagItem7Id == param1 || _inventory.bagItem8Id == param1 || _inventory.bagItem9Id == param1 || _inventory.bagItem10Id == param1 || _inventory.bagItem11Id == param1 || _inventory.bagItem12Id == param1 || _inventory.bagItem13Id == param1 || _inventory.bagItem14Id == param1 || _inventory.bagItem15Id == param1 || _inventory.bagItem16Id == param1 || _inventory.bagItem17Id == param1 || _inventory.bagItem18Id == param1 || _inventory.shopItem1Id == param1 || _inventory.shopItem2Id == param1 || _inventory.shopItem3Id == param1 || _inventory.shopItem4Id == param1 || _inventory.shopItem5Id == param1 || _inventory.shopItem6Id == param1 || _inventory.shopItem7Id == param1 || _inventory.shopItem8Id == param1 || _inventory.shopItem9Id == param1 || _inventory.headItemId == param1 || _inventory.chestItemId == param1 || _inventory.beltItemId == param1 || _inventory.legsItemId == param1 || _inventory.bootsItemId == param1 || _inventory.necklaceItemId == param1 || _inventory.ringItemId == param1 || _inventory.piercingItemId == param1 || _inventory.gadgetItemId == param1 || _inventory.missilesItemId == param1;
      }
      
      public function hasBankItem(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(bankInventory == null)
         {
            return false;
         }
         if(param1 == 0)
         {
            return false;
         }
         if(!items.exists(param1))
         {
            return false;
         }
         _loc2_ = 1;
         while(_loc2_ <= 378)
         {
            _loc3_ = bankInventory.getData("bank_item" + _loc2_ + "_id") as int;
            if(_loc3_ == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      override public function get name() : String
      {
         return Character.getCleanName(super.name);
      }
      
      public function get nameWithTitle() : String
      {
         if(!hasData("title") || super.title == "" || AppConfig.titlesEnabled != true)
         {
            return name;
         }
         var _loc1_:String = super.name;
         if(_loc1_.indexOf("___") != -1)
         {
            return LocText.current.text("general/character_deleted");
         }
         _loc1_ = Titles.instance.getNameWithTitle(_loc1_,super.title,gender);
         return _loc1_;
      }
      
      override public function get title() : String
      {
         if(super.title == "" || AppConfig.titlesEnabled != true)
         {
            return "";
         }
         return Titles.instance.getTitle(super.title);
      }
      
      public function get isDeleted() : Boolean
      {
         var _loc1_:String = super.name;
         return _loc1_.indexOf("___") != -1;
      }
      
      override public function get duelStamina() : int
      {
         var _loc2_:int = super.duelStamina + _duelStaminaCorrectionValue;
         var _loc1_:int = Duel.maxDuelStamina;
         if(_loc2_ > _loc1_)
         {
            return _loc1_;
         }
         return _loc2_;
      }
      
      public function get hasFreeDuelEnemiesRefresh() : Boolean
      {
         return !TimeUtil.serverDateTime.isToday(tsLastDuelEnemiesRefresh);
      }
      
      public function get totalSecondsNeededForDuelStaminaProgress() : int
      {
         var _loc2_:int = Math.round(1 / CConstant.duel_stamina_refresh_amount_per_minute * 60);
         var _loc1_:int = Math.round(1 / CConstant.duel_stamina_refresh_amount_per_minute_first_duel * 60);
         if(isFirstDuel)
         {
            return _loc1_;
         }
         return _loc2_;
      }
      
      public function get secondsToNextFreeDuel() : int
      {
         var _loc2_:int = duelStaminaCost - duelStamina % duelStaminaCost - 1;
         var _loc1_:int = secondsToNextDuelStaminaRefill + totalSecondsNeededForDuelStaminaProgress * _loc2_;
         return _loc1_;
      }
      
      public function get isFirstDuel() : Boolean
      {
         return duelStamina < duelStaminaCost;
      }
      
      public function get secondsToNextDuelStaminaRefill() : int
      {
         var _loc1_:int = TimeUtil.now - _duelStaminaCorrection - tsLastDuelStaminaChange;
         if(_loc1_ >= totalSecondsNeededForDuelStaminaProgress)
         {
            _duelStaminaCorrection = _duelStaminaCorrection + totalSecondsNeededForDuelStaminaProgress;
            _duelStaminaCorrectionValue = _duelStaminaCorrectionValue + 1;
            _loc1_ = TimeUtil.now + _duelStaminaCorrection - tsLastDuelStaminaChange;
         }
         var _loc2_:int = totalSecondsNeededForDuelStaminaProgress - _loc1_ + 1;
         if(_loc2_ < 0)
         {
            _loc2_ = 1;
         }
         return _loc2_;
      }
      
      public function get hasAvailableFreeDuel() : Boolean
      {
         return duelStamina >= duelStaminaCost;
      }
      
      public function get availableFreeDuelCount() : int
      {
         return Math.floor(duelStamina / duelStaminaCost);
      }
      
      public function get hasFullDuelStamina() : Boolean
      {
         return duelStamina >= Duel.maxDuelStamina;
      }
      
      public function get isMale() : Boolean
      {
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return gender == "f";
      }
      
      override public function get description() : String
      {
         var _loc1_:String = super.description;
         if(_loc1_ == "" && User.current.character == this)
         {
            _loc1_ = LocText.current.text("dialog/character_description/text_empty_self");
         }
         else if(_loc1_ == "")
         {
            _loc1_ = LocText.current.text("dialog/character_description/text_empty_other");
         }
         return _loc1_;
      }
      
      public function get xpToLevelUp() : String
      {
         var _loc1_:int = CConstant.max_level;
         if(level == _loc1_)
         {
            return "";
         }
         var _loc4_:int = xp;
         var _loc3_:int = CLevel.fromId(level + 1).xp;
         var _loc2_:int = _loc3_ - _loc4_;
         return LocText.current.formatHugeNumber(_loc2_);
      }
      
      public function get xpCurrentLevel() : String
      {
         var _loc1_:int = CConstant.max_level;
         if(level == _loc1_)
         {
            return "";
         }
         var _loc4_:int = CLevel.fromId(level).xp;
         var _loc3_:int = CLevel.fromId(level + 1).xp;
         var _loc2_:int = _loc3_ - _loc4_;
         return LocText.current.formatHugeNumber(_loc2_);
      }
      
      public function get xpInThisLevel() : String
      {
         var _loc1_:int = CConstant.max_level;
         if(level == _loc1_)
         {
            return "";
         }
         var _loc3_:int = xp;
         var _loc4_:int = CLevel.fromId(level).xp;
         var _loc2_:int = _loc3_ - _loc4_;
         return LocText.current.formatHugeNumber(_loc2_);
      }
      
      public function get levelProgress() : Number
      {
         var _loc1_:int = CConstant.max_level;
         if(level == _loc1_)
         {
            return 1;
         }
         var _loc4_:int = CLevel.fromId(level).xp;
         var _loc3_:int = CLevel.fromId(level + 1).xp;
         var _loc2_:int = _loc3_ - _loc4_;
         return (xp - _loc4_) / _loc2_;
      }
      
      public function get totalStats() : int
      {
         return statTotalStamina + statTotalStrength + statTotalCriticalRating + statTotalDodgeRating + statWeaponDamage;
      }
      
      public function get hasAvailableStatPoints() : Boolean
      {
         return statPointsAvailable > 0;
      }
      
      public function get questBoosterActive() : Boolean
      {
         return super.activeQuestBoosterId != "" && tsActiveQuestBoostExpires > TimeUtil.now;
      }
      
      override public function get activeQuestBoosterId() : String
      {
         if(hasData("ts_active_quest_boost_expires") && !questBoosterActive)
         {
            return "";
         }
         return super.activeQuestBoosterId;
      }
      
      public function get activeQuestBoosterAmount() : int
      {
         if(hasData("ts_active_quest_boost_expires") && !questBoosterActive)
         {
            return 0;
         }
         var _loc1_:String = activeQuestBoosterId;
         if(_loc1_ == "")
         {
            return 0;
         }
         return CBooster.fromId(_loc1_).amount;
      }
      
      public function get hasExpiredQuestBooster() : Boolean
      {
         if(tsActiveQuestBoostExpires <= 0)
         {
            return false;
         }
         if(super.activeQuestBoosterId == "")
         {
            return false;
         }
         var _loc1_:int = tsActiveQuestBoostExpires - TimeUtil.now;
         return _loc1_ < 0;
      }
      
      public function get statsBoosterActive() : Boolean
      {
         return super.activeStatsBoosterId != "" && tsActiveStatsBoostExpires > TimeUtil.now;
      }
      
      override public function get activeStatsBoosterId() : String
      {
         if(hasData("ts_active_stats_boost_expires") && !statsBoosterActive)
         {
            return "";
         }
         return super.activeStatsBoosterId;
      }
      
      public function get activeStatsBoosterAmount() : int
      {
         if(hasData("ts_active_stats_boost_expires") && !statsBoosterActive)
         {
            return 0;
         }
         var _loc1_:String = activeStatsBoosterId;
         if(_loc1_ == "")
         {
            return 0;
         }
         return CBooster.fromId(_loc1_).amount;
      }
      
      public function get hasExpiredStatsBooster() : Boolean
      {
         if(tsActiveStatsBoostExpires <= 0)
         {
            return false;
         }
         if(super.activeStatsBoosterId == "")
         {
            return false;
         }
         var _loc1_:int = tsActiveStatsBoostExpires - TimeUtil.now;
         return _loc1_ < 0;
      }
      
      public function get activeGuildStatsBoosterAmount() : int
      {
         if(!hasGuild || guild == null)
         {
            return 0;
         }
         return guild.statCharacterBaseStatsBoost;
      }
      
      public function get workBoosterActive() : Boolean
      {
         return super.activeWorkBoosterId != "" && tsActiveWorkBoostExpires > TimeUtil.now;
      }
      
      override public function get activeWorkBoosterId() : String
      {
         if(hasData("ts_active_work_boost_expires") && !workBoosterActive)
         {
            return "";
         }
         return super.activeWorkBoosterId;
      }
      
      public function get activeWorkBoosterAmount() : int
      {
         if(hasData("ts_active_work_boost_expires") && !workBoosterActive)
         {
            return 0;
         }
         var _loc1_:String = activeWorkBoosterId;
         if(_loc1_ == "")
         {
            return 0;
         }
         return CBooster.fromId(_loc1_).amount;
      }
      
      public function get hasExpiredWorkBooster() : Boolean
      {
         if(tsActiveWorkBoostExpires <= 0)
         {
            return false;
         }
         if(super.activeWorkBoosterId == "")
         {
            return false;
         }
         var _loc1_:int = tsActiveWorkBoostExpires - TimeUtil.now;
         return _loc1_ < 0;
      }
      
      public function get senseBoosterActive() : Boolean
      {
         return tsActiveSenseBoostExpires > TimeUtil.now;
      }
      
      public function get hasExpiredSenseBooster() : Boolean
      {
         if(tsActiveSenseBoostExpires <= 0)
         {
            return false;
         }
         var _loc1_:int = tsActiveSenseBoostExpires - TimeUtil.now;
         return _loc1_ < 0;
      }
      
      public function get multitaskingBoosterActive() : Boolean
      {
         var _loc1_:int = tsActiveMultitaskingBoostExpires;
         return _loc1_ == -1 || _loc1_ > TimeUtil.now + 5;
      }
      
      public function get multitaskingBoosterAvailable() : Boolean
      {
         return level >= CConstant.booster_multitasking_unlock_level;
      }
      
      public function get hasExpiredMultitaskingBooster() : Boolean
      {
         if(tsActiveMultitaskingBoostExpires <= 0)
         {
            return false;
         }
         var _loc1_:int = tsActiveMultitaskingBoostExpires - TimeUtil.now;
         return _loc1_ < 0;
      }
      
      public function get onMap() : Boolean
      {
         return currentLocation == 1;
      }
      
      public function get inDungeon() : Boolean
      {
         return currentLocation == 3;
      }
      
      public function get isQuesting() : Boolean
      {
         return currentLocation == 2 || currentLocation == 0;
      }
      
      override public function get maxMovieEnergy() : int
      {
         var _loc1_:int = super.maxMovieEnergy;
         var _loc2_:Number = BonusInfo.getValue(5);
         if(_loc2_ > 0)
         {
            _loc1_ = _loc1_ * _loc2_;
         }
         return _loc1_;
      }
      
      public function get stageQuestIds() : Vector.<int>
      {
         return getStageQuestIdsForStage(currentQuestStage);
      }
      
      public function getStageQuestIdsForStage(param1:int) : Vector.<int>
      {
         var _loc2_:Object = getFromJson(questPool);
         if(_loc2_[param1] === undefined)
         {
            return null;
         }
         var _loc3_:Vector.<int> = Vector.<int>(_loc2_[param1]);
         return _loc3_;
      }
      
      public function getQuestStageByQuestId(param1:int) : int
      {
         var _loc2_:String = getString("quest_pool");
         var _loc4_:Object = JsonUtil.decode(_loc2_);
         var _loc5_:Vector.<int> = GameUtil.getCharacterStages(this);
         var _loc10_:int = 0;
         var _loc9_:* = _loc5_;
         for each(var _loc3_ in _loc5_)
         {
            var _loc8_:int = 0;
            var _loc7_:* = _loc4_[_loc3_];
            for each(var _loc6_ in _loc4_[_loc3_])
            {
               if(_loc6_ == param1)
               {
                  return _loc3_;
               }
            }
         }
         return 0;
      }
      
      public function get hasUsedAllQuestEnergy() : Boolean
      {
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            return false;
         }
         var _loc2_:int = questEnergyRefillAmountToday;
         var _loc1_:int = CConstant.quest_max_refill_amount_per_day;
         return _loc2_ >= _loc1_;
      }
      
      public function get secondsUntilQuestEnergyRefresh() : int
      {
         return TimeUtil.serverDateTime.secondsUntilTomorrow;
      }
      
      public function get isOnline() : Boolean
      {
         if(onlineStatus != 1)
         {
            return false;
         }
         return true;
      }
      
      public function getNeededImproveStatGameCurrency(param1:int, param2:int) : int
      {
         var _loc3_:* = 0;
         var _loc5_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc5_ = statBoughtStamina;
               break;
            case 1:
               _loc5_ = statBoughtStrength;
               break;
            case 2:
               _loc5_ = statBoughtCriticalRating;
               break;
            case 3:
               _loc5_ = statBoughtDodgeRating;
         }
         var _loc4_:int = 0;
         _loc3_ = _loc5_;
         while(_loc3_ < _loc5_ + param2)
         {
            _loc4_ = _loc4_ + GameUtil.calcNeededGameCurrency(_loc3_);
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function getStatValue(param1:int) : int
      {
         switch(int(param1) - 1)
         {
            case 0:
               return statTotalStamina;
            case 1:
               return statTotalStrength;
            case 2:
               return statTotalCriticalRating;
            case 3:
               return statTotalDodgeRating;
         }
      }
      
      public function set statBaseStamina(param1:int) : void
      {
         update(new TypedObject({"stat_base_stamina":param1}));
      }
      
      public function set statBaseStrength(param1:int) : void
      {
         update(new TypedObject({"stat_base_strength":param1}));
      }
      
      public function set statBaseCriticalRating(param1:int) : void
      {
         update(new TypedObject({"stat_base_critical_rating":param1}));
      }
      
      public function set statBaseDodgeRating(param1:int) : void
      {
         update(new TypedObject({"stat_base_dodge_rating":param1}));
      }
      
      public function set statTotalStamina(param1:int) : void
      {
         update(new TypedObject({"stat_total_stamina":param1}));
      }
      
      public function set statTotalStrength(param1:int) : void
      {
         update(new TypedObject({"stat_total_strength":param1}));
      }
      
      public function set statTotalCriticalRating(param1:int) : void
      {
         update(new TypedObject({"stat_total_critical_rating":param1}));
      }
      
      public function set statTotalDodgeRating(param1:int) : void
      {
         update(new TypedObject({"stat_total_dodge_rating":param1}));
      }
      
      public function get missilesDamage() : int
      {
         var _loc1_:Item = getItem("missiles_item_id");
         if(_loc1_ == null)
         {
            return 0;
         }
         return _loc1_.missileDamage;
      }
      
      public function resetDuelStaminaCorrection() : void
      {
         _duelStaminaCorrection = 0;
         _duelStaminaCorrectionValue = 0;
      }
      
      public function get canMail() : Boolean
      {
         return level >= CConstant.message_min_level && hasTutorialFlag("tutorial_finished");
      }
      
      public function get hasGuild() : Boolean
      {
         return guildId != 0;
      }
      
      public function get isMyGuildMember() : Boolean
      {
         if(id == User.current.character.id)
         {
            return false;
         }
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.getMember(name) !== null;
      }
      
      public function get guildBonusQuestWorkGameCurrencyRewardFactor() : Number
      {
         if(!hasGuild || guild == null)
         {
            return 0;
         }
         return guild.statQuestGameCurrencyRewardBoost / 50;
      }
      
      public function get hasFinishedAttackGuildBattle() : Boolean
      {
         return finishedAttackGuildBattle != null;
      }
      
      public function get hasFinishedDefenseGuildBattle() : Boolean
      {
         return finishedDefenseGuildBattle != null;
      }
      
      public function get finishedAttackGuildBattle() : GuildBattle
      {
         if(_finishedAttackGuildBattle == null)
         {
            return null;
         }
         if(_finishedAttackGuildBattle.status != 3)
         {
            return null;
         }
         if(_finishedAttackGuildBattle.id != finishedGuildBattleAttackId)
         {
            return null;
         }
         return _finishedAttackGuildBattle;
      }
      
      public function get finishedDefenseGuildBattle() : GuildBattle
      {
         if(_finishedDefenseGuildBattle == null)
         {
            return null;
         }
         if(_finishedDefenseGuildBattle.status != 3)
         {
            return null;
         }
         if(_finishedDefenseGuildBattle.id != finishedGuildBattleDefenseId)
         {
            return null;
         }
         return _finishedDefenseGuildBattle;
      }
      
      public function get hasDungeonKey() : Boolean
      {
         return dungeonKeyEndTimestamp > TimeUtil.now;
      }
      
      public function get dungeonKeyEndTimestamp() : int
      {
         return tsDungeonKeyFound + CConstant.dungeon_key_duration;
      }
      
      public function get currentDungeon() : Dungeon
      {
         if(activeDungeonId == 0)
         {
            return null;
         }
         return _dungeons.getData(activeDungeonId);
      }
      
      public function get canAccessDungeon() : Boolean
      {
         var _loc1_:* = null;
         if(!§§pop())
         {
            return false;
         }
         var _loc4_:int = 0;
         var _loc3_:* = CDungeonTemplate.ids;
         for each(var _loc2_ in CDungeonTemplate.ids)
         {
            _loc1_ = CDungeonTemplate.fromId(_loc2_);
            if(_loc1_.getLevel(1).minFans <= fansTotal)
            {
               return true;
            }
         }
         return false;
      }
      
      public function set currentBag(param1:int) : void
      {
         _currentBag = param1;
      }
      
      public function get currentBag() : int
      {
         return _currentBag;
      }
      
      public function set currentBank(param1:int) : void
      {
         _currentBank = param1;
      }
      
      public function get currentBank() : int
      {
         return _currentBank;
      }
      
      public function get washItemUsed() : Boolean
      {
         return TimeUtil.serverDateTime.isToday(tsLastWashItem);
      }
      
      public function get shopRefreshUsed() : Boolean
      {
         if(Inventory._forcePremiumShopRefresh)
         {
            return true;
         }
         return TimeUtil.serverDateTime.isToday(tsLastShopRefresh);
      }
      
      public function get customizeItemUsed() : Boolean
      {
         return TimeUtil.serverDateTime.isToday(tsLastCustomizeItem);
      }
      
      public function get hasPendingItemCustomization() : Boolean
      {
         return hasData("pending_customize_item") && getData("pending_customize_item") != null && getData("pending_customize_item") != "";
      }
      
      public function get pendingItemCustomization() : Object
      {
         return JsonUtil.decode(pendingCustomizeItem);
      }
      
      public function get mostXPQuest() : Quest
      {
         var _loc1_:* = null;
         var _loc2_:* = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _quests;
         for each(var _loc3_ in _quests)
         {
            if(_loc3_.xpPerEnergyValue > _loc2_)
            {
               _loc1_ = _loc3_;
               _loc2_ = Number(_loc3_.xpPerEnergyValue);
            }
         }
         return _loc1_;
      }
      
      public function get mostGameCurrencyQuest() : Quest
      {
         var _loc1_:* = null;
         var _loc2_:* = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _quests;
         for each(var _loc3_ in _quests)
         {
            if(_loc3_.gameCurrencyPerEnergyValue > _loc2_)
            {
               _loc1_ = _loc3_;
               _loc2_ = Number(_loc3_.gameCurrencyPerEnergyValue);
            }
         }
         return _loc1_;
      }
      
      public function get dungeonKeyQuest() : Quest
      {
         var _loc3_:int = 0;
         var _loc2_:* = _quests;
         for each(var _loc1_ in _quests)
         {
            if(_loc1_.reward.dungeonKey)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get repeatStoryDungeonKeyQuest() : Quest
      {
         var _loc3_:int = 0;
         var _loc2_:* = _quests;
         for each(var _loc1_ in _quests)
         {
            if(_loc1_.reward.repeatStoryDungeonIndex > 0)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get repeatDatingKeyQuest() : Quest
      {
         var _loc3_:int = 0;
         var _loc2_:* = _quests;
         for each(var _loc1_ in _quests)
         {
            if(_loc1_.reward.repeatDatingIndex > 0)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function refreshMovies(param1:DataObjectArray) : void
      {
         _movies = new IntMap();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            _movies.setData(_loc2_.id,new Movie(_loc2_));
         }
      }
      
      public function refreshMovie(param1:DOMovie) : void
      {
         DataObject.createOrUpdateMap(Movie,_movies,param1);
      }
      
      public function get movie() : Movie
      {
         if(!hasMovie)
         {
            return null;
         }
         return _movies.getData(movieId);
      }
      
      public function get hasMovie() : Boolean
      {
         return movieId != 0;
      }
      
      public function refreshEventQuest(param1:DOEventQuest) : void
      {
         var _loc3_:* = null;
         if(!param1.hasData("id") && !param1.hasData("identifier"))
         {
            return;
         }
         var _loc2_:* = null;
         if(param1.hasData("id"))
         {
            var _loc6_:int = 0;
            var _loc5_:* = _eventQuests;
            for each(var _loc4_ in _eventQuests)
            {
               if(_loc4_.hasData("id"))
               {
                  if(_loc4_.id == param1.id)
                  {
                     _loc2_ = _loc4_;
                     break;
                  }
               }
            }
         }
         if(!_loc2_)
         {
            var _loc8_:int = 0;
            var _loc7_:* = _eventQuests;
            for each(_loc4_ in _eventQuests)
            {
               if(_loc4_.identifier == param1.identifier)
               {
                  _loc2_ = _loc4_;
                  break;
               }
            }
         }
         if(_loc2_ == null)
         {
            _loc3_ = new EventQuest(param1);
            _eventQuests.push(_loc3_);
         }
         else
         {
            _loc2_.update(param1);
         }
      }
      
      public function get eventQuest() : EventQuest
      {
         if(!hasEventQuest)
         {
            return null;
         }
         var _loc3_:int = 0;
         var _loc2_:* = _eventQuests;
         for each(var _loc1_ in _eventQuests)
         {
            if(_loc1_.id == eventQuestId)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get hasEventQuest() : Boolean
      {
         return eventQuestId != 0;
      }
      
      public function get unassignedEventQuest() : EventQuest
      {
         var _loc3_:int = 0;
         var _loc2_:* = _eventQuests;
         for each(var _loc1_ in _eventQuests)
         {
            if(_loc1_.isUnassigned)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get hasUnassignedEventQuest() : Boolean
      {
         return unassignedEventQuest != null;
      }
      
      public function eventItemInStage(param1:int) : Vector.<String>
      {
         var _loc6_:* = null;
         var _loc5_:Vector.<String> = new Vector.<String>(0);
         if(!eventQuest)
         {
            return _loc5_;
         }
         if(param1 > maxQuestStage && param1 <= CConstant.quest_max_stage)
         {
            return _loc5_;
         }
         var _loc3_:String = getString("quest_pool");
         var _loc4_:Object = JsonUtil.decode(_loc3_);
         var _loc7_:Array = _loc4_[param1];
         var _loc9_:int = 0;
         var _loc8_:* = _loc7_;
         for each(var _loc2_ in _loc7_)
         {
            _loc6_ = _quests.getData(_loc2_);
            if(_loc6_.reward.eventItemIdentifier != null)
            {
               _loc5_.push(_loc6_.reward.eventItemIdentifier);
            }
         }
         return _loc5_;
      }
      
      public function refreshHerobook(param1:TypedObject) : void
      {
         _herobook.setData(param1);
      }
      
      public function get herobook() : Herobook
      {
         return _herobook;
      }
      
      public function get friendUserIds() : Vector.<int>
      {
         var _loc2_:TypedObject = TypedObject.fromJsonString(friendData);
         var _loc1_:Vector.<int> = new Vector.<int>(0);
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_.keys;
         for each(var _loc3_ in _loc2_.keys)
         {
            if(_loc2_.getBoolean(_loc3_))
            {
               _loc1_.push(parseInt(_loc3_));
            }
         }
         return _loc1_;
      }
      
      public function hasFriend(param1:int) : Boolean
      {
         return friendUserIds.indexOf(param1) !== -1;
      }
      
      public function meetsGuildApplyRequirements(param1:Guild) : Boolean
      {
         if(!param1)
         {
            return false;
         }
         if(param1.hasMinApplyLevel && param1.minApplyLevel > level)
         {
            return false;
         }
         if(param1.hasMinApplyHonor && param1.minApplyHonor > honor)
         {
            return false;
         }
         if(CConstant.message_min_level > level)
         {
            return false;
         }
         return true;
      }
      
      public function refreshResourceRequests(param1:DataObjectArray) : void
      {
         _resourceRequests = new Vector.<ResourceRequest>();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshResourceRequest(_loc2_);
         }
      }
      
      public function refreshResourceRequest(param1:DOResourceRequest) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = _resourceRequests;
         for each(var _loc3_ in _resourceRequests)
         {
            if(_loc3_.id == param1.id)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(_loc2_ == null)
         {
            _loc4_ = new ResourceRequest(param1);
            _resourceRequests.push(_loc4_);
         }
         else
         {
            _loc2_.update(param1);
         }
      }
      
      public function get resourceRequests() : Vector.<ResourceRequest>
      {
         return _resourceRequests;
      }
      
      public function getUnusedResourceCount(param1:int) : int
      {
         var _loc2_:* = null;
         var _loc3_:String = unusedResources;
         if(_loc3_ != "")
         {
            try
            {
               _loc2_ = new TypedObject(JsonUtil.decode(_loc3_));
               if(!_loc2_.rawData || !_loc2_.hasData(param1.toString()) || isNaN(_loc2_.getNumber(param1.toString())))
               {
                  var _loc5_:int = 0;
                  return _loc5_;
               }
               var _loc6_:* = _loc2_.getInt(param1.toString());
               return _loc6_;
            }
            catch(e:Error)
            {
               Logger.debug("[Character] Exception: \'" + e.message + "\'");
               Logger.debug("[Character] JSON: \'" + _loc3_ + "\'");
               var _loc7_:int = 0;
               return _loc7_;
            }
            return 0;
         }
         return 0;
      }
      
      public function getUsedResourceCount(param1:int) : int
      {
         var _loc2_:* = null;
         var _loc3_:String = usedResources;
         if(_loc3_ != "")
         {
            try
            {
               _loc2_ = new TypedObject(JsonUtil.decode(_loc3_));
               if(!_loc2_.rawData || !_loc2_.hasData(param1.toString()) || isNaN(_loc2_.getNumber(param1.toString())))
               {
                  var _loc5_:int = 0;
                  return _loc5_;
               }
               var _loc6_:* = _loc2_.getInt(param1.toString());
               return _loc6_;
            }
            catch(e:Error)
            {
               Logger.debug("[Character] Exception: \'" + e.message + "\'");
               Logger.debug("[Character] JSON: \'" + _loc3_ + "\'");
               var _loc7_:int = 0;
               return _loc7_;
            }
            return 0;
         }
         return 0;
      }
      
      public function refreshUserVouchers(param1:DataObjectArray) : void
      {
         _userVouchers = new Vector.<UserVoucher>();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshUserVoucher(_loc2_);
         }
      }
      
      public function refreshUserVoucher(param1:DOUserVoucher) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = _userVouchers;
         for each(var _loc4_ in _userVouchers)
         {
            if(_loc4_.id == param1.id)
            {
               _loc2_ = _loc4_;
               break;
            }
         }
         if(_loc2_ == null)
         {
            _loc3_ = new UserVoucher(param1);
            _userVouchers.push(_loc3_);
         }
         else
         {
            _loc2_.update(param1);
         }
      }
      
      public function get userVouchers() : Vector.<UserVoucher>
      {
         return _userVouchers;
      }
      
      public function itemSetStatValue(param1:int) : int
      {
         var _loc7_:* = null;
         var _loc5_:* = null;
         if(AppConfig.itemsetsEnabled != true)
         {
            return 0;
         }
         var _loc4_:TypedObject = this.equippedItemSetData;
         if(!_loc4_)
         {
            return 0;
         }
         var _loc3_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc3_ = statBaseStamina;
               break;
            case 1:
               _loc3_ = statBaseStrength;
               break;
            case 2:
               _loc3_ = statBaseCriticalRating;
               break;
            case 3:
               _loc3_ = statBaseDodgeRating;
         }
         var _loc2_:int = 0;
         var _loc12_:int = 0;
         var _loc11_:* = _loc4_.keys;
         for each(var _loc8_ in _loc4_.keys)
         {
            _loc7_ = new ItemSet(_loc8_,this);
            _loc5_ = _loc7_.characterBonusData;
            var _loc10_:int = 0;
            var _loc9_:* = _loc5_;
            for(var _loc6_ in _loc5_)
            {
               if(_loc6_ == param1)
               {
                  _loc2_ = _loc2_ + Math.ceil(_loc3_ * _loc5_[_loc6_]);
               }
            }
         }
         return _loc2_;
      }
      
      public function getEquippedItemSetCount(param1:String) : int
      {
         var _loc3_:* = null;
         if(AppConfig.itemsetsEnabled != true)
         {
            return 0;
         }
         if(!inventory)
         {
            return 0;
         }
         if(!inventory.hasData("item_set_data"))
         {
            return 0;
         }
         var _loc2_:String = inventory.itemSetData;
         if(_loc2_ != "")
         {
            try
            {
               _loc3_ = new TypedObject(JsonUtil.decode(_loc2_));
               if(_loc3_.hasData(param1))
               {
                  var _loc5_:* = _loc3_.getInt(param1);
                  return _loc5_;
               }
               var _loc6_:int = 0;
               return _loc6_;
            }
            catch(e:Error)
            {
               Logger.debug("[Character] Exception: \'" + e.message + "\'");
               Logger.debug("[Character] JSON: \'" + _loc2_ + "\'");
               var _loc7_:int = 0;
               return _loc7_;
            }
            return 0;
         }
         return 0;
      }
      
      public function get equippedItemSetData() : TypedObject
      {
         if(AppConfig.itemsetsEnabled != true)
         {
            return null;
         }
         if(!inventory)
         {
            return null;
         }
         var _loc1_:String = inventory.itemSetData;
         if(_loc1_ != "")
         {
            try
            {
               var _loc3_:* = new TypedObject(JsonUtil.decode(_loc1_));
               return _loc3_;
            }
            catch(e:Error)
            {
               Logger.debug("[Character] Exception: \'" + e.message + "\'");
               Logger.debug("[Character] JSON: \'" + _loc1_ + "\'");
               var _loc4_:* = null;
               return _loc4_;
            }
            return null;
         }
         return null;
      }
      
      public function hasTutorialFlag(param1:String) : Boolean
      {
         var _loc3_:String = tutorialFlags;
         var _loc2_:TypedObject = TypedObject.empty;
         if(_loc3_ != "")
         {
            try
            {
               _loc2_ = new TypedObject(JsonUtil.decode(_loc3_));
            }
            catch(e:Error)
            {
               Logger.debug("[Character] Exception: \'" + e.message + "\'");
               Logger.debug("[Character] JSON: \'" + _loc3_ + "\'");
               var _loc5_:Boolean = false;
               return _loc5_;
            }
         }
         return _loc2_.getBoolean(param1) === true;
      }
      
      public function hasNewTutorialFlag(param1:String) : Boolean
      {
         if(_newTutorialFlags.indexOf(param1) >= 0)
         {
            _newTutorialFlags.splice(_newTutorialFlags.indexOf(param1),1);
            return true;
         }
         return false;
      }
      
      public function setTutorialFlag(param1:String) : void
      {
         var _loc3_:String = tutorialFlags;
         var _loc2_:TypedObject = TypedObject.empty;
         if(_loc3_ != "")
         {
            try
            {
               _loc2_ = new TypedObject(JsonUtil.decode(_loc3_));
            }
            catch(e:Error)
            {
               Logger.debug("[Character] Exception: \'" + e.message + "\'");
               Logger.debug("[Character] JSON: \'" + _loc3_ + "\'");
               _loc2_ = TypedObject.empty;
            }
         }
         if(!§§pop())
         {
            _loc2_.setBoolean(param1,true);
            _loc3_ = _loc2_.asJsonString;
            if(param1 == "tutorial_finished")
            {
               UiPremiumCurrencyPanel.instance.offset = UiPremiumCurrencyPanel.instance.offset + CConstant.tutorial_finished_premium_currency;
            }
            Environment.application.sendActionRequest("setTutorialFlags",{
               "flags":_loc3_,
               "flag":param1
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "refreshQuests":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request,false);
               }
               break;
            case "setTutorialFlags":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.request.getData("flag") == "tutorial_finished")
                  {
                     if(AppEnvironment.appPlatform.hasAppFriendBar)
                     {
                        AppEnvironment.friendBar.updateSetting("tutorial_finished",true);
                     }
                     else
                     {
                        AppEnvironment.friendBar.login(User.current.id,User.current.sessionId);
                     }
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request,false);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      public function getQuestsVisibleOnCitymapForStage(param1:int) : Vector.<Quest>
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc3_:* = undefined;
         var _loc6_:* = null;
         try
         {
            _loc2_ = getString("quest_pool");
            _loc4_ = JsonUtil.decode(_loc2_);
            _loc7_ = _loc4_[param1];
            _loc3_ = new Vector.<Quest>();
            var _loc10_:* = 0;
            var _loc9_:* = _loc7_;
            for each(var _loc5_ in _loc7_)
            {
               _loc6_ = this.quests[_loc5_];
               if(_loc6_.visibleOnMap)
               {
                  _loc3_.push(_loc6_);
               }
            }
            _loc10_ = _loc3_;
            return _loc10_;
         }
         catch(e:Error)
         {
            _loc9_ = new Vector.<Quest>();
            return _loc9_;
         }
      }
      
      public function get moviesTotal() : int
      {
         return getInt("movies");
      }
      
      public function get fansTotal() : int
      {
         return getInt("fans");
      }
      
      public function itemsInStage(param1:int) : Vector.<Item>
      {
         var _loc6_:* = null;
         var _loc5_:Vector.<Item> = new Vector.<Item>(0);
         if(param1 > maxQuestStage && param1 <= CConstant.quest_max_stage)
         {
            return _loc5_;
         }
         var _loc3_:String = getString("quest_pool");
         var _loc4_:Object = JsonUtil.decode(_loc3_);
         var _loc7_:Array = _loc4_[param1];
         var _loc9_:int = 0;
         var _loc8_:* = _loc7_;
         for each(var _loc2_ in _loc7_)
         {
            _loc6_ = _quests.getData(_loc2_);
            if(_loc6_.reward.itemId > 0)
            {
               _loc5_.push(items.getData(_loc6_.reward.itemId));
            }
         }
         return _loc5_;
      }
      
      public function movieVotesInStage(param1:int) : Vector.<int>
      {
         var _loc6_:* = null;
         var _loc5_:Vector.<int> = new Vector.<int>(0);
         if(param1 > maxQuestStage && param1 <= CConstant.quest_max_stage)
         {
            return _loc5_;
         }
         var _loc3_:String = getString("quest_pool");
         var _loc4_:Object = JsonUtil.decode(_loc3_);
         var _loc7_:Array = _loc4_[param1];
         var _loc9_:int = 0;
         var _loc8_:* = _loc7_;
         for each(var _loc2_ in _loc7_)
         {
            _loc6_ = _quests.getData(_loc2_);
            if(_loc6_.reward.movieVotes > 0)
            {
               _loc5_.push(_loc6_.reward.movieVotes);
            }
         }
         return _loc5_;
      }
      
      public function dungeonKeyInStage(param1:int) : Boolean
      {
         var _loc5_:* = null;
         if(param1 > maxQuestStage && param1 <= CConstant.quest_max_stage)
         {
            return false;
         }
         var _loc3_:String = getString("quest_pool");
         var _loc4_:Object = JsonUtil.decode(_loc3_);
         var _loc6_:Array = _loc4_[param1];
         var _loc8_:int = 0;
         var _loc7_:* = _loc6_;
         for each(var _loc2_ in _loc6_)
         {
            _loc5_ = _quests.getData(_loc2_);
            if(_loc5_.reward.dungeonKey)
            {
               return true;
            }
         }
         return false;
      }
      
      public function refreshTitles(param1:DataObjectArray) : void
      {
         var _loc4_:Boolean = true;
         if(_titles == null)
         {
            _titles = new StringMap();
            if(hasTutorialFlag("titles"))
            {
               _loc4_ = false;
            }
            var _loc6_:int = 0;
            var _loc5_:* = Titles.instance.allTitles();
            for each(var _loc3_ in Titles.instance.allTitles())
            {
               _loc3_.isNew = false;
            }
         }
         var _loc8_:int = 0;
         var _loc7_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshTitle(_loc2_,_loc4_);
         }
      }
      
      public function refreshTitle(param1:DOTitle, param2:Boolean = true) : void
      {
         var _loc3_:String = param1.identifier;
         if(!_titles.exists(_loc3_))
         {
            _titles.setData(_loc3_,param1);
            if(param2)
            {
               newTitlesCount = Number(newTitlesCount) + 1;
               Titles.instance.flagAsNew(_loc3_);
            }
         }
      }
      
      public function hasTitle(param1:Title) : Boolean
      {
         if(AppConfig.titlesEnabled != true)
         {
            return false;
         }
         return _titles.exists(param1.identifier);
      }
      
      public function get newTitlesCount() : int
      {
         return _newTitlesCount + Marriages.instance.newMarriageCount;
      }
      
      public function set newTitlesCount(param1:int) : void
      {
         _newTitlesCount = param1;
      }
      
      public function titleCollectedDate(param1:Title) : String
      {
         var _loc2_:String = param1.identifier;
         if(!_titles.exists(_loc2_))
         {
            return "";
         }
         return AppDateTime.timestampToLocalString(DateTime.fromStringServer(_titles.getData(_loc2_).date).timestamp,AppDateTime.dateFormat);
      }
      
      public function resetNewTitles() : void
      {
         newTitlesCount = 0;
         var _loc3_:int = 0;
         var _loc2_:* = Titles.instance.allTitles();
         for each(var _loc1_ in Titles.instance.allTitles())
         {
            _loc1_.isNew = false;
         }
      }
      
      public function get ingameNotifications() : IngameNotifications
      {
         if(_ingameNotifications == null)
         {
            _ingameNotifications = new IngameNotifications();
         }
         return _ingameNotifications;
      }
      
      public function get battleEffectsData() : Object
      {
         var _loc1_:* = null;
         if(hasData("battle_data") && battleData != "" && battleData != "[]")
         {
            _loc1_ = JsonUtil.decode(battleData);
            if(_loc1_ is Array)
            {
               return {};
            }
            if(_loc1_["effects"])
            {
               return _loc1_["effects"];
            }
         }
         return {};
      }
      
      public function get currentWorkDuration() : int
      {
         var _loc2_:int = CConstant.work_step_duration;
         var _loc1_:int = Math.floor(currentWorkDurationRaw / _loc2_) * _loc2_;
         return _loc1_;
      }
      
      public function get currentWorkDurationRaw() : int
      {
         var _loc1_:int = tsLastWorkCollection;
         var _loc2_:int = TimeUtil.now - _loc1_;
         return NumberUtil.clamp(_loc2_,0,maxWorkDuration);
      }
      
      public function get maxWorkDuration() : int
      {
         var _loc1_:int = CConstant.work_duration_base;
         var _loc2_:int = CConstant.work_step_duration;
         var _loc3_:Number = _loc1_ * (1 + activeWorkBoosterAmount / 100);
         return Math.floor(_loc3_ / _loc2_) * _loc2_;
      }
      
      public function get workProgress() : Number
      {
         return currentWorkDurationRaw / maxWorkDuration * 100;
      }
      
      public function get secondsToNextWorkStep() : int
      {
         var _loc1_:int = 0;
         var _loc3_:int = CConstant.work_step_duration;
         var _loc5_:int = tsLastWorkCollection;
         var _loc6_:int = TimeUtil.now - _loc5_;
         var _loc2_:int = currentWorkReward;
         var _loc4_:int = Math.floor(_loc6_ / _loc3_);
         do
         {
            _loc4_++;
            _loc1_ = _loc4_ * _loc3_;
         }
         while(GameUtil.getWorkGameCurrencyRewardNew(level,activeWorkBoosterAmount / 100,_loc1_,guildBonusQuestWorkGameCurrencyRewardFactor) <= _loc2_);
         
         return _loc1_ - _loc6_;
      }
      
      public function get currentWorkReward() : int
      {
         return GameUtil.getWorkGameCurrencyRewardNew(level,activeWorkBoosterAmount / 100,currentWorkDuration,guildBonusQuestWorkGameCurrencyRewardFactor);
      }
      
      public function get maxWorkReward() : int
      {
         return GameUtil.getWorkGameCurrencyRewardNew(level,activeWorkBoosterAmount / 100,maxWorkDuration,guildBonusQuestWorkGameCurrencyRewardFactor);
      }
      
      public function get hasMovieOffers() : Boolean
      {
         return moviePool != "";
      }
      
      public function get movieOffers() : Vector.<Movie>
      {
         var _loc1_:Vector.<Movie> = new Vector.<Movie>(0);
         var _loc3_:Array = JsonUtil.decode(moviePool);
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            _loc1_.push(_movies.getData(_loc2_));
         }
         return _loc1_;
      }
      
      override public function get movieEnergy() : int
      {
         var _loc5_:int = super.movieEnergy;
         var _loc1_:int = tsLastMovieEnergyChange;
         var _loc2_:int = TimeUtil.now - _loc1_;
         var _loc4_:Number = _loc2_ / 60;
         var _loc3_:Number = CConstant.movie_energy_refresh_amount_per_minute;
         _loc5_ = _loc5_ + Math.floor(_loc4_ * _loc3_);
         return NumberUtil.clamp(_loc5_,0,maxMovieEnergy);
      }
      
      public function get secondsToNextMovieEnergyRefill() : int
      {
         var _loc1_:int = tsLastMovieEnergyChange;
         var _loc3_:int = TimeUtil.now - _loc1_;
         var _loc4_:Number = CConstant.movie_energy_refresh_amount_per_minute / 60;
         var _loc2_:int = Math.round(1 / _loc4_);
         return _loc2_ - _loc3_ % _loc2_;
      }
      
      public function get hasEnoughEnergyForMovieQuest() : Boolean
      {
         if(movie)
         {
            var _loc3_:int = 0;
            var _loc2_:* = movie.movieQuests;
            for each(var _loc1_ in movie.movieQuests)
            {
               if(_loc1_.energyCost <= movieEnergy)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function get hasEnoughEnergyForAllMovieQuests() : Boolean
      {
         if(movie)
         {
            var _loc3_:int = 0;
            var _loc2_:* = movie.movieQuests;
            for each(var _loc1_ in movie.movieQuests)
            {
               if(_loc1_.energyCost > movieEnergy)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public function get secondsToNextMovieQuest() : int
      {
         var _loc4_:* = null;
         var _loc3_:Number = NaN;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         if(movie && movie.isOpen)
         {
            _loc4_ = null;
            var _loc7_:int = 0;
            var _loc6_:* = movie.movieQuests;
            for each(var _loc2_ in movie.movieQuests)
            {
               if(_loc4_ == null || _loc4_.energyCost > _loc2_.energyCost)
               {
                  _loc4_ = _loc2_;
               }
            }
            if(!_loc4_)
            {
               return 0;
            }
            _loc3_ = CConstant.movie_energy_refresh_amount_per_minute * 60;
            _loc1_ = secondsToNextMovieEnergyRefill;
            _loc5_ = _loc4_.energyCost - movieEnergy - 1;
            return _loc5_ * _loc3_ + _loc1_;
         }
         return 0;
      }
      
      public function get remainingSecondsUntilNewMovieOffers() : int
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(remainingMoviesToday > 0)
         {
            _loc1_ = this.tsLastMovieFinished;
            _loc3_ = TimeUtil.now - _loc1_;
            _loc2_ = CConstant.movie_cooldown;
            _loc4_ = _loc2_ - _loc3_;
            return NumberUtil.clamp(_loc4_,0,_loc2_);
         }
         return TimeUtil.serverDateTime.secondsUntilTomorrow;
      }
      
      public function get remainingMoviesToday() : int
      {
         var _loc2_:* = undefined;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:int = moviesStartedToday;
         var _loc7_:int = CConstant.movie_daily_limit;
         if(hasGuild && guild)
         {
            _loc2_ = guild.allArtifactIds;
            _loc6_ = 0;
            while(_loc6_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc6_];
               _loc1_ = CGuildArtifact.fromId(_loc4_);
               if(_loc1_.type == 3)
               {
                  _loc7_ = _loc7_ + _loc1_.value;
               }
               _loc6_++;
            }
         }
         var _loc5_:Number = BonusInfo.getValue(9);
         if(_loc5_ > 0)
         {
            _loc7_ = _loc7_ * _loc5_;
         }
         return _loc7_ - _loc3_;
      }
      
      public function refreshStoryDungeons(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshStoryDungeon(_loc2_);
         }
      }
      
      public function refreshStoryDungeon(param1:DOStoryDungeon) : void
      {
         if(!param1.id)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _storyDungeons;
         for each(var _loc2_ in _storyDungeons)
         {
            if(_loc2_.id == param1.id)
            {
               _loc2_.update(param1);
               return;
            }
         }
         _storyDungeons.push(new StoryDungeon(param1));
      }
      
      public function get currentStoryDungeon() : StoryDungeon
      {
         if(!hasCurrentStoryDungeon)
         {
            return null;
         }
         var _loc3_:int = 0;
         var _loc2_:* = _storyDungeons;
         for each(var _loc1_ in _storyDungeons)
         {
            if(_loc1_.storyDungeonIndex == currentStoryDungeonIndex && !_loc1_.repeat)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get repeatStoryDungeon() : StoryDungeon
      {
         if(!hasRepeatStoryDungeon)
         {
            return null;
         }
         var _loc3_:int = 0;
         var _loc2_:* = _storyDungeons;
         for each(var _loc1_ in _storyDungeons)
         {
            if(_loc1_.id == currentRepeatStoryDungeonId && _loc1_.repeat)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getActiveStoryDungeonByStage(param1:int) : StoryDungeon
      {
         if(currentStoryDungeon && currentStoryDungeon.stage == param1 && !currentStoryDungeon.isRewardProcessed)
         {
            return currentStoryDungeon;
         }
         if(repeatStoryDungeon && repeatStoryDungeon.stage == param1 && !repeatStoryDungeon.isRewardProcessed)
         {
            return repeatStoryDungeon;
         }
         return null;
      }
      
      public function get activeStoryDungeonBattle() : Battle
      {
         if(currentStoryDungeon)
         {
            if(currentStoryDungeon.battle && currentStoryDungeon.battle.id == activeStoryDungeonAttackId)
            {
               return currentStoryDungeon.battle;
            }
         }
         if(repeatStoryDungeon)
         {
            if(repeatStoryDungeon.battle && repeatStoryDungeon.battle.id == activeRepeatStoryDungeonAttackId)
            {
               return repeatStoryDungeon.battle;
            }
         }
         return null;
      }
      
      public function get hasCurrentStoryDungeon() : Boolean
      {
         return currentStoryDungeonIndex > 0;
      }
      
      public function get hasRepeatStoryDungeon() : Boolean
      {
         return currentRepeatStoryDungeonId > 0;
      }
      
      public function set completedStoryDungeons(param1:Vector.<int>) : void
      {
         update(new TypedObject({"completed_story_dungeons":param1}));
      }
      
      public function get completedStoryDungeons() : Vector.<int>
      {
         if(!hasData("completed_story_dungeons"))
         {
            return new Vector.<int>(0);
         }
         return this.getData("completed_story_dungeons") as Vector.<int>;
      }
      
      public function get slotmachineSpinCountLeftToday() : int
      {
         return CConstant.slotmachine_max_daily_spins > 0?CConstant.slotmachine_max_daily_spins - slotmachineSpinCount:2147483647;
      }
      
      public function get hasDailySlotmachineSpinLimitReached() : Boolean
      {
         return slotmachineSpinCountLeftToday <= 0;
      }
      
      public function get hasNewUserVouchers() : Boolean
      {
         return allNewUserVoucherIds.length > 0;
      }
      
      public function get allNewUserVoucherIds() : Vector.<int>
      {
         var _loc1_:String = newUserVoucherIds;
         if(_loc1_ != null && _loc1_ != "")
         {
            return Vector.<int>(JsonUtil.decode(_loc1_));
         }
         return new Vector.<int>(0);
      }
      
      public function refreshItemPatternValues(param1:TypedObject) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = param1.keys;
         for each(var _loc2_ in param1.keys)
         {
            _loc3_ = ItemPatterns.instance.itemPattern(_loc2_);
            if(_loc3_)
            {
               _loc3_.update(param1.getTypedObject(_loc2_));
            }
         }
      }
      
      public function refreshCollectedItemPattern(param1:TypedObject) : void
      {
         ItemPatterns.instance.refreshCollectedItemPattern(param1);
      }
      
      public function get isStorageUpgraded() : Boolean
      {
         if(!User.current)
         {
            return false;
         }
         return User.current.getBooleanSettingValue("storage_upgraded");
      }
      
      public function get maximumEnergyStorage() : int
      {
         if(isStorageUpgraded)
         {
            return CConstant.maximum_energy_storage_amount_upgraded;
         }
         return CConstant.maximum_energy_storage_amount;
      }
      
      public function refreshDating(param1:DODatingLookup) : void
      {
         if(!param1.id)
         {
            return;
         }
         if(_dating)
         {
            _dating.update(param1);
         }
         else
         {
            _dating = new Dating(param1);
         }
      }
      
      public function get dating() : Dating
      {
         if(!_dating)
         {
            _dating = new Dating({});
         }
         return _dating;
      }
      
      public function refreshFanFoto(param1:DOFanFoto) : void
      {
         if(!param1.id || !FanFoto.isAvailable)
         {
            return;
         }
         if(_fanFoto)
         {
            _fanFoto.update(param1);
         }
         else
         {
            _fanFoto = new FanFoto(param1);
         }
      }
      
      public function get fanFoto() : FanFoto
      {
         return _fanFoto;
      }
      
      public function refreshMovieVoteRewards(param1:String) : void
      {
         _movieVoteRewards = new Reward(param1);
      }
      
      public function get movieVoteRewards() : Reward
      {
         return _movieVoteRewards;
      }
      
      public function refreshOutfits(param1:DataObjectArray) : void
      {
         outfits.refreshOutfits(param1);
      }
      
      public function refreshOutfit(param1:DOOutfit) : void
      {
         outfits.refreshOutfit(param1);
      }
      
      public function get outfits() : Outfits
      {
         if(!_outfits)
         {
            _outfits = new Outfits();
         }
         return _outfits;
      }
      
      public function refreshOpticalChanges(param1:DOOpticalChangesLookup) : void
      {
         OpticalChanges.instance.refresh(param1);
      }
      
      public function refreshCollectedOpticalChanges(param1:TypedObject) : void
      {
         OpticalChanges.instance.refreshCollectedOpticalChanges(param1);
      }
      
      public function get opticalChanges() : Vector.<int>
      {
         if(hasData("optical_changes"))
         {
            return getIntVector("optical_changes");
         }
         return null;
      }
      
      public function refreshDailyBonusLookup(param1:DODailyBonusLookup) : void
      {
         this.dailyBonusLookup.update(param1);
      }
      
      public function refreshDailyBonusRewards(param1:DataObjectArray) : void
      {
         var _loc2_:* = null;
         dailyBonusLookup.refreshRewards(param1);
         if(User.current && !DialogCollectDailyBonusReward._isOpen)
         {
            _loc2_ = dailyBonusLookup.getReward();
            if(_loc2_)
            {
               Environment.panelManager.showDialog(new DialogCollectDailyBonusReward(_loc2_));
            }
         }
      }
      
      public function refreshDailyBonusReward(param1:DODailyBonusReward) : void
      {
         var _loc2_:* = null;
         dailyBonusLookup.refreshReward(param1);
         if(User.current && !DialogCollectDailyBonusReward._isOpen)
         {
            _loc2_ = dailyBonusLookup.getReward();
            if(_loc2_)
            {
               Environment.panelManager.showDialog(new DialogCollectDailyBonusReward(_loc2_));
            }
         }
      }
      
      public function get dailyBonusLookup() : DailyBonusLookup
      {
         if(!_dailyBonusLookup)
         {
            _dailyBonusLookup = new DailyBonusLookup();
         }
         return _dailyBonusLookup;
      }
      
      public function getUserStoryQuestInStage(param1:int) : Quest
      {
         var _loc5_:* = null;
         if(param1 > maxQuestStage && param1 <= CConstant.quest_max_stage)
         {
            return null;
         }
         var _loc3_:String = getString("quest_pool");
         var _loc4_:Object = JsonUtil.decode(_loc3_);
         var _loc6_:Array = _loc4_[param1];
         var _loc8_:int = 0;
         var _loc7_:* = _loc6_;
         for each(var _loc2_ in _loc6_)
         {
            _loc5_ = _quests.getData(_loc2_);
            if(_loc5_.isUserStoryQuest)
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      public function get serverId() : String
      {
         if(!hasData("server_id"))
         {
            return ServerInfo.serverId;
         }
         return getString("server_id");
      }
      
      public function get isOwnServer() : Boolean
      {
         return serverId == ServerInfo.serverId;
      }
      
      public function get streams() : Streams
      {
         return _streams;
      }
      
      public function refreshStreaming(param1:DOStreaming) : void
      {
         if(!hasStreaming)
         {
            _streaming = new Streaming(param1);
         }
         else
         {
            _streaming.update(param1);
         }
      }
      
      public function get streaming() : Streaming
      {
         return _streaming;
      }
      
      public function get hasStreaming() : Boolean
      {
         return _streaming != null;
      }
   }
}
