package com.playata.application.data.dungeon
{
   import com.playata.application.data.constants.CDungeonQuestTemplate;
   import com.playata.application.data.constants.CDungeonTemplate;
   import com.playata.application.data.constants.CDungeonTemplateLevel;
   import com.playata.application.data.dataobject.DODungeonLevel;
   import com.playata.application.data.dataobject.DODungeonQuest;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class DungeonLevel extends DODungeonLevel
   {
       
      
      private var _quests:IntMap;
      
      public function DungeonLevel(param1:Object = null)
      {
         _quests = new IntMap();
         super(param1);
      }
      
      public function refreshQuest(param1:DODungeonQuest) : void
      {
         DataObject.createOrUpdateMap(DungeonQuest,_quests,param1);
      }
      
      public function get currentQuest() : DungeonQuest
      {
         return _quests.getData(currentDungeonQuestId);
      }
      
      public function get isFinished() : Boolean
      {
         return status == 3;
      }
      
      public function get isUnlocked() : Boolean
      {
         var _loc1_:Dungeon = User.current.character.currentDungeon;
         if(_loc1_.id != dungeonId)
         {
            return false;
         }
         return _loc1_.unlockedLevel >= level;
      }
      
      public function get textLocked() : String
      {
         return LocText.current.text("dungeon/" + dungeonIdentifier + "/level_" + level + "/locked");
      }
      
      public function get textUnlocked() : String
      {
         return LocText.current.text("dungeon/" + dungeonIdentifier + "/level_" + level + "/unlocked");
      }
      
      public function get numMissions() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = CDungeonQuestTemplate.ids;
         for each(var _loc2_ in CDungeonQuestTemplate.ids)
         {
            if(_loc2_.indexOf(dungeonIdentifier) == 0 && CDungeonQuestTemplate.fromId(_loc2_).level == level)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function get dungeonLevelTemplate() : CDungeonTemplateLevel
      {
         return CDungeonTemplate.fromId(dungeonIdentifier).getLevel(level);
      }
      
      public function get unlockNpcIdentifier() : String
      {
         return dungeonLevelTemplate.unlockNpcIdentifier;
      }
      
      public function get unlockNpcImageUrlHD() : String
      {
         return ServerInfo.assetURL("dungeons/" + unlockNpcIdentifier,"png");
      }
      
      public function get imageUrl() : String
      {
         return ServerInfo.assetURL("dungeons/" + dungeonIdentifier + "_level_" + level,"png");
      }
   }
}
