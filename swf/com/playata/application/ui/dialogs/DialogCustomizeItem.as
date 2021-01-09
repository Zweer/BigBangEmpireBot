package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.battle.BattleSkills;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.battle.UiBattleSkill;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCustomizeItemGeneric;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillGeneric;
   
   public class DialogCustomizeItem extends UiDialog
   {
       
      
      private var _item:Item;
      
      private var _itemSlot:UiItemSlot;
      
      private var _skills:Vector.<UiBattleSkill>;
      
      private var _btnClose:UiButton;
      
      private var _btnCustomize:UiPremiumButton;
      
      public function DialogCustomizeItem(param1:Item)
      {
         var _loc9_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = 0;
         var _loc5_:SymbolDialogCustomizeItemGeneric = new SymbolDialogCustomizeItemGeneric();
         super(_loc5_);
         _queued = false;
         _item = param1;
         _loc5_.txtDialogTitle.text = LocText.current.text("dialog/customize_item/title");
         if(param1.battleSkillData)
         {
            _loc5_.txtInfo.text = LocText.current.text("dialog/customize_item/info_skill",param1.battleSkillData.name);
         }
         else
         {
            _loc5_.txtInfo.text = LocText.current.text("dialog/customize_item/info");
         }
         _loc5_.txtInfo.autoFontSize = true;
         _loc5_.txtTitleBonus.text = LocText.current.text("dialog/customize_item/title_bonus");
         _loc5_.txtTitleSpecials.text = LocText.current.text("dialog/customize_item/title_specials");
         var _loc7_:Vector.<BattleSkill> = BattleSkills.instance.getSkillsForSlot(param1.itemSlotType);
         var _loc8_:int = 1;
         var _loc3_:int = 1;
         _skills = new Vector.<UiBattleSkill>(0);
         var _loc11_:int = 0;
         var _loc10_:* = _loc7_;
         for each(var _loc4_ in _loc7_)
         {
            if(_loc4_.isBonusSkill)
            {
               _loc9_ = _loc5_.getChildByName("iconBonus" + _loc8_) as SymbolBattleSkillGeneric;
               _loc5_.getChildByName("iconBonus" + _loc8_ + "Hover").visible = false;
               _loc8_++;
            }
            else
            {
               _loc9_ = _loc5_.getChildByName("iconSpecial" + _loc3_) as SymbolBattleSkillGeneric;
               _loc5_.getChildByName("iconSpecial" + _loc3_ + "Hover").visible = false;
               _loc3_++;
            }
            _loc2_ = new UiBattleSkill(_loc9_,1,_loc4_);
            _loc2_.onInteractionOver.add(overHandler);
            _loc2_.onInteractionOut.add(outHandler);
            _skills.push(_loc2_);
         }
         _loc6_ = _loc8_;
         while(_loc6_ <= 4)
         {
            _loc5_.getChildByName("iconBonus" + _loc6_).visible = false;
            _loc6_++;
         }
         _loc6_ = _loc3_;
         while(_loc6_ <= 2)
         {
            _loc5_.getChildByName("iconSpecial" + _loc6_).visible = false;
            _loc6_++;
         }
         _itemSlot = new UiItemSlot(_loc5_.itemSlot,20);
         _itemSlot.item = param1;
         _itemSlot.locked = true;
         _btnClose = new UiButton(_loc5_.btnClose,"",onClickClose);
         _btnCustomize = new UiPremiumButton(_loc5_.btnCustomize,CConstant.customize_item_premium_currency_amount,LocText.current.text("dialog/customize_item/button_customize"),LocText.current.text("dialog/customize_item/button_customize"),"","",onClickCustomize);
         _btnCustomize.premium = User.current.character.customizeItemUsed;
         _btnCustomize.textTooltip.requestTextFunction = getCustomizeItemTooltip;
      }
      
      private function outHandler(param1:InteractionEvent) : void
      {
         var _loc2_:String = (param1.target as IDisplayObject).name + "Hover";
         _vo.getChildByName(_loc2_).visible = false;
      }
      
      private function overHandler(param1:InteractionEvent) : void
      {
         var _loc2_:String = (param1.target as IDisplayObject).name + "Hover";
         _vo.getChildByName(_loc2_).visible = true;
      }
      
      private function getCustomizeItemTooltip() : String
      {
         if(User.current.character.customizeItemUsed)
         {
            return LocText.current.text("dialog/customize_item/button_customize_wait_tooltip",GameUtil.getPremiumCurrencyString(CConstant.customize_item_premium_currency_amount),TimeUtil.secondsToString(TimeUtil.serverDateTime.secondsUntilTomorrow));
         }
         return LocText.current.text("dialog/customize_item/button_customize_default_tooltip");
      }
      
      private function onClickCustomize(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("generateNewItemBattleSkill",{
            "item_id":_item.id,
            "use_premium":_btnCustomize.premium
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("generateNewItemBattleSkill" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(CConstant.customize_item_premium_currency_amount);
         }
         else if(param1.error == "errCustomizeItemNotYetAllowed")
         {
            _btnCustomize.premium = true;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/customize_item/not_yet_allowed/title"),LocText.current.text("dialog/customize_item/not_yet_allowed/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function dispose() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _skills;
         for each(var _loc1_ in _skills)
         {
            _loc1_.dispose();
         }
         _skills.length = 0;
         _skills = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnCustomize.dispose();
         _btnCustomize = null;
         _loc3_ = 1;
         while(_loc3_ <= 4)
         {
            _loc2_ = _vo.getChildByName("iconBonus" + _loc3_);
            _loc3_++;
         }
         _loc3_ = 1;
         while(_loc3_ <= 2)
         {
            _loc2_ = _vo.getChildByName("iconSpecial" + _loc3_);
            _loc3_++;
         }
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
