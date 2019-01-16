package com.playata.application.ui.elements.outfit
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.battle.BattleSkills;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.outfit.DefaultOutfit;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogOutfitRename;
   import com.playata.application.ui.dialogs.DialogOutfitSettings;
   import com.playata.application.ui.dialogs.DialogSelectItemForOutfit;
   import com.playata.application.ui.elements.avatar.UiAvatar;
   import com.playata.application.ui.elements.battle.UiBattleSkillBattleIcon;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalExclamationMarkGeneric;
   import visuals.ui.elements.outfit.SymbolOutfitContentGeneric;
   
   public class UiOutfitContent
   {
       
      
      private var _content:SymbolOutfitContentGeneric = null;
      
      private var _outfit:Outfit = null;
      
      private var _itemSlotHead:UiItemSlot = null;
      
      private var _itemSlotChest:UiItemSlot = null;
      
      private var _itemSlotBelt:UiItemSlot = null;
      
      private var _itemSlotLegs:UiItemSlot = null;
      
      private var _itemSlotBoots:UiItemSlot = null;
      
      private var _itemSlotNecklace:UiItemSlot = null;
      
      private var _itemSlotRing:UiItemSlot = null;
      
      private var _itemSlotPiercing:UiItemSlot = null;
      
      private var _itemSlotGadget:UiItemSlot = null;
      
      private var _avatar:UiAvatar = null;
      
      private var _btnTop:UiButton = null;
      
      private var _btnUp:UiButton = null;
      
      private var _btnDown:UiButton = null;
      
      private var _btnBottom:UiButton = null;
      
      private var _btnRename:UiButton = null;
      
      private var _btnSave:UiButton = null;
      
      private var _btnSettings:UiButton = null;
      
      private var _btnEquip:UiTextButton = null;
      
      private var _skills:Vector.<UiBattleSkillBattleIcon>;
      
      private var _onRefreshFunction:Function = null;
      
      private var _slotTarget:IDisplayObject;
      
      public function UiOutfitContent(param1:SymbolOutfitContentGeneric, param2:Function)
      {
         super();
         _content = param1;
         _onRefreshFunction = param2;
         _itemSlotHead = new UiItemSlot(_content.itemHead,1);
         _itemSlotHead.locked = true;
         _itemSlotChest = new UiItemSlot(_content.itemChest,2);
         _itemSlotChest.locked = true;
         _itemSlotBelt = new UiItemSlot(_content.itemBelt,3);
         _itemSlotBelt.locked = true;
         _itemSlotLegs = new UiItemSlot(_content.itemLegs,4);
         _itemSlotLegs.locked = true;
         _itemSlotBoots = new UiItemSlot(_content.itemBoots,5);
         _itemSlotBoots.locked = true;
         _itemSlotNecklace = new UiItemSlot(_content.itemNecklace,6);
         _itemSlotNecklace.locked = true;
         _itemSlotRing = new UiItemSlot(_content.itemRing,7);
         _itemSlotRing.locked = true;
         _itemSlotPiercing = new UiItemSlot(_content.itemPiercing,10);
         _itemSlotPiercing.locked = true;
         _itemSlotGadget = new UiItemSlot(_content.itemGadget,8);
         _itemSlotGadget.locked = true;
         _avatar = new UiAvatar(_content.avatar,true);
         _btnUp = new UiButton(_content.btnUp,LocText.current.text("dialog/outfits/move_up_tooltip"),onClickMoveUp);
         _btnTop = new UiButton(_content.btnTop,LocText.current.text("dialog/outfits/move_to_top_tooltip"),onClickMoveToTop);
         _btnDown = new UiButton(_content.btnDown,LocText.current.text("dialog/outfits/move_down_tooltip"),onClickMoveDown);
         _btnBottom = new UiButton(_content.btnBottom,LocText.current.text("dialog/outfits/move_to_bottom_tooltip"),onClickMoveToBottom);
         _btnRename = new UiButton(_content.btnRename,LocText.current.text("dialog/outfits/rename_outfit_tooltip"),onClickRename);
         _btnSave = new UiButton(_content.btnSave,LocText.current.text("dialog/outfits/save_to_outfit_tooltip"),onClickSave);
         _btnSettings = new UiButton(_content.btnSettings,LocText.current.text("dialog/outfits/change_outfit_settings_tooltip"),onClickSettings);
         _btnEquip = new UiTextButton(_content.btnEquip,LocText.current.text("dialog/outfits/equip_outfit"),LocText.current.text("dialog/outfits/equip_outfit_tooltip"),onClickEquip);
         _content.txtStats.text = LocText.current.text("dialog/outfits/stats");
         _content.txtDefaultEquipInfo.text = LocText.current.text("dialog/outfits/info_default_equip");
         _content.txtDefaultEquipInfo.autoFontSize = true;
         _itemSlotHead.onClick.add(handleItemClick);
         _itemSlotChest.onClick.add(handleItemClick);
         _itemSlotBelt.onClick.add(handleItemClick);
         _itemSlotLegs.onClick.add(handleItemClick);
         _itemSlotBoots.onClick.add(handleItemClick);
         _itemSlotNecklace.onClick.add(handleItemClick);
         _itemSlotRing.onClick.add(handleItemClick);
         _itemSlotPiercing.onClick.add(handleItemClick);
         _itemSlotGadget.onClick.add(handleItemClick);
         _skills = new Vector.<UiBattleSkillBattleIcon>(0);
         _skills.push(new UiBattleSkillBattleIcon(_content.skill1));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill2));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill3));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill4));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill5));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill6));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill7));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill8));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill9));
         _content.visible = false;
         var _loc3_:Boolean = false;
         _content.iconExclamationMarkHead.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkHead.nativeInstance.mouseEnabled = _loc3_;
         _loc3_ = false;
         _content.iconExclamationMarkChest.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkChest.nativeInstance.mouseEnabled = _loc3_;
         _loc3_ = false;
         _content.iconExclamationMarkBelt.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkBelt.nativeInstance.mouseEnabled = _loc3_;
         _loc3_ = false;
         _content.iconExclamationMarkLegs.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkLegs.nativeInstance.mouseEnabled = _loc3_;
         _loc3_ = false;
         _content.iconExclamationMarkBoots.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkBoots.nativeInstance.mouseEnabled = _loc3_;
         _loc3_ = false;
         _content.iconExclamationMarkNecklace.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkNecklace.nativeInstance.mouseEnabled = _loc3_;
         _loc3_ = false;
         _content.iconExclamationMarkRing.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkRing.nativeInstance.mouseEnabled = _loc3_;
         _loc3_ = false;
         _content.iconExclamationMarkPiercing.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkPiercing.nativeInstance.mouseEnabled = _loc3_;
         _loc3_ = false;
         _content.iconExclamationMarkGadget.nativeInstance.mouseChildren = _loc3_;
         _content.iconExclamationMarkGadget.nativeInstance.mouseEnabled = _loc3_;
      }
      
      public function dispose() : void
      {
         removeButtonMode();
         _btnUp.dispose();
         _btnUp = null;
         _btnTop.dispose();
         _btnTop = null;
         _btnDown.dispose();
         _btnDown = null;
         _btnBottom.dispose();
         _btnBottom = null;
         _btnRename.dispose();
         _btnRename = null;
         _btnSave.dispose();
         _btnSave = null;
         _btnSettings.dispose();
         _btnSettings = null;
         _btnEquip.dispose();
         _btnEquip = null;
         _itemSlotHead.dispose();
         _itemSlotHead = null;
         _itemSlotChest.dispose();
         _itemSlotChest = null;
         _itemSlotBelt.dispose();
         _itemSlotBelt = null;
         _itemSlotLegs.dispose();
         _itemSlotLegs = null;
         _itemSlotBoots.dispose();
         _itemSlotBoots = null;
         _itemSlotNecklace.dispose();
         _itemSlotNecklace = null;
         _itemSlotRing.dispose();
         _itemSlotRing = null;
         _itemSlotPiercing.dispose();
         _itemSlotPiercing = null;
         _itemSlotGadget.dispose();
         _itemSlotGadget = null;
         if(_skills)
         {
            var _loc3_:int = 0;
            var _loc2_:* = _skills;
            for each(var _loc1_ in _skills)
            {
               _loc1_.dispose();
            }
         }
         _content = null;
         _slotTarget = null;
         _avatar.dispose();
         _avatar = null;
      }
      
      public function refresh(param1:Outfit) : void
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc15_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc9_:int = 0;
         var _loc12_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         if(!_content)
         {
            return;
         }
         _outfit = param1;
         if(!_outfit)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.txtName.text = _outfit.name;
         var _loc11_:Character = User.current.character;
         setItem(_itemSlotHead,_content.iconExclamationMarkHead,1);
         setItem(_itemSlotChest,_content.iconExclamationMarkChest,2);
         setItem(_itemSlotBelt,_content.iconExclamationMarkBelt,3);
         setItem(_itemSlotLegs,_content.iconExclamationMarkLegs,4);
         setItem(_itemSlotBoots,_content.iconExclamationMarkBoots,5);
         setItem(_itemSlotNecklace,_content.iconExclamationMarkNecklace,6);
         setItem(_itemSlotRing,_content.iconExclamationMarkRing,7);
         setItem(_itemSlotPiercing,_content.iconExclamationMarkPiercing,10);
         setItem(_itemSlotGadget,_content.iconExclamationMarkGadget,8);
         var _loc10_:Vector.<BattleSkill> = null;
         if(_outfit is DefaultOutfit)
         {
            _btnUp.visible = false;
            _btnTop.visible = false;
            _btnDown.visible = false;
            _btnBottom.visible = false;
            _btnRename.visible = false;
            _btnSave.visible = false;
            _btnSettings.visible = false;
            _btnEquip.visible = false;
            _content.txtDefaultEquipInfo.visible = true;
            _content.txtCompare.visible = false;
            _content.txtCompareStamina.visible = false;
            _content.txtCompareStrength.visible = false;
            _content.txtCompareCriticalRating.visible = false;
            _content.txtCompareDodgeRating.visible = false;
            removeButtonMode();
            _content.txtStatStrength.text = GameUtil.getStatString(2,_loc11_.statTotalStrength);
            _content.txtStatStamina.text = GameUtil.getStatString(1,_loc11_.statTotalStamina);
            _content.txtStatDodgeRating.text = GameUtil.getStatString(4,_loc11_.statTotalDodgeRating);
            _content.txtStatCriticalRating.text = GameUtil.getStatString(3,_loc11_.statTotalCriticalRating);
            _avatar.update(_loc11_.getCurrentSettings(),true);
            _loc10_ = BattleSkills.instance.getSkillsFromBattleEffectData(_loc11_.battleEffectsData);
            _loc6_ = 0;
            while(_loc6_ < 9)
            {
               if(_loc6_ < _loc10_.length)
               {
                  _skills[_loc6_].setSkill(_loc10_[_loc6_],true,null);
               }
               else
               {
                  _skills[_loc6_].setSkill(null);
               }
               _loc6_++;
            }
         }
         else
         {
            _btnUp.visible = true;
            _btnTop.visible = true;
            _btnDown.visible = true;
            _btnBottom.visible = true;
            _btnRename.visible = true;
            _btnSave.visible = true;
            _btnSettings.visible = true;
            _btnEquip.visible = true;
            _content.txtDefaultEquipInfo.visible = false;
            addButtonMode();
            var _loc16_:* = _loc11_.outfits.outfits.length > 1;
            _btnTop.visible = _loc16_;
            _btnUp.visible = _loc16_;
            _loc16_ = _loc11_.outfits.outfits.length > 1;
            _btnBottom.visible = _loc16_;
            _btnDown.visible = _loc16_;
            _loc16_ = _outfit.index > 1;
            _btnTop.buttonEnabled = _loc16_;
            _btnUp.buttonEnabled = _loc16_;
            _loc16_ = _outfit.index < _loc11_.outfits.outfits.length;
            _btnBottom.buttonEnabled = _loc16_;
            _btnDown.buttonEnabled = _loc16_;
            _loc8_ = _loc11_.statTotalStrength;
            _loc15_ = _loc11_.statTotalStamina;
            _loc7_ = _loc11_.statTotalDodgeRating;
            _loc5_ = _loc11_.statTotalCriticalRating;
            _loc2_ = _loc11_.outfits.getCharacterStatsWithOutfit(_loc11_,_outfit);
            _loc9_ = _loc2_.getInt("stat_total_strength");
            _loc12_ = _loc2_.getInt("stat_total_stamina");
            _loc3_ = _loc2_.getInt("stat_total_dodge_rating");
            _loc4_ = _loc2_.getInt("stat_total_critical_rating");
            _loc10_ = _loc2_.getData("battle_data") as Vector.<BattleSkill>;
            _loc6_ = 0;
            while(_loc6_ < 9)
            {
               if(_loc6_ < _loc10_.length)
               {
                  _skills[_loc6_].setSkill(_loc10_[_loc6_],true,null);
               }
               else
               {
                  _skills[_loc6_].setSkill(null);
               }
               _loc6_++;
            }
            _avatar.update(_loc11_.getCurrentSettings(0,_outfit),true);
            _content.txtStatStrength.text = GameUtil.getStatString(2,_loc9_);
            _content.txtStatStamina.text = GameUtil.getStatString(1,_loc12_);
            _content.txtStatDodgeRating.text = GameUtil.getStatString(4,_loc3_);
            _content.txtStatCriticalRating.text = GameUtil.getStatString(3,_loc4_);
            _loc13_ = _loc12_ + _loc9_ + _loc4_ + _loc3_ - (_loc15_ + _loc8_ + _loc5_ + _loc7_);
            _content.txtCompare.visible = _loc13_ != 0;
            if(_loc13_ != 0)
            {
               _loc14_ = "<font " + (_loc13_ > 0?"color=\"#00E804\" size=\"14\"":"color=\"#D80000\"") + ">" + LocText.current.formatHugeNumber(_loc13_,true) + "</font>";
               _content.txtCompare.htmlText = LocText.current.text("general/item_compare",_loc14_);
            }
            setCompareValue(_content.txtStatStamina,_content.txtCompareStamina,_loc15_,_loc12_);
            setCompareValue(_content.txtStatStrength,_content.txtCompareStrength,_loc8_,_loc9_);
            setCompareValue(_content.txtStatCriticalRating,_content.txtCompareCriticalRating,_loc5_,_loc4_);
            setCompareValue(_content.txtStatDodgeRating,_content.txtCompareDodgeRating,_loc7_,_loc3_);
         }
      }
      
      private function setCompareValue(param1:ILabel, param2:ILabel, param3:int, param4:int) : void
      {
         if(param3 != param4)
         {
            param2.visible = true;
            param2.text = LocText.current.formatHugeNumber(param4 - param3,true);
            param2.textColor = param2.text == "0"?16777215:Number(param2.text.indexOf("+") != -1?59396:14155776);
            param2.x = param1.x + param1.textWidth + 5;
         }
         else
         {
            param2.visible = false;
         }
      }
      
      private function setItem(param1:UiItemSlot, param2:SymbolGoalExclamationMarkGeneric, param3:int) : void
      {
         if(_outfit.getItem(param3))
         {
            param1.item = _outfit.getItem(param3);
         }
         else
         {
            param1.item = null;
         }
         param2.visible = _outfit.isItemMissing(param3);
      }
      
      private function addButtonMode() : void
      {
         _itemSlotHead.useHandCursor = true;
         _itemSlotChest.useHandCursor = true;
         _itemSlotBelt.useHandCursor = true;
         _itemSlotLegs.useHandCursor = true;
         _itemSlotBoots.useHandCursor = true;
         _itemSlotNecklace.useHandCursor = true;
         _itemSlotRing.useHandCursor = true;
         _itemSlotPiercing.useHandCursor = true;
         _itemSlotGadget.useHandCursor = true;
      }
      
      private function removeButtonMode() : void
      {
         _itemSlotHead.useHandCursor = false;
         _itemSlotChest.useHandCursor = false;
         _itemSlotBelt.useHandCursor = false;
         _itemSlotLegs.useHandCursor = false;
         _itemSlotBoots.useHandCursor = false;
         _itemSlotNecklace.useHandCursor = false;
         _itemSlotRing.useHandCursor = false;
         _itemSlotPiercing.useHandCursor = false;
         _itemSlotGadget.useHandCursor = false;
      }
      
      private function handleItemClick(param1:InteractionEvent) : void
      {
         if(_outfit is DefaultOutfit)
         {
            return;
         }
         _slotTarget = param1.target as IDisplayObject;
         onSelectItemForOutfit();
      }
      
      private function onItemAction(param1:String) : Boolean
      {
         if(param1 == "moveToInventory")
         {
            onSelectItemForOutfit();
         }
         return true;
      }
      
      private function onSelectItemForOutfit() : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         var _loc1_:int = 0;
         if(_slotTarget == _itemSlotHead)
         {
            _loc1_ = 1;
         }
         else if(_slotTarget == _itemSlotChest)
         {
            _loc1_ = 2;
         }
         else if(_slotTarget == _itemSlotBelt)
         {
            _loc1_ = 3;
         }
         else if(_slotTarget == _itemSlotLegs)
         {
            _loc1_ = 4;
         }
         else if(_slotTarget == _itemSlotBoots)
         {
            _loc1_ = 5;
         }
         else if(_slotTarget == _itemSlotNecklace)
         {
            _loc1_ = 6;
         }
         else if(_slotTarget == _itemSlotRing)
         {
            _loc1_ = 7;
         }
         else if(_slotTarget == _itemSlotPiercing)
         {
            _loc1_ = 10;
         }
         else if(_slotTarget == _itemSlotGadget)
         {
            _loc1_ = 8;
         }
         Environment.panelManager.showDialog(new DialogSelectItemForOutfit(_outfit,_loc1_,onSetItemToOutfit));
      }
      
      private function onSetItemToOutfit(param1:int, param2:int) : void
      {
         Environment.application.sendActionRequest("setOutfitItem",{
            "outfit_id":_outfit.id,
            "item_id":param1,
            "item_type":param2
         },handleRequests);
      }
      
      private function onClickMoveUp(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("setOutfitOrder",{
            "outfit_id":_outfit.id,
            "move_up":true,
            "move_to_end":false
         },handleRequests);
      }
      
      private function onClickMoveToTop(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("setOutfitOrder",{
            "outfit_id":_outfit.id,
            "move_up":true,
            "move_to_end":true
         },handleRequests);
      }
      
      private function onClickMoveDown(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("setOutfitOrder",{
            "outfit_id":_outfit.id,
            "move_up":false,
            "move_to_end":false
         },handleRequests);
      }
      
      private function onClickMoveToBottom(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("setOutfitOrder",{
            "outfit_id":_outfit.id,
            "move_up":false,
            "move_to_end":true
         },handleRequests);
      }
      
      private function onClickRename(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogOutfitRename(_outfit,onRenameOutfit));
      }
      
      private function onRenameOutfit(param1:String) : void
      {
         if(_outfit.name != param1)
         {
            Environment.application.sendActionRequest("renameOutfit",{
               "outfit_id":_outfit.id,
               "name":param1
            },handleRequests);
         }
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("setEqipedItemsToOutfit",{"outfit_id":_outfit.id},handleRequests);
      }
      
      private function onClickSettings(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogOutfitSettings(_outfit,onSetOutfitSettings));
      }
      
      private function onSetOutfitSettings(param1:Vector.<int>) : void
      {
         Environment.application.sendActionRequest("setOutfitSettings",{
            "outfit_id":_outfit.id,
            "settings":JsonUtil.encode(param1)
         },handleRequests);
      }
      
      private function onClickEquip(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("equipOutfit",{"outfit_id":_outfit.id},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "setOutfitOrder":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onRefreshFunction();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setOutfitItem":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onRefreshFunction();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setEqipedItemsToOutfit":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onRefreshFunction();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "renameOutfit":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onRefreshFunction();
               }
               else if(param1.error == "errRenameInvalidName")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/outfit_invalid_name_title"),LocText.current.text("error/outfit_invalid_name_text",CConstant.character_name_length_min,CConstant.character_name_length_max),LocText.current.text("general/button_ok"),null,false));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setOutfitSettings":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onRefreshFunction();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "equipOutfit":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onRefreshFunction();
               }
               else if(param1.error == "errEquipOutfitInventoryNoEmptySlot")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/outfit_no_free_slot/title"),LocText.current.text("dialog/outfit_no_free_slot/text"),LocText.current.text("general/button_ok"),null,false));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
