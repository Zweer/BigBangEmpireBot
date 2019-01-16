package com.playata.application.data.goal
{
   import com.playata.framework.core.TypedObject;
   
   public class GoalFilter extends TypedObject
   {
       
      
      public function GoalFilter(param1:Object)
      {
         super(param1);
      }
      
      public function get filterLocked() : Boolean
      {
         return getBoolean("fl");
      }
      
      public function get showGameCurrencyGoals() : Boolean
      {
         return getBoolean("scg");
      }
      
      public function get showPremiumGoals() : Boolean
      {
         return getBoolean("spg");
      }
      
      public function get showStatGoals() : Boolean
      {
         return getBoolean("ssg");
      }
      
      public function get showXPGoals() : Boolean
      {
         return getBoolean("sxg");
      }
      
      public function get showItemGoals() : Boolean
      {
         return getBoolean("sig");
      }
      
      public function get showEnergyGoals() : Boolean
      {
         return getBoolean("seg");
      }
      
      public function get showBoosterGoals() : Boolean
      {
         return getBoolean("sbg");
      }
   }
}
