package com.playata.application.ui.elements.item
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.StatTypes;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item.ItemSet;
   import com.playata.application.data.item.LinkedItem;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.battle.UiBattleSkill;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.sewing_machine.UiSewingMachinContent;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.item.SymbolItemTooltipGeneric;
   import visuals.ui.elements.item.SymbolItemTooltipStatGeneric;
   
   public class UiLinkedItemTooltip extends UiClosableTooltip
   {
      
      private static var _compareItem:Item = null;
      
      protected static var _tooltipContent:SymbolItemTooltipGeneric = null;
      
      protected static var _setInfo:UiLinkedItemTooltipSetInfo = null;
      
      protected static var _battleSkill:UiBattleSkill;
      
      protected static var _currentLinkedItem:LinkedItem = null;
       
      
      private var _item:LinkedItem;
      
      public function UiLinkedItemTooltip(param1:IInteractiveDisplayObject)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolItemTooltipGeneric();
            _tooltipContent.txtItemName.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _setInfo = new UiLinkedItemTooltipSetInfo(_tooltipContent.setInfo);
            _battleSkill = new UiBattleSkill(_tooltipContent.battleSkill,3);
            _tooltipContent.txtStatsCaption.text = LocText.current.text("general/item_attributes_caption","");
            _tooltipContent.txtCompareCaption.visible = false;
            _tooltipContent.txtCompareCaption.text = "";
            _tooltipContent.txtCompareValue.visible = false;
            _tooltipContent.txtCompareValue.text = "";
            _tooltipContent.txtCompare1.visible = false;
            _tooltipContent.txtCompare2.visible = false;
            _tooltipContent.txtCompare3.visible = false;
            _tooltipContent.txtCompare4.visible = false;
            _tooltipContent.txtCompare5.visible = false;
            _tooltipContent.txtOutfitsCaption.visible = false;
            _tooltipContent.txtOutfits.visible = false;
            _tooltipContent.stat1.txtStat.autoFontSize = true;
            _tooltipContent.stat2.txtStat.autoFontSize = false;
            _tooltipContent.stat3.txtStat.autoFontSize = false;
            _tooltipContent.stat4.txtStat.autoFontSize = false;
            _tooltipContent.stat5.txtStat.autoFontSize = false;
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
      }
      
      public static function get compareItem() : Item
      {
         return _compareItem;
      }
      
      public static function set compareItem(param1:Item) : void
      {
         _compareItem = param1;
      }
      
      override public function get height() : Number
      {
         if(!_tooltipContent)
         {
            return super.height;
         }
         return _tooltipContent.background.height * _tooltipContent.scale;
      }
      
      override public function onAssigned() : void
      {
         if(_currentLinkedItem == _item)
         {
            return;
         }
         _currentLinkedItem = _item;
         if(_item == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         refreshContent();
      }
      
      public function refresh(param1:LinkedItem) : void
      {
         _item = param1;
      }
      
      private function refreshContent() : void
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
         _tooltipContent.txtItemPatternInfo.visible = false;
         _tooltipContent.iconItemPatternInfo.visible = false;
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
         LocText.current.gender = _loc1_;
      }
      
      private function refreshSewPattern() : void
      {
         _tooltipContent.txtPriceCaption.y = _tooltipContent.txtItemName.y + _tooltipContent.txtItemName.height + 5;
         _tooltipContent.iconCoins.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 2;
         _tooltipContent.iconPremiumCurrency.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 2;
         _tooltipContent.txtPrice.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height;
         _tooltipContent.iconCoins.visible = _item.quality == 1;
         _tooltipContent.iconPremiumCurrency.visible = _item.quality != 1;
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
         _tooltipContent.visible = true;
         placeCloseButton(_tooltipContent.background);
      }
      
      private function refreshItemPattern() : void
      {
         _tooltipContent.txtItemPatternInfo.visible = true;
         _tooltipContent.txtItemPatternInfo.y = _tooltipContent.txtItemName.y + _tooltipContent.txtItemName.height + 5;
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
         _tooltipContent.background.height = _tooltipContent.txtItemPatternInfo.y + _tooltipContent.txtItemPatternInfo.height + 15;
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
         _tooltipContent.visible = true;
         placeCloseButton(_tooltipContent.background);
      }
      
      private function refreshItem() : void
      {
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
         _tooltipContent.iconItemPatternInfo.visible = false;
         if(_item.isUsable)
         {
            if(_item.requiredLevel > User.current.character.level)
            {
               _tooltipContent.txtDescription.visible = true;
               _tooltipContent.txtDescription.text = LocText.current.text("general/item_required_level",_item.requiredLevel);
               _tooltipContent.txtDescription.textColor = 16711680;
            }
            else
            {
               _tooltipContent.txtDescription.visible = true;
               _tooltipContent.txtDescription.text = _item.description;
               _tooltipContent.txtDescription.textColor = 4183831;
            }
         }
         var _loc2_:StatTypes = new StatTypes();
         if(_item.statStrength > 0)
         {
            _loc2_.addStatType(2);
         }
         if(_item.statStamina > 0)
         {
            _loc2_.addStatType(1);
         }
         if(_item.statCriticalRating > 0)
         {
            _loc2_.addStatType(3);
         }
         if(_item.statDodgeRating > 0)
         {
            _loc2_.addStatType(4);
         }
         if(_item.statWeaponDamage > 0)
         {
            _loc2_.addStatType(5);
         }
         if(_item.missileDamage > 0)
         {
            _loc2_.addStatType(6);
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
         _tooltipContent.stat2.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat3.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat4.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat5.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat6.txtStat.textColor = _tooltipContent.stat1.txtStat.textColor;
         _tooltipContent.stat1.visible = _loc2_.statCount > 0;
         _tooltipContent.stat2.visible = _loc2_.statCount > 1;
         _tooltipContent.stat3.visible = _loc2_.statCount > 2;
         _tooltipContent.stat4.visible = _loc2_.statCount > 3;
         _tooltipContent.stat5.visible = _loc2_.statCount > 4;
         _tooltipContent.stat6.visible = _loc2_.statCount > 5;
         if(_loc2_.statCount > 0)
         {
            _tooltipContent.stat1.txtStat.text = _item.getStatText(_loc2_.getStatType(0));
         }
         if(_loc2_.statCount > 1)
         {
            _tooltipContent.stat2.txtStat.text = _item.getStatText(_loc2_.getStatType(1));
         }
         if(_loc2_.statCount > 2)
         {
            _tooltipContent.stat3.txtStat.text = _item.getStatText(_loc2_.getStatType(2));
         }
         if(_loc2_.statCount > 3)
         {
            _tooltipContent.stat4.txtStat.text = _item.getStatText(_loc2_.getStatType(3));
         }
         if(_loc2_.statCount > 4)
         {
            _tooltipContent.stat5.txtStat.text = _item.getStatText(_loc2_.getStatType(4));
         }
         if(_loc2_.statCount > 5)
         {
            _tooltipContent.stat6.txtStat.text = _item.getStatText(_loc2_.getStatType(5));
         }
         if(_loc2_.statCount > 0)
         {
            setStatIcon(_tooltipContent.stat1,_loc2_.getStatType(0));
         }
         if(_loc2_.statCount > 1)
         {
            setStatIcon(_tooltipContent.stat2,_loc2_.getStatType(1));
         }
         if(_loc2_.statCount > 2)
         {
            setStatIcon(_tooltipContent.stat3,_loc2_.getStatType(2));
         }
         if(_loc2_.statCount > 3)
         {
            setStatIcon(_tooltipContent.stat4,_loc2_.getStatType(3));
         }
         if(_loc2_.statCount > 4)
         {
            setStatIcon(_tooltipContent.stat5,_loc2_.getStatType(4));
         }
         if(_loc2_.statCount > 5)
         {
            setStatIcon(_tooltipContent.stat6,_loc2_.getStatType(5));
         }
         _tooltipContent.txtCompareCaption.y = _tooltipContent.txtStatsCaption.y;
         _tooltipContent.txtCompare1.y = _tooltipContent.stat1.y - 9;
         _tooltipContent.txtCompare2.y = _tooltipContent.stat2.y - 9;
         _tooltipContent.txtCompare3.y = _tooltipContent.stat3.y - 9;
         _tooltipContent.txtCompare4.y = _tooltipContent.stat4.y - 9;
         _tooltipContent.txtCompare5.y = _tooltipContent.stat5.y - 9;
         _tooltipContent.txtCompare6.y = _tooltipContent.stat6.y - 9;
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
         var _loc3_:* = 8;
         if(_tooltipContent.txtCompareValue.visible)
         {
            _loc3_ = Number(_tooltipContent.txtCompareValue.height);
            _tooltipContent.txtCompareValue.y = _tooltipContent.txtStatsCaption.y + 15 + _loc2_.statCount * (_tooltipContent.stat1.height + 1);
         }
         var _loc1_:Number = _tooltipContent.txtStatsCaption.height + _loc2_.statCount * (_tooltipContent.stat1.height + 1);
         _loc1_ = _loc1_ + (_tooltipContent.txtStatsCaption.y + _loc3_);
         var _loc4_:Number = _tooltipContent.txtStatsCaption.y + _loc3_ + _tooltipContent.txtStatsCaption.height + _loc2_.statCount * (_tooltipContent.stat1.height + 1);
         if(_item.isUsable)
         {
            _loc4_ = _loc4_ - 30;
            _loc1_ = _loc1_ - 30;
         }
         _battleSkill.owner = null;
         _battleSkill.skill = !!AppConfig.battleSkillsEnabled?_item.battleSkillData:null;
         if(_battleSkill.height > 0)
         {
            _tooltipContent.battleSkill.y = _loc4_ - 2;
            _loc4_ = _loc4_ + (_battleSkill.height + 5);
            _loc1_ = _loc1_ + (_battleSkill.height + 5);
         }
         var _loc5_:ItemSet = _item.itemSet;
         _setInfo.refresh(_item,_loc5_);
         if(_loc5_)
         {
            _tooltipContent.setInfo.y = _loc4_;
            _loc4_ = _loc4_ + (_tooltipContent.setInfo.height + 15);
            _loc1_ = _loc1_ + (_tooltipContent.setInfo.height + 15);
         }
         if(_tooltipContent.txtDescription.visible)
         {
            _tooltipContent.txtDescription.y = _loc4_;
            _tooltipContent.txtDescription.height = _tooltipContent.txtDescription.textHeight + 5;
            _loc1_ = _loc1_ + (_tooltipContent.txtDescription.height + 10);
         }
         _tooltipContent.txtPriceCaption.y = _loc1_;
         _tooltipContent.iconCoins.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 2;
         _tooltipContent.iconPremiumCurrency.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height - 2;
         _tooltipContent.txtPrice.y = _tooltipContent.txtPriceCaption.y + _tooltipContent.txtPriceCaption.height;
         _tooltipContent.iconCoins.visible = false;
         _tooltipContent.iconPremiumCurrency.visible = false;
         _tooltipContent.txtPrice.visible = false;
         _tooltipContent.txtPriceCaption.visible = false;
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
            var _loc6_:* = !!_item.isOutfitItem?_tooltipContent.txtOutfit.y + _tooltipContent.txtOutfit.textHeight + 10:Number(_tooltipContent.iconCoins.y + 29);
            _tooltipContent.txtItemPatternInfo.y = _loc6_;
            _tooltipContent.iconItemPatternInfo.y = _loc6_;
            _tooltipContent.txtItemPatternInfo.height = _tooltipContent.txtItemPatternInfo.textHeight + 15;
            _tooltipContent.background.height = _tooltipContent.txtItemPatternInfo.y + _tooltipContent.txtItemPatternInfo.height + 15;
         }
         _tooltipContent.visible = true;
         placeCloseButton(_tooltipContent.background);
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
      
      private function getStatContent(param1:int) : SymbolItemTooltipStatGeneric
      {
         return _tooltipContent.getChildByName("stat" + param1) as SymbolItemTooltipStatGeneric;
      }
   }
}
