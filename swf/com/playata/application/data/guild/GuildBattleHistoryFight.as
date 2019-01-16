package com.playata.application.data.guild
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOGuildHistoryBattle;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.JsonUtil;
   
   public class GuildBattleHistoryFight extends DOGuildHistoryBattle
   {
       
      
      private var _emblemSettings:GuildEmblemSettings = null;
      
      private var _rewards:TypedObject = null;
      
      public function GuildBattleHistoryFight(param1:DOGuildHistoryBattle)
      {
         super(param1);
      }
      
      public function get enemyGuildId() : int
      {
         return enemy;
      }
      
      public function get enemyIdentifier() : String
      {
         return getString("enemy");
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedShortFormattedTimestamp(battleTimestamp);
      }
      
      public function get isWon() : Boolean
      {
         return getBoolean("won");
      }
      
      public function get isGuildBattleAttack() : Boolean
      {
         return type == 1;
      }
      
      public function get isGuildBattleDefense() : Boolean
      {
         return type == 2;
      }
      
      public function get artifactId() : int
      {
         if(!rewardData)
         {
            return 0;
         }
         if(rewardData.hasData("artifact_id"))
         {
            return rewardData.getInt("artifact_id");
         }
         return 0;
      }
      
      public function get hasArtifactReward() : Boolean
      {
         if(!rewardData)
         {
            return false;
         }
         return rewardData.hasData("artifact_id");
      }
      
      public function get hasImprovementReward() : Boolean
      {
         if(!rewardData)
         {
            return false;
         }
         return rewardData.hasData("improvement_point");
      }
      
      public function get hasGuildMissileReward() : Boolean
      {
         if(!rewardData)
         {
            return false;
         }
         return rewardData.hasData("missiles");
      }
      
      public function get honorReward() : int
      {
         if(!rewardData)
         {
            return 0;
         }
         if(rewardData.hasData("honor"))
         {
            return rewardData.getInt("honor");
         }
         return 0;
      }
      
      override public function get enemyName() : String
      {
         return Character.getCleanName(super.enemyName);
      }
      
      public function get joinedMemberCount() : int
      {
         var _loc1_:Array = getFromJson(joinedCharacterIds,[]) as Array;
         return _loc1_.length;
      }
      
      private function get rewardData() : TypedObject
      {
         if(_rewards)
         {
            return _rewards;
         }
         var _loc1_:String = rewards;
         if(_loc1_ != "")
         {
            try
            {
               _rewards = new TypedObject(JsonUtil.decode(_loc1_));
               var _loc3_:* = _rewards;
               return _loc3_;
            }
            catch(e:Error)
            {
               Logger.debug("[GuildBattleHistoryFight] Exception: \'" + e.message + "\'");
               Logger.debug("[GuildBattleHistoryFight] JSON: \'" + _loc1_ + "\'");
            }
         }
         return null;
      }
      
      public function get emblemBackgroundShapeId() : int
      {
         return ebs;
      }
      
      public function get emblemBackgroundColorIndex() : int
      {
         return ebc;
      }
      
      public function get emblemBackgroundBorderColorIndex() : int
      {
         return ebbc;
      }
      
      public function get emblemIconShapeId() : int
      {
         return eis;
      }
      
      public function get emblemIconColorIndex() : int
      {
         return eic;
      }
      
      public function get emblemIconSize() : int
      {
         return eiz;
      }
      
      public function get emblemSettings() : GuildEmblemSettings
      {
         if(_emblemSettings == null)
         {
            _emblemSettings = GuildEmblemSettings.fromGuildBattleHistoryFight(this);
         }
         return _emblemSettings;
      }
   }
}
