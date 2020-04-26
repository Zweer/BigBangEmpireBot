package com.playata.application.data.duel
{
   import com.playata.application.data.battle.Battle;
   import com.playata.application.data.battle.BattleVisualizationCharacter;
   import com.playata.application.data.bonus.BonusInfo;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOBattle;
   import com.playata.application.data.dataobject.DOCharacter;
   import com.playata.application.data.dataobject.DODuel;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.framework.data.DataObject;
   
   public class Duel extends DODuel
   {
       
      
      private var _battle:Battle = null;
      
      private var _reward:Reward = null;
      
      private var _opponent:Character = null;
      
      public function Duel(param1:DODuel)
      {
         super(param1);
      }
      
      public static function get maxDuelStamina() : int
      {
         var _loc1_:Number = User.current.character.maxDuelStamina;
         var _loc2_:Number = BonusInfo.getValue(2);
         if(_loc2_ > 0)
         {
            _loc1_ = _loc1_ * _loc2_;
         }
         return int(_loc1_);
      }
      
      public function refreshBattle(param1:DOBattle) : void
      {
         _battle = DataObject.createOrUpdate(Battle,_battle,param1);
      }
      
      public function refreshOpponent(param1:DOCharacter) : Character
      {
         _opponent = DataObject.createOrUpdate(Character,_opponent,param1);
         return _opponent;
      }
      
      public function get battle() : Battle
      {
         return _battle;
      }
      
      public function get isWon() : Boolean
      {
         return battle.winner == "a";
      }
      
      public function get characterReward() : Reward
      {
         if(_reward == null)
         {
            _reward = new Reward(characterARewards);
         }
         return _reward;
      }
      
      public function get selfCharacterActiveDuel() : BattleVisualizationCharacter
      {
         if(!battle.profileAAppearance || !battle.profileAAppearance.hasData("gender"))
         {
            return BattleVisualizationCharacter.fromCharacter(User.current.character);
         }
         return BattleVisualizationCharacter.fromMissedBattle(battle.profileA,battle.profileAAppearance);
      }
      
      public function get selfCharacter() : BattleVisualizationCharacter
      {
         if(!battle.profileBAppearance || !battle.profileBAppearance.hasData("gender"))
         {
            return BattleVisualizationCharacter.fromCharacter(User.current.character);
         }
         return BattleVisualizationCharacter.fromMissedBattle(battle.profileB,battle.profileBAppearance);
      }
      
      public function get opponentActiveDuel() : BattleVisualizationCharacter
      {
         if(!battle.profileBAppearance || !battle.profileBAppearance.hasData("gender"))
         {
            return BattleVisualizationCharacter.fromCharacter(opponent);
         }
         return BattleVisualizationCharacter.fromMissedBattle(battle.profileB,battle.profileBAppearance);
      }
      
      public function get missedOpponent() : BattleVisualizationCharacter
      {
         if(!battle.profileAAppearance || !battle.profileAAppearance.hasData("gender"))
         {
            return BattleVisualizationCharacter.fromCharacter(opponent);
         }
         return BattleVisualizationCharacter.fromMissedBattle(battle.profileA,battle.profileAAppearance);
      }
      
      public function get opponent() : Character
      {
         return _opponent;
      }
      
      public function set opponent(param1:Character) : void
      {
         _opponent = param1;
      }
      
      public function get characterStatus() : int
      {
         return characterAStatus;
      }
   }
}
