package com.playata.application.data.reward
{
   import com.playata.application.data.bonus.BonusInfo;
   
   public class QuestReward extends Reward
   {
       
      
      public function QuestReward(param1:String)
      {
         super(param1);
      }
      
      override public function get xp() : int
      {
         var _loc1_:int = super.xp;
         var _loc2_:Number = BonusInfo.getValue(7);
         if(_loc2_ > 0)
         {
            _loc1_ = Math.round(_loc1_ * _loc2_);
         }
         return _loc1_;
      }
      
      override public function get gameCurrency() : int
      {
         var _loc1_:int = super.gameCurrency;
         var _loc2_:Number = BonusInfo.getValue(8);
         if(_loc2_ > 0)
         {
            _loc1_ = Math.round(_loc1_ * _loc2_);
         }
         return _loc1_;
      }
   }
}
