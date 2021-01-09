package com.playata.application.data.story_dungeon
{
   import com.playata.application.data.battle.Battle;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.constants.CNPC;
   import com.playata.application.data.constants.CStoryDungeon;
   import com.playata.application.data.dataobject.DOBattle;
   import com.playata.application.data.dataobject.DOStoryDungeon;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class StoryDungeon extends DOStoryDungeon
   {
       
      
      private var _rewards:Reward = null;
      
      private var _battle:Battle = null;
      
      public function StoryDungeon(param1:Object = null)
      {
         super(param1);
      }
      
      public static function getStoryDungeonTemplate(param1:int) : CStoryDungeon
      {
         return CStoryDungeon.fromId(param1);
      }
      
      public static function newStoryDungeonAvailable(param1:Character, param2:int = 0) : Boolean
      {
         return getNewStoryDungeonIndex(param1,param2) > 0;
      }
      
      public static function getNewStoryDungeonIndex(param1:Character, param2:int = 0) : int
      {
         var _loc5_:* = undefined;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc9_:StoryDungeon = param1.currentStoryDungeon;
         var _loc4_:* = 0;
         var _loc8_:StoryDungeon = null;
         if(!_loc9_ || _loc9_.isRewardProcessed)
         {
            _loc8_ = param1.repeatStoryDungeon;
            _loc5_ = param1.completedStoryDungeons;
            _loc6_ = param2 > 0?param2:int(param1.level);
            var _loc11_:int = 0;
            var _loc10_:* = CStoryDungeon.ids;
            for each(var _loc7_ in CStoryDungeon.ids)
            {
               if(_loc5_.indexOf(_loc7_) < 0)
               {
                  _loc3_ = CStoryDungeon.fromId(_loc7_);
                  if(_loc3_ && _loc6_ >= _loc3_.minLevel && (_loc4_ == 0 || CStoryDungeon.fromId(_loc4_).minLevel > _loc3_.minLevel))
                  {
                     _loc4_ = _loc7_;
                  }
               }
            }
         }
         if(_loc4_ > 0 && _loc8_ && _loc8_.stage == CStoryDungeon.fromId(_loc4_).stage)
         {
            return 0;
         }
         return _loc4_;
      }
      
      public static function getNextStoryDungeonIndex(param1:Character) : int
      {
         var _loc4_:* = undefined;
         var _loc2_:* = null;
         var _loc7_:StoryDungeon = param1.currentStoryDungeon;
         var _loc3_:* = 0;
         var _loc6_:StoryDungeon = null;
         if(!_loc7_ || _loc7_.isRewardProcessed)
         {
            _loc6_ = param1.repeatStoryDungeon;
            _loc4_ = param1.completedStoryDungeons;
            var _loc9_:int = 0;
            var _loc8_:* = CStoryDungeon.ids;
            for each(var _loc5_ in CStoryDungeon.ids)
            {
               if(_loc4_.indexOf(_loc5_) < 0)
               {
                  _loc2_ = CStoryDungeon.fromId(_loc5_);
                  if(_loc2_ && (_loc3_ == 0 || CStoryDungeon.fromId(_loc3_).minLevel > _loc2_.minLevel))
                  {
                     _loc3_ = _loc5_;
                  }
               }
            }
         }
         if(_loc3_ > 0 && _loc6_ && _loc6_.stage == CStoryDungeon.fromId(_loc3_).stage)
         {
            return 0;
         }
         return _loc3_;
      }
      
      public static function getRewardItemIconImageUrl(param1:int) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            _loc3_ = "";
            if(User.current.character.isMale)
            {
               _loc3_ = _loc2_.rewardItemIdentifierMId;
            }
            else
            {
               _loc3_ = _loc2_.rewardItemIdentifierFId;
            }
            _loc4_ = CItemTemplate.fromId(_loc3_).gender == "u"?"":!!User.current.character.isMale?"_m":"_f";
            return ServerInfo.assetURL(Item.itemAssetPath + _loc3_ + _loc4_ + "_i","png");
         }
         return "";
      }
      
      public static function getRewardItemQuality(param1:int) : int
      {
         var _loc3_:* = null;
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            _loc3_ = "";
            if(User.current.character.isMale)
            {
               _loc3_ = _loc2_.rewardItemIdentifierMId;
            }
            else
            {
               _loc3_ = _loc2_.rewardItemIdentifierFId;
            }
            return CItemTemplate.fromId(_loc3_).quality as int;
         }
         return 0;
      }
      
      public static function getRewardItemName(param1:int) : String
      {
         var _loc3_:* = null;
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            _loc3_ = "";
            if(User.current.character.isMale)
            {
               _loc3_ = _loc2_.rewardItemIdentifierMId;
            }
            else
            {
               _loc3_ = _loc2_.rewardItemIdentifierFId;
            }
            if(_loc3_.indexOf("surprise_box") != -1)
            {
               _loc3_ = _loc3_.substr(0,_loc3_.lastIndexOf("_"));
            }
            return LocText.current.text("item/" + _loc3_ + "/name");
         }
         return "";
      }
      
      public static function getRewardStatPoints(param1:int, param2:Boolean) : int
      {
         var _loc3_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc3_)
         {
            if(param2)
            {
               return _loc3_.statPointRewardRepeat;
            }
            return _loc3_.statPointReward;
         }
         return 0;
      }
      
      public static function getStage(param1:int) : int
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return _loc2_.stage;
         }
         return 0;
      }
      
      public static function getRewardStageChanges(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/reward_stage_changes");
      }
      
      public static function getRewardStageMissions(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/reward_more_missions");
      }
      
      public static function getBossThumbnailImageUrl(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return ServerInfo.assetURL("npc/" + getBossIdentifier(param1) + "_t","png");
         }
         return "";
      }
      
      public static function getBossFacebookImageUrl(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            ServerInfo.assetURL("facebook/story-dungeon-" + getBossIdentifier(param1),"png");
         }
         return "";
      }
      
      public static function getBossImageUrl(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return ServerInfo.assetURL("npc/" + getBossIdentifier(param1),"png");
         }
         return "";
      }
      
      public static function getBossImageUrlHD(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return ServerInfo.assetURL("npc_hd/" + getBossIdentifier(param1),"png");
         }
         return "";
      }
      
      public static function getBossVoiceType(param1:int) : int
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return CNPC.fromId(getBossIdentifier(param1)).voice;
         }
         return 0;
      }
      
      public static function getBossIdentifier(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            if(User.current.character.gender == "m")
            {
               return _loc2_.npcIdentifierMId;
            }
            return _loc2_.npcIdentifierFId;
         }
         return "";
      }
      
      public static function getBossLevel(param1:int) : int
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return _loc2_.npcLevel;
         }
         return 0;
      }
      
      public static function getBossName(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return LocText.current.text("npc/" + _loc2_.identifier + "/name");
         }
         return "";
      }
      
      public static function hasChangesForStage(param1:int, param2:int) : Boolean
      {
         var _loc3_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc3_)
         {
            return _loc3_.stage == param2;
         }
         return false;
      }
      
      public static function getStageOverlayUrl(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return ServerInfo.assetURL("story_dungeons_new/" + _loc2_.identifier + "_o","png");
         }
         return "";
      }
      
      public static function getUnlockPointImageUrl(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return ServerInfo.assetURL("story_dungeons_new/" + _loc2_.identifier + "_p","png");
         }
         return "";
      }
      
      public static function getName(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/name");
      }
      
      public static function getUnlockText(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/unlock");
      }
      
      public static function getBriefingText(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/briefing");
      }
      
      public static function getTaskCompleteBriefingText(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/briefing_task_complete");
      }
      
      public static function getWinText(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/win");
      }
      
      public static function getLostText(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/lost");
      }
      
      public static function getUnlockPoinName(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/unlock_point/name");
      }
      
      public static function getUnlockPoinTooltip(param1:int) : String
      {
         return LocText.current.text("story_dungeon/" + param1 + "/unlock_point/tooltip");
      }
      
      public static function getRepeatKeyImageUrl(param1:int) : String
      {
         var _loc2_:CStoryDungeon = getStoryDungeonTemplate(param1);
         if(_loc2_)
         {
            return ServerInfo.assetURL("story_dungeons_new/" + _loc2_.identifier + "_r","png");
         }
         return "";
      }
      
      public static function getRepeatKeyName(param1:int) : String
      {
         return LocText.current.text("story_dungeon/repeat_key_name",getName(param1));
      }
      
      public static function getRepeatKeyDescription(param1:int) : String
      {
         return LocText.current.text("story_dungeon/repeat_key_description",getName(param1));
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         if(_rewards)
         {
            _rewards = null;
         }
      }
      
      public function refreshBattle(param1:DOBattle) : void
      {
         _battle = DataObject.createOrUpdate(Battle,_battle,param1);
      }
      
      public function get battle() : Battle
      {
         return _battle;
      }
      
      public function get reward() : Reward
      {
         if(_rewards)
         {
            return _rewards;
         }
         _rewards = new Reward(rewards);
         return _rewards;
      }
      
      public function get battleId() : int
      {
         var _loc1_:* = null;
         if(battleIds != "")
         {
            _loc1_ = JsonUtil.decode(battleIds);
            return _loc1_[_loc1_.length - 1];
         }
         return 0;
      }
      
      public function get stage() : int
      {
         var _loc1_:CStoryDungeon = getStoryDungeonTemplate(storyDungeonIndex);
         return _loc1_.stage;
      }
      
      public function get hasFreeAttack() : Boolean
      {
         return TimeUtil.now - tsLastAttack > CConstant.story_dungeon_attack_cooldown;
      }
      
      public function get secondsUntilFreeAttack() : int
      {
         return CConstant.story_dungeon_attack_cooldown - (TimeUtil.now - tsLastAttack);
      }
      
      public function get pointsNeeded() : int
      {
         var _loc1_:CStoryDungeon = getStoryDungeonTemplate(storyDungeonIndex);
         if(repeat)
         {
            return _loc1_.unlockPointsNeededRepeat;
         }
         return _loc1_.unlockPointsNeeded;
      }
      
      public function get identifier() : String
      {
         var _loc1_:CStoryDungeon = getStoryDungeonTemplate(storyDungeonIndex);
         return _loc1_.identifier;
      }
      
      public function allPointsCollected() : Boolean
      {
         return pointsCollected >= pointsNeeded;
      }
      
      public function get isStarted() : Boolean
      {
         return status == 1;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 2;
      }
      
      public function get isRewardProcessed() : Boolean
      {
         return status == 3;
      }
      
      public function get questButtonImageUrl() : String
      {
         var _loc1_:CStoryDungeon = getStoryDungeonTemplate(storyDungeonIndex);
         if(_loc1_.npcIdentifierMId == _loc1_.npcIdentifierFId)
         {
            return ServerInfo.assetURL("story_dungeons_new/" + identifier + "_b","png");
         }
         return ServerInfo.assetURL("story_dungeons_new/" + identifier + "_" + User.current.character.gender + "_b","png");
      }
      
      public function get progress() : Number
      {
         return pointsCollected / pointsNeeded * 100;
      }
      
      public function get progressText() : String
      {
         return LocText.current.text("story_dungeon/" + storyDungeonIndex + "/progress",pointsCollected,pointsNeeded);
      }
      
      public function get instantFinishCost() : int
      {
         var _loc1_:CStoryDungeon = getStoryDungeonTemplate(storyDungeonIndex);
         var _loc2_:int = 0;
         if(repeat)
         {
            _loc2_ = _loc1_.skipPriceRepeat;
         }
         else
         {
            _loc2_ = _loc1_.skipPrice;
         }
         if(allPointsCollected())
         {
            return _loc2_;
         }
         return Math.ceil((100 - progress) / 100 * _loc2_);
      }
   }
}
