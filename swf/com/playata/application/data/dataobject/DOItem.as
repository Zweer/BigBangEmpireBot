package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOItem extends DataObject
   {
       
      
      public function DOItem(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get quality() : int
      {
         return getInt("quality");
      }
      
      public function get requiredLevel() : int
      {
         return getInt("required_level");
      }
      
      public function get charges() : int
      {
         return getInt("charges");
      }
      
      public function get itemLevel() : int
      {
         return getInt("item_level");
      }
      
      public function get tsAvailabilityStart() : int
      {
         return getInt("ts_availability_start");
      }
      
      public function get tsAvailabilityEnd() : int
      {
         return getInt("ts_availability_end");
      }
      
      public function get premiumItem() : Boolean
      {
         return getBoolean("premium_item");
      }
      
      public function get buyPrice() : int
      {
         return getInt("buy_price");
      }
      
      public function get sellPrice() : int
      {
         return getInt("sell_price");
      }
      
      public function get statStamina() : int
      {
         return getInt("stat_stamina");
      }
      
      public function get statStrength() : int
      {
         return getInt("stat_strength");
      }
      
      public function get statCriticalRating() : int
      {
         return getInt("stat_critical_rating");
      }
      
      public function get statDodgeRating() : int
      {
         return getInt("stat_dodge_rating");
      }
      
      public function get statWeaponDamage() : int
      {
         return getInt("stat_weapon_damage");
      }
      
      public function get displayOptions() : int
      {
         return getInt("display_options");
      }
      
      public function get battleSkill() : String
      {
         return getString("battle_skill");
      }
   }
}
