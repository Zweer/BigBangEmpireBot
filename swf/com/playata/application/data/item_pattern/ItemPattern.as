package com.playata.application.data.item_pattern
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class ItemPattern extends DataObject
   {
       
      
      private var _identifier:String = null;
      
      private var _values:Vector.<ItemPatternValue>;
      
      private var _itemIdentifiersM:Vector.<String> = null;
      
      private var _itemIdentifiersF:Vector.<String> = null;
      
      private var _collectedItems:Vector.<String> = null;
      
      public function ItemPattern(param1:String, param2:Object, param3:Vector.<String>, param4:Vector.<String>)
      {
         _values = new Vector.<ItemPatternValue>();
         _identifier = param1;
         _itemIdentifiersM = param3;
         _itemIdentifiersF = param4;
         if(_itemIdentifiersM == null)
         {
            _itemIdentifiersM = new Vector.<String>(0);
         }
         if(_itemIdentifiersF == null)
         {
            _itemIdentifiersF = new Vector.<String>(0);
         }
         super(param2);
         var _loc7_:int = 0;
         var _loc6_:* = param2.values;
         for(var _loc5_ in param2.values)
         {
            _values.push(new ItemPatternValue(parseInt(_loc5_.toString()),this,param2.values[_loc5_]));
         }
         _values.sort(sortByValue);
      }
      
      private function sortByValue(param1:ItemPatternValue, param2:ItemPatternValue) : int
      {
         return param1.value - param2.value;
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         _collectedItems = null;
         _itemIdentifiersM.sort(sortByCollectedIdentifier);
         _itemIdentifiersF.sort(sortByCollectedIdentifier);
      }
      
      private function sortByCollectedIdentifier(param1:String, param2:String) : int
      {
         var _loc3_:Boolean = isItemCollected(param1);
         var _loc4_:Boolean = isItemCollected(param2);
         if(_loc3_ && !_loc4_)
         {
            return -1;
         }
         if(!_loc3_ && _loc4_)
         {
            return 1;
         }
         return param1 < param2?-1:1;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get currentValue() : int
      {
         return getInt("value");
      }
      
      public function get tsStart() : String
      {
         if(getString("ts_availability_start") == "")
         {
            return null;
         }
         return getString("ts_availability_start");
      }
      
      public function get tsEnd() : String
      {
         if(getString("ts_availability_end") == "")
         {
            return null;
         }
         return getString("ts_availability_end");
      }
      
      public function get collectedItems() : Vector.<String>
      {
         if(_collectedItems != null)
         {
            return _collectedItems;
         }
         if(!hasData("collected_items"))
         {
            _collectedItems = new Vector.<String>(0);
            return _collectedItems;
         }
         _collectedItems = getStringVector("collected_items",new Vector.<String>(0));
         return _collectedItems;
      }
      
      public function getItemIdentifiers(param1:String) : Vector.<String>
      {
         if(param1 == "m")
         {
            return _itemIdentifiersM;
         }
         return _itemIdentifiersF;
      }
      
      public function isItemCollected(param1:String) : Boolean
      {
         return collectedItems.indexOf(param1) >= 0;
      }
      
      public function get isNew() : Boolean
      {
         return getBoolean("is_new");
      }
      
      public function getRequiredLevel(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = 2147483647;
         var _loc5_:Vector.<String> = getItemIdentifiers(param1);
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_;
         for each(var _loc4_ in _loc5_)
         {
            _loc3_ = CItemTemplate.fromId(_loc4_);
            if(_loc3_.requiredLevel < _loc2_)
            {
               _loc2_ = _loc3_.requiredLevel;
            }
         }
         return _loc2_;
      }
      
      public function get values() : Vector.<ItemPatternValue>
      {
         return _values;
      }
      
      public function currentTargetValue() : ItemPatternValue
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
      
      public function nextTargetValue() : ItemPatternValue
      {
         var _loc2_:ItemPatternValue = currentTargetValue();
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
      
      public function isFullyCollected(param1:String) : Boolean
      {
         return getItemIdentifiers(param1).length == currentValue;
      }
      
      public function isCollectible() : Boolean
      {
         var _loc1_:Character = User.current.character;
         if(getRequiredLevel(_loc1_.gender) > _loc1_.level)
         {
            return false;
         }
         return true;
      }
      
      public function isAvailable() : Boolean
      {
         if(tsStart != null)
         {
            if(DateTime.fromStringServer(tsStart).timestamp > TimeUtil.now)
            {
               return false;
            }
         }
         if(tsEnd != null)
         {
            if(DateTime.fromStringServer(tsEnd).timestamp < TimeUtil.now)
            {
               return false;
            }
         }
         return true;
      }
      
      public function get hasCollectableItemPatternValues() : Boolean
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
         return ServerInfo.assetURL("item_pattern/" + identifier,"png");
      }
      
      public function get title() : String
      {
         return LocText.current.text("item_pattern/" + identifier + "/title");
      }
      
      public function get sourceInfo() : String
      {
         if(!hasData("sources"))
         {
            return "";
         }
         var _loc2_:TypedObject = getTypedObject("sources");
         var _loc1_:String = LocText.current.text("item_pattern/source/title") + "\n";
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_.keys;
         for each(var _loc3_ in _loc2_.keys)
         {
            _loc1_ = _loc1_ + ("<li>" + LocText.current.text("item_pattern_source/" + _loc3_) + "</li>");
         }
         return _loc1_;
      }
      
      public function itemSourceInfo(param1:String) : String
      {
         if(!hasData("sources"))
         {
            return "";
         }
         var _loc3_:TypedObject = getTypedObject("sources");
         var _loc2_:String = LocText.current.text("item_pattern/source/title") + "\n";
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_.keys;
         for each(var _loc4_ in _loc3_.keys)
         {
            if(_loc3_.getArray(_loc4_).indexOf(param1) >= 0)
            {
               _loc2_ = _loc2_ + ("<li>" + LocText.current.text("item_pattern_source/" + _loc4_) + "</li>");
            }
         }
         return _loc2_;
      }
      
      public function getItemInfo(param1:String) : String
      {
         return LocText.current.text("item_pattern/item_not_collected",title,collectedItems.length,getItemIdentifiers(param1).length);
      }
   }
}
