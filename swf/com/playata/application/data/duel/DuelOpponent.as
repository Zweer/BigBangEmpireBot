package com.playata.application.data.duel
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.CharacterTooltipInformation;
   import com.playata.application.data.dataobject.DODuelOpponentEntry;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.avatar.ICharacterTooltipProvider;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.localization.LocText;
   
   public class DuelOpponent extends DODuelOpponentEntry implements ICharacterTooltipProvider
   {
       
      
      public function DuelOpponent(param1:DODuelOpponentEntry)
      {
         super(param1);
      }
      
      public function getCharacterTooltipInformation() : CharacterTooltipInformation
      {
         var _loc1_:* = null;
         var _loc3_:CharacterTooltipInformation = new CharacterTooltipInformation();
         _loc3_.totalStamina = getInt("stat_total_stamina");
         _loc3_.totalStrength = getInt("stat_total_strength");
         _loc3_.totalCriticalRating = getInt("stat_total_critical_rating");
         _loc3_.totalDodgeRating = getInt("stat_total_dodge_rating");
         _loc3_.avatarImageSettings = getString("avatar_image");
         var _loc2_:Object = {};
         if(hasData("battle_data") && getString("battle_data") != "" && getString("battle_data") != "[]")
         {
            _loc1_ = JsonUtil.decode(getString("battle_data"));
            if(_loc1_["effects"])
            {
               _loc2_ = _loc1_["effects"];
            }
         }
         _loc3_.battleEffectsData = _loc2_;
         return _loc3_;
      }
      
      override public function get name() : String
      {
         var _loc1_:String = super.name;
         if(_loc1_.indexOf("___") != -1)
         {
            return LocText.current.text("general/character_deleted");
         }
         if(!hasData("title") || getString("title") == "" || AppConfig.titlesEnabled != true)
         {
            return _loc1_;
         }
         _loc1_ = Titles.instance.getNameWithTitle(_loc1_,getString("title"),gender);
         return _loc1_;
      }
      
      public function get isDeleted() : Boolean
      {
         var _loc1_:String = super.name;
         return _loc1_.indexOf("___") != -1;
      }
      
      public function get isMale() : Boolean
      {
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return gender == "f";
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
