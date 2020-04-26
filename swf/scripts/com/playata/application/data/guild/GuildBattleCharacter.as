package com.playata.application.data.guild
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.BattleVisualizationCharacter;
   import com.playata.application.data.dataobject.DOBattleOpponent;
   
   public class GuildBattleCharacter extends BattleVisualizationCharacter
   {
       
      
      protected var _ownGuild:Boolean = false;
      
      public function GuildBattleCharacter(param1:Object, param2:int, param3:Boolean)
      {
         _ownGuild = param3;
         super(new DOBattleOpponent(param1));
         setInt("id",param2);
      }
      
      override public function get totalStats() : int
      {
         return getInt("stamina") + getInt("strength") + getInt("criticalrating") + getInt("dodgerating") + getInt("weapondamage");
      }
      
      public function get isOwnGuildMember() : Boolean
      {
         return _ownGuild;
      }
      
      public function get totalHitPoints() : int
      {
         if(!hasData("total_stamina"))
         {
            return hitPoints;
         }
         return GameUtil.getHitPoints(getInt("total_stamina"));
      }
      
      public function get hitPoints() : int
      {
         return GameUtil.getHitPoints(getInt("stamina"));
      }
      
      public function get battleEffects() : Object
      {
         if(!hasData("effects"))
         {
            return {};
         }
         return getData("effects");
      }
   }
}
