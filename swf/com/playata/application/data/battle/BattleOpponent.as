package com.playata.application.data.battle
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOBattleOpponent;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.framework.localization.LocText;
   
   public class BattleOpponent extends DOBattleOpponent
   {
       
      
      public function BattleOpponent(param1:DOBattleOpponent)
      {
         super(param1);
      }
      
      override public function get name() : String
      {
         return Character.getCleanName(super.name);
      }
      
      public function get nameWithTitle() : String
      {
         if(!hasData("title") || getString("title") == "" || AppConfig.titlesEnabled != true)
         {
            return name;
         }
         var _loc1_:String = getString("name");
         if(_loc1_.indexOf("___") != -1)
         {
            return LocText.current.text("general/character_deleted");
         }
         _loc1_ = Titles.instance.getNameWithTitle(_loc1_,getString("title"),gender);
         return _loc1_;
      }
      
      public function get isDeleted() : Boolean
      {
         var _loc1_:String = super.name;
         return _loc1_.indexOf("___") != -1;
      }
      
      public function get isMe() : Boolean
      {
         if(User.current == null || User.current.character == null)
         {
            return false;
         }
         return User.current.character.id == id;
      }
      
      public function get isMale() : Boolean
      {
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return gender == "f";
      }
      
      public function get totalStats() : int
      {
         return statTotalStamina + statTotalStrength + statTotalCriticalRating + statTotalDodgeRating + statWeaponDamage;
      }
      
      public function get isOnline() : Boolean
      {
         if(onlineStatus != 1)
         {
            return false;
         }
         return true;
      }
      
      public function get isMyGuildMember() : Boolean
      {
         if(id == User.current.character.id)
         {
            return false;
         }
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.getMember(name) !== null;
      }
   }
}
