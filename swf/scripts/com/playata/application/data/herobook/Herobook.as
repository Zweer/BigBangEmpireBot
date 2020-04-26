package com.playata.application.data.herobook
{
   import com.playata.application.data.dataobject.DOHerobookObjective;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.TimeUtil;
   
   public class Herobook
   {
       
      
      private var _objectives:Vector.<HerobookObjective>;
      
      private var _newObjectives:Boolean = false;
      
      public function Herobook()
      {
         _objectives = new Vector.<HerobookObjective>();
         super();
      }
      
      private static function sortObjectivesByIndex(param1:HerobookObjective, param2:HerobookObjective) : int
      {
         if(param1.isCollected && !param2.isCollected)
         {
            return 1;
         }
         if(!param1.isCollected && param2.isCollected)
         {
            return -1;
         }
         if(param1.durationType < param2.durationType)
         {
            return -1;
         }
         if(param1.durationType > param2.durationType)
         {
            return 1;
         }
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
      
      public function setData(param1:TypedObject) : void
      {
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc2_:HerobookObjective = null;
         var _loc7_:int = 0;
         var _loc6_:* = param1.keys;
         for each(var _loc4_ in param1.keys)
         {
            if(_loc4_ == "newObjectivesCreated")
            {
               _newObjectives = true;
            }
            else
            {
               _loc5_ = new DOHerobookObjective(param1.getData(_loc4_));
               _loc2_ = getObjectiveById(_loc5_.id);
               if(_loc2_)
               {
                  _loc2_.update(_loc5_);
               }
               else
               {
                  _loc2_ = new HerobookObjective(_loc5_);
                  _objectives.push(_loc2_);
               }
            }
         }
         _loc3_ = _objectives.length - 1;
         while(_loc3_ >= 0)
         {
            _loc2_ = _objectives[_loc3_];
            if(_loc2_.isAborted || !_loc2_.isCollectable && _loc2_.remainingSeconds <= 0)
            {
               _objectives.splice(_loc3_,1);
            }
            _loc3_--;
         }
         sortObjectives();
      }
      
      public function sortObjectives() : void
      {
         _objectives.sort(sortObjectivesByIndex);
      }
      
      public function get collectableObjectiveCount() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _objectives;
         for each(var _loc2_ in _objectives)
         {
            if(!_loc2_.isCollected && _loc2_.isCollectable)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get objectives() : Vector.<HerobookObjective>
      {
         return _objectives;
      }
      
      public function getObjectiveById(param1:int) : HerobookObjective
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _objectives.length)
         {
            if(_objectives[_loc2_].id == param1)
            {
               return _objectives[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getCollectableInactiveObjectives() : Vector.<HerobookObjective>
      {
         var _loc1_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Vector.<HerobookObjective> = null;
         _loc1_ = 0;
         while(_loc1_ < _objectives.length)
         {
            _loc3_ = _objectives[_loc1_];
            if(_loc3_.isCollectable && _loc3_.remainingSeconds <= 0)
            {
               if(_loc2_ == null)
               {
                  _loc2_ = new Vector.<HerobookObjective>();
               }
               _loc2_.push(_loc3_);
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function get newObjectives() : Boolean
      {
         return _newObjectives;
      }
      
      public function set newObjectives(param1:Boolean) : void
      {
         _newObjectives = param1;
      }
      
      public function get activeObjectiveCount() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _objectives;
         for each(var _loc2_ in _objectives)
         {
            if(_loc2_.isStarted && _loc2_.remainingSeconds > 0)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function hasActiveObjectiveWithItem(param1:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = _objectives;
         for each(var _loc2_ in _objectives)
         {
            if(!(_loc2_.type != 22 && _loc2_.type != 23 && _loc2_.type != 24))
            {
               if(_loc2_.isStarted && _loc2_.remainingSeconds > 0)
               {
                  if(_loc2_.reference == param1)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function hasCollectItemObjective() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = _objectives;
         for each(var _loc1_ in _objectives)
         {
            if(!(_loc1_.type != 22 && _loc1_.type != 23 && _loc1_.type != 24))
            {
               return true;
            }
         }
         return false;
      }
      
      public function get minTimeRemainingLongString() : String
      {
         var _loc1_:int = 2147483647;
         var _loc4_:int = 0;
         var _loc3_:* = _objectives;
         for each(var _loc2_ in _objectives)
         {
            if(_loc2_.isStarted && _loc2_.remainingSeconds < _loc1_ && _loc2_.remainingSeconds > 0)
            {
               _loc1_ = _loc2_.remainingSeconds;
            }
         }
         if(_loc1_ > 0 && _loc1_ < 2147483647)
         {
            return TimeUtil.secondsToString(_loc1_);
         }
         return "";
      }
   }
}
