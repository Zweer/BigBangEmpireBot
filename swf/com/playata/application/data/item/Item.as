package com.playata.application.data.item
{
   import com.playata.application.AppConfig;
   import com.playata.application.Application;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.BattleEffect;
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.battle.BattleSkills;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CItemEffect;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.constants.CStoryDungeon;
   import com.playata.application.data.dataobject.DOItem;
   import com.playata.application.data.marriage.Marriage;
   import com.playata.application.data.marriage.Marriages;
   import com.playata.application.data.outfit.Outfits;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.panels.PanelCharacter;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.localization.LocText;
   
   public class Item extends DOItem
   {
      
      public static const ITEM_EFFECT_SEPARATOR:String = "-effect-";
      
      private static var _storyDungeonItemIdentifers:Vector.<String> = null;
       
      
      private var _ownerGender:String;
      
      private var _addGenderSuffix:Boolean;
      
      private var _ownerName:String;
      
      public function Item(param1:Object = null, param2:String = null, param3:String = null)
      {
         super(param1);
         _ownerGender = param2 == null?Application.userController.appUser.character.gender:param2;
         _ownerName = param3;
         _addGenderSuffix = GameUtil.doesItemNeedGenderSuffix(identifier);
      }
      
      public static function isStoryDungeonItem(param1:String) : Boolean
      {
         var _loc6_:* = undefined;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(!_storyDungeonItemIdentifers)
         {
            _storyDungeonItemIdentifers = new Vector.<String>();
            _loc6_ = CStoryDungeon.ids;
            var _loc8_:int = 0;
            var _loc7_:* = _loc6_;
            for each(var _loc2_ in _loc6_)
            {
               _loc5_ = CStoryDungeon.fromId(_loc2_);
               _loc4_ = null;
               if(User.current.character.isMale)
               {
                  _loc4_ = _loc5_.rewardItemIdentifierMId;
               }
               else
               {
                  _loc4_ = _loc5_.rewardItemIdentifierFId;
               }
               if(CItemTemplate.exists(_loc4_))
               {
                  _loc3_ = CItemTemplate.fromId(_loc4_);
                  _storyDungeonItemIdentifers.push(_loc4_);
               }
            }
         }
         return _storyDungeonItemIdentifers.indexOf(param1) >= 0;
      }
      
      public static function get itemAssetPath() : String
      {
         return "items/";
      }
      
      public static function getHasAnimation(param1:String) : Boolean
      {
         return param1.indexOf("-effect-") > 0;
      }
      
      public static function getAnimation(param1:String) : CItemEffect
      {
         if(!getHasAnimation(param1))
         {
            return null;
         }
         return CItemEffect.fromId(param1.substring(param1.indexOf("-effect-") + "-effect-".length));
      }
      
      public static function getBaseIdentifier(param1:String) : String
      {
         if(!getHasAnimation(param1))
         {
            return param1;
         }
         return param1.substring(0,param1.indexOf("-effect-"));
      }
      
      public function get baseIdentifier() : String
      {
         if(Item.getHasAnimation(identifier))
         {
            return Item.getBaseIdentifier(identifier);
         }
         return identifier;
      }
      
      public function updateOwner(param1:String, param2:String) : void
      {
         _ownerGender = param1;
         _ownerName = param2;
      }
      
      public function get isUsable() : Boolean
      {
         return type == 11 || type == 13 || type == 15 || type == 14 || type == 12;
      }
      
      public function get isOwnItem() : Boolean
      {
         return characterId == User.current.character.id;
      }
      
      public function get isPremium() : Boolean
      {
         return getData("premium_item");
      }
      
      public function get isOutfitItem() : Boolean
      {
         return displayOptions == 7 || displayOptions == 8;
      }
      
      public function get itemSlotType() : int
      {
         var _loc1_:int = getInt("type");
         switch(int(_loc1_) - 1)
         {
            case 0:
               return 1;
            case 1:
               return 2;
            case 2:
               return 3;
            case 3:
               return 4;
            case 4:
               return 5;
            case 5:
               return 6;
            case 6:
               return 7;
            case 7:
               return 8;
            case 8:
               return 9;
            case 9:
               return 10;
         }
      }
      
      public function get plusItemlevel() : int
      {
         var _loc1_:int = tsAvailabilityStart;
         if(_loc1_ > 100)
         {
            return 0;
         }
         return _loc1_;
      }
      
      public function get name() : String
      {
         var _loc1_:* = null;
         var _loc3_:String = baseIdentifier;
         if(_loc3_.indexOf("surprise_box") != -1)
         {
            _loc3_ = _loc3_.substr(0,_loc3_.lastIndexOf("_"));
         }
         var _loc2_:String = LocText.current.text("item/" + _loc3_ + "/name");
         if(isMarriageRewardItem)
         {
            _loc1_ = Marriages.instance.getMarriageWithItemId(id);
            if(_loc1_)
            {
               _loc2_ = StringUtil.replace(_loc2_,"[NAME]",_loc1_.otherCharacterName);
               _loc2_ = StringUtil.replace(_loc2_,"[name]",_loc1_.otherCharacterName);
            }
            else
            {
               _loc2_ = StringUtil.replace(_loc2_,"[NAME]",LocText.current.text("general/character_deleted"));
               _loc2_ = StringUtil.replace(_loc2_,"[name]",LocText.current.text("general/character_deleted"));
            }
         }
         return _loc2_;
      }
      
      public function get isMarriageRewardItem() : Boolean
      {
         return identifier == "ring_wedding_ring";
      }
      
      public function get description() : String
      {
         if(type == 13)
         {
            return LocText.current.text("general/item_reskill_description");
         }
         if(type == 14)
         {
            return LocText.current.text("general/item_wedding_ring_description",CConstant.max_simultane_marriages);
         }
         if(type == 15)
         {
            return LocText.current.text("general/item_divorce_item_description");
         }
         var _loc1_:String = baseIdentifier;
         if(type == 12)
         {
            return LocText.current.text("title/shop_description",Titles.instance.getNameWithTitle(User.current.character.name,_loc1_));
         }
         if(_loc1_.indexOf("surprise_box") != -1)
         {
            _loc1_ = _loc1_.substr(0,_loc1_.lastIndexOf("_"));
         }
         return LocText.current.text("item/" + _loc1_ + "/description");
      }
      
      public function get qualityName() : String
      {
         var _loc1_:String = null;
         switch(int(quality) - 1)
         {
            case 0:
               _loc1_ = LocText.current.text("general/item_common");
               break;
            case 1:
               _loc1_ = LocText.current.text("general/item_rare");
               break;
            case 2:
               _loc1_ = LocText.current.text("general/item_epic");
         }
         return _loc1_;
      }
      
      public function get typeName() : String
      {
         var _loc1_:String = null;
         switch(int(type) - 1)
         {
            case 0:
               _loc1_ = LocText.current.text("general/item_head");
               break;
            case 1:
               _loc1_ = LocText.current.text("general/item_chest");
               break;
            case 2:
               _loc1_ = LocText.current.text("general/item_belt");
               break;
            case 3:
               _loc1_ = LocText.current.text("general/item_legs");
               break;
            case 4:
               _loc1_ = LocText.current.text("general/item_boots");
               break;
            case 5:
               _loc1_ = LocText.current.text("general/item_necklace");
               break;
            case 6:
               _loc1_ = LocText.current.text("general/item_ring");
               break;
            case 7:
               _loc1_ = LocText.current.text("general/item_gadget");
               break;
            case 8:
               _loc1_ = LocText.current.text("general/item_missiles");
               break;
            case 9:
               _loc1_ = LocText.current.text("general/item_piercing");
               break;
            case 10:
               _loc1_ = LocText.current.text("general/item_surprise_box");
               break;
            case 11:
               _loc1_ = LocText.current.text("general/item_shop_title");
               break;
            case 12:
               _loc1_ = LocText.current.text("general/item_reskill");
               break;
            case 13:
               _loc1_ = LocText.current.text("general/item_wedding_ring");
               break;
            case 14:
               _loc1_ = LocText.current.text("general/item_divorce_item");
         }
         return _loc1_;
      }
      
      public function get missileDamage() : int
      {
         var _loc2_:* = undefined;
         if(type != 9)
         {
            return 0;
         }
         var _loc4_:Number = CConstant.item_missile_damage_factor;
         var _loc1_:int = Math.round(itemLevel * _loc4_);
         if(isOwnItem)
         {
            _loc2_ = BattleSkills.instance.getSkillsFromBattleEffectData(User.current.character.battleEffectsData);
            var _loc6_:int = 0;
            var _loc5_:* = _loc2_;
            for each(var _loc3_ in _loc2_)
            {
               if(_loc3_.id == BattleEffect.getBattleSkillId(103))
               {
                  _loc1_ = Math.round(_loc1_ * (1 + _loc3_.value1 / 100));
               }
            }
         }
         return _loc1_;
      }
      
      public function get totalStats() : int
      {
         return statStamina + statStrength + statCriticalRating + statDodgeRating + statWeaponDamage + missileDamage;
      }
      
      public function getStatValue(param1:int) : int
      {
         switch(int(param1) - 1)
         {
            case 0:
               return statStamina;
            case 1:
               return statStrength;
            case 2:
               return statCriticalRating;
            case 3:
               return statDodgeRating;
            case 4:
               return statWeaponDamage;
            case 5:
               return missileDamage;
         }
      }
      
      public function getStatText(param1:int) : String
      {
         switch(int(param1) - 1)
         {
            case 0:
               return GameUtil.getStatString(param1,statStamina);
            case 1:
               return GameUtil.getStatString(param1,statStrength);
            case 2:
               return GameUtil.getStatString(param1,statCriticalRating);
            case 3:
               return GameUtil.getStatString(param1,statDodgeRating);
            case 4:
               return GameUtil.getStatString(param1,statWeaponDamage);
            case 5:
               return GameUtil.getStatString(param1,missileDamage);
         }
      }
      
      public function getStatDiffText(param1:int, param2:Item, param3:Boolean = false, param4:IntMap = null) : String
      {
         var _loc6_:int = 0;
         if(param4 && param4.exists(param1))
         {
            _loc6_ = param4.getData(param1);
         }
         var _loc5_:int = 0;
         if(param2)
         {
            switch(int(param1) - 1)
            {
               case 0:
                  _loc5_ = param2.statStamina;
                  break;
               case 1:
                  _loc5_ = param2.statStrength;
                  break;
               case 2:
                  _loc5_ = param2.statCriticalRating;
                  break;
               case 3:
                  _loc5_ = param2.statDodgeRating;
                  break;
               case 4:
                  _loc5_ = param2.statWeaponDamage;
                  break;
               case 5:
                  _loc5_ = param2.missileDamage;
            }
         }
         if(param3)
         {
            switch(int(param1) - 1)
            {
               case 0:
                  return LocText.current.formatHugeNumber(statStamina - _loc5_ + _loc6_,true);
               case 1:
                  return LocText.current.formatHugeNumber(statStrength - _loc5_ + _loc6_,true);
               case 2:
                  return LocText.current.formatHugeNumber(statCriticalRating - _loc5_ + _loc6_,true);
               case 3:
                  return LocText.current.formatHugeNumber(statDodgeRating - _loc5_ + _loc6_,true);
               case 4:
                  return LocText.current.formatHugeNumber(statWeaponDamage - _loc5_ + _loc6_,true);
               case 5:
                  return LocText.current.formatHugeNumber(missileDamage - _loc5_ + _loc6_,true);
            }
         }
         else
         {
            switch(int(param1) - 1)
            {
               case 0:
                  return LocText.current.formatHugeNumber(statStamina - _loc5_ + _loc6_,true) + " " + LocText.current.text("general/stat_stamina");
               case 1:
                  return LocText.current.formatHugeNumber(statStrength - _loc5_ + _loc6_,true) + " " + LocText.current.text("general/stat_strength");
               case 2:
                  return LocText.current.formatHugeNumber(statCriticalRating - _loc5_ + _loc6_,true) + " " + LocText.current.text("general/stat_critical_rating");
               case 3:
                  return LocText.current.formatHugeNumber(statDodgeRating - _loc5_ + _loc6_,true) + " " + LocText.current.text("general/stat_dodge_rating");
               case 4:
                  return LocText.current.formatHugeNumber(statWeaponDamage - _loc5_ + _loc6_,true) + " " + LocText.current.text("general/stat_weapon_damage");
               case 5:
                  return LocText.current.formatHugeNumber(missileDamage - _loc5_ + _loc6_,true) + " " + LocText.current.text("general/stat_missile_damage");
            }
         }
         return null;
      }
      
      public function get iconImageUrl() : String
      {
         var _loc2_:String = itemAssetPath;
         var _loc1_:String = baseIdentifier;
         if(_loc1_.indexOf("surprise_box") != -1)
         {
            _loc2_ = _loc2_ + ("sb" + _loc1_.substr(0,_loc1_.lastIndexOf("_")));
         }
         else if(_loc1_.indexOf("title") != -1)
         {
            _loc2_ = _loc2_ + ("ttl" + _loc1_);
         }
         else
         {
            _loc2_ = _loc2_ + baseIdentifier;
            if(_addGenderSuffix)
            {
               _loc2_ = _loc2_ + ("_" + _ownerGender);
            }
         }
         _loc2_ = _loc2_ + "_i";
         return ServerInfo.assetURL(_loc2_,"png");
      }
      
      public function get isSewPattern() : Boolean
      {
         return this.hasData("sewing_pattern");
      }
      
      public function get isItemPattern() : Boolean
      {
         return this.hasData("item_pattern");
      }
      
      public function getSewPrice(param1:Item) : int
      {
         if(hasAnimation)
         {
            return CConstant.sewing_machine_effect_item_premium_currency_amount;
         }
         return GameUtil.itemPatternSewPrice(quality,param1.sellPrice,getInt("sew_price"));
      }
      
      public function get itemSetIdentifier() : String
      {
         if(AppConfig.itemsetsEnabled != true)
         {
            return null;
         }
         if(type == 11 || type == 12)
         {
            return null;
         }
         return CItemTemplate.fromId(identifier).itemSetIdentifier;
      }
      
      public function get itemSet() : ItemSet
      {
         var _loc3_:* = null;
         if(AppConfig.itemsetsEnabled != true)
         {
            return null;
         }
         var _loc2_:String = itemSetIdentifier;
         if(!_loc2_)
         {
            return null;
         }
         var _loc1_:* = null;
         if(characterId != User.current.character.id)
         {
            if(ViewManager.instance.activePanelInstance is PanelCharacter)
            {
               if((ViewManager.instance.activePanelInstance as PanelCharacter).customCharacter)
               {
                  _loc3_ = (ViewManager.instance.activePanelInstance as PanelCharacter).customCharacter;
                  if(_loc3_.id == characterId)
                  {
                     _loc1_ = _loc3_;
                  }
               }
            }
         }
         return new ItemSet(_loc2_,_loc1_);
      }
      
      public function get isEventItem() : Boolean
      {
         if(CItemTemplate.exists(identifier))
         {
            return CItemTemplate.fromId(identifier).isEvent;
         }
         return false;
      }
      
      public function get itemPattern() : String
      {
         if(CItemTemplate.exists(identifier))
         {
            return CItemTemplate.fromId(identifier).itemPatternId;
         }
         return null;
      }
      
      public function get battleSkillData() : BattleSkill
      {
         if(!hasData("battle_skill") || !battleSkill || battleSkill == "")
         {
            return null;
         }
         return BattleSkill.fromJSON(battleSkill);
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get ownerIsMale() : Boolean
      {
         return _ownerGender == "m";
      }
      
      public function get hasAnimation() : Boolean
      {
         return Item.getHasAnimation(identifier);
      }
      
      public function get animationIconUrl() : String
      {
         if(!hasAnimation)
         {
            return "";
         }
         return ServerInfo.assetURL("item_effects/" + Item.getAnimation(identifier).identifier + "_i","png");
      }
      
      public function get animationName() : String
      {
         if(!hasAnimation)
         {
            return "";
         }
         return LocText.current.text("item_effect/" + Item.getAnimation(identifier).identifier + "/name");
      }
      
      public function get isItemUsedInOutfit() : Boolean
      {
         if(!isOwnItem)
         {
            return false;
         }
         var _loc1_:Outfits = User.current.character.outfits;
         if(!_loc1_)
         {
            return false;
         }
         return _loc1_.hasOutfitWithItem(this);
      }
   }
}
