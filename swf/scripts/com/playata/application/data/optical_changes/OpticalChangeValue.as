package com.playata.application.data.optical_changes
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.COpticalChangeCategoryValue;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class OpticalChangeValue extends DataObject
   {
       
      
      private var _value:int = 0;
      
      private var _opticalChange:OpticalChangeCategorie = null;
      
      public function OpticalChangeValue(param1:int, param2:OpticalChangeCategorie, param3:COpticalChangeCategoryValue = null)
      {
         _value = param1;
         _opticalChange = param2;
         super(param3);
      }
      
      public function isCollected() : Boolean
      {
         return OpticalChanges.instance.isOpticalChangeCollected(_opticalChange,this);
      }
      
      public function get opticalChange() : OpticalChangeCategorie
      {
         return _opticalChange;
      }
      
      public function get value() : int
      {
         return _value;
      }
      
      public function isCollectable() : Boolean
      {
         return value <= _opticalChange.currentValue;
      }
      
      public function isAvailable() : Boolean
      {
         return _opticalChange.currentTargetValue() == this;
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
         var _loc1_:int = _opticalChange.currentValue;
         return LocText.current.formatHugeNumber(Math.min(_loc1_,value)) + "/" + LocText.current.formatHugeNumber(value);
      }
      
      public function get progress() : Number
      {
         var _loc1_:int = _opticalChange.currentValue;
         return Math.min(_loc1_,value) / value * 100;
      }
      
      public function get rewardText() : String
      {
         var _loc1_:int = GameUtil.getOpticalChangeRewardAmount(rewardType,rewardFactor);
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
         return GameUtil.getOpticalChangeRewardAmount(rewardType,rewardFactor);
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
      
      public function get rewardDescription() : String
      {
         var _loc1_:String = "";
         _loc1_ = _loc1_ + LocText.current.text("optical_change_value/reward_description",value);
         var _loc2_:OpticalChangeValue = opticalChange.nextTargetValue();
         if(_loc2_ != this)
         {
            _loc1_ = _loc1_ + ("\n" + LocText.current.text("optical_change_value/next_reward_description",_loc2_.value));
         }
         return _loc1_;
      }
   }
}
