package com.playata.application.ui.elements.item
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CItemSetTemplate;
   import com.playata.application.data.constants.CItemSetTemplateBonus;
   import com.playata.application.data.item.ItemSet;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.item.SymbolItemTooltipSetInfoGeneric;
   import visuals.ui.elements.item.SymbolItemTooltipSetInfoStatGeneric;
   
   public class UiItemTooltipSetInfo
   {
       
      
      private var _content:SymbolItemTooltipSetInfoGeneric = null;
      
      private var _itemSet:ItemSet = null;
      
      public function UiItemTooltipSetInfo(param1:SymbolItemTooltipSetInfoGeneric)
      {
         super();
         _content = param1;
         _content.txtSetName.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
      }
      
      public function dispose() : void
      {
         _content = null;
      }
      
      public function refresh(param1:UiItemGraphic, param2:ItemSet) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(AppConfig.itemsetsEnabled != true)
         {
            _content.visible = false;
            return;
         }
         _itemSet = param2;
         if(!_itemSet)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.txtCompare1.visible = true;
         _content.txtCompare2.visible = true;
         _content.txtCompare3.visible = true;
         _content.txtCompare4.visible = true;
         _content.stat1.visible = true;
         _content.stat2.visible = true;
         _content.stat3.visible = true;
         _content.stat4.visible = true;
         _content.txtCompare1.visible = false;
         _content.txtCompare2.visible = false;
         _content.txtCompare3.visible = false;
         _content.txtCompare4.visible = false;
         var _loc8_:int = _itemSet.equippedItemCount;
         var _loc7_:int = 0;
         var _loc3_:CItemSetTemplate = CItemSetTemplate.fromId(_itemSet.identifier);
         var _loc10_:int = 0;
         var _loc9_:* = _loc3_.bonusIds;
         for each(var _loc4_ in _loc3_.bonusIds)
         {
            _loc5_ = _loc3_.getBonus(_loc4_);
            _loc7_++;
            _loc6_ = _content.getChildByName("stat" + _loc7_.toString()) as SymbolItemTooltipSetInfoStatGeneric;
            _loc6_.txtStat.text = LocText.current.text("general/item_set_value",Math.round(_loc5_.value * 100),GameUtil.getStatName(_loc5_.type));
            _loc6_.txtParts.text = LocText.current.text("general/item_set_parts",_loc4_);
            setStatIcon(_loc6_,_loc5_.type,_loc4_ > _loc8_?0.5:1);
            _loc6_.txtStat.alpha = _loc4_ > _loc8_?0.5:1;
            _loc6_.txtParts.alpha = _loc4_ > _loc8_?0.5:1;
            if(UiItemTooltip.compareItem != null && UiItemTooltip.compareItem.itemSetIdentifier && UiItemTooltip.compareItem.itemSetIdentifier != param1.item.itemSetIdentifier)
            {
               if(_loc8_ + 1 == _loc4_)
               {
                  getCompareLabel(_loc7_).text = "+" + Math.round(_loc5_.value * 100) + "%";
                  getCompareLabel(_loc7_).textColor = 4162607;
                  getCompareLabel(_loc7_).visible = true;
               }
            }
            else if(UiItemTooltip.compareItem == null && (param1.itemSlot.isBagSlotType || param1.itemSlot.itemSlotType == 99 || param1.itemSlot.itemSlotType == 0))
            {
               if(_loc8_ + 1 == _loc4_)
               {
                  getCompareLabel(_loc7_).text = "+" + Math.round(_loc5_.value * 100) + "%";
                  getCompareLabel(_loc7_).textColor = 4162607;
                  getCompareLabel(_loc7_).visible = true;
               }
            }
            else if(UiItemTooltip.compareItem != null && !UiItemTooltip.compareItem.itemSetIdentifier && param1.item.itemSetIdentifier)
            {
               if(_loc8_ + 1 == _loc4_)
               {
                  getCompareLabel(_loc7_).text = "+" + Math.round(_loc5_.value * 100) + "%";
                  getCompareLabel(_loc7_).textColor = 4162607;
                  getCompareLabel(_loc7_).visible = true;
               }
            }
         }
         _content.txtSetName.text = _itemSet.name + " (" + _loc8_.toString() + "/" + _itemSet.itemCount.toString() + ")";
         _content.stat1.y = _content.txtSetName.y + _content.txtSetName.height + 15;
         _content.stat2.y = _content.stat1.y + _content.stat1.height;
         _content.stat3.y = _content.stat2.y + _content.stat2.height;
         _content.stat4.y = _content.stat3.y + _content.stat3.height;
         _content.stat2.txtStat.textColor = _content.stat1.txtStat.textColor;
         _content.stat2.txtStat.textColor = _content.stat1.txtStat.textColor;
         _content.stat3.txtStat.textColor = _content.stat1.txtStat.textColor;
         _content.stat4.txtStat.textColor = _content.stat1.txtStat.textColor;
         _content.stat1.visible = _loc7_ > 0;
         _content.stat2.visible = _loc7_ > 1;
         _content.stat3.visible = _loc7_ > 2;
         _content.stat4.visible = _loc7_ > 3;
         _content.txtCompare1.y = _content.stat1.y - 10;
         _content.txtCompare2.y = _content.txtCompare1.y + _content.txtCompare1.height - 1;
         _content.txtCompare3.y = _content.txtCompare2.y + _content.txtCompare2.height + 1;
         _content.txtCompare4.y = _content.txtCompare3.y + _content.txtCompare3.height + 1;
         if(!_content.stat2.visible)
         {
            _content.stat2.y = _content.stat1.y;
         }
         if(!_content.stat3.visible)
         {
            _content.stat3.y = _content.stat1.y;
         }
         if(!_content.stat4.visible)
         {
            _content.stat4.y = _content.stat1.y;
         }
         if(!_content.txtCompare2.visible)
         {
            _content.txtCompare2.y = _content.txtCompare1.y;
         }
         if(!_content.txtCompare3.visible)
         {
            _content.txtCompare3.y = _content.txtCompare1.y;
         }
         if(!_content.txtCompare4.visible)
         {
            _content.txtCompare4.y = _content.txtCompare1.y;
         }
      }
      
      private function setStatIcon(param1:SymbolItemTooltipSetInfoStatGeneric, param2:int, param3:Number = 1) : void
      {
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
      
      private function getCompareLabel(param1:int) : ILabel
      {
         switch(int(param1) - 1)
         {
            case 0:
               return _content.txtCompare1;
            case 1:
               return _content.txtCompare2;
            case 2:
               return _content.txtCompare3;
            case 3:
               return _content.txtCompare4;
         }
      }
   }
}
