package com.playata.application.data.duel
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.battle.BattleOpponent;
   import com.playata.application.data.dataobject.DOBattleOpponent;
   import com.playata.application.data.dataobject.DOMissedDuel;
   import com.playata.application.data.reward.Reward;
   import com.playata.framework.data.DataObject;
   
   public class MissedDuel extends DOMissedDuel
   {
       
      
      protected var _opponent:BattleOpponent = null;
      
      private var _reward:Reward = null;
      
      public function MissedDuel(param1:DOMissedDuel)
      {
         super(param1);
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedShortFormattedTimestamp(tsCreation);
      }
      
      public function get isWon() : Boolean
      {
         return winner == "b";
      }
      
      public function refreshOpponent(param1:DOBattleOpponent) : BattleOpponent
      {
         _opponent = DataObject.createOrUpdate(BattleOpponent,_opponent,param1);
         return _opponent;
      }
      
      public function get opponent() : BattleOpponent
      {
         return _opponent;
      }
      
      public function get reward() : Reward
      {
         if(_reward == null)
         {
            _reward = new Reward(characterBRewards);
         }
         return _reward;
      }
   }
}
