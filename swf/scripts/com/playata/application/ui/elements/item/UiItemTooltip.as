package com.playata.application.ui.elements.item
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.StatTypes;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item.ItemSet;
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.battle.UiBattleSkill;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.sewing_machine.UiSewingMachinContent;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.item.SymbolItemTooltipGeneric;
   import visuals.ui.elements.item.SymbolItemTooltipStatGeneric;
   
   public class UiItemTooltip extends UiClosableTooltip
   {
      
      private static var _compareItem:Item = null;
      
      private static var _compareOutfit:Outfit = null;
      
      protected static var _tooltipContent:SymbolItemTooltipGeneric = null;
      
      protected static var _setInfo:UiItemTooltipSetInfo = null;
      
      protected static var _battleSkill:UiBattleSkill;
      
      protected static var _currentItem:Item = null;
       
      
      protected var _item:Item = null;
      
      protected var _itemGraphic:UiItemGraphic = null;
      
      public function UiItemTooltip(param1:UiItemGraphic, param2:Item)
      {
         _itemGraphic = param1;
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolItemTooltipGeneric();
            _tooltipContent.txtItemName.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _setInfo = new UiItemTooltipSetInfo(_tooltipContent.setInfo);
            _battleSkill = new UiBattleSkill(_tooltipContent.battleSkill,3);
            _tooltipContent.stat1.txtStat.autoFontSize = true;
            _tooltipContent.stat2.txtStat.autoFontSize = false;
            _tooltipContent.stat3.txtStat.autoFontSize = false;
            _tooltipContent.stat4.txtStat.autoFontSize = false;
            _tooltipContent.stat5.txtStat.autoFontSize = false;
         }
         _tooltipContent.visible = false;
         super(new InteractiveDisplayObject(param1.itemSlot.container),_tooltipContent);
         this.item = param2;
      }
      
      public static function get compareItem() : Item
      {
         return _compareItem;
      }
      
      public static function set compareItem(param1:Item) : void
      {
         _compareItem = param1;
      }
      
      public static function get compareOutfit() : Outfit
      {
         return _compareOutfit;
      }
      
      public static function set compareOutfit(param1:Outfit) : void
      {
         _compareOutfit = param1;
      }
      
      override public function get height() : Number
      {
         if(!_tooltipContent)
         {
            return super.height;
         }
         return _tooltipContent.background.height * _tooltipContent.scale;
      }
      
      public function set item(param1:Item) : void
      {
         _item = param1;
      }
      
      override public function onAssigned() : void
      {
         if(_currentItem == _item)
         {
            return;
         }
         _currentItem = _item;
         if(_item == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         refresh();
      }
      
      public function refresh() : void
      {
         var _loc1_:int = LocText.current.gender;
         LocText.current.gender = !!_item.ownerIsMale?1:2;
         _tooltipContent.txtItemName.text = _item.name;
         _tooltipContent.txtItemCategory.text = _item.typeName;
         _tooltipContent.txtItemQualityCommon.text = _item.qualityName;
         _tooltipContent.txtItemQualityCommon.visible = _item.quality == 1;
         _tooltipContent.txtItemQualityRare.text = _item.qualityName;
         _tooltipContent.txtItemQualityRare.visible = _item.quality == 2;
         _tooltipContent.txtItemQualityEpic.text = _item.qualityName;
         _tooltipContent.txtItemQualityEpic.visible = _item.quality == 3;
         if(_item.isSewPattern)
         {
            refreshSewPattern();
         }
         else if(_item.isItemPattern)
         {
            refreshItemPattern();
         }
         else
         {
            refreshItem();
         }
         _tooltipContent.txtStatsCaption.text = LocText.current.text("general/item_attributes_caption","");
         _tooltipContent.txtOutfitsCaption.text = LocText.current.text("general/item_outfits_caption");
         LocText.current.gender = _loc1_;
      }
      
      private function refreshSewPattern() : void
      {
         var _loc1_:int = _tooltipContent.txtItemName.y + _tooltipContent.txtItemName.height + 5;
         var _loc2_:* = _item != null && _item.hasAnimation;
         _tooltipContent.iconItemEffect.visible = _loc2_;
         _tooltipContent.txtItemEffectName.visible = _loc2_;
         if(_tooltipContent.iconItemEffect.visible)
         {
            _tooltipContent.iconItemEffect.setUriSprite(_item.animationIconUrl,30,30,false,-1);
            _tooltipContent.txtItemEffectName.text = _item.animationName;
            _tooltipContent.iconItemEffect.y = _loc1_;
            _tooltipContent.txtItemEffectName.y = _tooltipContent.iconItemEffect.y + 3;
            _loc1_ = _tooltipContent.iconItemEffect.y + 30 + 5;
         }
         _tooltipContent.txtPriceCaption.y = _loc1_;
         _tooltipContent.iconCoins.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 2;
         _tooltipContent.iconPremiumCurrency.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 2;
         _tooltipContent.txtPrice.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height;
         _tooltipContent.iconCoins.visible = _item.quality == 1;
         _tooltipContent.iconPremiumCurrency.visible = _item.quality != 1;
         _tooltipContent.txtPrice.visible = true;
         _tooltipContent.txtPriceCaption.visible = true;
         _tooltipContent.txtPrice.text = LocText.current.formatHugeNumber(_item.getSewPrice(UiSewingMachinContent.sourceItem));
         _tooltipContent.txtPriceCaption.text = LocText.current.text("general/item_price_sew_caption");
         _tooltipContent.background.height = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height + 40;
         _tooltipContent.txtCompare1.visible = false;
         _tooltipContent.txtCompare2.visible = false;
         _tooltipContent.txtCompare3.visible = false;
         _tooltipContent.txtCompare4.visible = false;
         _tooltipContent.txtCompare5.visible = false;
         _tooltipContent.txtCompare6.visible = false;
         _tooltipContent.txtCompareCaption.visible = false;
         _tooltipContent.txtCompareValue.visible = false;
         _tooltipContent.txtItemCategory.visible = false;
         _tooltipContent.txtItemQualityCommon.visible = false;
         _tooltipContent.txtItemQualityEpic.visible = false;
         _tooltipContent.txtItemQualityRare.visible = false;
         _tooltipContent.txtStatsCaption.visible = false;
         _tooltipContent.stat1.visible = false;
         _tooltipContent.stat2.visible = false;
         _tooltipContent.stat3.visible = false;
         _tooltipContent.stat4.visible = false;
         _tooltipContent.stat5.visible = false;
         _tooltipContent.stat6.visible = false;
         _tooltipContent.txtDescription.visible = false;
         _tooltipContent.setInfo.visible = false;
         _tooltipContent.txtItemPatternInfo.visible = false;
         _tooltipContent.iconItemPatternInfo.visible = false;
         _tooltipContent.txtOutfitsCaption.visible = false;
         _tooltipContent.txtOutfits.visible = false;
         _tooltipContent.txtOutfit.visible = false;
         _tooltipContent.iconOutfit.visible = false;
         _battleSkill.skill = null;
         _tooltipContent.visible = true;
         placeCloseButton(_tooltipContent.background);
      }
      
      private function refreshItemPattern() : void
      {
         var _loc1_:int = _tooltipContent.txtItemName.y + _tooltipContent.txtItemName.height + 5;
         var _loc2_:* = _item != null && _item.hasAnimation;
         _tooltipContent.iconItemEffect.visible = _loc2_;
         _tooltipContent.txtItemEffectName.visible = _loc2_;
         if(_tooltipContent.iconItemEffect.visible)
         {
            _tooltipContent.iconItemEffect.setUriSprite(_item.animationIconUrl,30,30,false,-1);
            _tooltipContent.txtItemEffectName.text = _item.animationName;
            _tooltipContent.iconItemEffect.y = _loc1_;
            _tooltipContent.txtItemEffectName.y = _tooltipContent.iconItemEffect.y + 3;
            _loc1_ = _tooltipContent.iconItemEffect.y + 30 + 5;
         }
         _tooltipContent.txtItemPatternInfo.visible = true;
         _tooltipContent.txtItemPatternInfo.y = _loc1_;
         _tooltipContent.txtItemPatternInfo.x = 20;
         _tooltipContent.txtItemPatternInfo.width = 185;
         if(ItemPatterns.instance.itemPattern(_item.itemPattern).isItemCollected(_item.identifier))
         {
            _tooltipContent.txtItemPatternInfo.text = LocText.current.text("item_pattern/is_collected");
         }
         else if(_item.requiredLevel > User.current.character.level)
         {
            _tooltipContent.txtItemPatternInfo.text = LocText.current.text("item_pattern/item_required_level",_item.requiredLevel);
         }
         else
         {
            _tooltipContent.txtItemPatternInfo.htmlText = ItemPatterns.instance.itemPattern(_item.itemPattern).itemSourceInfo(_item.identifier);
         }
         _tooltipContent.txtItemPatternInfo.height = _tooltipContent.txtItemPatternInfo.textHeight + 5;
         _tooltipContent.background.height = _tooltipContent.txtItemPatternInfo.y + _tooltipContent.txtItemPatternInfo.height + 25;
         _tooltipContent.txtPriceCaption.visible = false;
         _tooltipContent.iconCoins.visible = false;
         _tooltipContent.iconPremiumCurrency.visible = false;
         _tooltipContent.txtPrice.visible = false;
         _tooltipContent.txtCompare1.visible = false;
         _tooltipContent.txtCompare2.visible = false;
         _tooltipContent.txtCompare3.visible = false;
         _tooltipContent.txtCompare4.visible = false;
         _tooltipContent.txtCompare5.visible = false;
         _tooltipContent.txtCompare6.visible = false;
         _tooltipContent.txtCompareCaption.visible = false;
         _tooltipContent.txtCompareValue.visible = false;
         _tooltipContent.txtItemCategory.visible = false;
         _tooltipContent.txtItemQualityCommon.visible = false;
         _tooltipContent.txtItemQualityEpic.visible = false;
         _tooltipContent.txtItemQualityRare.visible = false;
         _tooltipContent.txtStatsCaption.visible = false;
         _tooltipContent.stat1.visible = false;
         _tooltipContent.stat2.visible = false;
         _tooltipContent.stat3.visible = false;
         _tooltipContent.stat4.visible = false;
         _tooltipContent.stat5.visible = false;
         _tooltipContent.stat6.visible = false;
         _tooltipContent.setInfo.visible = false;
         _tooltipContent.txtDescription.visible = false;
         _tooltipContent.iconItemPatternInfo.visible = false;
         _tooltipContent.txtOutfitsCaption.visible = false;
         _tooltipContent.txtOutfits.visible = false;
         _tooltipContent.txtOutfit.visible = false;
         _tooltipContent.iconOutfit.visible = false;
         _battleSkill.skill = null;
         _tooltipContent.visible = true;
         placeCloseButton(_tooltipContent.background);
      }
      
      private function refreshItem() : void
      {
         var _loc1_:* = null;
         var _loc7_:* = null;
         var _loc10_:* = null;
         _tooltipContent.txtCompare1.visible = true;
         _tooltipContent.txtCompare2.visible = true;
         _tooltipContent.txtCompare3.visible = true;
         _tooltipContent.txtCompare4.visible = true;
         _tooltipContent.txtCompare5.visible = true;
         _tooltipContent.txtCompare6.visible = true;
         _tooltipContent.txtCompareCaption.visible = true;
         _tooltipContent.txtCompareValue.visible = true;
         _tooltipContent.txtItemCategory.visible = true;
         _tooltipContent.txtItemQualityCommon.visible = _item.quality == 1;
         _tooltipContent.txtItemQualityRare.visible = _item.quality == 2;
         _tooltipContent.txtItemQualityEpic.visible = _item.quality == 3;
         _tooltipContent.txtStatsCaption.visible = _item.type != 11 && _item.type != 12 && _item.type != 13 && _item.type != 14 && _item.type != 15;
         _tooltipContent.stat1.visible = true;
         _tooltipContent.stat2.visible = true;
         _tooltipContent.stat3.visible = true;
         _tooltipContent.stat4.visible = true;
         _tooltipContent.stat5.visible = true;
         _tooltipContent.stat6.visible = true;
         _tooltipContent.txtDescription.visible = false;
         _tooltipContent.setInfo.visible = false;
         _tooltipContent.txtItemPatternInfo.visible = false;
         _tooltipContent.txtItemPatternInfo.x = 47;
         _tooltipContent.iconItemPatternInfo.visible = false;
         _tooltipContent.txtItemEffectName.visible = false;
         _tooltipContent.iconItemEffect.visible = false;
         _tooltipContent.txtOutfitsCaption.visible = false;
         _tooltipContent.txtOutfits.visible = false;
         if(_item.isUsable)
         {
            if(_item.requiredLevel > User.current.character.level)
            {
               _tooltipContent.txtDescription.visible = true;
               _tooltipContent.txtDescription.text = LocText.current.text("general/item_required_level",_item.requiredLevel);
               _tooltipContent.txtDescription.textColor = 16711680;
            }
            else if(_itemGraphic.itemSlot.isBagSlotType)
            {
               _tooltipContent.txtDescription.visible = true;
               _loc1_ = "";
               switch(int(_item.type) - 11)
               {
                  case 0:
                     _loc1_ = LocText.current.text("general/use_item_surprise_box");
                     break;
                  case 1:
                     _loc1_ = LocText.current.text("general/use_item_shop_title");
                     break;
                  case 2:
                     _loc1_ = LocText.current.text("general/use_item_reskill");
                     break;
                  case 3:
                     _loc1_ = LocText.current.text("general/use_item_wedding_ring");
                     break;
                  case 4:
                     _loc1_ = LocText.current.text("general/use_item_divorce_item");
               }
               _tooltipContent.txtDescription.text = _item.description + "\n\n" + _loc1_;
               _tooltipContent.txtDescription.textColor = 4183831;
            }
            else
            {
               _tooltipContent.txtDescription.visible = true;
               _tooltipContent.txtDescription.text = _item.description;
               _tooltipContent.txtDescription.textColor = 4183831;
            }
         }
         else if(_item.type == 9 && _itemGraphic.itemSlot.isBagSlotType)
         {
            if(CConstant.item_missile_min_required_level > User.current.character.level)
            {
               _tooltipContent.txtDescription.visible = true;
               _tooltipContent.txtDescription.text = LocText.current.text("general/item_required_level",CConstant.item_missile_min_required_level);
               _tooltipContent.txtDescription.textColor = 16711680;
            }
         }
         var _loc6_:StatTypes = new StatTypes();
         if(_item.statStrength > 0)
         {
            _loc6_.addStatType(2);
         }
         if(_item.statStamina > 0)
         {
            _loc6_.addStatType(1);
         }
         if(_item.statCriticalRating > 0)
         {
            _loc6_.addStatType(3);
         }
         if(_item.statDodgeRating > 0)
         {
            _loc6_.addStatType(4);
         }
         if(_item.statWeaponDamage > 0)
         {
            _loc6_.addStatType(5);
         }
         if(_item.missileDamage > 0)
         {
            _loc6_.addStatType(6);
         }
         _tooltipContent.txtItemCategory.y = _tooltipContent.txtItemName.y + _tooltipContent.txtItemName.height + 5;
         _tooltipContent.txtItemQualityCommon.y = _tooltipContent.txtItemCategory.y;
         _tooltipContent.txtItemQualityRare.y = _tooltipContent.txtItemCategory.y;
         _tooltipContent.txtItemQualityEpic.y = _tooltipContent.txtItemCategory.y;
         _tooltipContent.txtStatsCaption.y = _tooltipContent.txtItemCategory.y + _tooltipContent.txtItemCategory.height + 3;
         _tooltipContent.stat1.y = _tooltipContent.txtStatsCaption.y + _tooltipContent.txtStatsCaption.height + 12;
         _tooltipContent.stat2.y = _tooltipContent.stat1.y + _tooltipContent.stat1.height;
         _tooltipContent.stat3.y = _tooltipContent.stat2.y + _tooltipContent.stat2.height;
         _tooltipContent.stat4.y = _tooltipContent.stat3.y + _tooltipContent.stat3.height;
         _tooltipContent.stat5.y = _tooltipContent.stat4.y + _tooltipContent.stat4.height;
         _tooltipContent.stat6.y = _tooltipContent.stat5.y + _tooltipContent.stat5.height;
         _tooltipContent.stat2.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat3.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat4.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat5.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat6.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat1.visible = _loc6_.statCount > 0;
         _tooltipContent.stat2.visible = _loc6_.statCount > 1;
         _tooltipContent.stat3.visible = _loc6_.statCount > 2;
         _tooltipContent.stat4.visible = _loc6_.statCount > 3;
         _tooltipContent.stat5.visible = _loc6_.statCount > 4;
         _tooltipContent.stat6.visible = _loc6_.statCount > 5;
         if(_loc6_.statCount > 0)
         {
            _tooltipContent.stat1.txtStat.text = _item.getStatText(_loc6_.getStatType(0));
         }
         if(_loc6_.statCount > 1)
         {
            _tooltipContent.stat2.txtStat.text = _item.getStatText(_loc6_.getStatType(1));
         }
         if(_loc6_.statCount > 2)
         {
            _tooltipContent.stat3.txtStat.text = _item.getStatText(_loc6_.getStatType(2));
         }
         if(_loc6_.statCount > 3)
         {
            _tooltipContent.stat4.txtStat.text = _item.getStatText(_loc6_.getStatType(3));
         }
         if(_loc6_.statCount > 4)
         {
            _tooltipContent.stat5.txtStat.text = _item.getStatText(_loc6_.getStatType(4));
         }
         if(_loc6_.statCount > 5)
         {
            _tooltipContent.stat6.txtStat.text = _item.getStatText(_loc6_.getStatType(5));
         }
         if(_loc6_.statCount > 0)
         {
            setStatIcon(_tooltipContent.stat1,_loc6_.getStatType(0));
         }
         if(_loc6_.statCount > 1)
         {
            setStatIcon(_tooltipContent.stat2,_loc6_.getStatType(1));
         }
         if(_loc6_.statCount > 2)
         {
            setStatIcon(_tooltipContent.stat3,_loc6_.getStatType(2));
         }
         if(_loc6_.statCount > 3)
         {
            setStatIcon(_tooltipContent.stat4,_loc6_.getStatType(3));
         }
         if(_loc6_.statCount > 4)
         {
            setStatIcon(_tooltipContent.stat5,_loc6_.getStatType(4));
         }
         if(_loc6_.statCount > 5)
         {
            setStatIcon(_tooltipContent.stat6,_loc6_.getStatType(5));
         }
         _tooltipContent.txtCompareCaption.y = _tooltipContent.txtStatsCaption.y;
         _tooltipContent.txtCompare1.y = _tooltipContent.stat1.y - 9;
         _tooltipContent.txtCompare2.y = _tooltipContent.stat2.y - 9;
         _tooltipContent.txtCompare3.y = _tooltipContent.stat3.y - 9;
         _tooltipContent.txtCompare4.y = _tooltipContent.stat4.y - 9;
         _tooltipContent.txtCompare5.y = _tooltipContent.stat5.y - 9;
         _tooltipContent.txtCompare6.y = _tooltipContent.stat6.y - 9;
         var _loc4_:* = false;
         if(UiItemTooltip.compareOutfit != null)
         {
            _loc4_ = UiItemTooltip.compareOutfit.getItem(_item.type) == _item;
         }
         else
         {
            _loc4_ = Boolean(User.current.character.isItemEquipped(_item));
         }
         var _loc3_:int = _loc6_.statCount;
         if(!_item.isUsable && _item.isOwnItem && !_loc4_)
         {
            try
            {
               _loc3_ = refreshCompareItem(_loc6_);
            }
            catch(e:Error)
            {
               _tooltipContent.txtCompareCaption.visible = false;
               _tooltipContent.txtCompareCaption.text = "";
               _tooltipContent.txtCompareValue.visible = false;
               _tooltipContent.txtCompareValue.text = "";
               _tooltipContent.txtCompare1.visible = false;
               _tooltipContent.txtCompare2.visible = false;
               _tooltipContent.txtCompare3.visible = false;
               _tooltipContent.txtCompare4.visible = false;
               _tooltipContent.txtCompare5.visible = false;
               _tooltipContent.txtCompare6.visible = false;
            }
            if(User.current.character.level >= CConstant.sewing_machine_req_level && (_itemGraphic.itemSlot.itemSlotType == 0 || _itemGraphic.itemSlot.itemSlotType == 99) && _item.itemPattern)
            {
               _loc7_ = ItemPatterns.instance.itemPattern(_item.itemPattern);
               if(_loc7_ && !_loc7_.isItemCollected(_item.identifier))
               {
                  _tooltipContent.txtItemPatternInfo.visible = true;
                  _tooltipContent.iconItemPatternInfo.visible = true;
                  _tooltipContent.txtItemPatternInfo.text = _loc7_.getItemInfo(User.current.character.gender);
               }
            }
         }
         else
         {
            _tooltipContent.txtCompareCaption.visible = false;
            _tooltipContent.txtCompareCaption.text = "";
            _tooltipContent.txtCompareValue.visible = false;
            _tooltipContent.txtCompareValue.text = "";
            _tooltipContent.txtCompare1.visible = false;
            _tooltipContent.txtCompare2.visible = false;
            _tooltipContent.txtCompare3.visible = false;
            _tooltipContent.txtCompare4.visible = false;
            _tooltipContent.txtCompare5.visible = false;
            _tooltipContent.txtCompare6.visible = false;
         }
         var _loc8_:* = 8;
         if(_tooltipContent.txtCompareValue.visible)
         {
            _loc8_ = Number(_tooltipContent.txtCompareValue.height);
            _tooltipContent.txtCompareValue.y = _tooltipContent.txtStatsCaption.y + 15 + _loc3_ * (_tooltipContent.stat1.height + 1);
         }
         var _loc2_:Number = _tooltipContent.txtStatsCaption.height + _loc3_ * (_tooltipContent.stat1.height + 1);
         _loc2_ = _loc2_ + (_tooltipContent.txtStatsCaption.y + _loc8_);
         var _loc9_:Number = _tooltipContent.txtStatsCaption.y + _loc8_ + _tooltipContent.txtStatsCaption.height + _loc3_ * (_tooltipContent.stat1.height + 1);
         if(_item.isUsable)
         {
            _loc9_ = _loc9_ - 30;
            _loc2_ = _loc2_ - 30;
         }
         _battleSkill.owner = !!_item.isOwnItem?null:_item.ownerName;
         _battleSkill.skill = !!AppConfig.battleSkillsEnabled?_item.battleSkillData:null;
         if(_battleSkill.height > 0)
         {
            _tooltipContent.battleSkill.y = _loc9_ - 2;
            _loc9_ = _loc9_ + (_battleSkill.height + 5);
            _loc2_ = _loc2_ + (_battleSkill.height + 5);
         }
         var _loc11_:ItemSet = _item.itemSet;
         _setInfo.refresh(_itemGraphic,_loc11_);
         if(_loc11_)
         {
            _tooltipContent.setInfo.y = _loc9_;
            _loc9_ = _loc9_ + (_tooltipContent.setInfo.height + 15);
            _loc2_ = _loc2_ + (_tooltipContent.setInfo.height + 15);
         }
         if(_tooltipContent.txtDescription.visible)
         {
            _tooltipContent.txtDescription.y = _loc9_;
            _tooltipContent.txtDescription.height = _tooltipContent.txtDescription.textHeight + 5;
            _loc2_ = _loc2_ + (_tooltipContent.txtDescription.height + 10);
         }
         var _loc15_:* = _item != null && _item.hasAnimation;
         _tooltipContent.iconItemEffect.visible = _loc15_;
         _tooltipContent.txtItemEffectName.visible = _loc15_;
         if(_tooltipContent.iconItemEffect.visible)
         {
            _tooltipContent.iconItemEffect.setUriSprite(_item.animationIconUrl,30,30,false,-1);
            _tooltipContent.txtItemEffectName.text = _item.animationName;
            _tooltipContent.iconItemEffect.y = _loc2_;
            _tooltipContent.txtItemEffectName.y = _tooltipContent.iconItemEffect.y + 3;
            _loc2_ = _tooltipContent.iconItemEffect.y + 30 + 5;
         }
         var _loc12_:Vector.<Outfit> = User.current.character.outfits.getOutfitsWithItem(_item);
         if(_loc12_.length > 0)
         {
            _loc10_ = "";
            var _loc17_:int = 0;
            var _loc16_:* = _loc12_;
            for each(var _loc5_ in _loc12_)
            {
               if(_loc10_ != "")
               {
                  _loc10_ = _loc10_ + "\n";
               }
               _loc10_ = _loc10_ + (" - " + _loc5_.name);
            }
            _tooltipContent.txtOutfitsCaption.visible = true;
            _tooltipContent.txtOutfits.visible = true;
            _tooltipContent.txtOutfits.text = _loc10_;
            _tooltipContent.txtOutfits.height = _tooltipContent.txtOutfits.textHeight + 5;
            _tooltipContent.txtOutfitsCaption.y = _loc2_;
            _tooltipContent.txtOutfits.y = _tooltipContent.txtOutfitsCaption.y + 15;
            _loc2_ = _loc2_ + (_tooltipContent.txtOutfits.height + 20);
         }
         _tooltipContent.txtPriceCaption.y = _loc2_;
         _tooltipContent.iconCoins.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 2;
         _tooltipContent.iconPremiumCurrency.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 2;
         _tooltipContent.txtPrice.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height;
         if(_item.isOwnItem)
         {
            if(_itemGraphic.itemSlot.itemSlotType == 99)
            {
               _tooltipContent.iconCoins.visible = !_item.isPremium;
               _tooltipContent.iconPremiumCurrency.visible = _item.isPremium;
               _tooltipContent.txtPrice.visible = true;
               _tooltipContent.txtPriceCaption.visible = true;
               _tooltipContent.txtPrice.text = LocText.current.formatHugeNumber(_item.buyPrice);
               _tooltipContent.txtPriceCaption.text = LocText.current.text("general/item_price_buy_caption");
            }
            else
            {
               _tooltipContent.iconCoins.visible = true;
               _tooltipContent.iconPremiumCurrency.visible = false;
               _tooltipContent.txtPrice.visible = true;
               _tooltipContent.txtPriceCaption.visible = true;
               _tooltipContent.txtPrice.text = LocText.current.formatHugeNumber(_item.sellPrice);
               _tooltipContent.txtPriceCaption.text = LocText.current.text("general/item_price_sell_caption");
            }
            _tooltipContent.background.height = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height + 40;
         }
         else
         {
            _tooltipContent.iconCoins.visible = false;
            _tooltipContent.iconPremiumCurrency.visible = false;
            _tooltipContent.txtPrice.visible = false;
            _tooltipContent.txtPrice.visible = false;
            _tooltipContent.txtPriceCaption.visible = false;
         }
         if(_item.isOutfitItem)
         {
            _tooltipContent.txtOutfit.autoFontSize = true;
            _tooltipContent.txtOutfit.text = LocText.current.text("general/outfit_tooltip");
            _tooltipContent.txtOutfit.visible = true;
            _tooltipContent.iconOutfit.visible = true;
            _tooltipContent.iconOutfit.y = _tooltipContent.iconCoins.y + 40;
            if(!_tooltipContent.txtPriceCaption.visible)
            {
               _tooltipContent.iconOutfit.y = _tooltipContent.iconOutfit.y - 50;
            }
            _tooltipContent.txtOutfit.y = _tooltipContent.iconOutfit.y - 3;
            _tooltipContent.background.height = _tooltipContent.txtOutfit.y + _tooltipContent.txtOutfit.height + 30;
         }
         else
         {
            _tooltipContent.txtOutfit.visible = false;
            _tooltipContent.iconOutfit.visible = false;
            if(!_tooltipContent.txtPriceCaption.visible)
            {
               _tooltipContent.background.height = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 10;
            }
            else
            {
               _tooltipContent.background.height = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height + 40;
            }
         }
         if(_tooltipContent.txtItemPatternInfo.visible)
         {
            _loc15_ = !!_item.isOutfitItem?_tooltipContent.txtOutfit.y + _tooltipContent.txtOutfit.textHeight + 10:Number(_tooltipContent.iconCoins.y + 29);
            _tooltipContent.txtItemPatternInfo.y = _loc15_;
            _tooltipContent.iconItemPatternInfo.y = _loc15_;
            _tooltipContent.txtItemPatternInfo.height = _tooltipContent.txtItemPatternInfo.textHeight + 15;
            _tooltipContent.background.height = _tooltipContent.txtItemPatternInfo.y + _tooltipContent.txtItemPatternInfo.textHeight + 30;
         }
         _tooltipContent.visible = true;
         placeCloseButton(_tooltipContent.background);
      }
      
      private function refreshCompareItem(param1:StatTypes) : int
      {
         var _loc6_:* = null;
         var _loc2_:int = param1.statCount;
         var _loc7_:* = param1;
         var _loc5_:int = _item.totalStats;
         var _loc10_:IntMap = null;
         var _loc11_:Item = UiItemTooltip.compareItem;
         if(_loc11_ == null && UiItemTooltip.compareOutfit != null)
         {
            _loc11_ = UiItemTooltip.compareOutfit.getItem(_item.type);
         }
         if(_loc11_ != null)
         {
            _loc5_ = _loc5_ - _loc11_.totalStats;
            _loc10_ = ItemSet.getStatValueDiff(_loc11_,_item);
            var _loc13_:int = 0;
            var _loc12_:* = _loc10_;
            for(var _loc9_ in _loc10_)
            {
               _loc5_ = _loc5_ + _loc10_.getData(_loc9_);
            }
         }
         var _loc4_:* = _loc2_;
         _tooltipContent.txtCompareCaption.visible = true;
         _tooltipContent.txtCompareCaption.htmlText = LocText.current.text("general/item_compare_caption","");
         _tooltipContent.txtCompareValue.visible = true;
         if(_loc5_ == 0)
         {
            _tooltipContent.txtCompareValue.text = LocText.current.text("general/item_compare_same");
         }
         else
         {
            _loc6_ = "<font " + (_loc5_ > 0?"color=\"#00E804\" size=\"14\"":"color=\"#D80000\"") + ">" + LocText.current.formatHugeNumber(_loc5_,true) + "</font>";
            _tooltipContent.txtCompareValue.htmlText = LocText.current.text("general/item_compare",_loc6_);
         }
         var _loc3_:Vector.<SymbolItemTooltipStatGeneric> = new Vector.<SymbolItemTooltipStatGeneric>();
         if(_loc11_ && _item.statStrength != _loc11_.statStrength && !containsStat(_loc7_,2))
         {
            _loc7_.addStatType(2);
            _loc2_++;
            _loc3_.push(getStatContent(_loc2_));
         }
         if(_loc11_ && _item.statStamina != _loc11_.statStamina && !containsStat(_loc7_,1))
         {
            _loc7_.addStatType(1);
            _loc2_++;
            _loc3_.push(getStatContent(_loc2_));
         }
         if(_loc11_ && _item.statCriticalRating != _loc11_.statCriticalRating && !containsStat(_loc7_,3))
         {
            _loc7_.addStatType(3);
            _loc2_++;
            _loc3_.push(getStatContent(_loc2_));
         }
         if(_loc11_ && _item.statDodgeRating != _loc11_.statDodgeRating && !containsStat(_loc7_,4))
         {
            _loc7_.addStatType(4);
            _loc2_++;
            _loc3_.push(getStatContent(_loc2_));
         }
         if(_loc11_ && _item.statWeaponDamage != _loc11_.statWeaponDamage && !containsStat(_loc7_,5))
         {
            _loc7_.addStatType(5);
            _loc2_++;
            _loc3_.push(getStatContent(_loc2_));
         }
         if(_loc11_ && _item.missileDamage != _loc11_.missileDamage && !containsStat(_loc7_,6))
         {
            _loc7_.addStatType(6);
            _loc2_++;
            _loc3_.push(getStatContent(_loc2_));
         }
         var _loc15_:int = 0;
         var _loc14_:* = _loc3_;
         for each(var _loc8_ in _loc3_)
         {
            _loc8_.visible = true;
            _loc8_.txtStat.text = _item.getStatText(_loc7_.getStatType(_loc4_));
            _loc8_.txtStat.textColor = 11184810;
            setStatIcon(_loc8_,_loc7_.getStatType(_loc4_),_item.getStatValue(_loc7_.getStatType(_loc4_)) == 0?0.5:1);
            _loc4_++;
         }
         _tooltipContent.txtCompare1.visible = _loc7_.statCount > 0;
         _tooltipContent.txtCompare2.visible = _loc7_.statCount > 1;
         _tooltipContent.txtCompare3.visible = _loc7_.statCount > 2;
         _tooltipContent.txtCompare4.visible = _loc7_.statCount > 3;
         _tooltipContent.txtCompare5.visible = _loc7_.statCount > 4;
         _tooltipContent.txtCompare6.visible = _loc7_.statCount > 5;
         if(_loc7_.statCount > 0)
         {
            _tooltipContent.txtCompare1.text = _item.getStatDiffText(_loc7_.getStatType(0),_loc11_,true,_loc10_);
         }
         if(_loc7_.statCount > 1)
         {
            _tooltipContent.txtCompare2.text = _item.getStatDiffText(_loc7_.getStatType(1),_loc11_,true,_loc10_);
         }
         if(_loc7_.statCount > 2)
         {
            _tooltipContent.txtCompare3.text = _item.getStatDiffText(_loc7_.getStatType(2),_loc11_,true,_loc10_);
         }
         if(_loc7_.statCount > 3)
         {
            _tooltipContent.txtCompare4.text = _item.getStatDiffText(_loc7_.getStatType(3),_loc11_,true,_loc10_);
         }
         if(_loc7_.statCount > 4)
         {
            _tooltipContent.txtCompare5.text = _item.getStatDiffText(_loc7_.getStatType(4),_loc11_,true,_loc10_);
         }
         if(_loc7_.statCount > 5)
         {
            _tooltipContent.txtCompare6.text = _item.getStatDiffText(_loc7_.getStatType(5),_loc11_,true,_loc10_);
         }
         if(_loc7_.statCount > 0)
         {
            _tooltipContent.txtCompare1.textColor = _tooltipContent.txtCompare1.text == "0"?2894892:Number(_tooltipContent.txtCompare1.text.indexOf("+") != -1?4162607:16711680);
         }
         if(_loc7_.statCount > 1)
         {
            _tooltipContent.txtCompare2.textColor = _tooltipContent.txtCompare2.text == "0"?2894892:Number(_tooltipContent.txtCompare2.text.indexOf("+") != -1?4162607:16711680);
         }
         if(_loc7_.statCount > 2)
         {
            _tooltipContent.txtCompare3.textColor = _tooltipContent.txtCompare3.text == "0"?2894892:Number(_tooltipContent.txtCompare3.text.indexOf("+") != -1?4162607:16711680);
         }
         if(_loc7_.statCount > 3)
         {
            _tooltipContent.txtCompare4.textColor = _tooltipContent.txtCompare4.text == "0"?2894892:Number(_tooltipContent.txtCompare4.text.indexOf("+") != -1?4162607:16711680);
         }
         if(_loc7_.statCount > 4)
         {
            _tooltipContent.txtCompare5.textColor = _tooltipContent.txtCompare5.text == "0"?2894892:Number(_tooltipContent.txtCompare5.text.indexOf("+") != -1?4162607:16711680);
         }
         if(_loc7_.statCount > 5)
         {
            _tooltipContent.txtCompare6.textColor = _tooltipContent.txtCompare6.text == "0"?2894892:Number(_tooltipContent.txtCompare6.text.indexOf("+") != -1?4162607:16711680);
         }
         if(_loc7_.statCount > 0)
         {
            _tooltipContent.txtCompare1.alpha = _tooltipContent.txtCompare1.text == "0"?0.5:1;
         }
         if(_loc7_.statCount > 1)
         {
            _tooltipContent.txtCompare2.alpha = _tooltipContent.txtCompare2.text == "0"?0.5:1;
         }
         if(_loc7_.statCount > 2)
         {
            _tooltipContent.txtCompare3.alpha = _tooltipContent.txtCompare3.text == "0"?0.5:1;
         }
         if(_loc7_.statCount > 3)
         {
            _tooltipContent.txtCompare4.alpha = _tooltipContent.txtCompare4.text == "0"?0.5:1;
         }
         if(_loc7_.statCount > 4)
         {
            _tooltipContent.txtCompare5.alpha = _tooltipContent.txtCompare5.text == "0"?0.5:1;
         }
         if(_loc7_.statCount > 5)
         {
            _tooltipContent.txtCompare6.alpha = _tooltipContent.txtCompare6.text == "0"?0.5:1;
         }
         return _loc2_;
      }
      
      private function containsStat(param1:StatTypes, param2:int) : Boolean
      {
         return param1.containsValue(param2);
      }
      
      private function setStatIcon(param1:SymbolItemTooltipStatGeneric, param2:int, param3:Number = 1) : void
      {
         param1.txtStat.alpha = param3;
         param1.iconToughness.visible = param2 == 1;
         param1.iconBrawn.visible = param2 == 2;
         param1.iconBrain.visible = param2 == 3;
         param1.iconAwareness.visible = param2 == 4;
         param1.iconWeaponDamage.visible = param2 == 5 || param2 == 6;
         param1.iconToughness.alpha = param3;
         param1.iconBrawn.alpha = param3;
         param1.iconBrain.alpha = param3;
         param1.iconAwareness.alpha = param3;
         param1.iconWeaponDamage.alpha = param3;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(Environment.info.isTouchScreen)
         {
            return;
         }
         super.handleInteractionOver(param1);
      }
      
      protected function getStatContent(param1:int) : SymbolItemTooltipStatGeneric
      {
         return _tooltipContent.getChildByName("stat" + param1) as SymbolItemTooltipStatGeneric;
      }
   }
}
