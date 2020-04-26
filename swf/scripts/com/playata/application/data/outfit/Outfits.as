package com.playata.application.data.outfit
{
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOOutfit;
   import com.playata.application.data.inventory.Inventory;
   import com.playata.application.data.item.Item;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObjectArray;
   
   public class Outfits
   {
      
      public static var ITEM_TYPES:Array = [2,1,3,4,5,6,7,10,8];
       
      
      private var _outfits:Vector.<Outfit>;
      
      public function Outfits()
      {
         _outfits = new Vector.<Outfit>();
         super();
      }
      
      public function refreshOutfit(param1:DOOutfit) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _outfits;
         for each(var _loc2_ in _outfits)
         {
            if(_loc2_.id == param1.id)
            {
               _loc2_.update(param1);
               return;
            }
         }
         _loc2_ = new Outfit(param1);
         _outfits.push(_loc2_);
      }
      
      public function refreshOutfits(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshOutfit(_loc2_);
         }
         _outfits.sort(sortByIndex);
      }
      
      private function sortByIndex(param1:Outfit, param2:Outfit) : int
      {
         return param1.index - param2.index;
      }
      
      public function get outfits() : Vector.<Outfit>
      {
         return _outfits;
      }
      
      public function getOutfitWithSetting(param1:int) : Outfit
      {
         var _loc4_:int = 0;
         var _loc3_:* = _outfits;
         for each(var _loc2_ in _outfits)
         {
            if(_loc2_.hasSetting(param1))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function hasOutfitWithItem(param1:Item) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = _outfits;
         for each(var _loc2_ in _outfits)
         {
            if(_loc2_.hasItem(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function getOutfitsWithItem(param1:Item) : Vector.<Outfit>
      {
         var _loc3_:Vector.<Outfit> = new Vector.<Outfit>();
         var _loc5_:int = 0;
         var _loc4_:* = _outfits;
         for each(var _loc2_ in _outfits)
         {
            if(_loc2_.hasItem(param1))
            {
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_;
      }
      
      public function hasMissingItems() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = _outfits;
         for each(var _loc1_ in _outfits)
         {
            if(_loc1_.hasMissingItem())
            {
               return true;
            }
         }
         return false;
      }
      
      public function getCharacterStatsWithOutfit(param1:Character, param2:Outfit) : TypedObject
      {
         var _loc4_:* = null;
         if(!param1 || !param2)
         {
            return null;
         }
         var _loc7_:TypedObject = TypedObject.empty;
         var _loc8_:Inventory = param1.inventory;
         var _loc6_:TypedObject = TypedObject.empty;
         var _loc9_:String = null;
         var _loc11_:int = 0;
         var _loc10_:* = Outfits.ITEM_TYPES;
         for each(var _loc3_ in Outfits.ITEM_TYPES)
         {
            _loc9_ = getItemSlot(_loc3_);
            if(_loc9_)
            {
               _loc6_.setInt(_loc3_.toString(),_loc8_.getInt(_loc9_));
               if(param2.getItem(_loc3_))
               {
                  _loc8_.setInt(_loc9_,param2.getItem(_loc3_).id);
               }
               else
               {
                  _loc8_.setInt(_loc9_,0);
               }
            }
         }
         _loc7_.setInt("stat_total_strength",param1.statBaseStrength + param1.itemStrength + param1.boosterStrength + param1.guildBoosterStrength + param1.battleSkillStrength);
         _loc7_.setInt("stat_total_stamina",param1.statBaseStamina + param1.itemStamina + param1.boosterStamina + param1.guildBoosterStamina + param1.battleSkillStamina);
         _loc7_.setInt("stat_total_dodge_rating",param1.statBaseDodgeRating + param1.itemDodgeRating + param1.boosterDodgeRating + param1.guildBoosterDodgeRating + param1.battleSkillDodgeRating);
         _loc7_.setInt("stat_total_critical_rating",param1.statBaseCriticalRating + param1.itemCriticalRating + param1.boosterCriticalRating + param1.guildBoosterCriticalRating + param1.battleSkillCriticalRating);
         var _loc5_:Vector.<BattleSkill> = new Vector.<BattleSkill>();
         var _loc13_:int = 0;
         var _loc12_:* = Outfits.ITEM_TYPES;
         for each(_loc3_ in Outfits.ITEM_TYPES)
         {
            _loc4_ = param2.getItem(_loc3_);
            if(_loc4_ && _loc4_.battleSkillData && !_loc4_.battleSkillData.isBonusSkill && _loc4_.battleSkillData.identifier != "increase_stats")
            {
               _loc5_.push(_loc4_.battleSkillData);
            }
         }
         _loc7_.setData("battle_data",_loc5_);
         var _loc15_:int = 0;
         var _loc14_:* = Outfits.ITEM_TYPES;
         for each(_loc3_ in Outfits.ITEM_TYPES)
         {
            _loc9_ = getItemSlot(_loc3_);
            if(_loc9_)
            {
               _loc8_.setInt(_loc9_,_loc6_.getInt(_loc3_.toString()));
            }
         }
         return _loc7_;
      }
      
      private function getItemSlot(param1:int) : String
      {
         switch(int(param1) - 1)
         {
            case 0:
               return "head_item_id";
            case 1:
               return "chest_item_id";
            case 2:
               return "belt_item_id";
            case 3:
               return "legs_item_id";
            case 4:
               return "boots_item_id";
            case 5:
               return "necklace_item_id";
            case 6:
               return "ring_item_id";
            case 7:
               return "gadget_item_id";
            default:
               return null;
            case 9:
               return "piercing_item_id";
         }
      }
   }
}
