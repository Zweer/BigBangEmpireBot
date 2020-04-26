package com.playata.application.data.dungeon
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CDungeonTemplate;
   import com.playata.application.data.dataobject.DODungeon;
   import com.playata.application.data.dataobject.DODungeonLevel;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class Dungeon extends DODungeon
   {
       
      
      private var _levels:IntMap;
      
      public function Dungeon(param1:DODungeon)
      {
         _levels = new IntMap();
         super(param1);
      }
      
      public function refreshLevel(param1:DODungeonLevel) : void
      {
         DataObject.createOrUpdateMap(DungeonLevel,_levels,param1);
      }
      
      public function get currentLevel() : DungeonLevel
      {
         return _levels.getData(currentLevelId);
      }
      
      public function get progressIndex() : int
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         _loc3_ = 1;
         while(_loc3_ <= numLevels)
         {
            _loc2_ = getLevel(_loc3_);
            if(_loc2_.status != 1)
            {
               _loc1_ = _loc1_ + _loc2_.progressIndex;
               if(_loc2_.level > 1)
               {
                  _loc1_++;
               }
               _loc3_++;
               continue;
            }
            break;
         }
         return _loc1_;
      }
      
      public function get nextLevel() : DungeonLevel
      {
         var _loc2_:int = currentLevel.level + 1;
         var _loc4_:int = 0;
         var _loc3_:* = _levels.values;
         for each(var _loc1_ in _levels.values)
         {
            if(_loc1_.level == _loc2_)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getLevel(param1:int) : DungeonLevel
      {
         var _loc4_:int = 0;
         var _loc3_:* = _levels.values;
         for each(var _loc2_ in _levels.values)
         {
            if(_loc2_.level == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get isOpen() : Boolean
      {
         return status == 2;
      }
      
      public function get isTimeUp() : Boolean
      {
         return status == 4;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 3;
      }
      
      public function get dungeonTemplate() : CDungeonTemplate
      {
         return CDungeonTemplate.fromId(identifier);
      }
      
      public function get durationInSeconds() : int
      {
         return dungeonTemplate.duration;
      }
      
      public function get currentDungeonQuest() : DungeonQuest
      {
         return currentLevel.currentQuest;
      }
      
      public function get name() : String
      {
         return LocText.current.text("dungeon/" + identifier + "/name");
      }
      
      public function get descriptionText() : String
      {
         return LocText.current.text("dungeon/" + identifier + "/description");
      }
      
      public function get completeTitle() : String
      {
         return LocText.current.text("dungeon/" + identifier + "/completed_title");
      }
      
      public function get completeText() : String
      {
         if(!getLevel(1).isFinished)
         {
            return LocText.current.text("dungeon/" + identifier + "/time_up_level_1_text");
         }
         if(!getLevel(2).isFinished)
         {
            return LocText.current.text("dungeon/" + identifier + "/time_up_level_2_text");
         }
         if(!getLevel(3).isFinished)
         {
            return LocText.current.text("dungeon/" + identifier + "/time_up_level_3_text");
         }
         return LocText.current.text("dungeon/" + identifier + "/completed_text");
      }
      
      public function get remainingSeconds() : int
      {
         var _loc1_:int = tsEnd - TimeUtil.now;
         var _loc2_:int = dungeonTemplate.duration;
         _loc2_ = _loc2_ * 3600;
         return NumberUtil.clamp(_loc1_,0,_loc2_);
      }
      
      public function get numQuestsTotal() : int
      {
         return GameUtil.numMissionsInDungeon(identifier);
      }
      
      public function get numQuestsCompleted() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _levels.values;
         for each(var _loc1_ in _levels.values)
         {
            _loc2_ = _loc2_ + _loc1_.progressIndex;
         }
         return _loc2_;
      }
      
      public function get numLevels() : int
      {
         return dungeonTemplate.levelIds.length;
      }
      
      public function get isMultiscreen() : Boolean
      {
         var _loc1_:* = identifier;
         switch(_loc1_)
         {
            case "burning_bernie":
               return true;
            case "flaming_wheels":
               return true;
            case "whiplash":
               return true;
            default:
               return false;
         }
      }
      
      public function get currentBackgroundType() : int
      {
         var _loc1_:int = 0;
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            var _loc2_:* = identifier;
            switch(_loc2_)
            {
               case "burning_bernie":
                  _loc1_ = 1030;
                  break;
               case "flaming_wheels":
                  _loc1_ = 1033;
                  break;
               case "whiplash":
                  _loc1_ = 1036;
            }
         }
         else
         {
            _loc2_ = identifier;
            switch(_loc2_)
            {
               case "burning_bernie":
                  _loc1_ = 30;
                  break;
               case "flaming_wheels":
                  _loc1_ = 33;
                  break;
               case "whiplash":
                  _loc1_ = 36;
            }
         }
         if(isMultiscreen)
         {
            _loc1_ = _loc1_ + (currentLevel.level - 1);
         }
         return _loc1_;
      }
   }
}
