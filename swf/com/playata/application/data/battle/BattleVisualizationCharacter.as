package com.playata.application.data.battle
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CCharacterAppearance;
   import com.playata.application.data.dataobject.DOBattleOpponent;
   import com.playata.framework.core.TypedObject;
   
   public class BattleVisualizationCharacter extends BattleOpponent
   {
       
      
      public function BattleVisualizationCharacter(param1:DOBattleOpponent)
      {
         super(param1);
      }
      
      public static function fromCharacter(param1:Character) : BattleVisualizationCharacter
      {
         var _loc4_:DOBattleOpponent = new DOBattleOpponent({
            "name":param1.name,
            "title":param1.title,
            "gender":param1.gender,
            "level":param1.level,
            "stat_total_stamina":param1.statTotalStamina,
            "stat_total_strength":param1.statTotalStrength,
            "stat_total_critical_rating":param1.statTotalCriticalRating,
            "stat_total_dodge_rating":param1.statTotalDodgeRating,
            "stat_weapon_damage":param1.statWeaponDamage,
            "show_head_item":param1.isHeadItemShown,
            "show_chest_item":param1.isChestItemShown,
            "show_belt_item":param1.isBeltItemShown,
            "show_legs_item":param1.isLegsItemShown,
            "show_boots_item":param1.isBootsItemShown,
            "head":(param1.getItemByType(1) != null?param1.getItemByType(1).identifier:null),
            "belt":(param1.getItemByType(3) != null?param1.getItemByType(3).identifier:null),
            "boots":(param1.getItemByType(5) != null?param1.getItemByType(5).identifier:null),
            "chest":(param1.getItemByType(2) != null?param1.getItemByType(2).identifier:null),
            "legs":(param1.getItemByType(4) != null?param1.getItemByType(4).identifier:null),
            "missiles":(param1.getItemByType(9) != null?param1.getItemByType(9).identifier:null),
            "avatar_image":param1.avatarImage
         });
         var _loc2_:CCharacterAppearance = CCharacterAppearance.fromId(param1.gender);
         var _loc7_:int = 0;
         var _loc6_:* = _loc2_.constantKeys;
         for each(var _loc3_ in _loc2_.constantKeys)
         {
            if(!(_loc3_ == "hair_back" || _loc3_ == "hair_middle" || _loc3_.indexOf("_change_cost_coins") > 0 || _loc3_.indexOf("_change_cost_premium") > 0 || _loc3_.indexOf("_change_required_level") > 0 || _loc3_.indexOf("photo") == 0 || _loc3_.indexOf("_style") > 0))
            {
               if(param1.hasData("appearance_" + _loc3_) || param1.hasData(_loc3_))
               {
                  if(param1.hasData("appearance_" + _loc3_))
                  {
                     _loc4_.setInt(_loc3_,param1.getInt("appearance_" + _loc3_));
                  }
                  else
                  {
                     _loc4_.setInt(_loc3_,param1.getInt(_loc3_));
                  }
               }
               else if(_loc3_ == "panties_type" || _loc3_ == "bra_type")
               {
                  _loc4_.setInt(_loc3_,_loc2_.getIntVector(_loc3_)[1]);
               }
               else
               {
                  _loc4_.setInt(_loc3_,_loc2_.getIntVector(_loc3_)[0]);
               }
            }
         }
         var _loc5_:BattleVisualizationCharacter = new BattleVisualizationCharacter(_loc4_);
         return _loc5_;
      }
      
      public static function fromMissedBattle(param1:TypedObject, param2:TypedObject) : BattleVisualizationCharacter
      {
         var _loc5_:DOBattleOpponent = new DOBattleOpponent({
            "name":param2.getString("name"),
            "title":param2.getString("title"),
            "gender":param2.getString("gender"),
            "level":param1.getInt("level"),
            "stat_total_stamina":param1.getInt("stamina"),
            "stat_total_strength":param1.getInt("strength"),
            "stat_total_critical_rating":param1.getInt("criticalrating"),
            "stat_total_dodge_rating":param1.getInt("dodgerating"),
            "stat_weapon_damage":param1.getInt("weapondamage"),
            "show_head_item":(!!param2.hasData("show_head_item")?param2.getBoolean("show_head_item"):null),
            "show_chest_item":(!!param2.hasData("show_chest_item")?param2.getBoolean("show_chest_item"):null),
            "show_belt_item":(!!param2.hasData("show_belt_item")?param2.getBoolean("show_belt_item"):null),
            "show_legs_item":(!!param2.hasData("show_legs_item")?param2.getBoolean("show_legs_item"):null),
            "show_boots_item":(!!param2.hasData("show_boots_item")?param2.getBoolean("show_boots_item"):null),
            "head":(!!param2.hasData("head")?param2.getData("head"):null),
            "belt":(!!param2.hasData("belt")?param2.getData("belt"):null),
            "boots":(!!param2.hasData("boots")?param2.getData("boots"):null),
            "chest":(!!param2.hasData("chest")?param2.getData("chest"):null),
            "legs":(!!param2.hasData("legs")?param2.getData("legs"):null),
            "missiles":(!!param2.hasData("missiles")?param2.getData("missiles"):null),
            "avatar_image":(!!param2.hasData("avatar_image")?param2.getData("avatar_image"):null)
         });
         var _loc3_:CCharacterAppearance = CCharacterAppearance.fromId(param2.getString("gender"));
         var _loc8_:int = 0;
         var _loc7_:* = _loc3_.constantKeys;
         for each(var _loc4_ in _loc3_.constantKeys)
         {
            if(!(_loc4_ == "hair_back" || _loc4_ == "hair_middle" || _loc4_.indexOf("_change_cost_coins") > 0 || _loc4_.indexOf("_change_cost_premium") > 0 || _loc4_.indexOf("_change_required_level") > 0 || _loc4_.indexOf("photo") == 0 || _loc4_.indexOf("_style") > 0))
            {
               if(param2.hasData("appearance_" + _loc4_) || param2.hasData(_loc4_))
               {
                  if(param2.hasData("appearance_" + _loc4_))
                  {
                     _loc5_.setInt(_loc4_,param2.getInt("appearance_" + _loc4_));
                  }
                  else
                  {
                     _loc5_.setInt(_loc4_,param2.getInt(_loc4_));
                  }
               }
               else if(_loc3_.getIntVector(_loc4_).length > 0)
               {
                  if(_loc4_ == "panties_type" || _loc4_ == "bra_type")
                  {
                     _loc5_.setInt(_loc4_,_loc3_.getData(_loc4_)[1]);
                  }
                  else
                  {
                     _loc5_.setInt(_loc4_,_loc3_.getData(_loc4_)[0]);
                  }
               }
            }
         }
         var _loc6_:BattleVisualizationCharacter = new BattleVisualizationCharacter(_loc5_);
         return _loc6_;
      }
      
      public function get appearanceSettings() : AppearanceSettings
      {
         var _loc3_:TypedObject = new TypedObject({"gender":gender});
         var _loc1_:CCharacterAppearance = CCharacterAppearance.fromId(gender);
         var _loc5_:int = 0;
         var _loc4_:* = _loc1_.constantKeys;
         for each(var _loc2_ in _loc1_.constantKeys)
         {
            if(!(_loc2_ == "hair_back" || _loc2_ == "hair_middle" || _loc2_.indexOf("_change_cost_") > 0 || _loc2_.indexOf("photo") == 0 || _loc2_.indexOf("_change_required_level") > 0 || _loc2_.indexOf("_style") > 0))
            {
               if(hasData("appearance_" + _loc2_))
               {
                  _loc3_.setInt(_loc2_,getInt("appearance_" + _loc2_));
               }
               else if(hasData(_loc2_))
               {
                  _loc3_.setInt(_loc2_,getInt(_loc2_));
               }
               else if(_loc1_.getIntVector(_loc2_).length > 0)
               {
                  if(_loc2_ == "panties_type" || _loc2_ == "bra_type")
                  {
                     _loc3_.setInt(_loc2_,_loc1_.getIntVector(_loc2_)[1]);
                  }
                  else
                  {
                     _loc3_.setInt(_loc2_,_loc1_.getIntVector(_loc2_)[0]);
                  }
               }
            }
         }
         _loc3_.setBoolean("show_head_item",!!hasData("show_head_item")?getBoolean("show_head_item"):true);
         _loc3_.setBoolean("show_chest_item",!!hasData("show_chest_item")?getBoolean("show_chest_item"):true);
         _loc3_.setBoolean("show_belt_item",!!hasData("show_belt_item")?getBoolean("show_belt_item"):true);
         _loc3_.setBoolean("show_legs_item",!!hasData("show_legs_item")?getBoolean("show_legs_item"):true);
         _loc3_.setBoolean("show_boots_item",!!hasData("show_boots_item")?getBoolean("show_boots_item"):true);
         _loc3_.setData("head",!!hasData("head")?getData("head"):null);
         _loc3_.setData("belt",!!hasData("belt")?getData("belt"):null);
         _loc3_.setData("boots",!!hasData("boots")?getData("boots"):null);
         _loc3_.setData("chest",!!hasData("chest")?getData("chest"):null);
         _loc3_.setData("legs",!!hasData("legs")?getData("legs"):null);
         _loc3_.setData("missiles",!!hasData("missiles")?getData("missiles"):null);
         return new AppearanceSettings(_loc3_);
      }
   }
}
