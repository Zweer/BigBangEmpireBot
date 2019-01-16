package com.playata.application.data.optical_changes
{
   import com.playata.application.data.constants.COpticalChange;
   import com.playata.application.data.constants.COpticalChangeCategory;
   import com.playata.application.data.dataobject.DOOpticalChangesLookup;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.util.JsonUtil;
   
   public class OpticalChanges extends DOOpticalChangesLookup
   {
      
      private static var _instance:OpticalChanges = null;
       
      
      private var _opticalChangeCategories:Vector.<OpticalChangeCategorie>;
      
      private var _collectedOpticalChangeCategories:StringMap;
      
      private var _allActiveOptions:Vector.<int> = null;
      
      private var _chests:Array = null;
      
      public function OpticalChanges()
      {
         var _loc1_:* = null;
         _opticalChangeCategories = new Vector.<OpticalChangeCategorie>();
         _collectedOpticalChangeCategories = new StringMap();
         super(null);
         if(_instance != null)
         {
            throw new Error("OpticalChanges can only have a single instance!");
         }
         _instance = this;
         var _loc5_:int = 0;
         var _loc4_:* = COpticalChangeCategory.ids;
         for each(var _loc3_ in COpticalChangeCategory.ids)
         {
            _opticalChangeCategories.push(new OpticalChangeCategorie(_loc3_));
         }
         _opticalChangeCategories.sort(sortByName);
         var _loc7_:int = 0;
         var _loc6_:* = COpticalChange.ids;
         for each(var _loc2_ in COpticalChange.ids)
         {
            _loc1_ = COpticalChange.fromId(_loc2_);
            getOpticalChangeCategorieOfType(_loc1_.type).addOpticalChange(_loc2_,_loc1_);
         }
      }
      
      public static function get instance() : OpticalChanges
      {
         return _instance;
      }
      
      private function sortByName(param1:OpticalChangeCategorie, param2:OpticalChangeCategorie) : int
      {
         return param1.title.localeCompare(param2.title);
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         _collectedOpticalChangeCategories = new StringMap();
         _loc1_ = 0;
         while(_loc1_ < _opticalChangeCategories.length)
         {
            _opticalChangeCategories[_loc1_].resetOpticalChangesInUse();
            _opticalChangeCategories[_loc1_].resetUnlockedOpticalChanges();
            _loc1_++;
         }
      }
      
      public function get opticalChangeCategories() : Vector.<OpticalChangeCategorie>
      {
         return _opticalChangeCategories;
      }
      
      public function getOpticalChangeCategorieOfType(param1:int) : OpticalChangeCategorie
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _opticalChangeCategories.length)
         {
            if(_opticalChangeCategories[_loc2_].type == param1)
            {
               return _opticalChangeCategories[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getOpticalChangeById(param1:int) : OpticalChange
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _opticalChangeCategories.length)
         {
            _loc3_ = 0;
            while(_loc3_ < _opticalChangeCategories[_loc2_].opticalChanges.length)
            {
               if(_opticalChangeCategories[_loc2_].opticalChanges[_loc3_].id == param1)
               {
                  return _opticalChangeCategories[_loc2_].opticalChanges[_loc3_];
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function get allAvailableChests() : Array
      {
         if(!_chests && availableChests)
         {
            _chests = JsonUtil.decode(availableChests);
         }
         if(!_chests)
         {
            _chests = [];
         }
         return _chests;
      }
      
      public function get hasUnopenedChests() : Boolean
      {
         return allAvailableChests.length > 0;
      }
      
      public function get allActiveOptions() : Vector.<int>
      {
         if(!_allActiveOptions && activeOptions)
         {
            _allActiveOptions = Vector.<int>(JsonUtil.decode(activeOptions));
         }
         return _allActiveOptions;
      }
      
      public function getActiveOptionsForTarget(param1:int, param2:Boolean = false) : Vector.<int>
      {
         if(!param2)
         {
            if(param1 == 1 && !useForQuest)
            {
               return null;
            }
            if(param1 == 2 && !useForDuel)
            {
               return null;
            }
         }
         return allActiveOptions;
      }
      
      public function isOpticalChangeActive(param1:int) : Boolean
      {
         if(allActiveOptions)
         {
            var _loc4_:int = 0;
            var _loc3_:* = allActiveOptions;
            for each(var _loc2_ in allActiveOptions)
            {
               if(_loc2_ == param1)
               {
                  return true;
               }
            }
            return false;
         }
         return COpticalChange.fromId(param1).defaultValue;
      }
      
      public function refreshCollectedOpticalChanges(param1:TypedObject) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc7_:* = null;
         var _loc11_:int = 0;
         var _loc10_:* = param1.keys;
         for each(var _loc6_ in param1.keys)
         {
            _loc3_ = param1.getData(_loc6_);
            var _loc9_:int = 0;
            var _loc8_:* = _loc3_;
            for(var _loc2_ in _loc3_)
            {
               _loc4_ = new TypedObject(_loc3_[_loc2_]);
               _loc5_ = _loc4_.getInt("value");
               _loc7_ = _loc2_ + "_" + _loc5_.toString();
               if(!_collectedOpticalChangeCategories.exists(_loc7_))
               {
                  _collectedOpticalChangeCategories.setData(_loc7_,_loc4_.getString("date"));
               }
            }
         }
      }
      
      public function refresh(param1:DOOpticalChangesLookup) : void
      {
         var _loc6_:* = null;
         var _loc4_:int = 0;
         update(param1);
         _allActiveOptions = null;
         _chests = null;
         if(unlockedOptions != null && unlockedOptions != "")
         {
            _loc6_ = JsonUtil.decode(unlockedOptions);
            var _loc10_:int = 0;
            var _loc9_:* = _loc6_;
            for(var _loc3_ in _loc6_)
            {
               var _loc8_:int = 0;
               var _loc7_:* = _loc6_[_loc3_];
               for(var _loc2_ in _loc6_[_loc3_])
               {
                  getOpticalChangeCategorieOfType(_loc3_).markOpticalChangeAsUnlocked(_loc6_[_loc3_][_loc2_]);
               }
            }
            _loc4_ = 0;
            while(_loc4_ < _opticalChangeCategories.length)
            {
               _opticalChangeCategories[_loc4_].sortAvailableOpticalChanges();
               _loc4_++;
            }
         }
         if(allActiveOptions)
         {
            _loc4_ = 0;
            while(_loc4_ < _opticalChangeCategories.length)
            {
               _opticalChangeCategories[_loc4_].resetOpticalChangesInUse();
               _loc4_++;
            }
            var _loc12_:int = 0;
            var _loc11_:* = allActiveOptions;
            for each(var _loc5_ in allActiveOptions)
            {
               getOpticalChangeCategorieOfType(COpticalChange.fromId(_loc5_).type).markOpticalChangeAsUsed(_loc5_);
            }
         }
      }
      
      public function isOpticalChangeCollected(param1:OpticalChangeCategorie, param2:OpticalChangeValue) : Boolean
      {
         var _loc3_:String = param1.type + "_" + param2.value.toString();
         return _collectedOpticalChangeCategories.exists(_loc3_);
      }
      
      public function get hasCollectableOpticalChangeValues() : Boolean
      {
         var _loc2_:Vector.<OpticalChangeCategorie> = this.opticalChangeCategories;
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            if(_loc1_.hasCollectableOpticalChangeValues)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getFullyCollectedOpticalChangeCategoriesCount(param1:int = 0) : int
      {
         var _loc2_:int = 0;
         var _loc4_:Vector.<OpticalChangeCategorie> = this.opticalChangeCategories;
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            if(!(param1 != 0 && param1 != _loc3_.category))
            {
               if(_loc3_.isFullyCollected())
               {
                  _loc2_++;
               }
            }
         }
         return _loc2_;
      }
      
      public function resetNewOpticalChangeCategories() : void
      {
         var _loc2_:Vector.<OpticalChangeCategorie> = this.opticalChangeCategories;
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            _loc1_.newOpticalChange = false;
         }
      }
   }
}
