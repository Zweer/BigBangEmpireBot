package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOWorkData extends DataObject
   {
       
      
      public function DOWorkData(param1:Object)
      {
         super(param1);
      }
      
      public function get offer() : String
      {
         return getString("offer");
      }
      
      public function get gameCurrencyReward() : int
      {
         return getInt("game_currency_reward");
      }
      
      public function get duration() : int
      {
         return getInt("duration");
      }
   }
}
