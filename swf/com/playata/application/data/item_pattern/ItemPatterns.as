package com.playata.application.data.item_pattern
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.util.TimeUtil;
   
   public class ItemPatterns
   {
      
      private static var _instance:ItemPatterns = null;
       
      
      private var _itemPattern:Vector.<ItemPattern>;
      
      private var _availableItemPattern:Vector.<ItemPattern>;
      
      private var _collectedItemPattern:StringMap;
      
      private var _nextItemPatternsUpdate:int = 0;
      
      public function ItemPatterns(param1:Object, param2:Object)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc10_:* = null;
         var _loc6_:* = null;
         _itemPattern = new Vector.<ItemPattern>();
         _availableItemPattern = new Vector.<ItemPattern>();
         _collectedItemPattern = new StringMap();
         super();
         if(_instance != null)
         {
            throw new Error("ItemPatterns can only have a single instance!");
         }
         _instance = this;
         var _loc9_:TypedObject = TypedObject.empty;
         var _loc7_:TypedObject = TypedObject.empty;
         var _loc12_:int = 0;
         var _loc11_:* = param2;
         for(var _loc8_ in param2)
         {
            _loc3_ = param2[_loc8_];
            if(_loc3_["item_pattern"] != null)
            {
               _loc4_ = _loc3_["item_pattern"];
               if(!_loc9_.hasData(_loc4_))
               {
                  _loc9_.setArray(_loc4_,[]);
               }
               if(!_loc7_.hasData(_loc4_))
               {
                  _loc7_.setArray(_loc4_,[]);
               }
               _loc10_ = _loc3_["gender"] as String;
               if(_loc10_ == "m")
               {
                  _loc9_.getArray(_loc4_).push(_loc8_);
               }
               else if(_loc10_ == "f")
               {
                  _loc7_.getArray(_loc4_).push(_loc8_);
               }
               else if(_loc10_ == "b" || _loc10_ == "u")
               {
                  _loc9_.getArray(_loc4_).push(_loc8_);
                  _loc7_.getArray(_loc4_).push(_loc8_);
               }
            }
         }
         var _loc14_:int = 0;
         var _loc13_:* = param1;
         for(var _loc5_ in param1)
         {
            _loc6_ = param1[_loc5_];
            if(_loc6_.active == true)
            {
               if(!(_loc6_.lookup_column == "user_story" && !AppConfig.userStoryQuestsEnabled))
               {
                  _itemPattern.push(new ItemPattern(_loc5_,_loc6_,_loc9_.getStringVector(_loc5_),_loc7_.getStringVector(_loc5_)));
               }
            }
         }
      }
      
      public static function get instance() : ItemPatterns
      {
         return _instance;
      }
      
      public function sortPattern() : void
      {
         _itemPattern.sort(sortByLevelIdentifier);
      }
      
      public function get itemPatterns() : Vector.<ItemPattern>
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(_nextItemPatternsUpdate == 0 || _nextItemPatternsUpdate < TimeUtil.now)
         {
            _availableItemPattern.length = 0;
            var _loc6_:int = 0;
            var _loc5_:* = _itemPattern;
            for each(var _loc4_ in _itemPattern)
            {
               if(_loc4_.isAvailable() || Environment.info.isTestMode)
               {
                  _availableItemPattern.push(_loc4_);
               }
            }
            _loc1_ = new Date();
            _loc1_.setTime(TimeUtil.now * 1000);
            _loc2_ = (60 - _loc1_.getMinutes()) * 60;
            _loc3_ = 60 - _loc1_.getSeconds();
            _nextItemPatternsUpdate = TimeUtil.now + _loc2_ + _loc3_;
         }
         return _availableItemPattern;
      }
      
      private function sortByLevelIdentifier(param1:ItemPattern, param2:ItemPattern) : int
      {
         var _loc7_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc8_:Boolean = false;
         try
         {
            _loc7_ = param1.isCollectible();
            _loc4_ = param2.isCollectible();
            if(_loc7_ && !_loc4_)
            {
               var _loc10_:int = -1;
               return _loc10_;
            }
            if(!_loc7_ && _loc4_)
            {
               var _loc11_:int = 1;
               return _loc11_;
            }
            _loc3_ = param1.hasCollectableItemPatternValues;
            _loc6_ = param2.hasCollectableItemPatternValues;
            if(_loc3_ && !_loc6_)
            {
               var _loc12_:int = -1;
               return _loc12_;
            }
            if(!_loc3_ && _loc6_)
            {
               var _loc13_:int = 1;
               return _loc13_;
            }
            _loc5_ = param1.isFullyCollected(User.current.character.gender);
            _loc8_ = param2.isFullyCollected(User.current.character.gender);
            if(_loc5_ && !_loc8_)
            {
               var _loc14_:int = 1;
               return _loc14_;
            }
            if(!_loc5_ && _loc8_)
            {
               var _loc15_:int = -1;
               return _loc15_;
            }
            var _loc16_:* = param1.identifier < param2.identifier?-1:1;
            return _loc16_;
            return;
         }
         catch(e:Error)
         {
            var _loc17_:int = 0;
            return _loc17_;
         }
      }
      
      public function itemPattern(param1:String) : ItemPattern
      {
         var _loc4_:int = 0;
         var _loc3_:* = _itemPattern;
         for each(var _loc2_ in _itemPattern)
         {
            if(_loc2_.identifier == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function refreshCollectedItemPattern(param1:TypedObject) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc11_:int = 0;
         var _loc10_:* = param1.keys;
         for each(var _loc4_ in param1.keys)
         {
            _loc2_ = param1.getData(_loc4_);
            var _loc9_:int = 0;
            var _loc8_:* = _loc2_;
            for(var _loc5_ in _loc2_)
            {
               _loc3_ = new TypedObject(_loc2_[_loc5_]);
               _loc6_ = _loc3_.getInt("value");
               _loc7_ = _loc5_ + "_" + _loc6_.toString();
               if(!_collectedItemPattern.exists(_loc7_))
               {
                  _collectedItemPattern.setData(_loc7_,_loc3_.getString("date"));
               }
            }
         }
      }
      
      public function isItemPatternCollected(param1:ItemPattern, param2:ItemPatternValue) : Boolean
      {
         var _loc3_:String = param1.identifier + "_" + param2.value.toString();
         return _collectedItemPattern.exists(_loc3_);
      }
      
      public function get hasCollectableItemPatternValues() : Boolean
      {
         var _loc2_:Vector.<ItemPattern> = this.itemPatterns;
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            if(_loc1_.hasCollectableItemPatternValues)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get hasNewItemPattern() : Boolean
      {
         var _loc2_:Vector.<ItemPattern> = this.itemPatterns;
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            if(_loc1_.isNew)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getFullyCollectedItemPatternsCount(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc4_:Vector.<ItemPattern> = this.itemPatterns;
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            if(_loc3_.isFullyCollected(param1))
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
   }
}
