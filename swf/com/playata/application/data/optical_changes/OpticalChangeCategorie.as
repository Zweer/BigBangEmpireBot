package com.playata.application.data.optical_changes
{
   import com.playata.application.data.constants.COpticalChange;
   import com.playata.application.data.constants.COpticalChangeCategory;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class OpticalChangeCategorie
   {
       
      
      private var _type:int = 0;
      
      private var _values:Vector.<OpticalChangeValue>;
      
      private var _opticalChanges:Vector.<OpticalChange>;
      
      private var _availableOpticalChanges:Vector.<OpticalChange>;
      
      private var _nextOpticalChangesUpdate:int = 0;
      
      private var _newOpticalChange:Boolean = false;
      
      private var _category:int = 0;
      
      public function OpticalChangeCategorie(param1:int)
      {
         _values = new Vector.<OpticalChangeValue>();
         _opticalChanges = new Vector.<OpticalChange>();
         _availableOpticalChanges = new Vector.<OpticalChange>();
         super();
         _type = param1;
         var _loc2_:COpticalChangeCategory = COpticalChangeCategory.fromId(param1);
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_.valueIds;
         for each(var _loc3_ in _loc2_.valueIds)
         {
            _values.push(new OpticalChangeValue(_loc3_,this,_loc2_.getValue(_loc3_)));
         }
         _values.sort(sortByValue);
         _category = _loc2_.category;
      }
      
      private function sortByValue(param1:OpticalChangeValue, param2:OpticalChangeValue) : int
      {
         return param1.value - param2.value;
      }
      
      public function addOpticalChange(param1:int, param2:COpticalChange) : void
      {
         _opticalChanges.push(new OpticalChange(param1,param2));
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function markOpticalChangeAsUnlocked(param1:int) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _opticalChanges.length)
         {
            if(_opticalChanges[_loc2_].id == param1)
            {
               if(!_opticalChanges[_loc2_].isUnlocked)
               {
                  _newOpticalChange = true;
               }
               _opticalChanges[_loc2_].markAsUnlocked();
               break;
            }
            _loc2_++;
         }
      }
      
      public function resetUnlockedOpticalChanges() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _opticalChanges.length)
         {
            _opticalChanges[_loc1_].markAsLocked();
            _loc1_++;
         }
         _newOpticalChange = false;
      }
      
      public function markOpticalChangeAsUsed(param1:int) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _opticalChanges.length)
         {
            if(_opticalChanges[_loc2_].id == param1)
            {
               _opticalChanges[_loc2_].isUsed = true;
               break;
            }
            _loc2_++;
         }
      }
      
      public function resetOpticalChangesInUse() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _opticalChanges.length)
         {
            _opticalChanges[_loc1_].isUsed = false;
            _loc1_++;
         }
      }
      
      public function get currentValue() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc1_ < _opticalChanges.length)
         {
            if(_opticalChanges[_loc1_].isUnlocked)
            {
               _loc2_++;
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function get opticalChanges() : Vector.<OpticalChange>
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(_nextOpticalChangesUpdate == 0 || _nextOpticalChangesUpdate < TimeUtil.now)
         {
            _availableOpticalChanges.length = 0;
            var _loc6_:int = 0;
            var _loc5_:* = _opticalChanges;
            for each(var _loc3_ in _opticalChanges)
            {
               if(_loc3_.isAvailable() || _loc3_.isUnlocked || Environment.info.isTestMode)
               {
                  _availableOpticalChanges.push(_loc3_);
               }
            }
            _loc1_ = new Date();
            _loc1_.setTime(TimeUtil.now * 1000);
            _loc2_ = (60 - _loc1_.getMinutes()) * 60;
            _loc4_ = 60 - _loc1_.getSeconds();
            _nextOpticalChangesUpdate = TimeUtil.now + _loc2_ + _loc4_;
            sortAvailableOpticalChanges();
         }
         return _availableOpticalChanges;
      }
      
      public function sortAvailableOpticalChanges() : void
      {
         if(_availableOpticalChanges && _availableOpticalChanges.length > 0)
         {
            _availableOpticalChanges.sort(sortByUnlockedQualityName);
         }
      }
      
      private function sortByUnlockedQualityName(param1:OpticalChange, param2:OpticalChange) : int
      {
         if(param1.isUnlocked && !param2.isUnlocked)
         {
            return -1;
         }
         if(!param1.isUnlocked && param2.isUnlocked)
         {
            return 1;
         }
         if(param1.rarity != param2.rarity)
         {
            return param1.rarity - param2.rarity;
         }
         return param1.name.localeCompare(param2.name);
      }
      
      public function get values() : Vector.<OpticalChangeValue>
      {
         return _values;
      }
      
      public function currentTargetValue() : OpticalChangeValue
      {
         var _loc3_:int = 0;
         var _loc2_:* = values;
         for each(var _loc1_ in values)
         {
            if(!_loc1_.isCollected())
            {
               return _loc1_;
            }
         }
         return values[values.length - 1];
      }
      
      public function nextTargetValue() : OpticalChangeValue
      {
         var _loc2_:OpticalChangeValue = currentTargetValue();
         var _loc4_:int = 0;
         var _loc3_:* = values;
         for each(var _loc1_ in values)
         {
            if(!_loc1_.isCollected())
            {
               if(_loc1_ != _loc2_)
               {
                  return _loc1_;
               }
            }
         }
         return values[values.length - 1];
      }
      
      public function isFullyCollected() : Boolean
      {
         return opticalChanges.length == currentValue;
      }
      
      public function get hasCollectableOpticalChangeValues() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = values;
         for each(var _loc1_ in values)
         {
            if(_loc1_.isCollectable() && !_loc1_.isCollected())
            {
               return true;
            }
         }
         return false;
      }
      
      public function get iconImageUrl() : String
      {
         return ServerInfo.assetURL("optical_changes_icons/" + type,"png");
      }
      
      public function get title() : String
      {
         return LocText.current.text("optical_change_categories/" + type + "/title");
      }
      
      public function get newOpticalChange() : Boolean
      {
         return _newOpticalChange;
      }
      
      public function set newOpticalChange(param1:Boolean) : void
      {
         _newOpticalChange = param1;
      }
   }
}
