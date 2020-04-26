package com.playata.application.data.dating
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CDating;
   import com.playata.application.data.dataobject.DODatingLookup;
   import com.playata.application.data.dataobject.DODatingStep;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.data.DataObjectArray;
   
   public class Dating extends DODatingLookup
   {
       
      
      private var _datingSteps:Vector.<DatingStep>;
      
      private var _completedDatingSteps:Vector.<String>;
      
      private var _unlockedPictures:Object = null;
      
      public function Dating(param1:Object)
      {
         _datingSteps = new Vector.<DatingStep>();
         super(param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         if(_unlockedPictures)
         {
            _unlockedPictures = null;
         }
      }
      
      public function refreshDatingSteps(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for(var _loc2_ in param1)
         {
            refreshDatingStep(param1[_loc2_]);
         }
      }
      
      public function refreshDatingStep(param1:DODatingStep) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _datingSteps.length)
         {
            if(_datingSteps[_loc2_].id == param1.id)
            {
               _datingSteps[_loc2_].update(param1);
               return;
            }
            _loc2_++;
         }
         _datingSteps.push(new DatingStep(param1));
      }
      
      public function get datingSteps() : Vector.<DatingStep>
      {
         return _datingSteps;
      }
      
      public function set completedDatingSteps(param1:Vector.<String>) : void
      {
         _completedDatingSteps = param1;
      }
      
      public function hasActiveDatingStep(param1:int, param2:int = 0) : Boolean
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _datingSteps.length)
         {
            if(_datingSteps[_loc3_].datingIndex == param1 && (_datingSteps[_loc3_].isStarted || _datingSteps[_loc3_].isFinished))
            {
               if(param2 > 0 && _datingSteps[_loc3_].stepIndex == param2)
               {
                  return true;
               }
               if(param2 == 0)
               {
                  return true;
               }
            }
            _loc3_++;
         }
         return false;
      }
      
      public function hasActiveRepeatDatingStep() : Boolean
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _datingSteps.length)
         {
            if(_datingSteps[_loc1_].repeat && (_datingSteps[_loc1_].isStarted || _datingSteps[_loc1_].isFinished))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function hasActiveDatingStepInStage(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _datingSteps.length)
         {
            if(_datingSteps[_loc2_].stage == param1 && (_datingSteps[_loc2_].isStarted || _datingSteps[_loc2_].isFinished))
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function getActiveDatingStepInStage(param1:int) : DatingStep
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _datingSteps.length)
         {
            if(_datingSteps[_loc2_].stage == param1 && (_datingSteps[_loc2_].isStarted || _datingSteps[_loc2_].isFinished))
            {
               return _datingSteps[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getActiveDatingStepByDating(param1:int) : DatingStep
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _datingSteps.length)
         {
            if(_datingSteps[_loc2_].datingIndex == param1 && (_datingSteps[_loc2_].isStarted || _datingSteps[_loc2_].isFinished))
            {
               return _datingSteps[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getLastRepeatDatingStep() : DatingStep
      {
         var _loc1_:int = 0;
         var _loc2_:DatingStep = null;
         _loc1_ = 0;
         while(_loc1_ < _datingSteps.length)
         {
            if(_datingSteps[_loc1_].repeat)
            {
               if(!_loc2_ || _datingSteps[_loc1_].id > _loc2_.id)
               {
                  _loc2_ = _datingSteps[_loc1_];
               }
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function hasDatingStepCompleted(param1:int, param2:int = 0) : Boolean
      {
         var _loc3_:int = 0;
         if(param2 == 0)
         {
            return hasDatingStepCompleted(param1,1) && hasDatingStepCompleted(param1,2) && hasDatingStepCompleted(param1,3) && hasDatingStepCompleted(param1,4) && hasDatingStepCompleted(param1,5);
         }
         _loc3_ = 0;
         while(_loc3_ < _completedDatingSteps.length)
         {
            if(_completedDatingSteps[_loc3_].indexOf(param1 + "_") == 0)
            {
               if(param2 > 0 && _completedDatingSteps[_loc3_] == param1 + "_" + param2)
               {
                  return true;
               }
            }
            _loc3_++;
         }
         return false;
      }
      
      public function isDatingAvailable(param1:Character, param2:int) : Boolean
      {
         if(!DatingUtil.isAvailable)
         {
            return false;
         }
         var _loc3_:CDating = DatingUtil.getDatingTemplate(param2);
         if(getNewDatingIndexForStage(param1,_loc3_.stage) != param2)
         {
            return false;
         }
         return true;
      }
      
      public function newDatingAvailableInStage(param1:Character, param2:int) : Boolean
      {
         var _loc3_:* = null;
         if(!DatingUtil.isAvailable)
         {
            return false;
         }
         var _loc6_:int = 0;
         var _loc5_:* = CDating.ids;
         for each(var _loc4_ in CDating.ids)
         {
            _loc3_ = CDating.fromId(_loc4_);
            if(_loc3_.stage == param2)
            {
               if(_loc3_.minLevel <= param1.level)
               {
                  if(!hasActiveDatingStepInStage(param2))
                  {
                     if(!hasActiveDatingStep(_loc4_))
                     {
                        if(!hasDatingStepCompleted(_loc4_))
                        {
                           return true;
                        }
                     }
                  }
               }
            }
         }
         return false;
      }
      
      public function getNewDatingIndexForStage(param1:Character, param2:int) : int
      {
         var _loc3_:* = null;
         if(!DatingUtil.isAvailable)
         {
            return 0;
         }
         var _loc4_:Vector.<int> = new Vector.<int>(0);
         var _loc7_:int = 0;
         var _loc6_:* = CDating.ids;
         for each(var _loc5_ in CDating.ids)
         {
            _loc3_ = CDating.fromId(_loc5_);
            if(_loc3_.stage == param2)
            {
               if(_loc3_.minLevel <= param1.level)
               {
                  if(!hasActiveDatingStepInStage(param2))
                  {
                     if(!hasActiveDatingStep(_loc5_))
                     {
                        if(!hasDatingStepCompleted(_loc5_))
                        {
                           _loc4_.push(_loc5_);
                        }
                     }
                  }
               }
            }
         }
         if(_loc4_.length > 0)
         {
            _loc4_.sort(sortByMinLevel);
            return _loc4_[0];
         }
         return 0;
      }
      
      private function sortByMinLevel(param1:int, param2:int) : int
      {
         var _loc4_:int = DatingUtil.getDatingTemplate(param1).minLevel;
         var _loc3_:int = DatingUtil.getDatingTemplate(param2).minLevel;
         return _loc4_ - _loc3_;
      }
      
      public function getNewDatingStepIndex(param1:Character, param2:int) : int
      {
         if(!DatingUtil.isAvailable)
         {
            return 0;
         }
         var _loc3_:CDating = DatingUtil.getDatingTemplate(param2);
         if(_loc3_.minLevel > param1.level)
         {
            return 0;
         }
         if(hasActiveDatingStepInStage(_loc3_.stage))
         {
            return 0;
         }
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_.stepIds;
         for each(var _loc4_ in _loc3_.stepIds)
         {
            if(!hasActiveDatingStep(param2,_loc4_) && !hasDatingStepCompleted(param2,_loc4_))
            {
               return _loc4_;
            }
         }
         return 0;
      }
      
      public function get unlockedPictures() : Object
      {
         if(_unlockedPictures)
         {
            return _unlockedPictures;
         }
         if(hasData("unlocked_dating_pictures") && getData("unlocked_dating_pictures") != "" && getData("unlocked_dating_pictures") != [])
         {
            _unlockedPictures = JsonUtil.decode(getString("unlocked_dating_pictures"));
         }
         return _unlockedPictures;
      }
      
      public function isPictureAllowed(param1:int, param2:int) : Boolean
      {
         if(param1 == 0)
         {
            return true;
         }
         return unlockedPictures[param1][param2][1];
      }
      
      public function getUnlockedPicturesByDatingIndex(param1:int = 0) : int
      {
         var _loc3_:int = 0;
         var _loc5_:Object = this.unlockedPictures;
         var _loc9_:int = 0;
         var _loc8_:* = _loc5_;
         for(var _loc4_ in _loc5_)
         {
            if(param1 == 0 || parseInt(_loc4_) == param1)
            {
               var _loc7_:int = 0;
               var _loc6_:* = _loc5_[_loc4_];
               for(var _loc2_ in _loc5_[_loc4_])
               {
                  _loc3_++;
               }
               continue;
            }
         }
         return _loc3_;
      }
   }
}
