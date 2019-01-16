package com.playata.application.data.item_pattern
{
   import com.playata.application.data.GameUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class ItemPatternValue extends DataObject
   {
       
      
      private var _value:int = 0;
      
      private var _itemPattern:ItemPattern = null;
      
      public function ItemPatternValue(param1:int, param2:ItemPattern, param3:Object = null)
      {
         _value = param1;
         _itemPattern = param2;
         super(param3);
      }
      
      public function isCollected() : Boolean
      {
         return ItemPatterns.instance.isItemPatternCollected(_itemPattern,this);
      }
      
      public function get itemPattern() : ItemPattern
      {
         return _itemPattern;
      }
      
      public function get value() : int
      {
         return _value;
      }
      
      public function isCollectable() : Boolean
      {
         return value <= _itemPattern.currentValue;
      }
      
      public function isAvailable() : Boolean
      {
         if(!_itemPattern.isCollectible())
         {
            return false;
         }
         return _itemPattern.currentTargetValue() == this;
      }
      
      public function get rewardType() : int
      {
         return getInt("reward_type");
      }
      
      public function get rewardFactor() : Number
      {
         return getNumber("reward_factor");
      }
      
      public function get progressText() : String
      {
         var _loc1_:int = _itemPattern.currentValue;
         return LocText.current.formatHugeNumber(Math.min(_loc1_,value)) + "/" + LocText.current.formatHugeNumber(value);
      }
      
      public function get progress() : Number
      {
         var _loc1_:int = _itemPattern.currentValue;
         return Math.min(_loc1_,value) / value * 100;
      }
      
      public function get rewardText() : String
      {
         var _loc1_:int = GameUtil.getItemPatternRewardAmount(rewardType,rewardFactor);
         switch(int(rewardType) - 1)
         {
            case 0:
               return GameUtil.getStatPointString(_loc1_);
            case 1:
               return LocText.current.text("general/item_reward_text");
            case 2:
               return GameUtil.getEnergyString(_loc1_);
         }
      }
      
      public function get rewardAmount() : int
      {
         return GameUtil.getItemPatternRewardAmount(rewardType,rewardFactor);
      }
      
      public function get isStatPointReward() : Boolean
      {
         return rewardType == 1;
      }
      
      public function get isItemReward() : Boolean
      {
         return rewardType == 2;
      }
      
      public function get isQuestEnergyReward() : Boolean
      {
         return rewardType == 3;
      }
      
      public function get hasTitleReward() : Boolean
      {
         return rewardTitle != null && rewardTitle != "";
      }
      
      public function get rewardTitle() : String
      {
         return getString("reward_title");
      }
      
      public function get rewardDescription() : String
      {
         var _loc1_:String = "";
         _loc1_ = _loc1_ + LocText.current.text("item_pattern_value/reward_description",value);
         var _loc2_:ItemPatternValue = itemPattern.nextTargetValue();
         if(_loc2_ != this)
         {
            _loc1_ = _loc1_ + ("\n" + LocText.current.text("item_pattern_value/next_reward_description",_loc2_.value));
         }
         return _loc1_;
      }
   }
}
